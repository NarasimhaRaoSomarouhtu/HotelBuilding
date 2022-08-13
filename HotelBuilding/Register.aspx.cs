using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Diagnostics;

namespace HotelBuilding
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginHyperLink.NavigateUrl = "Login";
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                LoginHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        

        protected void RegisterUser(object sender, EventArgs e)
        {
            Button registerButton = (Button)sender;

            HtmlInputText username = (HtmlInputText)registerButton.Parent.FindControl("username");
            HtmlInputPassword password = (HtmlInputPassword)registerButton.Parent.FindControl("password");
            HtmlInputText contact = (HtmlInputText)registerButton.Parent.FindControl("contact");
            HtmlSelect role = (HtmlSelect)registerButton.Parent.FindControl("role");

            //Debug.WriteLine(role.Items[role.SelectedIndex].Text);

            try
            {
                /* using (SqlConnection con = new SqlConnection(@"data source=.;initial catalog=Hotel;integrated security=True;"))
                 {
                     con.Open();
                     string checkUser = "select count(*) from Users where username=@username;";

                     SqlCommand com = new SqlCommand(checkUser, con);
                     com.Parameters.AddWithValue("username", username.Value);
                     com.ExecuteNonQuery();
                     int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                     if (temp > 0)
                     {
                         Response.Write("User Already Exists");
                     }
                     else
                     {
                         string query = "insert into Users values(@username,@password,@Contact,@Role)";
                         SqlCommand cmd = new SqlCommand(query, con);
                         cmd.Parameters.AddWithValue("username", username.Value);
                         cmd.Parameters.AddWithValue("password", password.Value);
                         cmd.Parameters.AddWithValue("Contact", contact.Value);
                         cmd.Parameters.AddWithValue("Role", role.Items[role.SelectedIndex].Text);
                         cmd.ExecuteNonQuery();
                         //Response.Redirect("Login.aspx");
                     }
                 }*/
                using (SqlConnection con = new SqlConnection(@"data source=.;initial catalog=Hotel;integrated security=True;"))
                {
                    con.Open();

                    

                    using (SqlCommand cmd = new SqlCommand("select count(*) from [Users] where username = @username", con))
                    {
                        cmd.Parameters.AddWithValue("username", username.Value);
                        int temp= Convert.ToInt32(cmd.ExecuteScalar().ToString());



                        if (temp == 1)
                        {
                            Label3.Visible = true;
                            Label3.Text = "User Already Exists ";
                            Label3.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {

                            string query = "insert into Users values(@username,@password,@Contact,@Role)";
                            using (SqlCommand cd = new SqlCommand(query, con))

                            {
                                cd.Parameters.AddWithValue("username", username.Value);
                                cd.Parameters.AddWithValue("password", password.Value);
                                cd.Parameters.AddWithValue("contact", contact.Value);
                                cd.Parameters.AddWithValue("role", role.Items[role.SelectedIndex].Text);
                                cd.ExecuteNonQuery();

                                
                            }
                        }
                    }

                    con.Close();
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
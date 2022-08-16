 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI.HtmlControls;

namespace HotelBuilding
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            //Session["UserPresent"] = false;
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }
        protected void loginUser(object sender, EventArgs e)
        {
            Button loginButton = (Button)sender;

            HtmlInputText username = (HtmlInputText)loginButton.Parent.FindControl("username");
            HtmlInputPassword password = (HtmlInputPassword)loginButton.Parent.FindControl("password");
            HtmlSelect role = (HtmlSelect)loginButton.Parent.FindControl("role");

            try
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=HotelDb; integrated security=True;"))
                {
                    con.Open();
                    string userCheck = "select * from Users where Username=@username and Password=@password";

                    SqlCommand userCheckCmd = new SqlCommand(userCheck, con);

                    userCheckCmd.Parameters.AddWithValue("username", username.Value);
                    userCheckCmd.Parameters.AddWithValue("password", password.Value);

                    SqlDataReader userCheckReader = userCheckCmd.ExecuteReader();

                    if (userCheckReader.Read())
                    {
                        userCheckReader.Close();

                        string roleCheck = "select Role from Users where Username=@username";
                        
                        SqlCommand roleCheckCmd = new SqlCommand(roleCheck, con);

                        roleCheckCmd.Parameters.AddWithValue("username", username.Value);

                        SqlDataReader roleCheckReader = roleCheckCmd.ExecuteReader();

                        if (roleCheckReader.Read())
                        {
                            string userRole = roleCheckReader["role"].ToString();

                            if (userRole == role.Items[role.SelectedIndex].Text)
                            {
                                if (userRole == "User")
                                {
                                    Session["UserPresent"] = true;
                                    Session["Username"] = username.Value;
                                    Response.Redirect("User/UserMenu.aspx");
                                }
                                if (userRole == "Admin")
                                {
                                    Session["UserPresent"] = true;
                                    Session["Username"] = username.Value;
                                    Response.Redirect("Admin/AdminMenu.aspx");
                                }
           
                            }
                            else
                            {
                                Label1.Visible = true;
                                Label1.Text = "Invalid User ";
                                Label1.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                        
                    }
                    else
                    {
                        Label3.Visible =true ;
                        Label3.Text = "Invalid User Credentials";
                        Label3.ForeColor = System.Drawing.Color.Red;

                    }
                    con.Close();
                }
            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
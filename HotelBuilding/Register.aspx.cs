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
                using (SqlConnection con = new SqlConnection(@"data source=.;initial catalog=Hotel;integrated security=True;"))
                {
                    con.Open();
                    string query = "insert into Users values(@username,@password,@Contact,@Role)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("username", username.Value);
                    cmd.Parameters.AddWithValue("password", password.Value);
                    cmd.Parameters.AddWithValue("Contact", contact.Value);
                    cmd.Parameters.AddWithValue("Role", role.Items[role.SelectedIndex].Text);
                    cmd.ExecuteNonQuery();
                    //Response.Redirect("Login.aspx");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
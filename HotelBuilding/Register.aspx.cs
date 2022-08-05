using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace HotelBuilding
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {

                using (SqlConnection con = new SqlConnection(@"data source=.;initial catalog=Hotel;integrated security=True;"))
                {
                    con.Open();
                    string query = "insert into Login values(@username,@password)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("username", txtUserName.Text);
                    cmd.Parameters.AddWithValue("password", txtPassword.Text);
                    cmd.ExecuteNonQuery();
                    txtUserName.Text = "";
                    txtPassword.Text = "";
                }
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        
    }
}
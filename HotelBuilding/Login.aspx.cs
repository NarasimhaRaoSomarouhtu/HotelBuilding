﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace HotelBuilding
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=Hotel; integrated security=True;"))
                {
                    con.Open();
                    string qry = "select * from Login where username='" +txtUserName.Text + "' and password='" + txtPassword.Text + "'";
                    SqlCommand cmd = new SqlCommand(qry, con);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        Response.Write("<script>alert('login success'</script>");
                        Response.Redirect("Contact.aspx");
                    }
                    else
                    {
                        Response.Redirect("Register.aspx");

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
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBuilding.Admin
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
        protected void checkValidation(object sender, EventArgs e)
        {
            Debug.WriteLine("validation check");
            using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=HotelDb; integrated security=True;"))
            {
                Button btn = (Button)sender;
                TextBox ItemTb = (TextBox)btn.Parent.FindControl("ItemIdTextBox");

                con.Open();

                string query = "select * from Menu where ItemId=@ItemId";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("ItemId", ItemTb.Text);

                var temp = cmd.ExecuteScalar();

                if (temp != null)
                {
                    Label1.Visible = true;
                    Label1.Text = "Item / ItemId already exists.";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    btn.CommandName = "Insert";
                }

                con.Close();
            }
        }

        protected void DeleteItem(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=HotelDb; integrated security=True;"))
            {
                Button btn = (Button)sender;
                Label ItemId = (Label)btn.Parent.FindControl("ItemIdLabel");

                con.Open();

                string query = "delete from Menu where ItemId=@ItemId";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("ItemId", ItemId.Text);

                cmd.ExecuteNonQuery();

                con.Close();
            }
            Response.Redirect(Request.RawUrl);
            
        }
    }
}
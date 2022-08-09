using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

        protected void DeleteItem(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=Hotel; integrated security=True;"))
            {
                Button btn = (Button)sender;
                Label ItemId = (Label)btn.Parent.FindControl("ItemIdLabel");

                con.Open();

                string query = "delete from Item where ItemId=@ItemId";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("ItemId", ItemId.Text);

                cmd.ExecuteNonQuery();

                con.Close();
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}
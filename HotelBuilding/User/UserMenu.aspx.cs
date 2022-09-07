using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HotelBuilding.User
{
    public partial class UserMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserPresent"] == null || (Boolean)Session["UserPresent"] != true)
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void addToCart(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            Label ItemId = (Label)btn.Parent.FindControl("ItemIdLabel");

            HtmlInputGenericControl Quantity = (HtmlInputGenericControl)btn.Parent.FindControl("Quantity");

            using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=HotelDb; integrated security=True;"))
            {
                con.Open();

                string qry = "select * from Cart where ItemId = @ItemId";
                SqlCommand command = new SqlCommand(qry, con);

                command.Parameters.AddWithValue("ItemId", ItemId.Text);

                SqlDataReader reader = command.ExecuteReader();

                if (Convert.ToInt32(Quantity.Value) > 0)
                {
                    if (reader.Read())
                    {
                        reader.Close();
                        string updateQuery = "Update Cart Set Quantity = @Quantity where ItemId = @ItemId";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                        updateCmd.Parameters.AddWithValue("Quantity", Quantity.Value);
                        updateCmd.Parameters.AddWithValue("ItemId", ItemId.Text);

                        updateCmd.ExecuteNonQuery();
                    }
                    else
                    {
                        reader.Close();
                        string insertQuery = "insert into Cart values(@Username,@ItemId,@Quantity)";
                        SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                        insertCmd.Parameters.AddWithValue("Username", Session["Username"].ToString());
                        insertCmd.Parameters.AddWithValue("ItemId", ItemId.Text);
                        insertCmd.Parameters.AddWithValue("Quantity", Quantity.Value);

                        insertCmd.ExecuteNonQuery();
                    }
                }
            }
        }
    }
}
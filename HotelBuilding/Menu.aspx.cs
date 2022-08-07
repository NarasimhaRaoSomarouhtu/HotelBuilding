using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HotelBuilding
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addToCart(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;

                Label OrderId = (Label)btn.Parent.FindControl("ItemIdLabel");
                Label ItemName = (Label)btn.Parent.FindControl("ItemNameLabel");
                Label ItemPrice = (Label)btn.Parent.FindControl("ItemPriceLabel");

                //not working
                HtmlInputGenericControl Quantity = (HtmlInputGenericControl)btn.Parent.FindControl("Quantity");

                // check output window to see output

                using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=Hotel; integrated security=True;"))
                {
                    con.Open();
                    string query = "insert into Cart values(@OrderId,@ItemName,@ItemPrice,@Quantity)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("OrderId", OrderId.Text);
                    cmd.Parameters.AddWithValue("ItemName", ItemName.Text);
                    cmd.Parameters.AddWithValue("ItemPrice", ItemPrice.Text);
                    cmd.Parameters.AddWithValue("Quantity", Quantity.Value);

                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
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
                Control Quantity = (Control)btn.Parent.FindControl("Quantity");
                
                // check output window to see output
                Debug.WriteLine(ItemName.Text);
                string q = Request.Form["Quantity"];
                Debug.WriteLine(q);


                using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=Hotel; integrated security=True;"))
                {
                    con.Open();
                    string query = "insert into Order1 values(@OrderId,@ItemName,@ItemPrice)";
                    SqlCommand cmd = new SqlCommand(query, con);
                   cmd.Parameters.AddWithValue("OrderId", OrderId.Text);
                    cmd.Parameters.AddWithValue("ItemName", ItemName.Text);
                    cmd.Parameters.AddWithValue("ItemPrice", ItemPrice.Text);
                   //cmd.Parameters.AddWithValue("Quantity", Quantity.);
                    //cmd.Parameters.AddWithValue("Contact", txtPrice.Text);
                    cmd.ExecuteNonQuery();
                    Convert.ToInt32(OrderId.Text);
                   ItemName.Text = "";
                    Convert.ToInt32(ItemPrice.Text);
                   // Convert.ToInt32(Quantity.);
                }
           }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
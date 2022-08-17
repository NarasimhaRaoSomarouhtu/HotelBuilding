using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HotelBuilding.User
{
    public partial class Cart : System.Web.UI.Page
    {
        string totalPrice;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Boolean)Session["UserPresent"] == true)
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=HotelDb; integrated security=True;"))
                {
                    string TotalQry = "select Sum(Cast(ItemPrice as int) * Cast(Quantity as int)) as Total from Menu Inner join Cart on Cart.ItemId = Menu.ItemId and Cart.Username = @Username;";

                    con.Open();

                    SqlCommand cmd = new SqlCommand(TotalQry, con);

                    cmd.Parameters.AddWithValue("Username", Session["Username"].ToString());

                    SqlDataReader reader = cmd.ExecuteReader();

                    OrderButton.Visible = false;
                    popup.Visible = false;

                    if (reader.Read())
                    {
                        if (reader["Total"].ToString() != "")
                        {
                            totalPrice = reader["Total"].ToString();
                            totalPriceLabel.InnerHtml = "Total Amount: " + reader["Total"].ToString();

                            OrderButton.Visible = true;
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }

        }


        protected void removeFromCart(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=HotelDb; integrated security=True;"))
            {
                Button btn = (Button)sender;
                Label ItemId = (Label)btn.Parent.FindControl("ItemIdLabel");

                con.Open();

                string query = "delete from Cart where ItemId=@ItemId and Username=@Username";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("ItemId", ItemId.Text);
                cmd.Parameters.AddWithValue("Username", Session["Username"].ToString());

                cmd.ExecuteNonQuery();

                con.Close();
            }
            Response.Redirect(Request.RawUrl);
        }

        protected void ConfirmOrder(object sender, EventArgs e)
        {
            Debug.WriteLine("function called");
            using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=HotelDb; integrated security=True;"))
            {
                con.Open();

                //insert into orders table
                string insertQuery = "INSERT INTO Orders(ItemId, Username, Quantity) SELECT ItemId, Username, Quantity FROM Cart where Username=@Username;";

                SqlCommand insertCmd = new SqlCommand(insertQuery, con);

                insertCmd.Parameters.AddWithValue("Username", Session["Username"].ToString());

                insertCmd.ExecuteNonQuery();

                // remove from cart table
                string emptyCart = "Delete from Cart where Username=@Username";

                SqlCommand emptyCmd = new SqlCommand(emptyCart, con);

                emptyCmd.Parameters.AddWithValue("Username", Session["Username"].ToString());

                emptyCmd.ExecuteNonQuery();

                con.Close();

            }

            popup.Visible = true;
            OrderStatus.Visible = true;
            OrderStatus.Text = "Order Placed Successfully ";
            OrderStatus.ForeColor = System.Drawing.Color.Green;

            var t = Task.Run(async delegate
            {
                await Task.Delay(3000);
            });
            t.Wait();

            Response.Redirect(Request.RawUrl);
        }

    }
}
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
            if((Boolean)Session["UserPresent"] != true)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void addToCart(object sender, EventArgs e)
        {
            if ((Boolean)Session["UserPresent"] == true)
            {
                //try
                //{
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

                        string qry = "select * from Cart where OrderId = @OrderId";
                        SqlCommand command = new SqlCommand(qry, con);

                        command.Parameters.AddWithValue("OrderId", OrderId.Text);

                        SqlDataReader reader = command.ExecuteReader();


                        if (reader.Read())
                        {
                            reader.Close();
                            string updateQuery = "Update Cart Set Quantity = @Quantity where OrderId = @OrderId";
                            SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                            updateCmd.Parameters.AddWithValue("Quantity", Quantity.Value);
                            updateCmd.Parameters.AddWithValue("OrderId", OrderId.Text);

                            updateCmd.ExecuteNonQuery();
                        }
                        else
                        {
                            reader.Close();
                            string insertQuery = "insert into Cart values(@OrderId,@ItemName,@ItemPrice,@Quantity)";
                            SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                            insertCmd.Parameters.AddWithValue("OrderId", OrderId.Text);
                            insertCmd.Parameters.AddWithValue("ItemName", ItemName.Text);
                            insertCmd.Parameters.AddWithValue("ItemPrice", ItemPrice.Text);
                            insertCmd.Parameters.AddWithValue("Quantity", Quantity.Value);

                            insertCmd.ExecuteNonQuery();
                        }
                    }
                //}
                //catch (Exception ex)
                //{
                //    throw new Exception(ex.Message);
                //}
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
        }
    }
}
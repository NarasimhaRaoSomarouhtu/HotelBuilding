using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HotelBuilding
{
    public partial class Cart : System.Web.UI.Page
    {   
        protected void Page_Load(object sender, EventArgs e)
        {
            if((Boolean)Session["UserPresent"] == true)
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=Hotel; integrated security=True;"))
                {
                    string TotalQry = "Select Sum(Cast(ItemPrice as int) * Cast(Quantity as int)) as Total from Cart;";

                    con.Open();

                    SqlCommand cmd = new SqlCommand(TotalQry, con);

                    SqlDataReader reader = cmd.ExecuteReader();

                    HtmlGenericControl div = ListView1.Parent.FindControl("totalPriceLabel") as HtmlGenericControl;

                    if (reader.Read())
                    {
                        if(reader["Total"].ToString() != "")
                        {
                            div.InnerHtml = "Total Price : " + reader["Total"].ToString();
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
            using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=Hotel; integrated security=True;"))
            {
                Button btn = (Button)sender;
                Label OrderId = (Label)btn.Parent.FindControl("OrderIdLabel");

                con.Open();

                string query = "delete from Cart where OrderId=@OrderId";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("OrderId", OrderId.Text);

                cmd.ExecuteNonQuery();

                con.Close();
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}
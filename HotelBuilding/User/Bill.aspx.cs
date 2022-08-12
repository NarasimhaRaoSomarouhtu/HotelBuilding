using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;



namespace HotelBuilding.User
{
    public partial class Bill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
                    if (reader["Total"].ToString() != "")
                    {
                        div.InnerHtml = "Grand Total : " + reader["Total"].ToString();
                    }
                }

            }
        }
    }
}
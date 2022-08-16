using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBuilding.User
{
    public partial class Bills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=HotelDb; integrated security=True;"))
            {
                con.Open();

                string query = "SELECT Orders.OrderDate AS 'Date', SUM(CAST(Menu.ItemPrice AS int) * CAST(Orders.Quantity AS int)) AS 'Total Price' FROM Menu INNER JOIN Orders ON Menu.ItemId = Orders.ItemId where Username=@Username GROUP BY Orders.OrderDate";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("Username", Session["Username"].ToString());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                da.Fill(dt);
                con.Close();
                ds.Tables.Add(dt);

                ListView1.DataSource = ds.Tables[0];
                ListView1.DataBind();

            }
        }
    }
}
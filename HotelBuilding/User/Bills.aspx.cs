using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace HotelBuilding.User
{
    public partial class Bills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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

        protected void btn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Label DateLabel = (Label)btn.Parent.FindControl("DateLabel");

            DateTime trueDate = DateTime.Parse(DateLabel.Text);

            using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=HotelDb; integrated security=True;"))
            {
                string DetailsQry = "select *, Cast(ItemPrice as int) * Cast(Quantity as int) as 'Total Price' from Menu inner join Orders on Menu.ItemId = Orders.ItemId where [Username] = @Username and OrderDate = @Date;";

                con.Open();

                SqlCommand cmd = new SqlCommand(DetailsQry, con);

                cmd.Parameters.AddWithValue("Username", Session["Username"].ToString());
                cmd.Parameters.AddWithValue("Date", trueDate);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    modalBody.InnerHtml = modalBody.InnerHtml + "Item : " + reader["ItemName"].ToString() + "<br />Item Price : " + reader["ItemPrice"].ToString() + "<br/>Quantity : " + reader["Quantity"] + "<br/>Total Price : "+reader["Total Price"];
                    modalBody.InnerHtml = modalBody.InnerHtml + "<hr />";
                }

                reader.Close();

                string TotalQry = "select Sum(Cast(ItemPrice as int) * Cast(Quantity as int)) 'Total Price' from Menu inner join Orders on Menu.ItemId = Orders.ItemId where [Username] = @Username and OrderDate = @Date; ";

                SqlCommand cmd2 = new SqlCommand(TotalQry, con);

                cmd2.Parameters.AddWithValue("Username", Session["Username"].ToString());
                cmd2.Parameters.AddWithValue("Date", trueDate);


                SqlDataReader reader2 = cmd2.ExecuteReader();

                while (reader2.Read())
                {
                    modalBody.InnerHtml = modalBody.InnerHtml + "Total Price : " + reader2["Total Price"];
                    //modalBody.Style.Add(HtmlTextWriterStyle.Color, "brown");
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "callFunction", "showModal();", true);
            }
        }
    }
}
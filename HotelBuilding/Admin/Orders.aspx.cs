using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelBuilding.Admin
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserPresent"] == null || (Boolean)Session["UserPresent"] != true)
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Label DateLabel = (Label)btn.Parent.FindControl("OrderDateLabel");
            Label NameLabel = (Label)btn.Parent.FindControl("UsernameLabel");

            DateTime trueDate = DateTime.Parse(DateLabel.Text);

            using (SqlConnection con = new SqlConnection(@"Data Source=.; initial catalog=HotelDb; integrated security=True;"))
            {
                string DetailsQry = "select ItemName, ItemPrice, Quantity, Cast(ItemPrice as int) * Cast(Quantity as int) as 'Total Price' from Menu inner join Orders on Menu.ItemId = Orders.ItemId where [Username] = @Username and OrderDate = @Date;";

                con.Open();

                SqlCommand cmd = new SqlCommand(DetailsQry, con);

                cmd.Parameters.AddWithValue("Username", NameLabel.Text);
                cmd.Parameters.AddWithValue("Date", trueDate);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    modalBody.InnerHtml = modalBody.InnerHtml + "Item : " + reader["ItemName"].ToString() + "<br />Item Price : " + reader["ItemPrice"].ToString() + "<br/>Quantity : " + reader["Quantity"] + "<br/>Total Price : " + reader["Total Price"];
                    modalBody.InnerHtml = modalBody.InnerHtml + "<hr />";
                }

                reader.Close();

                string TotalQry = "select Sum(Cast(ItemPrice as int) * Cast(Quantity as int)) 'Total Price' from Menu inner join Orders on Menu.ItemId = Orders.ItemId where [Username] = @Username and OrderDate=@Date";

                SqlCommand cmd2 = new SqlCommand(TotalQry, con);

                cmd2.Parameters.AddWithValue("Username", NameLabel.Text);
                cmd2.Parameters.AddWithValue("Date", trueDate);

                SqlDataReader reader2 = cmd2.ExecuteReader();

                while (reader2.Read())
                {
                    modalBody.InnerHtml = modalBody.InnerHtml + "Grand Total : " + reader2["Total Price"];
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
            }
        }

    }
}
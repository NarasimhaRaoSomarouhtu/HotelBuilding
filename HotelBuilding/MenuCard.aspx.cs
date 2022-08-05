using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace HotelBuilding
{
    public partial class MenuCard : System.Web.UI.Page
    {
       
     
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"data source=.;initial catalog=Hotel;integrated security=True;"))
            {
                con.Open();
                string query = "select ItemId,ItemName,ItemPrice form Item ";
                SqlCommand cmd = new SqlCommand(query, con);

                ddlResult.DataSource = cmd.ExecuteReader();
                ddlResult.DataTextField = "ItemName";
                ddlResult.DataValueField = "ItemId";
                ddlResult.DataBind();

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            


        }
    }
}
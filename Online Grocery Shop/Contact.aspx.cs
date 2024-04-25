using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    public static int i = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (i == 1)
        {
            lblresp.Text = "Thank You For Your Review.";
            i = 0;
        }
    }

    protected void btnSendMsg_Click(object sender, EventArgs e)
    {

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"Insert into Feedback values ('" + txtname.Text.Trim() + "','" + txtemail.Text.Trim() + "','" + txtContact.Text.Trim() + "','" + txtMessage.Text.Trim() + "')", cn);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        i = 1;
        Response.Redirect(Request.RawUrl);
    }
}
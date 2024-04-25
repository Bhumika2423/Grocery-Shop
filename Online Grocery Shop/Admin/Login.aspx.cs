using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
    }
    protected void btnAdlogin_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"select 1 from [AdminUsers] where UserName='" + txtUnameAd.Text.Trim() + "' and Password='" + txtPassAd.Text.Trim() + "'", cn);
        cn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Session["Admin"] = txtUnameAd.Text.Trim();
            Response.Redirect("~/Admin/Admin.aspx");
        }
        else
        {
            spnmsg.Visible = true;
        }
        cn.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Home.aspx");
    }
}
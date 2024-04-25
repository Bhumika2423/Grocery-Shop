using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddAdmin : System.Web.UI.Page
{
    public static string show = string.Empty;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] != null)
        {
            if (show == "Delete")
            {
                lblMsg.Text = "Admin removed Succesfully !!";
                show = string.Empty;
            }
            else if (show == "Add")
            {
                lblMsg.Text = "Admin Added Successfully !!";
                show = string.Empty;
            }
            else if (show == "Exists")
            {
                lblMsg.Text = "Admin UserName Already Exists !!";
                show = string.Empty;
            }
            this.fillgrid();
        }
        else
        {
            Response.Redirect("~/Admin/Login.aspx");
        }
    }
    protected void gvAdmin_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = gvAdmin.Rows[e.RowIndex];
        Label lblAid = (Label)row.FindControl("lblAid");
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"delete from AdminUsers where AdminID=" + lblAid.Text.Trim(), cn);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        fillgrid();
        show = "Delete";
        Response.Redirect(Request.RawUrl);
    }
    protected void fillgrid()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"select * from AdminUsers", cn);
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        gvAdmin.DataSource = ds;
        gvAdmin.DataBind();

    }
    protected void btnAddAdmin_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd0 = new SqlCommand(@"select case when (select 1 from AdminUsers where UserName='" + txtAuser.Text.Trim() + "')=1 then 1 else 0 end",cn);
        SqlCommand cmd = new SqlCommand(@"Insert into AdminUsers values ('" +txtAuser.Text.Trim()+"','" + txtApwd.Text.Trim() + "')", cn);
        cn.Open();
        int i =(int)cmd0.ExecuteScalar();
        if (i == 1)
        {
            show = "Exists";
        }
        else
        {
            cmd.ExecuteNonQuery();
            show = "Add";
        }
        cn.Close();
        Response.Redirect(Request.RawUrl);
    }
}
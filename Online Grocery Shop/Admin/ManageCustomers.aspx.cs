using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageCustomers : System.Web.UI.Page
{
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillgrid();
        }
    }
    protected void fillgrid()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"SELECT * FROM [Registration] ", cn);
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        gvCustomer.DataSource = ds;
        gvCustomer.DataBind();

    }
    protected void gvCustomer_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvCustomer.EditIndex = e.NewEditIndex;
        fillgrid();
    }
    protected void gvCustomer_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvCustomer.Rows[e.RowIndex];
        Label odid = (Label)row.FindControl("lblid");
        CheckBox chkActive = (CheckBox)row.FindControl("chkActive");
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        int active;
        if (chkActive.Checked == false)
        {
            active = 0;
        }
        else
        {
            active = 1;
        }
        SqlCommand cmd = new SqlCommand(@"update Registration  set active = "+active+" where Id=" + odid.Text, cn);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        gvCustomer.EditIndex = -1;
        fillgrid();
        lblMsg.Text = "Customer is Sucessfully Updated";


    }
    protected void gvCustomer_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvCustomer_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        e.Cancel = true;
        gvCustomer.EditIndex = -1;
        fillgrid();
    }
}
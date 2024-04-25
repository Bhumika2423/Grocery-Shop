using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;


public partial class Admin_ManageOrders : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand(@"Select * from [Order] order by Order_Time ", cn);
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        gvManageOrders.DataSource = ds;
        gvManageOrders.DataBind();

    }
    protected void gvManageOrders_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvManageOrders.Rows[e.RowIndex];
        Label odid = (Label)row.FindControl("lblOCode");
        TextBox txtadd = (TextBox)row.FindControl("txtAdd");
        TextBox txtstate = (TextBox)row.FindControl("txtState");
        TextBox txtcity = (TextBox)row.FindControl("txtCity");
        TextBox txtpostal = (TextBox)row.FindControl("txtPc");
        DropDownList ddlStatus = (DropDownList)row.FindControl("ddlStatusGV");

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"update [Order] set Address  ='" + txtadd.Text.Trim() + "',state = '" + txtstate.Text.Trim() + "',city ='" + txtcity.Text.Trim() + "',Postalcode ='" + txtpostal.Text.Trim() + "',Status='" + ddlStatus.SelectedValue + "' where order_Code ='" + odid.Text.Trim() + "'", cn);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        gvManageOrders.EditIndex = -1;
        fillgrid();
        lblMsg.Text = "Order Updated Successfully !!";


    }
    protected void gvManageOrders_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvManageOrders.EditIndex = e.NewEditIndex;
        fillgrid();

    }
    protected void gvManageOrders_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = gvManageOrders.Rows[e.RowIndex];
        Label odid = (Label)row.FindControl("lblOCode");

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"delete from [order] where  order_Code ='" + odid.Text.Trim() + "'", cn);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        fillgrid();
        lblMsg.Text = "Order Deleted Successfully !!";

    }
    protected void gvManageOrders_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvManageOrders.EditIndex = -1;
        fillgrid();


    }
    protected void btnExport_Click(object sender, EventArgs e)
    {


        string constr = ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Select RTRIM(Order_Code) as [Order Code],Order_Time as [Order Date],RTRIM(Productname) as [Product Name],RTRIM(OrderedProducts.Price) as [Price ($)],RTRIM(Qty) as [Qty],RTRIM(Unit) as [Unit],RTRIM(Name) as [Customer name],RTRIM(Address + ',' + City + ',' + State + ',' + PostalCode) as [Address],RTRIM(TotalAmount) as [Total Amount ($)] from [Order],OrderedProducts,Product where product.ProductID=Orderedproducts.Prod_ID and [Order].Order_Code=OrderedProducts.OrderCode and Status='Confirmed' order by Order_Time"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        using (XLWorkbook wb = new XLWorkbook())
                        {
                            wb.Worksheets.Add(dt, "Order");

                            Response.Clear();
                            Response.Buffer = true;
                            Response.Charset = "";
                            string FileName = "Report-" + System.DateTime.Now + ".xlsx";
                            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                            Response.AddHeader("content-disposition", "attachment;filename= " + FileName);
                            using (MemoryStream MyMemoryStream = new MemoryStream())
                            {
                                wb.SaveAs(MyMemoryStream);
                                MyMemoryStream.WriteTo(Response.OutputStream);
                                Response.Flush();
                                Response.End();
                            }
                        }
                    }
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
public partial class OrderHistory : System.Web.UI.Page
{
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        fillgrid();
    }
 
    protected void fillgrid()
    {
        if (Session["User"] != null)
        {
             if (Request.QueryString["invo"].ToString() != "")
            {
            int odid = Convert.ToInt32(Request.QueryString["invo"].ToString());
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
            SqlCommand cmd = new SqlCommand(@"Select * from [Order] where Order_Code='" + odid + "' ", cn);
            cn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            lblOrderCode.Text = ds.Tables[0].Rows[0]["order_code"].ToString();
            lblOrderTime.Text = ds.Tables[0].Rows[0]["order_time"].ToString();
            lblCustomerName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            lblAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            lblCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
            lblState.Text = ds.Tables[0].Rows[0]["State"].ToString();
            lblPostalCode.Text = ds.Tables[0].Rows[0]["PostalCode"].ToString();
            lblGrandTotal.Text = ds.Tables[0].Rows[0]["GrandTotal"].ToString();
            lblUserID.Text = ds.Tables[0].Rows[0]["User_ID"].ToString();
            SqlConnection cn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
            SqlCommand cmd1 = new SqlCommand(@"SELECT Productname,ImageURL,Unit,CategoryType,Qty,OrderedProducts.Price,TotalAmount from Product,CategoryMaster,OrderedProducts where CategoryMaster.CategoryID=Product.CategoryID and OrderedProducts.Prod_ID=Product.ProductID and OrderCode='" + odid + "'", cn1);
            cn1.Open();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            ds = new DataSet();
            da1.Fill(ds);
            gvorderHistory.DataSource = ds;
            gvorderHistory.DataBind();
        
       }
            else
            {
                Response.Redirect("~/OrderHistory.aspx");
            }
        }
        else
        {

            Page.ClientScript.RegisterStartupScript(typeof(Page), "<script>", "<script>alert ('Please Login')</script>");
            Response.Redirect("Home.aspx");
        }
    }
 
}
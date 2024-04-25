using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    DataSet ds;
    public static string show = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (show == "show")
        {
            lblMsg.Text = "Product Added to Cart Successfully !!";
            show = string.Empty;
        }

        if (!string.IsNullOrWhiteSpace(Request.QueryString["Q"]))
            {
                string query = Request.QueryString["Q"].ToString();
                SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
                SqlCommand cmd = new SqlCommand(@"Select * From Product where ProductName Like '%" + query + "%'", cn);
                cn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                gvSearch.DataSource = ds;
                gvSearch.DataBind();
            }
        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"Select * From Product where ProductName Like '%" + txtSearch.Text.Trim() + "%'", cn);
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds);
        gvSearch.DataSource = ds;
        gvSearch.DataBind();
    }

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        Button temp = (Button)sender;
        DataListItem dli = (DataListItem)temp.Parent;
        Label lblReq = (Label)dli.FindControl("lblReq");
        TextBox txtqty = (TextBox)dli.FindControl("txtQty");
        if (!string.IsNullOrEmpty(txtqty.Text.Trim()))
        {
            Label lblid = (Label)dli.FindControl("ProductIdLabel");
            Image img = (Image)dli.FindControl("imgPd");
            Label lblnam = (Label)dli.FindControl("NameLabel");
            Label lblUnit = (Label)dli.FindControl("UnitLabel");
            Label price = (Label)dli.FindControl("PriceLabel");
            Label catid = (Label)dli.FindControl("TypeIdLabel");
            DataTable dt = new DataTable();
            if (Session["Cart"] != null)
            {
                dt = (DataTable)Session["Cart"];
            }
            else
            {
                DataColumn product_ID = new DataColumn("product_ID");
                DataColumn Product_img = new DataColumn("Product_img");
                DataColumn Product_name = new DataColumn("Product_name");
                DataColumn Unit = new DataColumn("Unit");
                DataColumn ProductPrice = new DataColumn("ProductPrice");
                DataColumn Qty = new DataColumn("Qty");
                DataColumn Category = new DataColumn("Category");
                DataColumn TotalPrice = new DataColumn("TotalPrice");

                dt.Columns.Add(product_ID);
                dt.Columns.Add(Product_img);
                dt.Columns.Add(Product_name);
                dt.Columns.Add(Unit);
                dt.Columns.Add(ProductPrice);
                dt.Columns.Add(Qty);
                dt.Columns.Add(Category);
                dt.Columns.Add(TotalPrice);
            }
            DataRow dr = dt.NewRow();
            dr["product_ID"] = lblid.Text;
            dr["Product_img"] = img.ImageUrl.ToString();
            dr["Product_name"] = lblnam.Text;
            dr["Unit"] = lblUnit.Text;
            dr["ProductPrice"] = price.Text.Replace("$", "");
            dr["Qty"] = txtqty.Text;
            dr["Category"] = catid.Text;
            Decimal Totalprices = Decimal.Parse(txtqty.Text) * Decimal.Parse(price.Text.Replace("$", ""));
            dr["TotalPrice"] = Totalprices.ToString();
            dt.Rows.Add(dr);
            Session["Cart"] = dt;
            show = "show";
            Response.Redirect(Request.RawUrl);
        }
    }
}
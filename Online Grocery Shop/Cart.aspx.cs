using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Cart"] != null)
        {
            if (!Page.IsPostBack)
                BindGrid();
        }
        else
        {
            divtotal.Visible = false;
            dvMain.Visible = false;
            dvempty.Visible = true;
        }
    }
    public void BindGrid()
    {
        DataTable dt = (DataTable)Session["Cart"];
        gvCart.DataSource = dt;
        gvCart.DataBind();
        if (dt.Rows.Count <= 0)
            btnChekout.Visible = false;
        Totalprice();
    }

    protected void gvCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        e.Cancel = true;
        gvCart.EditIndex = -1;
        BindGrid();
    }
    protected void gvCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvCart.Rows[e.RowIndex];
        Image img = (Image)row.FindControl("imgPd");
        Label lblnam = (Label)row.FindControl("lblName");
        Label price = (Label)row.FindControl("lblPrice");
        Label lbltotalpricegv = (Label)row.FindControl("lbltotPriceGv");
        TextBox txtqty = (TextBox)row.FindControl("txtQty");
        DataTable dt = (DataTable)Session["Cart"];
        DataRow dr = dt.Rows[e.RowIndex];
        if (txtqty.Text == "")
        {
            lblmess.Visible = true;
            btnChekout.Enabled = false;
        }
        else
        {
            lblmess.Visible = false;
            btnChekout.Enabled = true;
            lbltotalpricegv.Text = (decimal.Parse(price.Text) * decimal.Parse(txtqty.Text)).ToString();
            dr["Product_name"] = lblnam.Text;
            dr["ProductPrice"] = price.Text;
            dr["Qty"] = txtqty.Text;
            Decimal Totalprices = Decimal.Parse(lbltotalpricegv.Text);
            dr["TotalPrice"] = Totalprices.ToString();
            dr["Product_img"] = img.ImageUrl;
           // Session.Remove("Cart");
            Session["Cart"] = dt;
            gvCart.EditIndex = -1;
            BindGrid();
        }
    }
    private void Totalprice()
    {
        Decimal totalprice = 0;
        for (int i = 0; i < gvCart.Rows.Count; i++)
        {
            Label lb = this.gvCart.Rows[i].FindControl("lbltotPriceGv") as Label;
            Decimal VALUE = Convert.ToDecimal(lb.Text);
            totalprice = totalprice + VALUE;
        }
        lbltotPrice.Text = totalprice.ToString();
    }
    protected void gvCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvCart.EditIndex = e.NewEditIndex;
        BindGrid();
    }
    protected void gvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = (DataTable)Session["Cart"];
        DataRow dr = dt.Rows[e.RowIndex];
        dr.Delete();
        BindGrid();
        Response.Redirect(Request.RawUrl);
    }
    protected void btnChekout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Order.aspx");
    }
}
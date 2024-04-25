using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class PerfumeMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cartcount();
        }

        if (Request.Url.ToString().Contains("/Home.aspx") || Request.Url.ToString().Contains("/Registration.aspx"))
        {
            if (Session["User"] != null)
            {
                lbluname.Text = Session["User"].ToString();
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
                logout.Visible = true;
                lbtoredrhistory.Visible = true;
            }
            signini.Visible = false;
            upllogin.Update();
        }
        else
        {
            if (Session["User"] != null)
            {
                lbluname.Text = Session["User"].ToString();
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
                ltHi.Visible = true;
                logout.Visible = true;
                lbtoredrhistory.Visible = true;
                signini.Visible = false;
                upllogin.Update();
            }
        }
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            FormsAuthentication.SignOut();
            Session.Remove("User");
            Session.Abandon();
            Session.RemoveAll();
            Session.Clear();
            Response.Redirect("~/Home.aspx");
        }
        else
        {
            Response.Redirect("~/Home.aspx");
        }
    }
    protected void btnsingin_Click(object sender, EventArgs e)
    {
        dvsignin.Visible = true;
        signini.Visible = false;
        upllogin.Update();
    }
    protected void cancel_Click(object sender, EventArgs e)
    {
        dvsignin.Visible = false;
        signini.Visible = true;
        upllogin.Update();
    }
    public void cartcount()
    {
        if (Session["Cart"] != null)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Cart"];
            int coun = dt.Rows.Count;
            ltitemCount.Text = coun.ToString();
        }
    }
    protected void signin_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"select 1 from [Login] where UserEmail='" + loginUname.Text.Trim() + "' and Password='" + Pass.Text.Trim() + "'", cn);
        cn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Session["User"] = loginUname.Text.Trim();
            Response.Redirect("~/Products.aspx");
        }
        cn.Close();
        upllogin.Update();
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Search.aspx?Q=" + txtsearch.Text.Trim() + "");
    }
    protected void lbtoredrhistory_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/OrderHistory.aspx");
    }
}

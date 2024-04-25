using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PADMIN : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] != null)
        {
            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");
            loggedUser.Text = Session["Admin"].ToString();
            string url = HttpContext.Current.Request.Url.ToString();
            string value = string.Empty;
            if (url.Contains("/ManageProducts"))
                value = "1";
            else if (url.Contains("/ManageCustomers"))
                value = "2";
            else if (url.Contains("/ManageOrders") || (url.Contains("/ViewOrders")))
                value = "3";
            else if (url.Contains("/Feedbacks"))
                value = "4";
            else if (url.Contains("/AddAdmin"))
                value = "5";
            else
                value = "0";
            setTree(value);
        }
        else
        {
            Response.Redirect("~/Admin/Login.aspx");
        }
    }

    public void setTree(string value)
    {
        foreach (TreeNode node in tvAdminMenu.Nodes)
        {
            foreach (TreeNode child in node.ChildNodes)
            {
                
                if (child.Value == value)
                {
                    child.Selected = true;
                    child.Expanded = true;
                    return;
                }
            }
        }
    }
    protected void lbtLogout_Click(object sender, EventArgs e)
    {
        if (Session["Admin"] != null)
        {
            FormsAuthentication.SignOut();
            Session["Admin"] = null;
            Session.Abandon();
            Session.RemoveAll();
            Session.Clear();
        }
        Response.Redirect("~/Admin/Login.aspx");
    }
}

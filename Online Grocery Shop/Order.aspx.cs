using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;
using System.Net.Mail;

public partial class Order : System.Web.UI.Page
{
    public static int show = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(show==1)
        {
            lblMsg.Text="Order Placed Successfully, Please see Order History For Order Details!!";
            show = 0;
        }
        if (Session["User"] != null)
        {
            if (Session["Cart"] != null)
            {
                DataTable dt = (DataTable)Session["Cart"];
                if (!Page.IsPostBack)
                {
                    if (!dt.Columns.Contains("OrderNumber"))
                    {
                        DataColumn dc = new DataColumn();
                        dc.ColumnName = "OrderNumber";
                        dt.Columns.Add(dc);
                    }
                }
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Random rn = new Random();
                    dt.Rows[i]["OrderNumber"] = rn.Next();
                }
                gvorder.DataSource = dt;
                gvorder.DataBind();
                Totalprice();
                Session["Cart"] = dt;
            }
            else
            {
                divmain.Visible = false;
                dvempty.Visible = true;
            }
        }
        else
        {
            divmain.Visible = false;
            divLogin.Visible = true;
        }
    }
    private void Totalprice()
    {
        Decimal totalprice = 0;
        for (int i = 0; i < gvorder.Rows.Count; i++)
        {
            Label lb = this.gvorder.Rows[i].FindControl("lbltotPriceGv") as Label;
            Decimal VALUE = Convert.ToDecimal(lb.Text);
            totalprice = totalprice + VALUE;
        }
        lbltotPrice.Text = totalprice.ToString();
    }
    public static string GetUniqueKey(int maxSize)
    {
        char[] chars = new char[62];
        chars =
        "123456789".ToCharArray();
        byte[] data = new byte[1];
        RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider();
        crypto.GetNonZeroBytes(data);
        data = new byte[maxSize];
        crypto.GetNonZeroBytes(data);
        StringBuilder result = new StringBuilder(maxSize);
        foreach (byte b in data)
        {
            result.Append(chars[b % (chars.Length)]);
        }
        return result.ToString();
    }
 
    private void SendMail()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"Select * from [Order] where Order_Code='" + lblOrderCode.Text + "' ", cn);
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        lblUserID.Text = ds.Tables[0].Rows[0]["User_ID"].ToString();
        MailMessage Msg = new MailMessage();
        // Sender e-mail address.
        Msg.From = new MailAddress("amrinder0751@gmail.com");
        string ReceipientID = lblUserID.Text;
        // Recipient e-mail address.
        Msg.To.Add(ReceipientID);
        Msg.Subject = "Order Details";
        string body = "Your order has order no. " + lblOrderCode.Text + " with Fresho Mart is placed successfully..." + "\n" + "You will recieve your items by date " + System.DateTime.Now.AddDays(2).ToShortDateString() + "\n" + "Thanks" + "\n" + "Team FreshoMart";
        Msg.Body = body;
        Msg.IsBodyHtml = true;
        // your remote SMTP server IP.
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("amrinder0751@gmail.com", "enfield1537");
        smtp.EnableSsl = true;
        smtp.Send(Msg);
    }

    protected void ImageButton_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = (DataTable)Session["Cart"];
        Label lbluid = new Label();
        Label lbluname = new Label();
        Label lblemailid = new Label();
        Label lbluaddress = new Label();
        Label lblucountry = new Label();
        Label lblustate = new Label();
        Label lblucity = new Label();
        lblOrderCode.Text = GetUniqueKey(6);
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.Connection.Open();
        cmd.CommandText = "insert into [Order] (order_code,order_time,Name,User_Id,Address,State,City,PostalCode,Comment,Status,GrandTotal) values ('" + lblOrderCode.Text + "',getdate(),'" + txtname.Text + "','" + Session["User"].ToString() + "','" + txtstreet.Text + "','" + txtstate.Text.Trim() + "','" + txtcity.Text + "'," + txtPostal.Text + ",'" + txtComment.Text + "','Confirmed'," + lbltotPrice.Text + ") ";
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        for (int j = 0; j < dt.Rows.Count; j++)
        {
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = con1;
            cmd1.Connection.Open();
            cmd1.CommandText = "insert into [OrderedProducts] (OrderCode,Prod_ID,Qty,Price,TotalAmount) values ('" + lblOrderCode.Text + "'," + dt.Rows[j]["product_ID"].ToString() + "," + dt.Rows[j]["Qty"].ToString() + "," + dt.Rows[j]["ProductPrice"].ToString() + "," + dt.Rows[j]["TotalPrice"].ToString() + ") ";
            cmd1.CommandType = CommandType.Text;
            cmd1.ExecuteNonQuery();
            cmd1.Connection.Close();

        }
        Session.Remove("Cart");

        string redirectUrl = "";
        //Mention URL to redirect content to paypal site
        redirectUrl += "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=" + ConfigurationManager.AppSettings["PayPalEmail"].ToString();
        //First name I assign static based on login details assign this value
        redirectUrl += "&first_name=Fresho Mart";
        //Product Name
        redirectUrl += "&item_name=Grocery Items";
        //Product Amount
        redirectUrl += "&amount=" + lbltotPrice.Text;
        //Business contact paypal EmailID
        redirectUrl += "&business=abhinavjit_singh-facilitator@yahoo.com";
        //If transactioin has been successfully performed, redirect SuccessURL page- this page will be designed by developer
        redirectUrl += "&return=http://localhost:6261/OrderDetails.aspx?invo=" + lblOrderCode.Text + "";
        //SendMail();
        Response.Redirect(redirectUrl);
    }
}
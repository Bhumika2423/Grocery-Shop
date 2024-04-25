using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationSuccessfull : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UserEmail"] != null)
            {
                getUserData();
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
    }

    public void getUserData()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"Select * From Registration where Email='" + Session["UserEmail"].ToString() + "'", cn);
        cn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            lbEmail.Text = dr["Email"].ToString();
            lblCity.Text = dr["City"].ToString();
            lblCOuntry.Text = dr["Country"].ToString();
            lblDob.Text = dr["BirthDate"].ToString();
            lblGen.Text = dr["Gender"].ToString();
            lbName.Text = dr["Name"].ToString();
            lbpwd.Text = dr["Password"].ToString();
            lblPhone.Text = dr["PhoneNo"].ToString();
            lbStreet.Text = dr["Street"].ToString();
            lblNatio.Text = dr["Nationality"].ToString();
        }
        cn.Close();
    }
}
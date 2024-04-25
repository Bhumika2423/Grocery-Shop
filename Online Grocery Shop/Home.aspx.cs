using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

public partial class Home : System.Web.UI.Page
{
    public static int i = 0;
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static Slide[] GetImages()
    {
        List<Slide> slides = new List<Slide>();
        string path = HttpContext.Current.Server.MapPath("~/imageslide/");
        if (path.EndsWith("\\"))
        {
            path = path.Remove(path.Length - 1);
        }
        Uri pathUri = new Uri(path, UriKind.Absolute);
        string[] files = Directory.GetFiles(path);
        foreach (string file in files)
        {
            Uri filePathUri = new Uri(file, UriKind.Absolute);
            slides.Add(new Slide
            {
                Name = Path.GetFileNameWithoutExtension(file),
                Description = Path.GetFileNameWithoutExtension(file) + " Description.",
                ImagePath = pathUri.MakeRelativeUri(filePathUri).ToString()
            });
        }
        return slides.ToArray();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (i == 1)
        {
            lblResult.Text = "UserName Or Password is Incorrect";
            i = 0;
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["GroceryDB"].ConnectionString);
        SqlCommand cmd = new SqlCommand(@"select 1 from Registration r right join [login] l on r.Email=l.UserEmail where l.UserEmail='" + txtUserName.Text.Trim()+ "' and l.Password='"+txtPassword.Text.Trim()+"' And r.Active=1", cn);
        cn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Session["User"] = txtUserName.Text.Trim();
            Response.Redirect("Products.aspx");
        }
        else
        {
            i = 1;
        }
        cn.Close();
       
    }
}
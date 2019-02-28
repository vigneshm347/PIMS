using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using EntityLayer;
using BusinessLayer;

namespace PropertyInsurance
{
    public partial class hom : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void login_sbmt(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ValidateUser();
            }
        }
        protected void ValidateUser()
        {
            Users u = new Users();
            UserAuthBAL ub = new UserAuthBAL();
            int i = 0;
            string encryptPass = "";
            string temp = txtpass.Text;
            encryptPass = encrypt(temp);
            try
            {
                u.UserID = txtname.Text;
                u.UserPassword = encryptPass;
                /* Call the BAL method */
                i = ub.UserAuth(u);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            if (i == 1)
            {
                Session["customerid"] = txtname.Text;
                Response.Redirect("admin.aspx");
            }
            else if (i == 2)
            {
                Session["userid"] = txtname.Text;
                Response.Redirect("userPage.aspx");
            }
            else
            {
                lblerror.Text = "Invalid Credentials !";
                lblerror.ForeColor = System.Drawing.Color.Red;
            }
        }
        private string encrypt(string text)
        {
            byte[] bytes = System.Text.Encoding.Unicode.GetBytes(text);
            string Encryptedpassword = Convert.ToBase64String(bytes);
            return Encryptedpassword;
        }

    }
}
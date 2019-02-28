using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using EntityLayer;
using BusinessLayer;
using System.Web.Services;
//using System.Web.Services;
namespace PropertyInsurance
{
    public partial class add_customer : System.Web.UI.Page
    {

        Users u = new Users();
        AddCustomerBAL ub = new AddCustomerBAL();
        SqlDataAdapter rd;
        DataSet ds = new DataSet();
        string password = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["customerid"] == null)
            {
                Response.Redirect("sessionExpired.htm");
            }
            try
            {
                SqlDataAdapter a = ub.ReqCity();
                DataSet dt = new DataSet();
                a.Fill(dt);
                city.DataSource = dt;
                city.DataTextField = "city_name";
                city.DataBind(); ;
            }
            catch (Exception ex)
            {
                Response.Write(ex);

            }
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            AddCustomer();
        }
        public void AddCustomer()
        {
            string uname = txtname.Text + " " + txtlname.Text;
            password = ub.generatePassword();
            string encryptPassword = ub.encrypt(password);
            u.UserPassword = encryptPassword;
            u.UserName = uname;
            u.UserEmailId = txtemail.Text;
            u.UserMobile = txtmobile.Text;
            u.UserIncome = txtannual.Text;
            u.UserPincode = txtpincode.Text;
            u.UserAddress = txtaddr.Text;
            u.UserDob = txtdob.Text;
            u.CreatedAt = DateTime.Now.ToString();
            u.UserCity = city.SelectedValue.ToString();
            /* Calls a method in BAL */
            ub.UserInsertBusiness(u);
            /* Method used to show the Customer ID and Password */
            GetCredentials(txtemail.Text);
        }
        public void GetCredentials(string emailKey)
        {
            StringBuilder table = new StringBuilder();
            /* This will call a BAL method */
            rd = ub.UserCredentials(u);
            rd.Fill(ds);
            try
            {
                for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
                {
                    table.Append("<h4 class='page-header'>One user added successfully. Find the credentials below</h4>");
                    table.Append("<table class='table table-bordered table-striped col-lg-2'>");
                    table.Append("<tr><th class='col-lg-2'>Customer ID</th><th class='col-lg-2'>Customer Password</th>");
                    table.Append("</tr>");
                    table.Append("<tr>");
                    table.Append("<td>" + ds.Tables[0].Rows[j][0] + "</td>");
                    table.Append("<td>" + password + "</td>");
                    table.Append("</tr>");
                }
                phcredentials.Controls.Add(new Literal { Text = table.ToString() });
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                txtemail.Text = string.Empty;
                txtmobile.Text = string.Empty;
                txtannual.Text = string.Empty;
                txtpincode.Text = string.Empty;
                txtaddr.Text = string.Empty;
                txtdob.Text = string.Empty;
                txtname.Text = string.Empty;
                txtlname.Text = string.Empty;
                txtpolnum.Text = string.Empty;
                u = null;
                ub = null;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}
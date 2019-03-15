using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using EntityLayer;
using BusinessLayer;
using System.Web.Services;
namespace WebSite
{
    public partial class add_employee : System.Web.UI.Page
    {
        Employee e = new Employee();
        addEmployeeBAL eb = new addEmployeeBAL();
        SqlDataAdapter rd;
        DataSet ds = new DataSet();
        string password = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["customerid"] == null)
            {
                Response.Redirect("sessionExpired.htm");
            }
         }
        protected void empsubmit_Click(object sender, EventArgs e)
        {
            AddEmployee();
        }
        public void AddEmployee()
        {
            string name = txtname.Text;
            password = eb.generatePassword();
            string encryptPassword = eb.encrypt(password);
            e.employeePass = encryptPassword;
            e.employeeName = name;
            e.employeeEmail = txtemail.Text;
            e.employeeMobile = txtmobile.Text;
            e.employeePincode = txtpincode.Text;
            e.employeeAddress = txtaddr.Text;
            e.employeeDob = txtdob.Text;
            /* Calls a method in BAL */
            eb.EmployeeInsertBusiness(e);
            /* Method used to show the Customer ID and Password */
            GetCredentials(txtemail.Text);
        }

        public void GetCredentials(string emailKey)
        {
            StringBuilder table = new StringBuilder();
            /* This will call a BAL method */
            rd = eb.EmployeeCredentials(e);
            rd.Fill(ds);
            try
            {
                for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
                {
                    table.Append("<h4 class='page-header'>One user added successfully. Find the credentials below</h4>");
                    table.Append("<table class='table table-bordered table-striped col-lg-2'>");
                    table.Append("<tr><th class='col-lg-2'>Employee ID</th><th class='col-lg-2'>Employee Password</th>");
                    table.Append("</tr>");
                    table.Append("<tr>");
                    table.Append("<td>" + ds.Tables[0].Rows[j][0] + "</td>");
                    table.Append("<td>" + password + "</td>");
                    table.Append("</tr>");
                }
                empcredentials.Controls.Add(new Literal { Text = table.ToString() });
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                txtemail.Text = string.Empty;
                txtmobile.Text = string.Empty;
                txtpincode.Text = string.Empty;
                txtaddr.Text = string.Empty;
                txtdob.Text = string.Empty;
                txtname.Text = string.Empty;
                e = null;
                eb = null;
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
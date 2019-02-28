using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using EntityLayer;
using BusinessLayer;

namespace PropertyInsurance
{
    public partial class AddPolicy : System.Web.UI.Page
    {
        string policynum = "";
        string policyid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customerid"] == null)
            {
                Response.Redirect("sessionExpired.htm");
            }
            policynum = Request.QueryString["policynum"];
            txtpolicy.Text = policynum;
            policyid = Request.QueryString["policyid"];
            txtpolicyid.Text = policyid;
        }

        protected void linksbt_Click(object sender, EventArgs e)
        {

            InsertRecord();


        }
        private void InsertRecord()
        {
            int i = 0;
            string today_date = DateTime.Now.ToString("MM/dd/yyyy");
            DateTime temp = DateTime.Now;
            string due_date = temp.AddYears(1).ToString("MM/dd/yyyy");
            try
            {

                ApplyPlanBAL ab = new ApplyPlanBAL();
                Users u = new Users();
                u.Policyid = Convert.ToInt32(policyid);
                u.PolicyNumber = policynum;
                u.UserID = txtid.Text;
                u.Taken_date = today_date;
                u.Due_Date = due_date;
                i = ab.AddPolicy(u);
                txtid.Text = string.Empty;
                if (i == 1)
                {
                    lblack.Text = "Inserted successfully";
                    lblack.ForeColor = System.Drawing.Color.Green;
                }

            }

            catch (SqlException sqlex)
            {
                if (sqlex.Number == 2601 || sqlex.Number == 2627)
                {
                    lblack.Text = "Oops ! Policy Number seems to be inserted already";
                    lblack.ForeColor = System.Drawing.Color.Red;
                }
            }

        }

    }
}
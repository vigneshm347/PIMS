using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Collections;
using EntityLayer;
using BusinessLayer;

namespace PropertyInsurance
{

    public partial class search_plan : System.Web.UI.Page
    {
        Users u = new Users();
        PlansBusiness pb = new PlansBusiness();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["customerid"] == null)
                {
                    Response.Redirect("sessionExpired.htm");
                }
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string type = ddlproduct.SelectedItem.Text.ToLower();
                ListPlans(type);
            }
        }
        /* returns list of plans */
        public void ListPlans(string type)
        {
            DataSet ds = new DataSet();
            StringBuilder table = new StringBuilder();
            try
            {
                u.ProductType = type;
                /* BAL method to display Plan lists available*/
                SqlDataAdapter rd = pb.GetPlansBAL(u);
                ds = new DataSet();
                rd.Fill(ds);
                table.Append("<h4>Showing available plans for " + type.ToUpper() + "</h4>");
                table.Append("<table class='result-table  table table-bordered table-striped table-condensed table-responsive'>");
                table.Append("<tr><th>Plan ID</th><th>Plan Name</th><th>Policy Name</th><th>Feature</th><th>Benefits</th><th>Benefit Illustration</th><th>Eligibility (yr)</th><th>Dependents</th>");
                table.Append("</tr>");
                for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
                {
                    table.Append("<tr>");
                    table.Append("<td>" + ds.Tables[0].Rows[j][0] + "</td>");
                    table.Append("<td>" + ds.Tables[0].Rows[j][1].ToString() + "</td>");
                    table.Append("<td>" + ds.Tables[0].Rows[j][2] + "</td>");
                    table.Append("<td>" + ds.Tables[0].Rows[j][3] + "</td>");
                    table.Append("<td>" + ds.Tables[0].Rows[j][4] + "</td>");
                    table.Append("<td>" + ds.Tables[0].Rows[j][5] + "</td>");
                    table.Append("<td>" + ds.Tables[0].Rows[j][6] + "</td>");
                    table.Append("<td>" + ds.Tables[0].Rows[j][7] + "</td>");
                    table.Append("</tr>");
                }
                phplansrch.Controls.Add(new Literal { Text = table.ToString() });
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
            finally
            {
                u = null;
                pb = null;
                ds.Dispose();

            }

        }
    }
}
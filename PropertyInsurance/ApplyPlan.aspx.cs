using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.Drawing;
using BusinessLayer;
using EntityLayer;

namespace PropertyInsurance
{
    public partial class ApplyPlan : System.Web.UI.Page
    {
        SqlDataAdapter rd;
        DataSet ds = new DataSet();
        Users u = new Users();
        ApplyPlanBAL ap = new ApplyPlanBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customerid"] == null)
            {
                Response.Redirect("sessionExpired.htm");
            }
        }

        protected void btnapply_Click(object sender, EventArgs e)
        {
            string type = "";
            // get product type
            type = ddlprodtype.SelectedItem.Text.ToLower();
            // get user age
            int age = Convert.ToInt32(txtcage.Text);
            // get number of dependents
            int dependent = Convert.ToInt32(txtdependents.Text);
            // filter plans
            Refine(type, age, dependent);
        }

        private void Refine(string type, int age, int dependent)
        {
            u.ProductType = type;
            u.Eligible = age;
            u.MaxDependent = dependent;
            /* calls BAL Method */
            rd = ap.ApplyPlan(u);
            rd.Fill(ds);
            StringBuilder table = new StringBuilder();
            try
            {
                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblnote.Text = "No matches found";
                    lblnote.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    table.Append("<h4>Your search results for " + type.ToUpper() + "</h4><label><span style='color:#d35400;'>* Note : Click on policy name to apply for it</span></label>");
                    table.Append("<table class='result-table  table table-bordered table-striped table-condensed table-responsive'>");
                    table.Append("<tr><th>Policy Name</th><th>Plan Name</th><th>Feature</th><th>Benefits</th><th>Benefit Illustration</th><th>Pay Premium</th><th>Eligibility (yr)</th><th>Dependents</th>");
                    table.Append("</tr>");
                    for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
                    {
                        table.Append("<tr>");
                        table.Append("<td>" + "<a href='preview.aspx?id=" + ds.Tables[0].Rows[j][0] + "' target='_blank' class='goLink' style='color:#000;'>" + ds.Tables[0].Rows[j][2] + "</a>" + "</td>");
                        table.Append("<td>" + ds.Tables[0].Rows[j][1].ToString() + "</td>");
                        table.Append("<td>" + ds.Tables[0].Rows[j][3] + "</td>");
                        table.Append("<td>" + ds.Tables[0].Rows[j][4] + "</td>");
                        table.Append("<td>" + ds.Tables[0].Rows[j][5] + "</td>");
                        table.Append("<td>" + ds.Tables[0].Rows[j][6] + "</td>");
                        table.Append("<td>" + ds.Tables[0].Rows[j][7] + "</td>");
                        table.Append("<td>" + ds.Tables[0].Rows[j][8] + "</td>");
                        table.Append("</tr>");
                    }
                }
                phplans.Controls.Add(new Literal { Text = table.ToString() });
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
            finally
            {
                u = null;
                ap = null;
                ds.Dispose();
            }
        }
    }
}
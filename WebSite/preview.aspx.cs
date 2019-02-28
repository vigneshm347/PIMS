using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using BusinessLayer;
using EntityLayer;

namespace PropertyInsurance
{
    public partial class preview : System.Web.UI.Page
    {
        SqlDataAdapter rd;
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customerid"] == null)
            {
                Response.Redirect("sessionExpired.htm");
            }
            if (!IsPostBack)
            {
                Users u = new Users();
                ApplyPlanBAL ap = new ApplyPlanBAL();
                string policyid = "";
                StringBuilder table = new StringBuilder();
                DateTime dateval = DateTime.Now;
                string date = dateval.ToString("MM/dd/yyyy");
                string duedate = dateval.AddYears(1).ToString("MM/dd/yyyy");
                txtdate.Text = date;
                string polnum = ap.generatePolicyNumber();
                polnum = "PL/" + polnum;
                string id = Request.QueryString["id"];
                u.Policyid = Convert.ToInt32(id);
                /* Call for BAL method */
                rd = ap.GenerateNominationForm(u);
                rd.Fill(ds);
                try
                {
                    for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
                    {
                        table.Append("<tr>");
                        table.Append("<td class='col-lg-3'><b>Policy Number :</b></td><td class='col-lg-3'><b>" + polnum + "</b></td>");
                        table.Append("<td class='col-lg-3'></td><td class='col-lg-3'></td>");
                        table.Append("</tr>");
                        table.Append("<tr>");
                        table.Append("<td class='col-lg-3'><b>Policy ID :</b></td><td class='col-lg-3'>" + ds.Tables[0].Rows[j][1] + "</td>");
                        table.Append("<td class='col-lg-3'><b>Product Type :</b></td><td class='col-lg-3'>" + ds.Tables[0].Rows[j][0].ToString().ToUpper() + "</td>");
                        table.Append("</tr>");
                        table.Append("<tr>");
                        table.Append("<td class='col-lg-3'><b>Plan Name :</b></td><td class='col-lg-3'>" + ds.Tables[0].Rows[j][2].ToString().ToUpper() + "</td>");
                        table.Append("<td class='col-lg-3'><b>Policy Name :</b></td><td class='col-lg-3'>" + ds.Tables[0].Rows[j][3] + "</td>");
                        table.Append("</tr>");
                        table.Append("<tr>");
                        table.Append("<td class='col-lg-3'><b>Policy Feature :</b></td><td class='col-lg-3'>" + ds.Tables[0].Rows[j][4] + "</td>");
                        table.Append("<td class='col-lg-3'><b>Product Benefit :</b></td><td class='col-lg-3'>" + ds.Tables[0].Rows[j][5] + "</td>");
                        table.Append("</tr>");
                        table.Append("<tr>");
                        table.Append("<td class='col-lg-3'><b>Illustration :</b></td><td class='col-lg-3'>" + ds.Tables[0].Rows[j][6] + "</td>");
                        table.Append("<td class='col-lg-3'><b>Premium Payment :</b></td><td class='col-lg-3'>" + ds.Tables[0].Rows[j][7] + "</td>");
                        table.Append("</tr>");
                        table.Append("<tr>");
                        table.Append("<td class='col-lg-3'><b>Eligibilty :</b></td><td class='col-lg-3'>" + ds.Tables[0].Rows[j][8] + "</td>");
                        table.Append("<td class='col-lg-3'><b>Dependents :</b></td><td class='col-lg-3'>" + ds.Tables[0].Rows[j][9] + "</td>");
                        table.Append("</tr>");
                        table.Append("<tr>");
                        table.Append("<td class='col-lg-3'><b>Policy Taken on :</b></td><td class='col-lg-3'>" + date + "</td>");
                        table.Append("<td class='col-lg-3'><b>Policy Due on :</b></td><td class='col-lg-3'>" + duedate + "</td>");
                        table.Append("</tr>");
                        table.Append("</tr>");
                    }
                    phpolsummary.Controls.Add(new Literal { Text = table.ToString() });
                    hdpolnum.Value = polnum;
                    hdpolid.Value = id;

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                }
                finally
                {
                    rd.Dispose();
                    u = null;
                }
            }
        }
    }
}
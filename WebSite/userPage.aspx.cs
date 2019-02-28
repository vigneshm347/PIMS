using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using EntityLayer;
using BusinessLayer;

namespace PropertyInsurance
{
    public partial class userPage1 : System.Web.UI.Page
    {
        string userid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("sessionExpired.htm");
            }
            else
            {
                userid = Session["userid"].ToString();
                HiddenField1.Value = userid.ToString();
                GetData();
            }
        }
        private void GetData()
        {
            DataSet ds = new DataSet();
            DataSet ds1 = new DataSet();
            Users u = new Users();
            u.UserID = userid;
            UserInfoBAL uib = new UserInfoBAL();
            SqlDataAdapter rd = new SqlDataAdapter();
            SqlDataAdapter rd1 = new SqlDataAdapter();
            /* Calls the BAL method to get User personal info */
            rd = uib.RequestUserInfo(u);
            rd.Fill(ds);
            /* Calls the BAL method to get Policy Info */
            rd1 = uib.RequestPolicyInfo(u);
            rd1.Fill(ds1);
            StringBuilder html = new StringBuilder();
            StringBuilder html1 = new StringBuilder();
            for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
            {

                html.Append("<div class='container'>");
                html.Append("<table class='table table-bordered table-striped'  cellpadding='10px'>");
                html.Append("<tr><th colspan='2' style='color: white; text-align:  center; background-color:#1abc9c;'>User Information</th></tr>");
                html.Append("<tr><td>Customer ID: </td><td class='fontc'>" + ds.Tables[0].Rows[j][0] + "</td></tr>");
                html.Append("<tr><td>Name </td><td class='fontc'>" + ds.Tables[0].Rows[j][1].ToString().ToUpper() + "</td></tr>");
                html.Append("<tr><td>Email ID: </td><td class='fontc'>" + ds.Tables[0].Rows[j][2].ToString() + "</td></tr>");
                html.Append("<tr><td>Mobile: </td><td class='fontc'>+91-" + ds.Tables[0].Rows[j][3] + "</td></tr>");
                html.Append("<tr><td>Annual Income: </td><td class='fontc'>" + ds.Tables[0].Rows[j][4] + "</td></tr>");
                html.Append("<tr><td>Date of birth: </td><td class='fontc'>" + ds.Tables[0].Rows[j][7].ToString().Substring(0, 9) + "</td></tr>");
                html.Append("<tr><td>Address: </td><td class='fontc'>" + ds.Tables[0].Rows[j][5].ToString().ToUpper() + ", " + ds.Tables[0].Rows[j][6] + ", " + ds.Tables[0].Rows[j][8].ToString() + ", " + ds.Tables[0].Rows[j][9].ToString() + ", " + ds.Tables[0].Rows[j][10].ToString().ToUpper() + "</td></tr>");
                html.Append("</table>");
                html.Append("</div>");
            }
            html1.Append("<div class='container'>");
            html1.Append("<div class='panel-group'>");
            html1.Append("<div class='panel panel-primary'>");
            html1.Append("<div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#accordion' data-target='#collapseOne' aria-expanded='true' aria-controls='collapseOne' href='#collapseOne'>Pull Down for policy details</a></h4></div>");

            for (int j = 0; j <= ds1.Tables[0].Rows.Count - 1; j++)
            {
                html1.Append("<div id='collapseOne' class='panel-collapse collapse '>");
                html1.Append(" <div class='panel-body accordion-body'>");
                html1.Append("<table class='table table-bordered table-striped' cellpadding='10px'>");
                html1.Append("<tr><th colspan='2' style='color: white; text-align:  center; background-color:#d35400;'>" + ds1.Tables[0].Rows[j][2].ToString().ToUpper() + "</th></tr>");
                html1.Append("<tr><td>Policy Number: </td><td class='fontc'>" + ds1.Tables[0].Rows[j][0].ToString() + "</td></tr>");
                html1.Append("<tr><td>Plan Name </td><td class='fontc'>" + ds1.Tables[0].Rows[j][1].ToString().ToUpper() + "</td></tr>");
                html1.Append("<tr><td>Policy Feature:</td><td class='fontc'>" + ds1.Tables[0].Rows[j][3].ToString() + "</td></tr>");
                html1.Append("<tr><td>Policy Benefit: </td><td class='fontc'>" + ds1.Tables[0].Rows[j][4].ToString() + "</td></tr>");
                html1.Append("<tr><td>Premium Payment (per year): </td><td class='fontc'>" + ds1.Tables[0].Rows[j][5] + "</td></tr>");
                html1.Append("<tr><td>Dependents </td><td class='fontc'>" + ds1.Tables[0].Rows[j][6] + "</td></tr>");
                html1.Append("<tr><td>Property </td><td class='fontc'>" + ds1.Tables[0].Rows[j][7].ToString().ToUpper() + "</td></tr>");
                html1.Append("<tr><td>Policy Taken: </td><td class='fontc'>" + ds1.Tables[0].Rows[j][8] + "</td></tr>");
                html1.Append("<tr><td>Renewal Date: </td><td class='fontc'>" + ds1.Tables[0].Rows[j][9] + "</td></tr>");
                html1.Append("</div>");
                html.Append("</table>");
                html1.Append("</div>");
                html1.Append("</div>");
                html1.Append("</div>");
                html1.Append("</div>");
                html1.Append("</br>");

            }

            
            phpolinfo.Controls.Add(new Literal { Text = html1.ToString() });


        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

    }
}
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using EntityLayer;
using BusinessLayer;
using System.Text;

namespace WebSite
{
    public partial class employee_claimaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    string query = "SELECT customer_id FROM claim_manager group by customer_id";
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                        {
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                ddlcustomers.DataSource = dt;
                                ddlcustomers.DataTextField = "customer_id";
                                ddlcustomers.DataBind();
                            }
                        }
                    }
                }
                catch(Exception ex)
                {
                    Response.Write(ex);
                }
                this.BindGrid();
            }
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string query = "SELECT claim_id, accident_date, accident_address, vin, accident_description, claim_status, customer_id, reviewer_comments, property_type FROM claim_manager order by claim_id";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewManageClaims.DataSource = dt;
                        GridViewManageClaims.DataBind();
                    }
                }
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewManageClaims.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewManageClaims.Rows[e.RowIndex];
            int claim_id = Convert.ToInt32(GridViewManageClaims.DataKeys[e.RowIndex].Values[0]);
            string status = (row.FindControl("ddlstatus") as DropDownList).SelectedValue;
            string comment = (row.FindControl("txtcomments") as TextBox).Text;
            string query = "UPDATE claim_manager SET claim_status=@status, reviewer_comments=@comment WHERE claim_id=@claim_id";
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@claim_id", claim_id);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@comment", comment);
                    //cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridViewManageClaims.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridViewManageClaims.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridViewManageClaims.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void btn_fetchCustomerPolicy(Object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            DataSet ds1 = new DataSet();
            Users u = new Users();
            u.UserID = ddlcustomers.SelectedValue;
            UserInfoBAL uib = new UserInfoBAL();
            SqlDataAdapter rd = new SqlDataAdapter();
            SqlDataAdapter rd1 = new SqlDataAdapter();
            rd = uib.RequestUserInfo(u);
            rd.Fill(ds);
            /* Calls the BAL method to get Policy Info */
            rd1 = uib.RequestPolicyInfo(u);
            rd1.Fill(ds1);
            StringBuilder html = new StringBuilder();
            StringBuilder html1 = new StringBuilder();
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


            userpolicyinfo.Controls.Add(new Literal { Text = html1.ToString() });
        }
    }
}
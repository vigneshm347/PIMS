using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace WebSite
{
    public partial class employee_claimaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string query = "SELECT claim_id, accident_date, accident_address, vin, accident_description, claim_status, customer_id, reviewer_comments FROM claim_manager";
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
    }
}
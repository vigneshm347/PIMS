using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace WebSite
{
    public partial class view_claim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGridAccept();
                this.BindGridReject();
                this.BindGridPending();
            }
        }
        private void BindGridAccept()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT claim_id, accident_date, accident_address, vin, accident_description, claim_status, reviewer_comments FROM claim_manager where customer_id='100004' and claim_status='APPROVED'"))
                {
                    using (SqlDataAdapter sda1 = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda1.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda1.Fill(dt);
                            GridViewViewAcceptedClaims.DataSource = dt;
                            GridViewViewAcceptedClaims.DataBind();
                        }
                    }
                }
            }
        }

        private void BindGridReject()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT claim_id, accident_date, accident_address, vin, accident_description, claim_status, reviewer_comments FROM claim_manager where customer_id='100004' and claim_status='REJECTED'"))
                {
                    using (SqlDataAdapter sda2 = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda2.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda2.Fill(dt);
                            GridViewViewRejectedClaims.DataSource = dt;
                            GridViewViewRejectedClaims.DataBind();
                        }
                    }
                }
            }
        }

        private void BindGridPending()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT claim_id, accident_date, accident_address, vin, accident_description, claim_status, reviewer_comments FROM claim_manager where customer_id='100004' and claim_status='PENDING'"))
                {
                    using (SqlDataAdapter sda3 = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda3.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda3.Fill(dt);
                            GridViewViewPendingClaims.DataSource = dt;
                            GridViewViewPendingClaims.DataBind();
                        }
                    }
                }
            }
        }

    }
}
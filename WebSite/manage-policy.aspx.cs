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
using System.Configuration;

namespace WebSite
{
    public partial class manage_policy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string query = "SELECT * FROM plan_detail";
            using (SqlConnection con = new SqlConnection(connection))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewPolicyInfo.DataSource = dt;
                        GridViewPolicyInfo.DataBind();
                    }
                }
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewPolicyInfo.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = GridViewPolicyInfo.Rows[e.RowIndex];
            int id = Convert.ToInt32(GridViewPolicyInfo.DataKeys[e.RowIndex].Values[0]);
            string policyname = (row.FindControl("txtPolicyName") as TextBox).Text;
            string policyfeature = (row.FindControl("txtPolicyFeature") as TextBox).Text;
            string policybenefit = (row.FindControl("txtPolicyBenefit") as TextBox).Text;
            string benefitillustration = (row.FindControl("txtBenefitIllustration") as TextBox).Text;
            int eligible = Convert.ToInt32((row.FindControl("txtElig") as TextBox).Text);
            int maxdependent = Convert.ToInt32((row.FindControl("txtMaxDependent") as TextBox).Text);
            string query = "UPDATE plan_detail SET policy_name=@name, policy_feature=@feature, policy_benefit=@benefit, benefit_illustration=@illus, eligible=@eligible, max_dependent=@dependent WHERE id=@id";
            string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(connection))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@name", policyname);
                        cmd.Parameters.AddWithValue("@feature", policyfeature);
                        cmd.Parameters.AddWithValue("@benefit", policybenefit);
                        cmd.Parameters.AddWithValue("@illus", benefitillustration);
                        cmd.Parameters.AddWithValue("@eligible", eligible);
                        cmd.Parameters.AddWithValue("@dependent", maxdependent);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    GridViewPolicyInfo.EditIndex = -1;
                    this.BindGrid();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Error! " + ex.Message + " Please check the data\");", true);
            }

        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridViewPolicyInfo.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {

            GridViewPolicyInfo.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

    }
}
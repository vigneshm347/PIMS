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
    public partial class add_new_policy : System.Web.UI.Page
    {
        PolicyDetail u = new PolicyDetail();
        AddPolicyDetail ub = new AddPolicyDetail();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connection))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT id, plan_name FROM plan_info"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlCustomers.DataSource = cmd.ExecuteReader();
                        ddlCustomers.DataTextField = "plan_name";
                        ddlCustomers.DataValueField = "id";
                        ddlCustomers.DataBind();
                        con.Close();
                    }
                }
                ddlCustomers.Items.Insert(0, new ListItem("--Select Customer--", "0"));
            }

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            AddPolicy();
        }

        public void AddPolicy()
        {
            string policyname = txtPolicyName.Text;
            u.PolicyName = txtPolicyName.Text;
            u.PolicyFeature = txtPolicyFeature.Text;
            u.PolicyBenefit = txtPolicyBenefit.Text;
            u.BenefitIllustration = txtBenefitIllus.Text;
            u.Eligible = Convert.ToInt32(txtEligibleAge.Text);
            u.MaxDependent = Convert.ToInt32(txtMaxDependents.Text);
            u.ProductType = ddlType.SelectedValue;
            u.PlanInfoId = Convert.ToInt32(ddlCustomers.SelectedItem.Value);

            /* Calls a method in BAL */
            ub.UserInsertBusiness(u);
        }
    }
}
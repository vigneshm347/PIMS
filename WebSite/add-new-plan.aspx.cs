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
    public partial class add_new_plan : System.Web.UI.Page
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
            string query = "SELECT * FROM plan_info";
            using (SqlConnection con = new SqlConnection(connection))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewPlanInfo.DataSource = dt;
                        GridViewPlanInfo.DataBind();
                    }
                }
            }
        }

        protected void Insert(object sender, EventArgs e)
        {
            string name = txtPlanName.Text;
            string amount = txtPremiumAmt.Text;
            txtPlanName.Text = "";
            txtPremiumAmt.Text = "";
            string query = "INSERT INTO plan_info VALUES(@Name, @amount)";
            string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            try
            {
                if (name == "" || amount == "")
                {
                    throw new Exception("Fields Can't be left empty");
                }
                using (SqlConnection con = new SqlConnection(connection))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@amount", amount);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        this.BindGrid();
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Error! " + ex.Message + " Please check the data\");", true);
            }
            
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewPlanInfo.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = GridViewPlanInfo.Rows[e.RowIndex];
            int id = Convert.ToInt32(GridViewPlanInfo.DataKeys[e.RowIndex].Values[0]);
            string name = (row.FindControl("txtPlanName") as TextBox).Text;
            string amount = (row.FindControl("txtPremiumAmt") as TextBox).Text;
            string query = "UPDATE plan_info SET plan_name=@Name, premium_amt=@amount WHERE id=@id";
            string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            try
            {
                if (name == "" || amount == "")
                {
                    throw new Exception("Fields Can't be left empty");
                }
                using (SqlConnection con = new SqlConnection(connection))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@amount", amount);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    GridViewPlanInfo.EditIndex = -1;
                    this.BindGrid();
                }
            }
            catch(Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Error! " + ex.Message + " Please check the data\");", true);
            }
            
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridViewPlanInfo.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
  
            GridViewPlanInfo.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

    }      
}
using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace WebSite
{
    public partial class EmployeeDashboard : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter adapt;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["customerid"] == null)
                {
                    Response.Redirect("sessionExpired.htm");
                }
                FetchDetails();
            }
        }

        public void FetchDetails()
        {
            dt = new DataTable();
            con = new SqlConnection(connection);
            con.Open();
            adapt = new SqlDataAdapter("Select id, user_id, uname, emailid, mobile, pincode, address from user_info where user_id = "+Session["customerid"] +"", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridViewEmployeeProfile.DataSource = dt;
                GridViewEmployeeProfile.DataBind();
            }
            con.Close();

        }
        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridViewEmployeeProfile.EditIndex = e.NewEditIndex;
            FetchDetails();
        }

        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            SqlCommand cmd;
            Label id = GridViewEmployeeProfile.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox name = GridViewEmployeeProfile.Rows[e.RowIndex].FindControl("txt_ename") as TextBox;
            TextBox emailid = GridViewEmployeeProfile.Rows[e.RowIndex].FindControl("txt_email") as TextBox;
            TextBox mobile = GridViewEmployeeProfile.Rows[e.RowIndex].FindControl("txt_mobile") as TextBox;
            TextBox pincode = GridViewEmployeeProfile.Rows[e.RowIndex].FindControl("txt_pincode") as TextBox;
            TextBox address = GridViewEmployeeProfile.Rows[e.RowIndex].FindControl("txt_address") as TextBox;
            con = new SqlConnection(connection);
            con.Open();
            try
            {
                if (name.Text == "" || emailid.Text == "" || mobile.Text == "" || pincode.Text == "" || address.Text == "" )
                {
                    throw new Exception("Fields Can't be left empty");
                }
                cmd = new SqlCommand("Update user_info set uname='" + name.Text + "',emailid='" + emailid.Text + "',mobile='" + mobile.Text + "',address='" + address.Text + "',pincode='" + pincode.Text +  "' where id=" + Convert.ToInt32(id.Text), con);
                cmd.ExecuteNonQuery();
                con.Close();
                GridViewEmployeeProfile.EditIndex = -1;
                FetchDetails();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Error! " + ex.Message + " Please check the data\");", true);
            }

        }
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridViewEmployeeProfile.EditIndex = -1;
            FetchDetails();
        }
    }
}
using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebSite
{
    public partial class manage_employee : System.Web.UI.Page
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
                ListEmployees();
            }
        }

        public void ListEmployees()
        {
            dt = new DataTable();
            con = new SqlConnection(connection);
            con.Open();
            adapt = new SqlDataAdapter("Select id, user_id, uname, emailid, mobile, pincode, address, isActive from user_info where role_id = 3", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridViewManageEmployee.DataSource = dt;
                GridViewManageEmployee.DataBind();
            }
            con.Close();

        }

            protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
            {
                //NewEditIndex property used to determine the index of the row being edited.  
                GridViewManageEmployee.EditIndex = e.NewEditIndex;
                ListEmployees();
            }

            protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
            {
                //Finding the controls from Gridview for the row which is going to update  
                SqlCommand cmd;
            int id = Convert.ToInt32(GridViewManageEmployee.DataKeys[e.RowIndex].Values[0]);
            TextBox name = GridViewManageEmployee.Rows[e.RowIndex].FindControl("txt_ename") as TextBox;
                TextBox emailid = GridViewManageEmployee.Rows[e.RowIndex].FindControl("txt_email") as TextBox;
                TextBox mobile = GridViewManageEmployee.Rows[e.RowIndex].FindControl("txt_mobile") as TextBox;
                TextBox pincode = GridViewManageEmployee.Rows[e.RowIndex].FindControl("txt_pincode") as TextBox;
                TextBox address = GridViewManageEmployee.Rows[e.RowIndex].FindControl("txt_address") as TextBox;
                DropDownList isactive = GridViewManageEmployee.Rows[e.RowIndex].FindControl("ddlisactive") as DropDownList;
            con = new SqlConnection(connection);
                con.Open();
                try
                {
                    if (name.Text == "" || emailid.Text == "" || mobile.Text == "" || pincode.Text == "" || address.Text == "")
                    {
                        throw new Exception("Fields Can't be left empty");
                    }
                    cmd = new SqlCommand("Update user_info set uname='" + name.Text + "',emailid='" + emailid.Text + "',mobile='" + mobile.Text + "',pincode='" + pincode.Text + "',address='" + address.Text + "',isActive='" + isactive.SelectedValue.ToString() + "' where id=" + Convert.ToInt32(id), con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridViewManageEmployee.EditIndex = -1;
                    ListEmployees();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Error! " + ex.Message + " Please check the data\");", true);
                }

            }
            protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
            {
                //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
                GridViewManageEmployee.EditIndex = -1;
                ListEmployees();
            }
        }
    }
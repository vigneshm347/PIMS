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
    public partial class manage_users : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter adapt;
        DataTable dt;
        Users u = new Users();
        ListCustomersBAL lcb = new ListCustomersBAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["customerid"] == null)
                {
                    Response.Redirect("sessionExpired.htm");
                }
                ListCustomers();
            }
           


        }

        public void ListCustomers()
        {
            dt = new DataTable();
            con = new SqlConnection(connection);
            con.Open();
            adapt = new SqlDataAdapter("Select id, user_id, uname, emailid, mobile, pincode, address, isActive from user_info where role_id = 2", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            con.Close();

        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.  
            GridView1.EditIndex = e.NewEditIndex;
            ListCustomers();
        }
        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            SqlCommand cmd;
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox uname = GridView1.Rows[e.RowIndex].FindControl("txt_uname") as TextBox;
            TextBox emailid = GridView1.Rows[e.RowIndex].FindControl("txt_email") as TextBox;
            TextBox mobile = GridView1.Rows[e.RowIndex].FindControl("txt_mobile") as TextBox;
            TextBox pincode = GridView1.Rows[e.RowIndex].FindControl("txt_pincode") as TextBox;
            TextBox address = GridView1.Rows[e.RowIndex].FindControl("txt_address") as TextBox;
            TextBox isactive = GridView1.Rows[e.RowIndex].FindControl("txt_isactive") as TextBox;
            con = new SqlConnection(connection);
            con.Open();
            try
            {
                if (uname.Text == "" || emailid.Text == "" || mobile.Text == "" || pincode.Text == "" || address.Text == "" || isactive.Text == "")
                {
                    throw new Exception("Fields Can't be left empty");
                }
                cmd = new SqlCommand("Update user_info set uname='" + uname.Text + "',emailid='" + emailid.Text + "',mobile='" + mobile.Text + "',pincode='" + pincode.Text + "',address='" + address.Text + "',isActive='" + Convert.ToInt32(isactive.Text) + "' where user_id=" + Convert.ToInt32(id.Text), con);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.EditIndex = -1;
                ListCustomers();
            }
            catch(Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(\"Error! " + ex.Message + " Please check the data\");", true);
            }
           
        }
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            GridView1.EditIndex = -1;
            ListCustomers();
        }
    }
}
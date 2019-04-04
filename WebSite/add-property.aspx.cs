using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class add_property : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                if (Session["userid"] == null)
                {
                    Response.Redirect("sessionExpired.htm");
                }
                this.BindGrid();
            }
        }


        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string query = "SELECT id, property_type, vin, model_year, car_makr, driver_id, home_address, pincode FROM customer_property_info";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridViewPropertyInfo.DataSource = dt;
                        GridViewPropertyInfo.DataBind();
                    }
                }
            }
        }

        protected void Insert(object sender, EventArgs e)
        {
            string property = ddlpropertyname.SelectedValue;
            string vin = txtvinnum.Text;
            string model = txtmodel.Text;
            string car = txtcarmake.Text;
            string driverid = txtdriverid.Text;
            string homeaddr = txthomeaddress.Text;
            string pincode = txtpincode.Text;
            txtvinnum.Text = "";
            txtmodel.Text = "";
            txtcarmake.Text = "";
            txtdriverid.Text = "";
            txthomeaddress.Text = "";
            txtpincode.Text = "";
            string query = "INSERT INTO customer_property_info values(@customer_id, @property_type, @vin, @model_year, @car_makr, @driver_id, @home_address, @pincode)";
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@customer_id", Session["userid"].ToString());
                    cmd.Parameters.AddWithValue("@property_type", property);
                    cmd.Parameters.AddWithValue("@vin", vin);
                    cmd.Parameters.AddWithValue("@model_year", model);
                    cmd.Parameters.AddWithValue("@car_makr", car);
                    cmd.Parameters.AddWithValue("@driver_id", driverid);
                    cmd.Parameters.AddWithValue("@home_address", homeaddr);
                    cmd.Parameters.AddWithValue("@pincode", pincode);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewPropertyInfo.Rows[e.RowIndex];
            int id = Convert.ToInt32(GridViewPropertyInfo.DataKeys[e.RowIndex].Values[0]);

            string property = (row.FindControl("ddlproperty") as DropDownList).SelectedValue;
            string vin = (row.FindControl("txtvin") as TextBox).Text;
            string model = (row.FindControl("txtmodel") as TextBox).Text;
            string car = (row.FindControl("txtmake") as TextBox).Text;
            string driverid = (row.FindControl("txtdriverid") as TextBox).Text;
            string homeaddr = (row.FindControl("txtaddress") as TextBox).Text;
            string pincode = (row.FindControl("txtpin") as TextBox).Text;


            string query = "UPDATE Customers SET property_type = @property_type, vin = @vin, model_year = @model_year, car_makr = @car_makr, driver_id = @driver_id, home_address = @home_address, pincode = @pincode WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@property_type", property);
                    cmd.Parameters.AddWithValue("@vin", vin);
                    cmd.Parameters.AddWithValue("@model_year", model);
                    cmd.Parameters.AddWithValue("@car_makr", car);
                    cmd.Parameters.AddWithValue("@driver_id", driverid);
                    cmd.Parameters.AddWithValue("@home_address", homeaddr);
                    cmd.Parameters.AddWithValue("@pincode", pincode);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridViewPropertyInfo.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridViewPropertyInfo.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewPropertyInfo.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM customer_property_info WHERE id=@id";
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.BindGrid();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewPropertyInfo.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridViewPropertyInfo.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }


}
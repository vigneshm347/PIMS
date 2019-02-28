using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace PropertyInsurance
{
    public partial class find_agent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("sessionExpired.htm");
            }
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=PC200998;Initial Catalog=super_db;User ID=sa;Password=password-1";
            try
            {
                if (!IsPostBack)
                {
                    conn.Open();
                    string query = "select city_name from city";
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = query;
                    SqlDataReader a = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(a);
                    city.DataSource = dt;
                    city.DataTextField = "city_name";
                    city.DataBind(); ;
                }
            }
            catch { }
            finally
            {
                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder html = new StringBuilder();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "Data Source=PC200998;Initial Catalog=super_db;User ID=sa;Password=password-1";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_FindAgent";
                cmd.Parameters.AddWithValue("@city", city.SelectedValue.ToString());
                SqlDataReader sda = cmd.ExecuteReader();
                if (sda.HasRows)
                {
                    while (sda.Read())
                    {
                        html.Append("<div class='container'>");
                        html.Append("<table class='table table-bordered table-striped'   cellpadding='10px'>");
                        html.Append("<tr><th colspan='2' style='color: white; text-align:  center; background-color:#1abc9c;'>Agent " + sda[1].ToString().ToUpper() + "<a  class='pull-chat pull-right'>Chat</a> </th></tr>");
                        html.Append("<tr><td>Contact Number: </td><td class='fontc'>+91-" + sda[2] + "</td></tr>");
                        html.Append("<tr><td>Address: </td><td class='fontc'>" + sda[3].ToString() + "</td></tr>");
                        html.Append("<tr><td>City: </td><td class='fontc'>" + sda[4] + "</td></tr>");
                        html.Append("<tr><td>Pincode: </td><td class='fontc'>" + sda[5] + "</td></tr>");

                        html.Append("</table>");
                        html.Append("</div>");
                    }
                    Label1.Text = "";
                }
                else
                {
                    Label1.Text = "No agent found";
                }

                PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            }

            catch (Exception ex)
            {
                Response.Write("");
            }

               
            finally
            {
                con.Close();
            }
        }
    }
}
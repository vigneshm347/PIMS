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
    public partial class user_searchplan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                string type = DropdownList1.SelectedItem.Text.ToLower();
             
                ListPlans(type);
            }
        }
        public void ListPlans(string type)
        {
            SqlConnection con = new SqlConnection();
            StringBuilder table = new StringBuilder();
            con.ConnectionString = "Data Source=PC200998;Initial Catalog=super_db;User ID=sa;Password=password-1";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_ListPlans";
                cmd.Parameters.AddWithValue("@plan", type);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.HasRows)
                {
                    table.Append("<h4>Showing available plans for " + type.ToUpper() + "</h4>");
                    table.Append("<table class='result-table  table table-bordered table-striped table-responsive'>");
                    table.Append("<tr><th>Plan ID</th><th>Plan Name</th><th>Policy Name</th><th>Feature</th><th>Benefits</th><th>Benefit Illustration</th><th>Eligibility (yr)</th><th>Dependents</th>");
                    table.Append("</tr>");
                    while (rd.Read())
                    {
                        table.Append("<tr>");
                        table.Append("<td>" + rd[0] + "</td>");
                        table.Append("<td>" + rd[1].ToString().ToUpper() + "</td>");
                        table.Append("<td>" + rd[2] + "</td>");
                        table.Append("<td>" + rd[3] + "</td>");
                        table.Append("<td>" + rd[4] + "</td>");
                        table.Append("<td>" + rd[5] + "</td>");
                        table.Append("<td>" + rd[6] + "</td>");
                        table.Append("<td>" + rd[7] + "</td>");
                        table.Append("</tr>");


                    }
                    rd.NextResult();
                }


                PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
                rd.Close();

            }


            catch (Exception ex)
            {
                Console.Write(ex);
            }
            finally
            {
                con.Close();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}
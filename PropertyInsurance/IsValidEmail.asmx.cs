using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;

namespace PropertyInsurance
{
    /// <summary>
    /// Summary description for IsValidEmail
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
   [System.Web.Script.Services.ScriptService]
    public class IsValidEmail : System.Web.Services.WebService
    {

        [WebMethod]
        public string CheckEmail(string email)
        {
            SqlConnection con = new SqlConnection();
            int i = 0;
            string retval = "";
            con.ConnectionString = "Data Source=PC200998;Initial Catalog=super_db;User ID=sa;Password=password-1";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_CheckEmail";
                cmd.Parameters.AddWithValue("@useremail", email);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                i = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }

            finally
            {
                con.Close();
            }

            if (i > 0)
            {
                retval = "true";
            }


            else
            {
                if (i == 0)
                {
                    retval = "false";
                }
            }
            return retval;
        }
        
    }
}

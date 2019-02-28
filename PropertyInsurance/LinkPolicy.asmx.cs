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
    /// Summary description for LinkPolicy
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LinkPolicy : System.Web.Services.WebService
    {

        [WebMethod]
        public string IsCustomer(string custid)
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
                cmd.CommandText = "usp_CustHasAccount";
                cmd.Parameters.AddWithValue("@id", custid);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                i = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

                if (i == 1)
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
               
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
            return retval;
        }
    }
}

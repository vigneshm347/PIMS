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
    /// Summary description for IsEmailExist
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
  [System.Web.Script.Services.ScriptService]
    public class IsEmailExist : System.Web.Services.WebService
    {

        [WebMethod]
        public string EmailExist(string mailid)
        {
            SqlConnection con = new SqlConnection();
            int i = 0;
            string retval = "";
            con.ConnectionString = "Data Source=DESKTOP-5Q6BVF4\\SQLExpress;Initial Catalog=Insurance;User ID=sa;Password=vicky1530;";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_EmailExist";
                cmd.Parameters.AddWithValue("@useremail", mailid);
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

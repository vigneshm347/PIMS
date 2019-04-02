using System;
using System.Diagnostics;
using System.Linq;
using System.Text;
using DataAcessLayer;
using EntityLayer;
using System.Data;
using System.Data.SqlClient;
namespace BusinessLayer
{
    public class AddClaimBAL
    {
        bool result;
        public bool ClaimInsert(Users u)
        {
            SqlParameter[] sp = new SqlParameter[7];

            sp[0] = new SqlParameter("@latitude", u.Latitude);
            sp[1] = new SqlParameter("@longitude", u.Longitude);
            sp[2] = new SqlParameter("@accident_date", u.DateOfAccident);
            sp[3] = new SqlParameter("@accident_address", u.AccidentLocation);
            sp[4] = new SqlParameter("@vin", u.VehicleVIN);
            sp[5] = new SqlParameter("@accident_description", u.Description);
            sp[6] = new SqlParameter("@customer_id", u.userID);

            try
            {
                AddClaimDAL acd = new AddClaimDAL();
                
                result = acd.insert_claim(sp);
            }

            catch (Exception e)
            {
                Debug.WriteLine(e.Message);
               
            }
            return result;

        }
    }
}

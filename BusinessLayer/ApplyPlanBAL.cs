using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataAcessLayer;
using EntityLayer;

namespace BusinessLayer
{
    
    public class ApplyPlanBAL
    {
        SqlDataAdapter rd;
        /* Gets matching Plans to customer */
        public SqlDataAdapter ApplyPlan(Users u)
        {
            ApplyPlanDAL apd = new ApplyPlanDAL();
            SqlParameter[] sp = new SqlParameter[3];
            sp[0] = new SqlParameter("@type", u.ProductType);
            sp[1] = new SqlParameter("@age", u.Eligible);
            sp[2] = new SqlParameter("@dependent", u.MaxDependent);
            /* Calls the DAL method */
            rd = apd.MatchedPlans(sp);
            return rd;
           
        }
        public SqlDataAdapter GenerateNominationForm(Users u)
        {
            ApplyPlanDAL apd = new ApplyPlanDAL();
            SqlParameter[] sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@id", u.Policyid);
            /* Calls the DAL method */
            rd = apd.GenerateForm(sp);
            return rd;
        }
        /* Links a policy to a customer */
        public int AddPolicy(Users u)
        {
            int i = 0;
            ApplyPlanDAL apd = new ApplyPlanDAL();
            SqlParameter[] sp = new SqlParameter[5];
            sp[0] = new SqlParameter("@policy_id", u.Policyid);
            sp[1] = new SqlParameter("@policynum", u.PolicyNumber);
            sp[2] = new SqlParameter("@user_id", u.UserID);
            sp[3] = new SqlParameter("@taken_date", u.Taken_date);
            sp[4] = new SqlParameter("@due_date", u.Due_Date);
            /* Calls the DAL method */
            i=apd.LinkPlan(sp);
            return i;
        }
       public string generatePolicyNumber()
        {
            var chars = "0123456789";
            var stringChars = new char[6];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            return finalString.ToString();
        }

    }
}

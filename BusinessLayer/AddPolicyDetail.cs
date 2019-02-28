using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAcessLayer;
using EntityLayer;
using System.Data;
using System.Data.SqlClient;
namespace BusinessLayer
{
    public class AddPolicyDetail
    {
        public void UserInsertBusiness(PolicyDetail u)
        {
            SqlParameter[] sp = new SqlParameter[8];

            sp[0] = new SqlParameter("@plan_info_id", u.PlanInfoId);
            sp[1] = new SqlParameter("@policy_name", u.PolicyName);
            sp[2] = new SqlParameter("@policy_feature", u.PolicyFeature);
            sp[3] = new SqlParameter("@policy_benefit", u.PolicyBenefit);
            sp[4] = new SqlParameter("@benefit_illustration", u.BenefitIllustration);
            sp[5] = new SqlParameter("@eligible", u.Eligible);
            sp[6] = new SqlParameter("@product_type", u.ProductType);
            sp[7] = new SqlParameter("@max_dependent", u.MaxDependent);

            try
            {

                AddPolicyDetailDAL pd = new AddPolicyDetailDAL();
                pd.insert_policy(sp);
            }
            catch (Exception e)
            {
                Console.Write(e);
            }
        }
    }
}

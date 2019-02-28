using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using EntityLayer;
using DataAcessLayer;

namespace BusinessLayer
{
    public class PaymentBAL
    {
        
        public int PayPremium(Users u)
        {
            PaymentDAL p = new PaymentDAL();
            SqlParameter[] sp = new SqlParameter[3];
            sp[0] = new SqlParameter("@channel", u.ChannelID);
            sp[1] = new SqlParameter("@policy", u.PolicyNumber);
            sp[2] = new SqlParameter("@date", u.PayedOn);
            int i = p.RecordPay(sp);
            return i;
        }
        public SqlDataAdapter GetReciept(Users u)
        {
            SqlDataAdapter rd;
            
            PaymentDAL p = new PaymentDAL();
            SqlParameter[] sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@policy",u.PolicyNumber);
            rd = p.GenerateReciept(sp);
            
            return rd;
        }
    }
}

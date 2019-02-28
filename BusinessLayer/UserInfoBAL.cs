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
    public class UserInfoBAL
    {
       
        UserInfoDAL uid = new UserInfoDAL();
        public SqlDataAdapter RequestUserInfo(Users u)
        {
            List<Users> list = new List<Users>();
            SqlParameter[] sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@userid", u.UserID);
            SqlDataAdapter rd = uid.GetInfo(sp);
            return rd;
        }
        public SqlDataAdapter RequestPolicyInfo(Users u)
        {
            List<Users> list = new List<Users>();
            SqlParameter[] sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@userid", u.UserID);
            SqlDataAdapter sda = uid.GetPolInfo(sp);
            return sda;
        }

    }
}

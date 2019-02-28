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
    public class AddCustomerBAL
    {

        public void UserInsertBusiness(Users u)
        {
            SqlParameter[] sp = new SqlParameter[10];

            sp[0] = new SqlParameter("@upassword", u.UserPassword);
            sp[1] = new SqlParameter("@uname", u.UserName);
            sp[2] = new SqlParameter("@emailid", u.UserEmailId);
            sp[3] = new SqlParameter("@mobile", u.UserMobile);
            sp[4] = new SqlParameter("@annual_income", u.UserIncome);
            sp[5] = new SqlParameter("@pincode", u.UserPincode);
            sp[6] = new SqlParameter("@address", u.UserAddress);
            sp[7] = new SqlParameter("@dob", u.UserDob);
            sp[8] = new SqlParameter("@created_at", u.CreatedAt);
            sp[9] = new SqlParameter("@city_name", u.UserCity);



            try
            {
                AddCustomerDAL ud = new AddCustomerDAL();
                ud.insert_User(sp);
            }
            catch (Exception e)
            {
                Console.Write(e);
            }



        }
        public SqlDataAdapter UserCredentials(Users u)
        {
            SqlParameter[] sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@email", u.UserEmailId);

            AddCustomerDAL ud = new AddCustomerDAL();
            SqlDataAdapter rd = ud.GetUserCredential(sp);
            return rd;
        }
        public SqlDataAdapter ReqCity()
        {
            AddCustomerDAL ud = new AddCustomerDAL();
            SqlDataAdapter rd = ud.GetCity();
            return rd;
        }
        public string generatePassword()
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            var stringChars = new char[8];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            return finalString.ToString();
        }
        public string encrypt(string text)
        {
            byte[] bytes = System.Text.Encoding.Unicode.GetBytes(text);
            string Encryptedpassword = Convert.ToBase64String(bytes);
            return Encryptedpassword;
        }
        public string decrypt(string encrpass)
        {
            byte[] bytes = Convert.FromBase64String(encrpass);
            string DecryptedPassword = System.Text.Encoding.Unicode.GetString(bytes);
            return DecryptedPassword;
        }

    }
}

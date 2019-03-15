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
    public class addEmployeeBAL
    {
        public void EmployeeInsertBusiness(Employee e)
        {
            SqlParameter[] sp = new SqlParameter[7];

            sp[0] = new SqlParameter("@ename", e.employeeName);
            sp[1] = new SqlParameter("@eemailid", e.employeeEmail);
            sp[2] = new SqlParameter("@emobile", e.employeeMobile);
            sp[3] = new SqlParameter("@eaddress", e.employeeAddress);
            sp[4] = new SqlParameter("@epincode", e.employeePincode);
            sp[5] = new SqlParameter("@epassword", e.employeePass);
            sp[6] = new SqlParameter("@edob", e.employeeDob);
            try
            {
                AddEmployeeDAL ed = new AddEmployeeDAL();
                ed.insert_Employee(sp);
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
        }

        public SqlDataAdapter EmployeeCredentials(Employee e)
        {
            SqlParameter[] sp = new SqlParameter[1];

            sp[0] = new SqlParameter("@eemailid", e.employeeEmail);

            AddEmployeeDAL ed = new AddEmployeeDAL();
            SqlDataAdapter rd = ed.GetEmployeeCredential(sp);
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

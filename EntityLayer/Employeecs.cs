using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntityLayer
{
   public class Employee
    {
        string empname;
        public string employeeName
        {
            get { return empname; }
            set { empname = value; }
        }
        string empemail;
        public string employeeEmail
        {
            get { return empemail; }
            set { empemail = value; }
        }

        string empmobile;
        public string employeeMobile
        {
            get { return empmobile; }
            set { empmobile = value; }
        }

           string empaddress;
        public string employeeAddress
        {
            get { return empaddress; }
            set { empaddress = value; }
        }

        string emppincode;
        public string employeePincode
        {
            get { return emppincode; }
            set { emppincode = value; }
        }
        string empid;
        public string employeeID
        {
            get { return empid; }
            set { empid = value; }
        }

        string emppass;
        public string employeePass
        {
            get { return emppass; }
            set { emppass = value; }
        }

        string empdob;
        public string employeeDob
        {
            get { return empdob; }
            set { empdob = value; }
        }

    }
}

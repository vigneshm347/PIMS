using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntityLayer
{
    class IssuedPolicy
    {
        int planDetailId;

        public int PlanDetailId
        {
            get { return planDetailId; }
            set { planDetailId = value; }
        }
        string customerId;

        public string CustomerId
        {
            get { return customerId; }
            set { customerId = value; }
        }
        string policyNumber;

        public string PolicyNumber
        {
            get { return policyNumber; }
            set { policyNumber = value; }
        }
        string takenAt;

        public string TakenAt
        {
            get { return takenAt; }
            set { takenAt = value; }
        }
        string dueDate;

        public string DueDate
        {
            get { return dueDate; }
            set { dueDate = value; }
        }
        

    }
}

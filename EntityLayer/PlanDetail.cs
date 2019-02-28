using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntityLayer
{
    class PlanDetail
    {
        string planName;

        public string PlanName
        {
            get { return planName; }
            set { planName = value; }
        }
        string premiumAmt;

        public string PremiumAmt
        {
            get { return premiumAmt; }
            set { premiumAmt = value; }
        }


    }
}

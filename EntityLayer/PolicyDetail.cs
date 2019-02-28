using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntityLayer
{
    public class PolicyDetail
    {
        int planInfoId;

        public int PlanInfoId
        {
            get { return planInfoId; }
            set { planInfoId = value; }
        }
        string policyName;

        public string PolicyName
        {
            get { return policyName; }
            set { policyName = value; }
        }
        string policyFeature;

        public string PolicyFeature
        {
            get { return policyFeature; }
            set { policyFeature = value; }
        }
        string policyBenefit;

        public string PolicyBenefit
        {
            get { return policyBenefit; }
            set { policyBenefit = value; }
        }

        string benefitIllustration;

        public string BenefitIllustration
        {
            get { return benefitIllustration; }
            set { benefitIllustration = value; }
        }
        int eligible;

        public int Eligible
        {
            get { return eligible; }
            set { eligible = value; }
        }
        string productType;

        public string ProductType
        {
            get { return productType; }
            set { productType = value; }
        }
        int maxDependent;

        public int MaxDependent
        {
            get { return maxDependent; }
            set { maxDependent = value; }
        }

    }
}

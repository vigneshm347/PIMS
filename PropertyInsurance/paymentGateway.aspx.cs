using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PropertyInsurance
{
    public partial class paymentGateway : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnverify_Click1(object sender, EventArgs e)
        {
            string policynum = txtpolicy.Text;
            string uname = txtname.Text;
            string amt = txtpremium.Text;
            Response.Redirect("permiumPayment.aspx?ref=" + policynum + "");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Data;
using BusinessLayer;
using EntityLayer;

namespace PropertyInsurance
{
    public partial class permiumPayment : System.Web.UI.Page
    {
        PaymentBAL p = new PaymentBAL();
        Users u = new Users();
        string refno = "";
        protected void Page_Load(object sender, EventArgs e)
        {


            refno = Request.QueryString["ref"];
            DateTime dt = DateTime.Now;
            int current_year = dt.Year;
            ArrayList mon = new ArrayList();
            ArrayList a = new ArrayList();
            for (int i = 0; i < 10; i++)
            {
                a.Add(current_year++);
            }

            foreach (object i in a)
            {
                ddlyear.Items.Add(i.ToString());
            }
            for (int i = 1; i < 13; i++)
            {
                ddlmonth.Items.Add(i.ToString());
            }



        }


        protected void btnpay_Click1(object sender, EventArgs e)
        {
            int i = 0;
            string bank = hdnbank.Value;
            DateTime current = DateTime.Now;
            string date = current.ToString();


            try
            {
                u.ChannelID = bank.ToString();
                u.PolicyNumber = refno;
                u.PayedOn = date;
                i = p.PayPremium(u);
                if (i == 1)
                {
                    
                    Response.Redirect("Reciept.aspx?refer=" + refno);
                }



            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            finally
            {
                p = null;
                u = null;
            }

        }


    }
}
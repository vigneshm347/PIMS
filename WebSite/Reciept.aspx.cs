using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BusinessLayer;
using EntityLayer;

namespace PropertyInsurance
{
    public partial class Reciept : System.Web.UI.Page
    {
        string refr = "";
        PaymentBAL p = new PaymentBAL();
        Users u = new Users();
        SqlDataAdapter rd = new SqlDataAdapter();
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            refr = Request.QueryString["refer"];
            lblpaidby.Text = refr;


            try
            {
                u.PolicyNumber = refr;
                rd = p.GetReciept(u);
                rd.Fill(ds);
                for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
                {
                    lblpaidby.Text = ds.Tables[0].Rows[j][1].ToString().ToUpper();
                    lblpaidto.Text = "Merchant";
                    lblpolnum.Text = refr;
                    lblbank.Text = ds.Tables[0].Rows[j][4].ToString().ToUpper();
                    lblamt.Text = ds.Tables[0].Rows[j][2].ToString();
                    lblpaidon.Text = ds.Tables[0].Rows[j][3].ToString().ToUpper();
                    lbltranid.Text = ds.Tables[0].Rows[j][0].ToString().ToUpper();
                }




            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            finally
            {
                rd.Dispose();
                u = null;
                p = null;
            }

        }
    }
}
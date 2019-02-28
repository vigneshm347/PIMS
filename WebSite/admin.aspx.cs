using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using EntityLayer;
using BusinessLayer;

namespace PropertyInsurance
{
    public partial class admin : System.Web.UI.Page
    {
        SqlDataAdapter rd;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["customerid"] == null)
                {
                    Response.Redirect("sessionExpired.htm");
                }

                else
                {
                    try
                    {
                        StatisticsBAL sb = new StatisticsBAL();
                        /* Calls the BAL method */
                        rd = sb.StatsData();
                        ds = new DataSet();
                        rd.Fill(ds);
                        for (int j = 0; j <= ds.Tables[0].Rows.Count - 1; j++)
                        {
                            lblusrcount.Text = ds.Tables[0].Rows[j][0].ToString();
                            lblpolissued.Text = ds.Tables[0].Rows[j][1].ToString();
                            lblplanct.Text = ds.Tables[0].Rows[j][2].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex);
                    }
                    finally
                    {
                        rd.Dispose();
                    }

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

    }
}
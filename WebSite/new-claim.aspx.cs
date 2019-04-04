using System;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using EntityLayer;
using BusinessLayer;

namespace WebSite
{
    public partial class new_claim : System.Web.UI.Page
    {
        Users u = new Users();
        AddClaimBAL ac = new AddClaimBAL();
        SqlDataAdapter rd;
        DataSet ds = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userid"] == null)
            {
                Response.Redirect("sessionExpired.htm");
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            AddClaim();
        }

        public void AddClaim()
        {
            u.Latitude = txtlatitude.Text;
            u.Longitude = txtlongitude.Text;
            u.DateOfAccident = txtaccidentdate.Text;
            u.AccidentLocation = txtcustomaddress.Text;
            u.VehicleVIN = txtvin.Text;
            u.Description = txtdescription.Text;
            u.userID = Session["userid"].ToString();
            if (ac.ClaimInsert(u))
            {
                txtlatitude.Text = string.Empty;
                txtlongitude.Text = string.Empty;
                txtaccidentdate.Text = string.Empty;
                txtcustomaddress.Text = string.Empty;
                txtvin.Text = string.Empty;
                txtdescription.Text = string.Empty;
                lblmailerror.Text = "Submitted claim";
                lblmailerror.ForeColor = System.Drawing.Color.Green;
                lblmailerror.Font.Bold = true;
            }
        }
    }
}
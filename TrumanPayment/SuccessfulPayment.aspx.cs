using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrumanPayment.Helper;

namespace TrumanPayment
{
    public partial class SuccessfulPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["BPAY"] != null)
                {
                    Label2.Text = System.Configuration.ConfigurationManager.AppSettings["BillerCode"].ToString();
                    Label4.Text = Request.QueryString["BPAY"].ToString();
                    Label1.Visible = false;
                    successmsg.Visible = false;
                }
                else if (Request.QueryString["DD"]!=null)
                {
                    if (Request.QueryString["DD"].ToString() == "agree")
                    {
                        Label1.Text = "Direct Deposit Payment Details Accepted Successfully";
                        DDFilelink.Visible = true;
                        BPAY.Visible = false;
                    }
                }
                else
                {
                    Label1.Text = "Payment Successful with Receipt number: "+Session["TNo"].ToString();
                   // Label1.Visible = false;
                    BPAY.Visible=false;
                    if (Session["TNo"] != null)
                    {
                        Label1.Text = "Payment Successful with Receipt number: " + Session["TNo"].ToString();
                    }
                
                }
            }
            catch(Exception ex)
            {
                Logging.AddtoLogFile(ex);
            }
        }
    }
}
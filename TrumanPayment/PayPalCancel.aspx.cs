using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrumanPayment
{
    public partial class PayPalCancel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Dictionary<string, string> PPPayment = new Dictionary<string, string>();
            PPPayment = (Dictionary<string, string>)Session["PPPaymentDetails"];
                
            Response.Redirect("Default.aspx?AccNum=" + PPPayment["AccNum"] + "&amount=" + PPPayment["Amount"], false);

        }

        public string AccNum { get; set; }
    }
}
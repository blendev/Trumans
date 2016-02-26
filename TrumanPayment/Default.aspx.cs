using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Qvalent.PayWay;
using System.Collections;
using TrumanPayment.PayPalAPI;
using System.Net;
using System.Web.Configuration;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace TrumanPayment
{
    public partial class _Default : Page
    {
        protected string cardNumber;
        protected string cardVerificationNumber;
        protected string cardExpiryYear;
        protected string cardExpiryMonth;
        protected string orderAmountCents;

        protected string summaryCode;
        protected string responseCode;
        protected string description;
        protected string receiptNo;
        protected string settlementDate;
        protected string creditGroup;
        protected string previousTxn;
        protected string cardSchemeName;
        protected void Page_Load(object sender, EventArgs e)
        {
            
         if(Request.QueryString["AccNum"]!=null)
         {
             accountNum.Value = Request.QueryString["AccNum"].ToString();

         }
         if (Request.QueryString["amount"] != null)
         {
             amount.Value = Request.QueryString["amount"].ToString();

         }
        }

        protected void btnCCPayment_Click(object sender, EventArgs e)
        {
            PayWayAPI payWayAPI = (PayWayAPI)Application["PayWayAPI"];

            //----------------------------------------------------------------------------
            // SET CONNECTION DEFAULTS
            //----------------------------------------------------------------------------
            string orderECI = "SSL";
            string orderType = "capture";

            cardNumber = ccNo.Value.ToString();
            cardVerificationNumber = CVV.Value.ToString();
            cardExpiryYear = txtYear.Value.ToString();
            cardExpiryMonth = ExpiryMonth.Value.ToString();

            StreamWriter File2 = File.AppendText(HttpContext.Current.Server.MapPath("~/Logs/file.txt"));
            File2.WriteLine("Year and month  : " + cardExpiryYear +" - "+ cardExpiryMonth);
            File2.Close();

            string card_currency = "AUD";
            var ActualAmount = amount.Value;
            var Surcharge = Math.Round((Convert.ToDouble(amount.Value) * 2) / 100,2);
            orderAmountCents =
                Convert.ToString(Convert.ToUInt64(Math.Round(
                    Convert.ToDouble(amount.Value.ToString()) * 100)+Surcharge*100));

            string customerUsername = System.Configuration.ConfigurationManager.AppSettings["CCUserName"].ToString();
            string customerPassword = System.Configuration.ConfigurationManager.AppSettings["CCPassword"].ToString();
            string customerMerchant = System.Configuration.ConfigurationManager.AppSettings["CCMerchant"].ToString();

            // Note: you must supply a unique order number for each transaction request.
            // We recommend that you store each transaction request in your database and
            // that the order number is the primary key for the transaction record in that
            // database.
            Guid guid = Guid.NewGuid();
            string str = guid.ToString();

            string orderNumber = Convert.ToString(accountNum.Value.ToString() + '-' + str.Substring(0,8));
            //"01";

            //----------------------------------------------------------------------------
            //INITIALISE CONNECTION VARIABLES
            //----------------------------------------------------------------------------
            Hashtable requestParameters = new Hashtable();
            requestParameters.Add("customer.username", customerUsername);
            requestParameters.Add("customer.password", customerPassword);
            requestParameters.Add("customer.merchant", customerMerchant);
            requestParameters.Add("order.type", orderType);
            requestParameters.Add("card.PAN", cardNumber);
            requestParameters.Add("card.CVN", cardVerificationNumber);
            requestParameters.Add("card.expiryYear", cardExpiryYear);
            requestParameters.Add("card.expiryMonth", cardExpiryMonth);
            requestParameters.Add("order.amount", orderAmountCents);
            requestParameters.Add("customer.orderNumber", orderNumber);
            requestParameters.Add("card.currency", card_currency);
            requestParameters.Add("order.ECI", orderECI);

            string requestText = payWayAPI.FormatRequestParameters(requestParameters);

            string responseText = payWayAPI.ProcessCreditCard(requestText);

            // Break the response string into its component parameters
            IDictionary responseParameters = payWayAPI.ParseResponseParameters(responseText);

            // Get the required parameters from the response
            summaryCode = (string)responseParameters["response.summaryCode"];
            responseCode = (string)responseParameters["response.responseCode"];
            description = (string)responseParameters["response.text"];
            receiptNo = (string)responseParameters["response.receiptNo"];
            settlementDate = (string)responseParameters["response.settlementDate"];
            creditGroup = (string)responseParameters["response.creditGroup"];
            previousTxn = (string)responseParameters["response.previousTxn"];
            cardSchemeName = (string)responseParameters["response.cardSchemeName"];
            try
            {
                //Read the connection string from Web.Config file
                string ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnectionsql"].ConnectionString;
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    //Create the SqlCommand object
                    SqlCommand cmd = new SqlCommand("sp_InsertCCPaymentDetails", con);

                    //Specify that the SqlCommand is a stored procedure
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                  
                    //Add the input parameters to the command object
                    cmd.Parameters.AddWithValue("@AccNum", accountNum.Value);
                    cmd.Parameters.AddWithValue("@Amount",(Convert.ToDouble(orderAmountCents)/100).ToString());
                    cmd.Parameters.AddWithValue("@CCsummaryCode", summaryCode);
                    cmd.Parameters.AddWithValue("@CCresponseCode", responseCode);
                    cmd.Parameters.AddWithValue("@CCdescription", description);
                    if(receiptNo==null)
                    {
                        receiptNo = "";
                    }
                    cmd.Parameters.AddWithValue("@CCreceiptNo", receiptNo);
                    if (settlementDate == null)
                    {
                        settlementDate = "";
                    }
                    cmd.Parameters.AddWithValue("@CCsettlementDate", settlementDate);
                    if (creditGroup == null)
                    {
                        creditGroup = "";
                    }
                    cmd.Parameters.AddWithValue("@CCcreditGroup", creditGroup);
                    if (previousTxn == null)
                    {
                        previousTxn = "";
                    }
                    cmd.Parameters.AddWithValue("@CCpreviousTxn", previousTxn);
                    if (cardSchemeName == null)
                    {
                        cardSchemeName = "";
                    }
                    cmd.Parameters.AddWithValue("@CCcardSchemeName", cardSchemeName);


                    //Open the connection and execute the query
                    con.Open();
                    try
                    {
                        cmd.ExecuteScalar();
                       
                    }
                    catch (Exception ex)
                    {
                        StreamWriter File1 = File.AppendText(HttpContext.Current.Server.MapPath("~/Logs/file.txt"));
                        File1.WriteLine("Error : " + ex.Message);
                        File1.Close();
                      

                    }
                }

            }
            catch (Exception ex)
            {


            }
            if(summaryCode=="0")
            {
                Session["TNo"] = receiptNo;
                Session["Description"] = description + summaryCode;
                Response.Redirect("SuccessfulPayment.aspx",false);
            }
            else
            {
                message.Visible = true;
                message.InnerHtml = description;
                CVV.Value = "";
                ccNo.Value = "";
                ExpiryMonth.Value = "";
                ExpiryYear.Value = "";
            }


        }

        protected void btnBPAY_Click(object sender, EventArgs e)
        {
            //Generate BPAY CDR
            //MOD10V01
            //List<int> Numlist = new List<int>();
            //List<int> AccNum = new List<int>();
            //int i = 0;
            //while(i<=20)
            //{
            //    Numlist.Add(1);
            //    Numlist.Add(2);
            //    i = i + 2;
            //}
            //string Accnumber = accountNum.Value;
            //AccNum = Accnumber.ToCharArray().Select(x => (int)Char.GetNumericValue(x)).ToList();

            //int startfrom = 20 - AccNum.Count();

            //int a = startfrom;
            //int y = 0;

            //while(a<20)
            //{
            //    AccNum[y] = AccNum[y] * Numlist[a];
            //    a++; y++;
            //}
            //a=0;
            //while(a<AccNum.Count())
            //{
            //    var sum = 0;
            //    var n = AccNum[a];
            //    while (n != 0)
            //    {
            //        sum += n % 10;
            //        n /= 10;
            //    }
            //    AccNum[a] = sum;
            //    a++;
            //}
            //var Total = AccNum.Sum();
            //var divbyTen = Total % 10;
            //var SubFromTen = 10 - divbyTen;

            //MOD10V05

            List<int> Numlist = new List<int>();
            List<int> AccNum = new List<int>();
            int i = 1;
            while (i <= 20)
            {
                Numlist.Add(i);
                i++;
            }
            string Accnumber = accountNum.Value;
            AccNum = Accnumber.ToCharArray().Select(x => (int)Char.GetNumericValue(x)).ToList();

           // int startfrom = 20 - AccNum.Count();

            int a = 0;
            int y = 0;

            while (a < AccNum.Count())
            {
                AccNum[y] = AccNum[y] * Numlist[a];
                a++; y++;
            }
            var Total = AccNum.Sum();
            var divbyTen = Total % 10;



            //Read the connection string from Web.Config file
            string ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnectionsql"].ConnectionString;
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                //Create the SqlCommand object
                SqlCommand cmd = new SqlCommand("sp_InsertBPayPaymentDetails", con);

                //Specify that the SqlCommand is a stored procedure
                cmd.CommandType = System.Data.CommandType.StoredProcedure;


                //Add the input parameters to the command object
                cmd.Parameters.AddWithValue("@AccNum", accountNum.Value);
                cmd.Parameters.AddWithValue("@Amount", amount.Value);
                cmd.Parameters.AddWithValue("@BPayBillerCode", System.Configuration.ConfigurationManager.AppSettings["BillerCode"].ToString());
                cmd.Parameters.AddWithValue("@BPayCRN", Accnumber + divbyTen.ToString());                


                //Open the connection and execute the query
                con.Open();
                try
                {
                    cmd.ExecuteScalar();
                    
                }
                catch (Exception ex)
                {
                    StreamWriter File2 = File.AppendText(HttpContext.Current.Server.MapPath("~/Logs/file.txt"));
                    File2.WriteLine("Error : " + ex.Message);
                    File2.Close();
                    

                }
            }

            Response.Redirect("SuccessfulPayment.aspx?BPAY=" + Accnumber + divbyTen.ToString(), false);
        }
        protected void btnDDCont_Click(object sender, EventArgs e)
        {
            if (chkDD.Checked)
            {
                Dictionary<string, string> DDPayment = new Dictionary<string, string>();
                DDPayment.Add("AccNum", accountNum.Value);
                DDPayment.Add("Amount", amount.Value);
                DDPayment.Add("DDAccNum", DDAccNum.Text.ToString().Replace("-", ""));
                DDPayment.Add("DDAccName", DDAccName.Value.ToString());
                DDPayment.Add("DDBankNum", DDBranchNum.Text.ToString().Replace("-", ""));

                Session["DDPaymentDetails"] = DDPayment;

                Response.Redirect("DirectDebitAgreement.aspx", false);
            }
            else
            {
                string script = "<script type=\"text/javascript\">alert('Direct Debit could not proceed - Please Accept Terms and Conditions before Proceeding !');</script>";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
            }
        }

        protected void btnPPCont_Click(object sender, EventArgs e)
        {
            try
            {

                var Surcharge = Math.Round((Convert.ToDouble(amount.Value) * 3) / 100, 2);
                var orderAmount =(Convert.ToDouble(amount.Value)+Surcharge).ToString();

                Dictionary<string, string> PPPayment = new Dictionary<string, string>();
                PPPayment.Add("AccNum", accountNum.Value);
               // PPPayment.Add("Amount", amount.Value);

                PPPayment.Add("Amount", orderAmount);

                Session["PPPaymentDetails"] = PPPayment;
                CustomSecurityHeaderType _credentials = new CustomSecurityHeaderType
                {
                    Credentials = new UserIdPasswordType()
                    {
                        Username = System.Configuration.ConfigurationManager.AppSettings["UserName"].ToString(),
                        Password = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString(),
                        Signature = System.Configuration.ConfigurationManager.AppSettings["Signature"].ToString(),
                    }
                };


                var expressCheckoutRequestDetails = new SetExpressCheckoutRequestDetailsType();
                // expressCheckoutRequestDetails.ReturnURL = "http://payment.trumans.blendev.com/PayPalPayment.aspx";
                //expressCheckoutRequestDetails.CancelURL = "http://payment.trumans.blendev.com/PayPalCancel.aspx";
                expressCheckoutRequestDetails.CancelURL = System.Configuration.ConfigurationManager.AppSettings["CancelURL"].ToString();
                expressCheckoutRequestDetails.ReturnURL = System.Configuration.ConfigurationManager.AppSettings["SuccessURL"].ToString();
                expressCheckoutRequestDetails.NoShipping = "1";
                var paymentDetailsArray = new PaymentDetailsType[1];
                paymentDetailsArray[0] = new PaymentDetailsType
                {
                    PaymentAction = PaymentActionCodeType.Sale,
                    OrderTotal = new BasicAmountType
                    {
                        currencyID = CurrencyCodeType.AUD,
                        Value = orderAmount.ToString(),
                    }
                };

                BasicAmountType OTotal = new BasicAmountType();
                OTotal.Value = orderAmount.ToString();
                OTotal.currencyID = CurrencyCodeType.AUD;
                expressCheckoutRequestDetails.OrderTotal = OTotal;

                var ExpressCheck = new SetExpressCheckoutRequestType
                 {
                     SetExpressCheckoutRequestDetails = expressCheckoutRequestDetails,
                     Version = "98",
                 };

                SetExpressCheckoutReq obj = new SetExpressCheckoutReq();
                obj.SetExpressCheckoutRequest = ExpressCheck;

                PayPalAPI.PayPalAPIAAInterfaceClient objPayPalAPI = new PayPalAPIAAInterfaceClient();

                var setExpressCheckoutResponse = objPayPalAPI.SetExpressCheckout(ref _credentials, obj);
                if (setExpressCheckoutResponse.Ack == AckCodeType.Success)
                {
                    Response.Redirect("https://www.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=" + setExpressCheckoutResponse.Token, false);
                    Session["Token"] = setExpressCheckoutResponse.Token;
                }
                else
                {
                    StreamWriter File2 = File.AppendText(HttpContext.Current.Server.MapPath("~/Logs/file.txt"));
                    File2.WriteLine("Error : " + setExpressCheckoutResponse.Errors[0].LongMessage);
                    File2.Close();


                    string script = "<script type=\"text/javascript\">alert('Unexpected Error Occured , Please try Later!!');</script>";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
                }


            }
            catch(Exception ex)
            {
                StreamWriter File2 = File.AppendText(HttpContext.Current.Server.MapPath("~/Logs/file.txt"));
                File2.WriteLine("Error : " + ex.Message);
                File2.Close();


                string script = "<script type=\"text/javascript\">alert('Unexpected Error Occured , Please try Later!!');</script>";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
            }

        }

    }
}
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Qvalent.PayWay;
using System.Collections;

namespace PayWayNet
{
    /// <summary>
    /// Summary description for processCard.
    /// </summary>
    public partial class processCard : System.Web.UI.Page
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

        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            PayWayAPI payWayAPI = (PayWayAPI)Application[ "PayWayAPI" ];

            //----------------------------------------------------------------------------
            // SET CONNECTION DEFAULTS
            //----------------------------------------------------------------------------
            string orderECI               = "SSL";
            string orderType              = "capture";

            cardNumber                    = Request.Form[ "cardNumber" ];
            cardVerificationNumber        = Request.Form[ "cardVerificationNumber" ];
            cardExpiryYear                = Request.Form[ "cardExpiryYear" ];
            cardExpiryMonth               = Request.Form[ "cardExpiryMonth" ];

            string card_currency          = "AUD";
            orderAmountCents =
                Convert.ToString(Convert.ToUInt64(Math.Round(
                    Convert.ToDouble(Request.Form["orderAmount"]) * 100)));

            string customerUsername       = "JDABBS";
            string customerPassword       = "Bl3nd3v$";
            string customerMerchant       = "Q21322";

            // Note: you must supply a unique order number for each transaction request.
            // We recommend that you store each transaction request in your database and
            // that the order number is the primary key for the transaction record in that
            // database.
            string orderNumber            = "01";

            //----------------------------------------------------------------------------
            //INITIALISE CONNECTION VARIABLES
            //----------------------------------------------------------------------------
            Hashtable requestParameters = new Hashtable();
            requestParameters.Add( "customer.username", customerUsername );
            requestParameters.Add( "customer.password", customerPassword );
            requestParameters.Add( "customer.merchant", customerMerchant );
            requestParameters.Add( "order.type", orderType );
            requestParameters.Add( "card.PAN", cardNumber );
            requestParameters.Add( "card.CVN", cardVerificationNumber );
            requestParameters.Add( "card.expiryYear", cardExpiryYear );
            requestParameters.Add( "card.expiryMonth", cardExpiryMonth );
            requestParameters.Add( "order.amount", orderAmountCents );
            requestParameters.Add( "customer.orderNumber", orderNumber );
            requestParameters.Add( "card.currency", card_currency );
            requestParameters.Add( "order.ECI", orderECI );

            string requestText = payWayAPI.FormatRequestParameters( requestParameters );

            string responseText = payWayAPI.ProcessCreditCard( requestText );

            // Break the response string into its component parameters
            IDictionary responseParameters = payWayAPI.ParseResponseParameters( responseText );

            // Get the required parameters from the response
            summaryCode = (string)responseParameters[ "response.summaryCode" ];
            responseCode = (string)responseParameters[ "response.responseCode" ];
            description = (string)responseParameters[ "response.text" ];
            receiptNo = (string)responseParameters[ "response.receiptNo" ];
            settlementDate = (string)responseParameters[ "response.settlementDate" ];
            creditGroup = (string)responseParameters[ "response.creditGroup" ];
            previousTxn = (string)responseParameters[ "response.previousTxn" ];
            cardSchemeName = (string)responseParameters[ "response.cardSchemeName" ];
        }

    }
}

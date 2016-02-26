using System;
using System.Collections;
using System.Collections.Specialized;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;

namespace Qvalent.PayWay
{
	/// <summary>
	/// Summary description for Class1.
	/// </summary>
	class CCAPITester
	{
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main(string[] args)
		{
            String initParams =
                "certificateFile=CERT_FILE" + "&" +
                "logDirectory=LOG_DIR";
            PayWayAPI payWayAPI = new PayWayAPI();
            payWayAPI.Initialise( initParams );

            Hashtable requestParameters = new Hashtable();
            requestParameters.Add( "customer.username", "USER" );
            requestParameters.Add( "customer.password", "PASS" );
            requestParameters.Add( "customer.merchant", "TEST" );
            requestParameters.Add( "order.type", "capture" );
            requestParameters.Add( "card.PAN", "4564710000000004" );
            requestParameters.Add( "card.CVN", "847" );
            requestParameters.Add( "card.expiryYear", "09" );
            requestParameters.Add( "card.expiryMonth", "02" );
            requestParameters.Add( "order.amount", "1008" );
            requestParameters.Add( "customer.orderNumber", "" + DateTime.Now.Ticks );
            requestParameters.Add( "card.currency", "AUD" );
            requestParameters.Add( "order.ECI", "SSL" );

            string requestText = payWayAPI.FormatRequestParameters( requestParameters );

            string responseText = payWayAPI.ProcessCreditCard( requestText );
            Console.Out.WriteLine( "\r\nRequest: " + requestText );
            Console.Out.WriteLine( "\r\nResponse: " + responseText );
            Console.Out.WriteLine( "" );

            // Break the response string into its component parameters
            IDictionary responseParameters = payWayAPI.ParseResponseParameters( responseText );

            // Print out the parameters:
            IDictionaryEnumerator enumerator = responseParameters.GetEnumerator();
            while ( enumerator.MoveNext() )
            {
                string name = (string)enumerator.Key;
                string val = (string)enumerator.Value;

                Console.Write( name + ": " );
                for ( int i = name.Length; i < 25; i++ )
                {
                    Console.Write( ' ' );
                }
                Console.WriteLine( val );
            }

        }

    }
}

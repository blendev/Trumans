using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrumanPayment.PayPalAPI;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.IO;
using System.Xml;
using System.Xml.Serialization;

namespace TrumanPayment
{
    public partial class PayPalPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                CustomSecurityHeaderType _credentials = new CustomSecurityHeaderType();
                //{
                //    Credentials = new UserIdPasswordType()
                //    {
                //        Username = "developer_api1.blendev.com",
                //        Password = "5EMFC3SHHDTSKTY4",
                //        Signature = "Ao--X15RhKPZUeA3L9bihv008SFUAc03629aPWDtEWfOvvTchBkLtV3A",
                //    }
                //};

                //GetExpressCheckoutDetailsRequestType request = new GetExpressCheckoutDetailsRequestType();
                //request.Token = Request.QueryString["Token"].ToString();

                //// Invoke the API
                //GetExpressCheckoutDetailsReq wrapper = new GetExpressCheckoutDetailsReq();
                //wrapper.GetExpressCheckoutDetailsRequest = request;




                PayPalAPI.PayPalAPIAAInterfaceClient objPayPalAPI = new PayPalAPIAAInterfaceClient();

                //var getExpRes = objPayPalAPI.GetExpressCheckoutDetails(ref _credentials,wrapper);
                //if(getExpRes.Ack==AckCodeType.Success && getExpRes.GetExpressCheckoutDetailsResponseDetails.PaymentInfo[0].PaymentStatus==PaymentStatusCodeType.Pending)
                //{
                //    //Show Error Message and save details in DB
                //}
                //else
                //{
                Dictionary<string, string> PPPayment = new Dictionary<string, string>();
                PPPayment = (Dictionary<string, string>)Session["PPPaymentDetails"];
                var payReq = new DoExpressCheckoutPaymentReq
                {
                    DoExpressCheckoutPaymentRequest = new DoExpressCheckoutPaymentRequestType
                    {
                        Version = "98",
                        DoExpressCheckoutPaymentRequestDetails = new DoExpressCheckoutPaymentRequestDetailsType
                        {
                            Token = Request.QueryString["Token"].ToString(),
                            PayerID = Request.QueryString["PayerId"].ToString(),
                            PaymentAction = PaymentActionCodeType.Sale,
                            PaymentActionSpecified = true,

                            PaymentDetails = new[]
                                            {
                                                new PaymentDetailsType
                                                    {                                                        
                                                        OrderTotal = new BasicAmountType
                                                        {
                                                            currencyID=CurrencyCodeType.AUD,
                                                            Value=PPPayment["Amount"].ToString(),
                                                        }
                                                    }
                                            }
                        }
                    }
                };
                _credentials = new CustomSecurityHeaderType
                {
                    Credentials = new UserIdPasswordType()
                    {
                        Username = System.Configuration.ConfigurationManager.AppSettings["UserName"].ToString(),
                        Password = System.Configuration.ConfigurationManager.AppSettings["Password"].ToString(),
                        Signature = System.Configuration.ConfigurationManager.AppSettings["Signature"].ToString(),
                    }
                };
                var DoExpRes = objPayPalAPI.DoExpressCheckoutPayment(ref _credentials, payReq);


                //Read the connection string from Web.Config file
                string ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnectionsql"].ConnectionString;
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    try
                    {
                        //Create the SqlCommand object
                        SqlCommand cmd = new SqlCommand("sp_InsertPayPalPaymentDetails", con);

                        //Specify that the SqlCommand is a stored procedure
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;



                        //Add the input parameters to the command object
                        cmd.Parameters.AddWithValue("@AccNum", PPPayment["AccNum"]);
                        cmd.Parameters.AddWithValue("@Amount", PPPayment["Amount"]);
                        cmd.Parameters.AddWithValue("@Token", Request.QueryString["Token"].ToString());
                        cmd.Parameters.AddWithValue("@PayerId", Request.QueryString["PayerId"].ToString());
                        cmd.Parameters.AddWithValue("@ExpressChkResp", DoExpRes.Ack);
                        if (DoExpRes.Errors != null)
                        {
                            if (DoExpRes.Errors.Count() > 0)
                            {
                                cmd.Parameters.AddWithValue("@PPError", DoExpRes.Errors[0].ShortMessage);
                            }
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@PPError", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.BillingAgreementID != null)
                        {
                            cmd.Parameters.AddWithValue("@BillingAgreementId", DoExpRes.DoExpressCheckoutPaymentResponseDetails.BillingAgreementID);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@BillingAgreementId", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.MsgSubID != null)
                        {
                            cmd.Parameters.AddWithValue("@MsgSubId", DoExpRes.DoExpressCheckoutPaymentResponseDetails.MsgSubID);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@MsgSubId", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.Note != null)
                        {
                            cmd.Parameters.AddWithValue("@Note", DoExpRes.DoExpressCheckoutPaymentResponseDetails.Note);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@Note", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].GrossAmount != null)
                        {
                            cmd.Parameters.AddWithValue("@GrossAmount", DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].GrossAmount.Value);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@GrossAmount", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentDate != null)
                        {
                            cmd.Parameters.AddWithValue("@PaymentDate", DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentDate);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@PaymentDate", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentError != null)
                        {
                            cmd.Parameters.AddWithValue("@PaymentError", DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentError.ShortMessage);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@PaymentError", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentRequestID != null)
                        {
                            cmd.Parameters.AddWithValue("@PaymentRequestID", DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentRequestID);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@PaymentRequestID", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentStatus != null)
                        {
                            cmd.Parameters.AddWithValue("@PaymentStatus", DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentStatus);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@PaymentStatus", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentType != null)
                        {
                            cmd.Parameters.AddWithValue("@PaymentType", DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentType.ToString());
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@PaymentType", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].ReceiptID != null)
                        {
                            cmd.Parameters.AddWithValue("@ReceiptID", DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].ReceiptID);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@ReceiptID", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].ReceiptReferenceNumber != null)
                        {
                            cmd.Parameters.AddWithValue("@ReceiptReferenceNumber", DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].ReceiptReferenceNumber);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@ReceiptReferenceNumber", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].TransactionID != null)
                        {
                            cmd.Parameters.AddWithValue("@TransactionID", DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].TransactionID);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@TransactionID", "");
                        }
                        if (DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].TransactionType != null)
                        {
                            cmd.Parameters.AddWithValue("@TransactionType", DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].TransactionType.ToString());
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@TransactionType", "");
                        }


                        //Open the connection and execute the query
                        con.Open();

                        cmd.ExecuteScalar();

                    }
                    catch (Exception ex)
                    {
                        StreamWriter file2 = File.AppendText(HttpContext.Current.Server.MapPath("~/Logs/file.txt"));

                        file2.WriteLine("Saving Error : "+DateTime.Now +"   "+ ex.Message);

                        file2.Close();

                    }
                }

                if (DoExpRes.Ack == AckCodeType.Success && DoExpRes.DoExpressCheckoutPaymentResponseDetails.PaymentInfo[0].PaymentStatus == PaymentStatusCodeType.Completed)
                {
                    Label1.Text = "PayPal Payment Successful ";


                }
            }
            catch(Exception ex)
            {
                StreamWriter file2 = File.AppendText(HttpContext.Current.Server.MapPath("~/Logs/file.txt"));               
                    
                file2.WriteLine("Exception : "+DateTime.Now+"  " + ex.Message);
               
                file2.Close();

                Response.Redirect("Default.aspx?PP=Error");
            }
            //}

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace TrumanPayment
{
    public partial class DirectDebitAgreement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Read the connection string from Web.Config file
                string ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnectionsql"].ConnectionString;
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    //Create the SqlCommand object
                    SqlCommand cmd = new SqlCommand("sp_InsertDDPaymentDetails", con);

                    //Specify that the SqlCommand is a stored procedure
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    Dictionary<string, string> DDPayment = new Dictionary<string, string>();
                    DDPayment = (Dictionary<string, string>)Session["DDPaymentDetails"];

                    //Add the input parameters to the command object
                    cmd.Parameters.AddWithValue("@AccNum", DDPayment["AccNum"]);
                    cmd.Parameters.AddWithValue("@Amount", DDPayment["Amount"]);
                    cmd.Parameters.AddWithValue("@DDAccName", DDPayment["DDAccName"]);
                    cmd.Parameters.AddWithValue("@DDBranchNum", DDPayment["DDBankNum"]);
                    cmd.Parameters.AddWithValue("@DDAccNum", DDPayment["DDAccNum"]);


                    //Open the connection and execute the query
                    con.Open();
                    try
                    {
                        cmd.ExecuteScalar();
                        Response.Redirect("SuccessfulPayment.aspx?DD=agree", false);
                    }
                    catch (Exception ex)
                    {
                        StreamWriter File2 = File.AppendText(HttpContext.Current.Server.MapPath("~/Logs/file.txt"));
                        File2.WriteLine("Error : "+ex.Message );
                        File2.Close();
                        Response.Redirect("Default.aspx?DD=Error", false);

                    }
                }
            }
            catch(Exception ex)
            {
                StreamWriter File2 = File.AppendText(HttpContext.Current.Server.MapPath("~/Logs/file.txt"));
                File2.WriteLine("Error : " + ex.Message);
                File2.Close();
                Response.Redirect("Default.aspx?DD=Error", false);
            }
        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {
           
        }
    }
}
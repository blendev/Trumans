using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.IO;

namespace TrumanPayment.Helper
{
    public static class Logging
    {
        public static void AddtoLogFile(Exception Excp)
        {
            try
            {
                string LogPath = ConfigurationManager.AppSettings["LogPath"].ToString();
                string filename = "Log_" + DateTime.Now.ToString("dd-MM-yyyy") + ".txt";
                string filepath = LogPath + filename;
                if (File.Exists(filepath))
                {
                    using (StreamWriter writer = new StreamWriter(filepath, true))
                    {
                        writer.WriteLine("-------------------START-------------" + DateTime.Now);
                        writer.WriteLine(Excp.Message);
                        writer.WriteLine("-------------------END-------------" + DateTime.Now);
                    }
                }
                else
                {
                    StreamWriter writer = File.CreateText(filepath);
                    writer.WriteLine("-------------------START-------------" + DateTime.Now);
                    writer.WriteLine(Excp.Message);
                    writer.WriteLine("-------------------END-------------" + DateTime.Now);
                    writer.Close();
                }
            }
            catch (Exception ex)
            {

            }
        }
    
    }
}
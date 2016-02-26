Copyright (c) 2005 Qvalent Pty Ltd.

Qvalent PayWay Cards API for Microsoft .NET
===========================================

1. Requirements

The .NET Framework 1.1 is required.

Microsoft Windows 2000 or later is required.  If you are using Windows 2000,
you must install the Windows 2000 high encryption pack from
http://www.microsoft.com/windows2000/downloads/recommended/encryption/


2. Using the ASP.NET Example Code

* Install the API on the web server by unzipping this ZIP file

* Copy the contents of the "examples" directory to your web directory.

* Download your certificate and save it on your server.  Record this location 
for use in the initialisation of the PayWayAPI object.  Update this
value in the Global.asax or Global.asax.cs file.

* Choose a log directory and ensure that your web application can write to that
directory on the server.  Use this location in the initialisation of the 
PayWayAPI object.  Update this value in the Global.asax or Global.asax.cs file.

* Enter your username and password in the processCard.aspx.cs file.

* Using your web browser, browse to index.htm, then press the Process Capture
button.  You should receive a successful response from the Qvalent payment server.


3. Using the Command Line Example Code

* Install the API on the web server by unzipping this ZIP file

* Download your certificate and save it on your server.  Record this location 
for use in the initialisation of the PayWayAPI object.  Update this
value in the CCAPITester.cs file.

* Choose a log directory and ensure that your web application can write to that
directory on the server.  Use this location in the initialisation of the 
PayWayAPI object.  Update this value in the CCAPITester.cs file.

* Enter your username and password in the CCAPITester.cs file.

* Compile and run the CCAPITester.cs test program, referencing the PayWayAPI.dll
file installed in the first step.

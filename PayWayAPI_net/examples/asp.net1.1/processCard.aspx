<%@ Page language="c#" Codebehind="processCard.aspx.cs" AutoEventWireup="false" Inherits="PayWayNet.processCard" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
  <HEAD>
    <title>Credit Card Result</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="style.css" rel="stylesheet" type="text/css">
  </HEAD>
  <body BGCOLOR="white">
    <table border="0" width="600" ID="Table1">
      <tr>
        <td colspan="2" class="listHeading">Request</td>
      </tr>
      <tr>
        <td width="180" class="formItem">Card Number:</td>
        <td><%=cardNumber%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Card Verification Number:</td>
        <td><%=cardVerificationNumber%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Card Expiry Month:</td>
        <td><%=cardExpiryMonth%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Card Expiry Year:</td>
        <td><%=cardExpiryYear%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Order Amount (Cents):</td>
        <td><%=orderAmountCents%></td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" class="listHeading">Response</td>
      </tr>
      <tr>
        <td width="180" class="formItem">Summary Code:</td>
        <td><%=summaryCode%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Response Code:</td>
        <td><%=responseCode%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Description:</td>
        <td><%=description%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Receipt Number:</td>
        <td><%=receiptNo%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Settlement Date:</td>
        <td><%=settlementDate%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Credit Group:</td>
        <td><%=creditGroup%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Previous Transaction:</td>
        <td><%=previousTxn%></td>
      </tr>
      <tr>
        <td width="180" class="formItem">Card Scheme Name:</td>
        <td><%=cardSchemeName%></td>
      </tr>
    </table>
  </body>
</HTML>

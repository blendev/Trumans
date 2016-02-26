<%@ Page Title="Trumans Payment" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TrumanPayment._Default" %>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head runat="server">
    <title>Trumans Payment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <base target="_parent" />
 <link rel="stylesheet" type="text/css" href="/Content/style.css" />
    <style type="text/css" media="screen, tv, projection, print">
        @import "Content/Menu.css";
    </style>
   
    <link rel="stylesheet" type="text/css" href="content/global_styles.css" />
    <link rel="stylesheet" type="text/css" href="content/tpl_styles.css" />
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <!--[if !IE]> <-->
    <script type="text/javascript" src="Scripts/ADxMenu.js"></script>
    <!--> <![endif]-->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="scripts/jquery.mousewheel-3.0.6.pack.js"></script>
    <script type="text/javascript" src="Scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="scripts/jquery.cycle.all.min.js"></script>
    <script type="text/javascript" src="content/slimbox2.js"></script>
    <link rel="stylesheet" href="content/slimbox2.css" type="text/css" media="screen" />
    <link href="Content/jquery.fancybox.css" rel="stylesheet" />
    <script src="Scripts/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="scripts/scripts.js"></script>
    <script type="text/javascript" src="scripts/respond.min.js"></script>

    <script type="text/javascript" src="scripts/responsiveMenu.js"></script>







    <script src="<%: ResolveUrl("~/Scripts/jquery.validate.js") %>" type="text/javascript"></script>

    <script type="text/javascript">
        function checkextrainfo() {
            if (document.getElementById('amount').value != "") {
                if ($('input[type="radio"]:checked').val() == 'Credit Card') {

                    var per = document.getElementById('amount').value * 2 / 100;


                    var sum = parseFloat(document.getElementById('amount').value) + per;

                    document.getElementById('extrainfo').innerHTML = '<p> <b>Subtotal</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) +
                                    '</p><b>Surcharge</b>(2%): $' + parseFloat(Math.round(per * 100) / 100).toFixed(2) + '<p> <b>Total</b>: $' + parseFloat(Math.round(sum * 100) / 100).toFixed(2) + '</p>';


                }
                else if (($('input[type="radio"]:checked').val() == 'DD') || ($('input[type="radio"]:checked').val() == 'BPAY') || ($('input[type="radio"]:checked').val() == 'PayPal')) {

                    document.getElementById('extrainfo').innerHTML = '<p> <b>Subtotal</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) +
                        '</p><b>Surcharge</b>: $0.00 <p> <b>Total</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) + '</p>';

                }
            }

        }
        $(document).ready(function () {
            $('input[type="radio"]').click(function () {
                if ($(this).attr("value") == "Credit Card") {
                    $("#message").hide();
                    $(".payment_dtl").not(".CC").hide();
                    $(".CC").show();
                    if (document.getElementById('amount').value != '') {
                        var per = document.getElementById('amount').value * 2 / 100;
                        var sum = parseFloat(document.getElementById('amount').value) + per;
                        document.getElementById('extrainfo').innerHTML = '<p> <b>Subtotal</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) +
                            '</p><b>Surcharge</b>(2%): $' + parseFloat(Math.round(per * 100) / 100).toFixed(2) + '<p> <b>Total</b>: $' + parseFloat(Math.round(sum * 100) / 100).toFixed(2) + '</p>';
                    }
                }
                if ($(this).attr("value") == "DD") {
                    $("#message").hide();
                   
                    $(".payment_dtl").not(".BA").hide();
                    $(".BA").show();
                    if (document.getElementById('amount').value != '') {


                        document.getElementById('extrainfo').innerHTML = '<p> <b>Subtotal</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) +
                            '</p><b>Surcharge</b>: $0.00 <p> <b>Total</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) + '</p>';
                    }
                }
                if ($(this).attr("value") == "Paypal") {
                    $("#message").hide();
                    $(".payment_dtl").not(".PP").hide();
                    $(".PP").show();
                    if (document.getElementById('amount').value != '') {


                        document.getElementById('extrainfo').innerHTML = '<p> <b>Subtotal</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) +
                            '</p><b>Surcharge</b>: $0.00 <p> <b>Total</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) + '</p>';
                    }
                   
                }
                if ($(this).attr("value") == "BPAY") {
                    $("#message").hide();
                    $(".payment_dtl").not(".BP").hide();
                    $(".BP").show();
                    if (document.getElementById('amount').value != '') {


                        document.getElementById('extrainfo').innerHTML = '<p> <b>Subtotal</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) +
                            '</p><b>Surcharge</b>: $0.00 <p> <b>Total</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) + '</p>';
                    }
                   
                }
            });



        });


    </script>

    <script>
        jQuery(document).ready(function ($) {
            $("#top_menu #menu").responsiveMenu();
        });

        function Val() {
          
            document.getElementById('ccNo').removeAttribute("required");
            document.getElementById('ExpiryMonth').removeAttribute("required");
            document.getElementById('ExpiryYear').removeAttribute("required");
            document.getElementById('CVV').removeAttribute("required");

            document.getElementById('ccNo').setCustomValidity("");
            document.getElementById('ExpiryMonth').setCustomValidity("");
            document.getElementById('ExpiryYear').setCustomValidity("");
            document.getElementById('CVV').setCustomValidity("");

            document.getElementById('chkDD').removeAttribute("required");
            document.getElementById('DDAccNum').removeAttribute("required");
            document.getElementById('DDBranchNum').removeAttribute("required");
            document.getElementById('DDAccName').removeAttribute("required");

            document.getElementById('chkDD').setCustomValidity("");
            document.getElementById('DDAccNum').setCustomValidity("");
            document.getElementById('DDBranchNum').setCustomValidity("");
            document.getElementById('DDAccName').setCustomValidity("");
                        
        }
        function Validate() {
           
            document.getElementById('ccNo').removeAttribute("required");           
            document.getElementById('ExpiryMonth').removeAttribute("required");
            document.getElementById('ExpiryYear').removeAttribute("required");
            document.getElementById('CVV').removeAttribute("required");

            document.getElementById('ccNo').setCustomValidity("");
            document.getElementById('ExpiryMonth').setCustomValidity("");
            document.getElementById('ExpiryYear').setCustomValidity("");
            document.getElementById('CVV').setCustomValidity("");

            if (document.getElementById('DDAccName').value == "") {
                document.getElementById('DDAccName').setCustomValidity("Please enter Account Name!!");
            }
            else {
                document.getElementById('DDAccName').setCustomValidity("");
            }


            if (document.getElementById('DDBranchNum').value == "") {
                document.getElementById('DDBranchNum').setCustomValidity("Please enter Branch Number!!");
            }
            else {
                document.getElementById('DDBranchNum').setCustomValidity("");
            }
            if (document.getElementById('DDBranchNum').value.replace('-', '').length != 6) {

                document.getElementById('DDBranchNum').setCustomValidity("Branch Number should be 6 digits!!");
            }
            else {
                document.getElementById('DDBranchNum').setCustomValidity("");
            }
            if (document.getElementById('DDAccNum').value == "") {
                document.getElementById('DDAccNum').setCustomValidity("Please enter Account Number!!");
            }
            else {
                document.getElementById('DDAccNum').setCustomValidity("");
            }
            if (document.getElementById('DDAccNum').value.replace('-', '').length > 9) {
                document.getElementById('DDAccNum').setCustomValidity("Account Number cannot be more then 9 digits!!");
            }
            else if (document.getElementById('DDAccNum').value.replace('-', '').length < 6) {
                document.getElementById('DDAccNum').setCustomValidity("Account Number cannot be less then 6 digits!!");
            }

            else {
                document.getElementById('DDAccNum').setCustomValidity("");
            }

            if (document.getElementById('chkDD').checked == false) {

                document.getElementById('chkDD').setCustomValidity("Please check the checkbox before proceeding");
            }
            else {
                document.getElementById('chkDD').setCustomValidity("");
            }

           



        }
        function ValidateCC() {

            document.getElementById('chkDD').removeAttribute("required");
            document.getElementById('DDAccNum').removeAttribute("required");
            document.getElementById('DDBranchNum').removeAttribute("required");
            document.getElementById('DDAccName').removeAttribute("required");

            document.getElementById('chkDD').setCustomValidity("");
            document.getElementById('DDAccNum').setCustomValidity("");
            document.getElementById('DDBranchNum').setCustomValidity("");
            document.getElementById('DDAccName').setCustomValidity("");
           
            if (document.getElementById('ccNo').value == "") {
                document.getElementById('ccNo').setCustomValidity("Please enter credit Card Number!!");
            }
            else if (document.getElementById('ccNo').value.length < 16) {
                document.getElementById('ccNo').setCustomValidity("Credit Card Number should be 16 digits");
            }
            else {
                document.getElementById('ccNo').setCustomValidity("");
            }

            if (document.getElementById('ExpiryMonth').value == "0") {
                document.getElementById('ExpiryMonth').setCustomValidity("Please select Expiry Month!!");
            }

            else {
                document.getElementById('ExpiryMonth').setCustomValidity("");
            }

            if (document.getElementById('ExpiryYear').value == "0") {
                document.getElementById('ExpiryYear').setCustomValidity("Please select Expiry Year!!");
            }
            else {
                document.getElementById('ExpiryYear').setCustomValidity("");
            }

            if (document.getElementById('CVV').value == "") {
                document.getElementById('CVV').setCustomValidity("Please enter CVV Number!!");
            }
            else if (document.getElementById('CVV').value.length <3) {
                document.getElementById('CVV').setCustomValidity("Please enter altleast 3 digits!!");
            }
            else {
                document.getElementById('CVV').setCustomValidity("");
            }

        }
        function GetSubCategory(catid) {
            window.location.href = 'SubCategories.aspx?CatId=' + catid;
        }
        $(document).ready(function () {


            function getQueryStrings() {
                var assoc = {};
                var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
                var queryString = location.search.substring(1);
                var keyValues = queryString.split('&');

                for (var i in keyValues) {
                    var key = keyValues[i].split('=');
                    if (key.length > 1) {
                        assoc[decode(key[0])] = decode(key[1]);
                    }
                }

                return assoc;
            }

            var qs = getQueryStrings();
            var myParam = qs["DD"];
            if (myParam != null) {
                alert("Something went wrong with Direct Deposit Payment... Please try again!")
            }
            var myParam = qs["DD"];
            if (myParam != null) {
                alert("Something went wrong with Direct Deposit Payment... Please try again!")
            }

            var PPError = qs["PP"];
            if (PPError != null) {
                alert("Something went wrong with PayPal Payment... Please try again!")
            }

        });


    </script>
    <script src="Scripts/utilities.js"></script>

</head>
<body>
    <form runat="server">
        <%--<div style="align-content: center">
            <iframe src="http://www.trumans.com.au/" id="headerFrame" height="371px" width="100%" scrolling="no" target="_parent"></iframe>
        </div>--%>
        <div class="main_area">
            <div class="center wrap">
                <div class="main_area_top wrap">
                    <header class="wrap">
                        <div class="logo">
                            <a href="http://www.trumans.com.au/">
                                <img src="Images/logo.png" alt="" /></a>
                        </div>
                        <div class="header_right wrap">
                            <div class="header_links"><a href="https://ww03.elbowspace.com/servlets/cfd?xr4=&formts=2007-09-27%2017:12:00.183292" target="_blank">account payments</a> &nbsp; | &nbsp; <a href="https://members.praemium.biz/praemium/genericmain.aspx?gid=trumans" target="_blank" class="first_top_link">login</a></div>
                            <div class="slogan">
                                <img alt="" src="Images/slogan.png" />
                            </div>
                            <div class="phone_number"><span class="phone_item">Chatswood <span>02 9410 6999</span></span><span class="mobile_hidden"> &nbsp;&nbsp; </span><span class="phone_item">Katoomba <span>02 4782 2587</span></span></div>
                        </div>
                    </header>
                    <div class="banner_area wrap">
                        <div class="banner_left wrap">
                            <img alt="" class="placeholder" src="Images/placeholder.gif" />
                            <div id="banner">
                                <!--  initialize the slideshow when the DOM is ready -->
                                <script type="text/javascript">

                                    jQuery(document).ready(function () {
                                        jQuery('#mwp_slideshow_slideshow_698182939').cycle({
                                            fx: 'fade',
                                            slideExpr: 'img',
                                            delay: 0,
                                            timeout: 6000
                                        });
                                    });

                                </script>

                                <div id="mwp_slideshow_slideshow_698182939" class="mwp_slideshow_image_container">
                                    <img src="Images/1 12 need help.jpg" border="0" width="632" height="269" style="width: 632px; height: 269px;" />
                                    <img src="Images/2 9 fin security.jpg" border="0" width="632" height="269" style="display: none; width: 632px; height: 269px;" /><img src="Images/3 13 savings plan.jpg" border="0" width="632" height="269" style="display: none; width: 632px; height: 269px;" /><img src="Images/4 4 in control.jpg" border="0" width="632" height="269" style="display: none; width: 632px; height: 269px;" /><img src="Images/5 8 succession plan.jpg" border="0" width="632" height="269" style="display: none; width: 632px; height: 269px;" /><img src="Images/6 14 need help.jpg" border="0" width="632" height="269" style="display: none; width: 632px; height: 269px;" /><img src="Images/7 6 save future.jpg" border="0" width="632" height="269" style="display: none; width: 632px; height: 269px;" />
                                </div>
                            </div>
                        </div>
                        <div class="banner_right">
                            <div class="banner_right_inner wrap">
                                <div>
                                    <a href="http://www.trumans.com.au/Arrange-a-Consultation-pg21618.html">
                                        <img src="images/arrange_a_consultation.png" alt="" /></a>
                                </div>
                                <div>
                                    <a href="http://www.trumans.com.au/Newsletter-Subscribe-pg21615.html">
                                        <img src="images/join_our_newsletter.png" alt="" /></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="top_menu">
                        <nav class="wrap" id="top_menu">
                            <div id="menu">
                                <ul id="menuList" class="adxm">
                                    <li class=" first_main_menu_item selected_main_menu_item"><a href="http://www.trumans.com.au/">Home</a>

                                    </li>
                                    <li class="submenu middle_main_menu_item"><a href="http://www.trumans.com.au/Our-Practice-pg21438.html">Our Practice</a><ul id="submenu_21438">
                                        <li><a href="http://www.trumans.com.au/Auditing-and-Assurance-pg21526.html">Auditing and Assurance</a></li>
                                        <li><a href="http://www.trumans.com.au/Business-Services-pg21527.html">Business Services</a></li>
                                        <li><a href="http://www.trumans.com.au/Tax-Planning-and-Management-pg21528.html">Tax Planning and Management</a></li>
                                        <li><a href="http://www.trumans.com.au/Trumans-Wealth-Management-pg26052.html" target="_blank">Trumans Wealth Management</a></li>
                                        <li><a href="http://www.trumans.com.au/Executive-Search-Services-pg27758.html" target="_blank">Executive Search Services</a></li>
                                    </ul>
                                    </li>
                                    <li class="submenu middle_main_menu_item"><a href="http://www.trumans.com.au/Our-People-pg21488.html">Our People</a><ul id="submenu_21488">
                                        <li><a href="http://www.trumans.com.au/Careers-pg26441.html">Careers</a></li>
                                        <li><a href="http://www.trumans.com.au/Careers-With-Our-Clients-pg29770.html">Careers With Our Clients</a></li>
                                    </ul>
                                    </li>
                                    <li class=" middle_main_menu_item"><a href="http://www.trumans.com.au/Newsletter-pg21489.html">Newsletter</a></li>
                                    <li class="submenu middle_main_menu_item"><a href="http://www.trumans.com.au/News-pg21535.html">News</a><ul id="submenu_21535">
                                        <li><a href="http://www.trumans.com.au/SuperStream-What-Is-It-pg28702.html">SuperStream - What Is It?</a></li>
                                        <li><a href="http://www.trumans.com.au/Articles-pg22830.html" target="_blank">Articles</a></li>
                                        <li><a href="http://www.trumans.com.au/Trumans-in-the-Community-pg22988.html" target="_blank">Trumans in the Community</a></li>
                                    </ul>
                                    </li>
                                    <li class=" middle_main_menu_item"><a href="http://www.trumans.com.au/Events-pg21495.html">Events</a></li>
                                    <li class=" middle_main_menu_item"><a href="http://www.trumans.com.au/Trumans-BLOG-pg24261.html" target="_blank">Trumans BLOG</a></li>
                                    <li class=" middle_main_menu_item"><a href="http://www.trumans.com.au/Alliance-Partners-pg22893.html" target="_blank">Alliance Partners</a></li>
                                    <li class=" last_main_menu_item"><a href="http://www.trumans.com.au/Contact-pg21436.html">Contact</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
                <div class="mainbody_top"></div>
                <div class="mainbody_repeat">
                    <div class="mainbody_margin_bottom">
                        <div class="mainbody_margin_top">
                            <div class="mainbody_padding">


                                <div class="left_col">


                                    <div class="left_col_padding wrap">
                                        <h1>Pay a Bill
                                        </h1>
                                        <p style="text-align: justify;">
                                            &nbsp;
                                        </p>
                                        <div id="message" style="color: red; border: 1px #dbdbdb solid; border-radius: 8px; padding: 10px; margin: 10px; width: 80%" runat="server" visible="false">
                                        </div>
                                        <div class="account_dtl">
                                            <h3>Client ID</h3>
                                            <br>

                                            <div>
                                                <a href="javascript:void(1);" class="tooltip">Client ID:<br>
                                                    <br>

                                                    <input class="bsb CC" type="text" maxlength="16" id="accountNum" autocomplete="off" runat="server" required>
                                            </div>
                                            <div>
                                                <img class="callout" src="Images/ico-tooltip.png" />
                                                <span>

                                                    <strong>Account Number Match</strong><br />
                                                    Account number is a 13, 10 or 9 digit number that can be found on your bill or bill notification email.
                                                </span>
                                                </a>
                                    
                                            </div>

                                        </div>

                                        <div class="account_dtl">
                                            <h3>Amount $</h3>
                                            <br>
                                            <div>
                                                <a href="javascript:void(1);" class="tooltip">Amount:<br>
                                                    <br>

                                                    <input type="text" class="bsb CC" name="amount" onchange="javascript:checkextrainfo();" id="amount" autocomplete="off" value="" runat="server" required>
                                            </div>
                                            <div>
                                                <img class="callout" src="Images/ico-tooltip.png" />

                                            </div>
                                            <div id="extrainfo" style="margin-top: 20px">
                                            </div>
                                        </div>
                                        <div class="account_dtl">
                                            <h3>Payment Method</h3>
                                            <br>
                                            <br>
                                            <div>
                                                <a href="javascript:void(1);" class="tooltip">
                                                    <input type="radio" name="pay" value="Credit Card" id="radCC">
                                                    <label style="display: inline" for="radCC">Credit Card</label>
                                                    <br>
                                                    <br />
                                                    <input type="radio" name="pay" value="DD" id="radDD">
                                                    <label style="display: inline" for="radDD">Direct Debit</label>
                                                    <br>
                                                    <br />
                                                    <input type="radio" name="pay" value="BPAY" id="radBPAY">
                                                    <label style="display: inline" for="radBPAY">BPAY</label>
                                                    <br />
                                                    <br />
                                                    <input type="radio" name="pay" value="Paypal" id="radPP">
                                                    <label style="display: inline" for="radPP">PayPal</label>
                                            </div>
                                            <div>
                                                <img class="callout" src="Images/ico-tooltip.png" />
                                                <span>

                                                    <strong>Payment Method</strong><br />
                                                    After selection you will be redirected to the payment provider.
                                                </span>
                                                </a>
                                            </div>
                                        </div>

                                        <div class="payment_dtl CC" style="display: none;">
                                            <h3>Credit/Debit Card Details</h3>
                                            <br>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td>Card Number</td>
                                                    <td>
                                                        <input  class="ignore" id="ccNo" type="text" runat="server" maxlength="16" autocomplete="off" onchange="return ValidateCC()" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Card Expiry </td>
                                                    <td>
                                                        <%--<input required class="ignore" id="ExpiryMonth" type="text" style="width: 69px;" runat="server" maxlength="2" autocomplete="off" />
                                                                <span>/</span>
                                                                <input required class="ignore" id="ExpiryYear" type="text" style="width: 69px;" runat="server" maxlength="2" autocomplete="off" />--%>
                                                        <select id="ExpiryMonth" runat="server" class="ignore">
                                                            <option value="0">Month</option>
                                                            <option value="1">Jan</option>
                                                            <option value="2">Feb</option>
                                                            <option value="3">Mar</option>
                                                            <option value="4">Apr</option>
                                                            <option value="5">May</option>
                                                            <option value="6">June</option>
                                                            <option value="7">July</option>
                                                            <option value="8">Aug</option>
                                                            <option value="9">Sept</option>
                                                            <option value="10">Oct</option>
                                                            <option value="11">Nov</option>
                                                            <option value="12">Dec</option>
                                                        </select>
                                                      
                                                        <select id="ExpiryYear"  runat="server">
                                                              <option value="0">Year</option>
                                                        </select>
                                                          <script>
                                                              var myselect = document.getElementById("ExpiryYear"), year = new Date().getFullYear(), maxyear= year+20, yearclone=year;
                                                              var gen = function (max) { do { myselect.add(new Option(year++, (yearclone++).toString().substr(2, 2)), null); } while (year < maxyear); }(20);

                                                        </script>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Verification Code </td>
                                                    <td>
                                                        <input  class="ignore" id="CVV" type="text" runat="server" maxlength="4" autocomplete="off" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <asp:Button ID="btnCCPayment" runat="server" Text="Continue" Style="color: #666; float: right; margin-left: 20px; font-size: 14px; height: 28px; line-height: 28px; overflow: visible; border: 0px; cursor: pointer; min-width: 110px; background: url(https://www.my.telstra.com.au/myaccount/static-content/css/images/lightbox-btn-hover-bg.png) repeat-x center; padding: 0px 10px;"
                                                            OnClick="btnCCPayment_Click" OnClientClick="return ValidateCC();" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="payment_dtl BA" style="display: none;">
                                            <h3>Direct Deposit Details</h3>
                                            <br>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td>Account Name</td>
                                                    <td>
                                                        <input id="DDAccName" type="text" runat="server" maxlength="32"  /></td>
                                                </tr>
                                                <tr>
                                                    <td>Branch Number(BSB)</td>
                                                    <td>
                                                        <asp:TextBox ID="DDBranchNum" type="text" runat="server" MaxLength="7" onchange="return Validate()" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Account Number</td>
                                                    <td>
                                                        <asp:TextBox ID="DDAccNum" type="text" runat="server" MaxLength="10" onchange="return Validate()" /></td>
                                                </tr>

                                                <tr style="height: 15px;">
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input id="chkDD" type="checkbox" value="" name="" runat="server" />
                                                        I accept the <a target="_blank" href="Files/Trumans DDR Service Agreement.pdf">Trumans Payment Service Agreement</a>

                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnDDCont" runat="server" Text="Continue" Style="color: #666; float: right; margin-left: 20px; font-size: 14px; height: 28px; line-height: 28px; overflow: visible; border: 0px; cursor: pointer; min-width: 110px; background: url(https://www.my.telstra.com.au/myaccount/static-content/css/images/lightbox-btn-hover-bg.png) repeat-x center; padding: 0px 10px;"
                                                            OnClick="btnDDCont_Click" OnClientClick="return Validate()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>


                                        <div class="payment_dtl BP" style="display: none;">
                                            <h3>BPAY Details</h3>
                                            <br>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td>Click the button to get your Reference Number for payment through BPAY</td>
                                                    <td></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <asp:Button ID="btn_BPAY" runat="server" Text="Continue" Style="color: #666; float: right; margin-left: 20px; font-size: 14px; height: 28px; line-height: 28px; overflow: visible; border: 0px; cursor: pointer; min-width: 110px; background: url(https://www.my.telstra.com.au/myaccount/static-content/css/images/lightbox-btn-hover-bg.png) repeat-x center; padding: 0px 10px;"
                                                            OnClick="btnBPAY_Click" OnClientClick="return Val();"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="payment_dtl PP" style="display: none;">
                                            <h3>Please click on button below to Pay through Paypal</h3>
                                            <br>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                </tr>

                                                <tr>
                                                    <td></td>
                                                    <td>

                                                        <asp:Button ID="Button2" runat="server" Style="background: url('https://www.paypalobjects.com/webstatic/en_AU/i/buttons/btn_paywith_primary_l.png') center center no-repeat; float: right; margin-left: 20px; font-size: 14px; line-height: 28px; overflow: visible; border: 0px; cursor: pointer; width: 230px; height: 50px; margin-top: 70px;"
                                                            OnClick="btnPPCont_Click" OnClientClick="return Val();" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="clear"></div>
                                        <div style="height: 80px;"></div>
                                        <div class="other-payment-links-details">
                                            <ul class="nav">
                                                <li>
                                                    <a href="javascript:void(1);" target="_blank">Other Payment Methods</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(1);" target="_blank">Payment&nbsp;Difficulties</a>
                                                </li>

                                            </ul>
                                        </div>
                                        <div class="clear"></div>


                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="mainbody_bottom"></div>
            </div>

            <footer>
                <div class="center wrap">
                    <div class="footer_right"><span class="footer_link_block">Copyright &copy; 2015 Trumans.&nbsp; All Rights Reserved.</span><span> &nbsp;&nbsp;&nbsp;&nbsp; </span><span class="footer_link_block"><a href="http://www.trumans.com.au/Terms-and-Conditions-pg27738.html">terms &amp; conditions </a>| <a href="http://www.trumans.com.au/Privacy-Policy-pg27737.html">privacy policy</a> | <span id="footer_links"><a href="http://www.blendev.com" target="_blank">Web Design by Blendev</a></span><span></div>
                    <div class="footer_left wrap">
                        <div>
                            <a href="http://www.linkedin.com/company/trumans" target="_blank">
                                <img src="Images/linkedin.png" alt="" /></a>
                        </div>
                        <div>
                            <a href="http://twitter.com/#!/Trumans_Au" target="_blank">
                                <img src="Images/twitter.png" alt="" /></a>
                        </div>
                        <div>
                            <a href="http://www.facebook.com/pages/Trumans/474724659210390" target="_blank">
                                <img src="Images/facebook.png" alt="" /></a>
                        </div>
                    </div>
                </div>
            </footer>
            <div id="preload_menu_bg"></div>
        </div>
    </form>
</body>
</html>

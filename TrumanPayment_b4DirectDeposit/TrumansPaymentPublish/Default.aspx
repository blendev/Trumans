<%@ Page Title="Trumans Payment" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TrumanPayment._Default" %>

 <!DOCTYPE html>
<html>
<meta charset="utf-8">
<head runat="server">
    <title>Trumans Payment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <base target="_parent" />
    <style type="text/css" media="screen, tv, projection, print">
        @import "Content/Menu.css";
    </style>
    <style>
        * {
            margin: 0px;
        }

        .mainbody_padding {
            margin-top: 20px;
            margin-left: 22px;
        }

        ul {
            list-style: none;
        }

        .clear {
            clear: both;
        }

        .account_dtl {
            position: relative;
            float: left;
            margin: 10px;
            border: 1px #dbdbdb solid;
            border-radius: 8px;
            padding: 10px;
            width: 280px;
            height: 200px;
        }
		
		.payment_dtl {
            position: relative;
            float: left;
            margin-left: 50px;
			 margin-top: 10px;
            border: 1px #dbdbdb solid;
            border-radius: 8px;
            padding: 10px;
            width: 70%;
            height: 200px;
        }

        .cf input {
            float: left;
            width: 100px;
        }

        .tooltips {
            float: left;
            margin-top: 4px;
        }

        #top_menu_new {
            visibility: hidden;
            position: absolute;
        }

        a.tooltip {
            outline: none;
        }

            a.tooltip strong {
                line-height: 30px;
            }

            a.tooltip:hover {
                text-decoration: none;
            }

            a.tooltip span {
                z-index: 10;
                display: none;
                padding: 14px 20px;
                margin-top: 30px;
                margin-left: 0x;
                width: 300px;
                line-height: 16px;
            }

            a.tooltip:hover span {
                display: inline;
                position: absolute;
                border: 2px solid #FFF;
                color: #EEE;
                background: #333;
            }

        .callout {
            position: absolute;
            border: 0;
            top: 5%;
            left: 90%;
            cursor: pointer;
        }

            .callout span {
                z-index: 22;
                position: relative;
            }

        /*CSS3 extras*/
        a.tooltip span {
            border-radius: 2px;
            box-shadow: 0px 0px 8px 4px #666;
            /*opacity: 0.8;*/
        }

        .other-payment-links-label {
            margin: 30px;
        }

        .other-payment-links-details ul li {
            float: left;
            margin: 10px;
        }

        * {
            box-sizing: border-box;
        }

        html,
        body {
            width: 100%;
            height: 100%;
        }

        body {
            margin: .75em;
            background: url(http://cache.clickonf5.org/wp-content/uploads/2010/04/ubuntu_wallpaper_thumb.png);
            background-size: cover;
        }

        /* Advanced Checkbox Hack */
        body {
            -webkit-animation: bugfix infinite 1s;
        }

        @-webkit-keyframes bugfix {
            from {
                padding: 0;
            }

            to {
                padding: 0;
            }
        }

        input[type=checkbox] {
            position: absolute;
            top: -9999px;
            left: -9999px;
        }

        label {
            display: none;
            cursor: pointer;
            user-select: none;
        }

        /* background for li / select */
        /* custom-dropdown */
        nav[role="custom-dropdown"] {
            position: relative;
            width: 100%;
        }

            nav[role="custom-dropdown"] a,
            nav[role="custom-dropdown"] label {
                color: #ccc;
                text-decoration: none;
                font: 1.4em sans-serif;
                transition: color .3s ease-in-out;
            }

            nav[role="custom-dropdown"] ul {
                padding: 0;
                margin: 0 auto;
                width: 100%;
                list-style: none;
            }

                nav[role="custom-dropdown"] ul > li {
                    float: left;
                    padding: .55em .55em;
                    background-image: url(https://raw.github.com/TimPietrusky/mantisbt-is-a-rockstar/master/rockstar/img/bg_dark_grey.png);
                    text-align: center;
                    transition-duration: .3s;
                    transition-timing-function: ease-in-out;
                    transition-property: box-shadow, color;
                    box-shadow: 0 0.05em 0.25em 0 rgba(0, 0, 0, 0.35);
                    cursor: pointer;
                }

                    nav[role="custom-dropdown"] ul > li:hover {
                        background-color: rgba(0, 0, 0, 0.85);
                        color: #fff;
                        box-shadow: 0 0.05em 0.25em 0 rgba(0, 0, 0, 0.35), inset 0 0 0 2em rgba(0, 0, 0, 0.3);
                    }

                        nav[role="custom-dropdown"] ul > li:hover > a {
                            color: #fff;
                        }

        /* small screens */
        @media screen and (max-width: 44em) {
            html,
            body {
                margin: 0;
            }

            .account_dtl {
                float: none;
                min-width: 80%;
            }

			.payment_dtl {
                float: none;
                min-width: 80%;
                width:280px;
                margin-left:30px;
            }

            #top_menu_new {
                visibility: visible;
                position: relative;
            }

            #top_menu {
                visibility: hidden;
                position: absolute;
            }

            h1 {
                margin: 32px 0 9px !important;
            }

            nav[role="custom-dropdown"] ul {
                display: none;
                height: 100%;
            }

            nav[role="custom-dropdown"] label {
                position: relative;
                display: block;
                width: 100%;
                min-height: 2.25em;
                padding: .45em;
                font-size: 1.1em;
                margin: 0;
                border: 0.15em solid rgba(60, 60, 60, 0.2);
                background-image: url(https://raw.github.com/TimPietrusky/mantisbt-is-a-rockstar/master/rockstar/img/bg_dark_grey.png);
            }

                nav[role="custom-dropdown"] label:after {
                    position: absolute;
                    right: .25em;
                    top: 0;
                    content: "\2261";
                    font-size: 1.8em;
                }

            nav[role="custom-dropdown"] input[type=checkbox]:checked ~ label:after {
                color: #222;
            }

            nav[role="custom-dropdown"] input[type=checkbox]:checked ~ ul {
                display: block;
            }

                nav[role="custom-dropdown"] input[type=checkbox]:checked ~ ul > li {
                    width: 100%;
                    opacity: .8;
                    text-align: left;
                }

                    nav[role="custom-dropdown"] input[type=checkbox]:checked ~ ul > li:after {
                        position: absolute;
                        right: .25em;
                        content: "\203A";
                        font: bold 1.4em sans-serif;
                    }
        }
    </style>
	<script src="Scripts/jquery-1.11.1.js"></script> 
	<script src="Scripts/jquery-ui.min.js"></script>
	
    <script type="text/javascript">
        $(document).ready(function () {
            $('input[type="radio"]').click(function () {
                if ($(this).attr("value") == "Credit Card") {

                    $(".payment_dtl").not(".CC").hide();
                    $(".CC").show();
                }
                if ($(this).attr("value") == "DD") {
                    $(".payment_dtl").not(".BA").hide();
                    $(".BA").show();
                }
                if ($(this).attr("value") == "Paypal") {
                    $(".payment_dtl").not(".PP").hide();
                    $(".PP").show();
                }
                if ($(this).attr("value") == "BPAY") {
                    $(".payment_dtl").not(".BP").hide();
                    $(".BP").show();
                }
            });

        });
        
        
        </script>

    <link rel="stylesheet" type="text/css" href="Content/tpl_styles.css" />

</head>
<body>
    <form runat="server">
    <div style="align-content:center">
        <iframe src="http://www.trumans.com.au/" id="headerFrame" height="371px" width="100%" scrolling="no"  target="_parent" ></iframe>
    </div>
    <div class="main_area">
        <div class="center wrap">
            <div class="main_area_top wrap">
                <header class="wrap"></header>
                <div class="banner_area wrap">
                    <div class="banner_left wrap">
                        <!--     <img alt="" class="placeholder" src="rs/7/sites/1123/custom_files/tpl_images/placeholder.gif" /> -->
                        <div id="banner">
                            ->
                        </div>
                    </div>
                    <div class="banner_right">
                        <div class="banner_right_inner wrap">

                        </div>
                    </div>
                </div>
                <div class="top_menu">
                    <nav class="wrap" id="top_menu" role="custom-dropdown">
                        <div id="menu"><ul id="menuList" class="adxm"><li class=" first_main_menu_item selected_main_menu_item_new"><a href="./">Home</a></li><li class="submenu middle_main_menu_item"><a href="Our-Practice-pg21438.html">Our Practice</a><ul id="submenu_21438"><li><a href="Auditing-and-Assurance-pg21526.html">Auditing and Assurance</a></li><li><a href="Business-Services-pg21527.html">Business Services</a></li><li><a href="Tax-Planning-and-Management-pg21528.html">Tax Planning and Management</a></li><li><a href="Trumans-Wealth-Management-pg26052.html" target="_blank">Trumans Wealth Management</a></li><li><a href="Executive-Search-Services-pg27758.html" target="_blank">Executive Search Services</a></li></ul></li><li class="submenu middle_main_menu_item"><a href="Our-People-pg21488.html">Our People</a><ul id="submenu_21488"><li><a href="Careers-pg26441.html">Careers</a></li><li><a href="Careers-With-Our-Clients-pg29770.html">Careers With Our Clients</a></li></ul></li><li class=" middle_main_menu_item"><a href="Newsletter-pg21489.html">Newsletter</a></li><li class="submenu middle_main_menu_item"><a href="News-pg21535.html">News</a><ul id="submenu_21535"><li><a href="SuperStream-What-Is-It-pg28702.html">SuperStream - What Is It?</a></li><li><a href="Articles-pg22830.html" target="_blank">Articles</a></li><li><a href="Trumans-in-the-Community-pg22988.html" target="_blank">Trumans in the Community</a></li></ul></li><li class=" middle_main_menu_item"><a href="Events-pg21495.html">Events</a></li><li class=" middle_main_menu_item"><a href="Trumans-BLOG-pg24261.html" target="_blank">Trumans BLOG</a></li><li class=" middle_main_menu_item"><a href="Alliance-Partners-pg22893.html" target="_blank">Alliance Partners</a></li><li class=" last_main_menu_item"><a href="Contact-pg21436.html">Contact</a></li></ul></div>
                    </nav>

                    <nav class="wrap" id="top_menu_new" role="custom-dropdown">
                        <input type="checkbox" id="button">
                        <label for="button" onclick></label>
                        <ul id="menuList" class="adxm"><li class=" first_main_menu_item selected_main_menu_item_new"><a href="./">Home</a></li><li class="submenu middle_main_menu_item"><a href="Our-Practice-pg21438.html">Our Practice</a><ul id="submenu_21438"><li><a href="Auditing-and-Assurance-pg21526.html">Auditing and Assurance</a></li><li><a href="Business-Services-pg21527.html">Business Services</a></li><li><a href="Tax-Planning-and-Management-pg21528.html">Tax Planning and Management</a></li><li><a href="Trumans-Wealth-Management-pg26052.html" target="_blank">Trumans Wealth Management</a></li><li><a href="Executive-Search-Services-pg27758.html" target="_blank">Executive Search Services</a></li></ul></li><li class="submenu middle_main_menu_item"><a href="Our-People-pg21488.html">Our People</a><ul id="submenu_21488"><li><a href="Careers-pg26441.html">Careers</a></li><li><a href="Careers-With-Our-Clients-pg29770.html">Careers With Our Clients</a></li></ul></li><li class=" middle_main_menu_item"><a href="Newsletter-pg21489.html">Newsletter</a></li><li class="submenu middle_main_menu_item"><a href="News-pg21535.html">News</a><ul id="submenu_21535"><li><a href="SuperStream-What-Is-It-pg28702.html">SuperStream - What Is It?</a></li><li><a href="Articles-pg22830.html" target="_blank">Articles</a></li><li><a href="Trumans-in-the-Community-pg22988.html" target="_blank">Trumans in the Community</a></li></ul></li><li class=" middle_main_menu_item"><a href="Events-pg21495.html">Events</a></li><li class=" middle_main_menu_item"><a href="Trumans-BLOG-pg24261.html" target="_blank">Trumans BLOG</a></li><li class=" middle_main_menu_item"><a href="Alliance-Partners-pg22893.html" target="_blank">Alliance Partners</a></li><li class=" last_main_menu_item"><a href="Contact-pg21436.html">Contact</a></li></ul>
                    </nav>
                </div>
            </div>
            <div class="mainbody_top"></div>
            <div class="mainbody_repeat">
                <div class="mainbody_margin_bottom">
                    <div class="mainbody_margin_top">
                        <div class="mainbody_padding">


                            <h1>
                                Pay a Bill
                            </h1>
                            <p style="text-align: justify;">
                                &nbsp;
                            </p>
                            <div id="message" style="color:red;border: 1px #dbdbdb solid;  border-radius: 8px;  padding: 10px; margin-left:20px; width:80%" runat="server" visible="false">
                               
                            </div>
                            <div class="account_dtl">
                                <h3>Account Details</h3><br>

                                <div>
                                    <a href="javascript:void(1);" class="tooltip"> Account Number:<br><br>
                                        
                                        <input type="text" maxlength="16"  id="accountNum" autocomplete="off" runat="server" required >

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
                                <h3>Amount $</h3><br>
                                <div><a href="javascript:void(1);" class="tooltip"> Amount:<br><br>
                                    
                                    <input type="text" class="accountNum toValidate" name="amount" id="amount" autocomplete="off" value="" runat="server" required> </div>
                                <div>
                                    <img class="callout" src="Images/ico-tooltip.png" />
                                   
                                </div>
                            </div>
                            <div class="account_dtl">
                                <h3>Payment Method</h3><br><br>
                                <div>
                                    <a href="javascript:void(1);" class="tooltip">
                                        <input type="radio" name="pay" value="Credit Card">Credit Card <br>                                        
                                        <input type="radio" name="pay" value="DD">Direct Debit <br>
                                        <input type="radio" name="pay" value="BPAY">BPAY <br>
                                        <input type="radio" name="pay" value="Paypal">PayPal
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
                        </div>
                        <div class="payment_dtl CC" style="display:none;">
						<h3>Credit/Debit Card Details</h3><br>
						<table style="width:100%"><tr><td>
                           Card Number</td><td>  <input id="ccNo" type="text" runat="server" maxlength="16"  /></td></tr>
                           <tr><td> Card Expiry </td> <td><input id="ExpiryMonth" type="text" style="width:60px;" runat="server" maxlength="2"/> <span>/</span> 
                               <input id="ExpiryYear" type="text" style="width:60px;" runat="server" maxlength="2" /></td></tr>
						    <tr><td> Verification Code </td> <td><input id="CVV" type="text" runat="server" maxlength="4" /> </td></tr>
							<tr><td></td><td> 
                                <asp:Button ID="btnCCPayment" runat="server" Text="Continue" style="color: #666; float: right;  margin-left: 20px;  font-size: 14px;
                                      height: 28px;
                                      line-height: 28px;
                                      overflow: visible;
                                      border: 0px;
                                      cursor: pointer;
                                      min-width: 110px;
                                      background: url(https://www.my.telstra.com.au/myaccount/static-content/css/images/lightbox-btn-hover-bg.png) repeat-x center;
                                      padding: 0px 10px;" OnClick="btnCCPayment_Click" />
                                </td></tr>
							</table>
                        </div>
                        
                         <div class="payment_dtl BA" style="display:none;">
						<h3>Bank Account Details</h3><br>
						<table style="width:100%"><tr><td>
                           Bank Account Number</td><td>  <input id="BANo" type="text" runat="server" /></td></tr>
                          
							<tr><td></td><td> 
                                <asp:Button ID="Button1" runat="server" Text="Continue" style="color: #666; float: right;  margin-left: 20px;  font-size: 14px;
                                      height: 28px;
                                      line-height: 28px;
                                      overflow: visible;
                                      border: 0px;
                                      cursor: pointer;
                                      min-width: 110px;
                                      background: url(https://www.my.telstra.com.au/myaccount/static-content/css/images/lightbox-btn-hover-bg.png) repeat-x center;
                                      padding: 0px 10px;" OnClick="btnCCPayment_Click" />
                                </td></tr>
							</table>
                        </div>
                        
                          
                         <div class="payment_dtl BP" style="display:none;">
						<h3>PayPal Details</h3><br>
						<table style="width:100%"><tr><td>
                           Click the button to get your Reference Number for payment through BPAY</td><td> </td></tr>
                           
							<tr><td></td><td> 
                                <asp:Button ID="btn_BPAY" runat="server" Text="Continue" style="color: #666; float: right;  margin-left: 20px;  font-size: 14px;
                                      height: 28px;
                                      line-height: 28px;
                                      overflow: visible;
                                      border: 0px;
                                      cursor: pointer;
                                      min-width: 110px;
                                      background: url(https://www.my.telstra.com.au/myaccount/static-content/css/images/lightbox-btn-hover-bg.png) repeat-x center;
                                      padding: 0px 10px;" OnClick="btnBPAY_Click" />
                                </td></tr>
							</table>
                        </div>
                        
                         <div class="payment_dtl PP" style="display:none;">
						<h3>PayPal Details</h3><br>
						<table style="width:100%"><tr><td>
                           PayPal Account Number</td><td>  <input id="Text1" type="text" runat="server" /></td></tr>
                           
							<tr><td></td><td> 
                                <asp:Button ID="Button2" runat="server" Text="Continue" style="color: #666; float: right;  margin-left: 20px;  font-size: 14px;
                                      height: 28px;
                                      line-height: 28px;
                                      overflow: visible;
                                      border: 0px;
                                      cursor: pointer;
                                      min-width: 110px;
                                      background: url(https://www.my.telstra.com.au/myaccount/static-content/css/images/lightbox-btn-hover-bg.png) repeat-x center;
                                      padding: 0px 10px;" OnClick="btnCCPayment_Click" />
                                </td></tr>
							</table>
                        </div>
                        
                        <div class="clear"></div>
                        <div style="height:80px;"></div>
                        <div class="other-payment-links-details">
                            <ul class="nav">                              

                                <li>
                                    <a href="javascript:void(1);" target="_blank">Payment&nbsp;Difficulties</a>
                                </li>

                            </ul>
                        </div>
                        <div class="clear"></div>


                    </div>
                </div>
            </div>
            <div class="mainbody_bottom"></div>
        </div>
    </div>
    <footer>
        <div class="center wrap">
            <div class="footer_right"><span class="footer_link_block">Copyright © 2015 Trumans.&nbsp; All Rights Reserved.</span><span> &nbsp;&nbsp;&nbsp;&nbsp; </span><span class="footer_link_block"><a href="/Terms-and-Conditions-pg27738.html">terms &amp; conditions </a> | <a href="/Privacy-Policy-pg27737.html">privacy policy</a> | <span id="footer_links"><a href="http://www.excitemedia.com.au" target="_blank">Web Design by Excite Media</a></span><span></span></span></div>
            <div class="footer_left wrap">
                <div><a href="http://www.linkedin.com/company/trumans" target="_blank"><img src="Images/linkedin.png" alt=""></a></div>
                <div><a href="http://twitter.com/#!/Trumans_Au" target="_blank"><img src="Images/twitter.png" alt=""></a></div>
                <div><a href="http://www.facebook.com/pages/Trumans/474724659210390" target="_blank"><img src="Images/facebook.png" alt=""></a></div>
            </div>
        </div>
    </footer>
</form>
</body>

    </html>
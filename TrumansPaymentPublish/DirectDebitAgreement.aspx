<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DirectDebitAgreement.aspx.cs" Inherits="TrumanPayment.DirectDebitAgreement" %>

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
    <div style="align-self:center;padding:10px ">
    <h1 style="text-align: center">Direct Debit Request Service Agreement</h1>
        <p>This is your Direct Debit Service Agreement with [insert Debit User Name, User Id & ABN].  It explains what your obligations are when undertaking a Direct Debit arrangement with us.  It also details what our obligations are to you as your Direct Debit provider.
Please keep this agreement for future reference.  It forms part of the terms and conditions of your Direct Debit Request (DDR) and should be read in conjunction with your DDR authorisation.
The terms of this Direct Debit Aggreement are for the purpose of [insert eg telecommunication services] debiting fromm your account [insert eg weekly, fortnightly, monthly etc]
</p>
        <h3>Definitions</h3>
        <p><b>account</b> means the account held at your financial institution from which we are authorised to arrange for funds to be debited.<br />
<b>agreement</b> means this Direct Debit Request Service Agreement between you and us.<br />
<b>banking day</b> means a day other than a Saturday or a Sunday or a public holiday listed throughout Australia.<br />
<b>debit day</b> means the day that payment by you to us is due.<br />
<b>debit payment </b>means a particular transaction where a debit is made.<br />
<b>direct debit</b> request means the Direct Debit Request between us and you.<br />
<b>us or we </b> means [insert name of Debit User], (the Debit User) you have authorised by requesting a Direct Debit Request.<br />
<b>you</b> means the customer who has signed or authorised by other means the Direct Debit Request.<br />
<b>your financial institution</b> means the financial institution nominated by you on the DDR at which the account is maintained.<br />
</p>
        
            <h3>1. Debiting your account</h3>
<p>
    1.1	By signing a Direct Debit Request or by providing us with a valid instruction, you have authorised us to arrange for funds to be debited from your account. You should refer to the Direct Debit Request and this agreement for the terms of the arrangement between us and you.
<br/>
1.2	We will only arrange for funds to be debited from your account as authorised in the Direct Debit Request.
	or
	We will only arrange for funds to be debited from your account if we have sent to the address nominated by you in the Direct Debit Request, a billing advice which specifies the amount payable by you to us and when it is due.
<br/>
1.3	If the debit day falls on a day that is not a banking day, we may direct your financial institution to debit your account on the following banking day. If you are unsure about which day your account has or will be debited you should ask your financial institution.
<br />
        </p>

      <h3>  2.	Amendments by us</h3>
        <p>2.1	We may vary any details of this agreement or a Direct Debit Request at any time by giving you at least fourteen (14) days written notice.

</p>


<h3> 3.	Amendments by you</h3>

        <p>
            You may change*, stop or defer a debit payment, or terminate this agreement by providing us with at least 
            [insert number of days] days notification by writing to:
[insert Debit User contact details]
or
by telephoning us on [insert number] during business hours;
or
arranging it through your own financial institution, which is required to act promptly on your instructions.
*Note: in relation to the above reference to ‘change’, your financial institution may ‘change’ your debit payment only 
            to the extent of advising us [insert name of Debit User] of your new account details.


        </p>
       <h3> 4.	Your obligations</h3><p>	4.1	It is your responsibility to ensure that there are 
           sufficient clear funds available in your account to allow a debit payment to be made in accordance with the Direct Debit Request.<br />
           </p>
        <p>	4.2	If there are insufficient clear funds in your account to meet a debit payment:
(a)	you may be charged a fee and/or interest by your financial institution;
(b)	you may also incur fees or charges imposed or incurred by us; and
(c) 	you must arrange for the debit payment to be made by another method or arrange for sufficient clear funds to be in your account by an agreed time so that we can process the debit payment.
           <br />
           </p>
        <p>	4.3	You should check your account statement to verify that the amounts debited from your account are correct
           </p>
        <h3>5	Dispute</h3>
	<p>	5.1	If you believe that there has been an error in debiting your account, you should notify us directly on [insert debit user contact details] and confirm that notice in writing with us as soon as possible so that we can resolve your query more quickly.  Alternatively you can take it up directly with your financial institution.
	</p>
        <p>	5.2	If we conclude as a result of our investigations that your account has been incorrectly debited we will respond to your query by arranging for your financial institution to adjust your account (including interest and charges) accordingly.  We will also notify you in writing of the amount by which your account has been adjusted.
</p>
        <p>	5.3	If we conclude as a result of our investigations that your account has not been incorrectly debited we will respond to your query by providing you with reasons and any evidence for this finding in writing.
</p>	
<h3>6.	Accounts</h3><p>
        	You should check:<br />
(a)	with your financial institution whether direct debiting is available from your account as direct debiting is not available on all accounts offered by financial institutions.<br />
        (b)	your account details which you have provided to us are correct by checking them against a recent account statement; and
<br />
        (c)	with your financial institution before completing the Direct Debit Request if you have any queries about how to complete the Direct Debit Request.
       </p>
       <h3>7.	Confidentiality</h3> <p>
        
        7.1	We will keep any information (including your account details) in your Direct Debit Request confidential.  We will make reasonable efforts to keep any such information that we have about you secure and to ensure that any of our employees or agents who have access to information about you do not make any unauthorised use, modification, reproduction or disclosure of that information.
        <br />
        7.2	We will only disclose information that we have about you:
(a)	to the extent specifically required by law; or 
(b)	for the purposes of this agreement (including disclosing information in connection with any query or claim).
       
        </p>
      <h3>  8.	Notice	</h3>
       <p> 
        8.1	If you wish to notify us in writing about anything relating to this agreement, you should write to 
[insert name of Debit User & contact details]
        <br />
        8.2	We will notify you by sending a notice in the ordinary post to the address you have given us in the Direct Debit Request.
        <br />
        8.3	Any notice will be deemed to have been received on the third banking day after posting. 
           </p>
				
    </div>
        <div style="text-align: center; padding : 20px;"> 
            <input id="btnBack" type="button" value="Back" onclick="javascript: window.location.href = 'Default.aspx'" />
            <asp:Button ID="btnAgree" runat="server" Text="I agree" OnClick="btnAgree_Click" />
        <input id="btnDecline" type="button" value="I Decline" onclick="javascript: window.location.href = 'Default.aspx?dd=decline'" /></div>
      </div> 
                          </div> 
   </div>
    </div>
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

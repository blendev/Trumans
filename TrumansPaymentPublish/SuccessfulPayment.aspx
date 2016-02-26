<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuccessfulPayment.aspx.cs" Inherits="TrumanPayment.SuccessfulPayment" %>

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
            margin-left: 10px;
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
                width: 280px;
                
            }

           

            h1 {
                margin: 32px 0 9px !important;
            }

      
        }
    </style>
    <link rel="stylesheet" type="text/css" href="content/global_styles.css" />
    <link rel="stylesheet" type="text/css" href="content/tpl_styles.css" />

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
                    alert("in")
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
                    $(".payment_dtl").not(".BA").hide();
                    $(".BA").show();
                    if (document.getElementById('amount').value != '') {


                        document.getElementById('extrainfo').innerHTML = '<p> <b>Subtotal</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) +
                            '</p><b>Surcharge</b>: $0.00 <p> <b>Total</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) + '</p>';
                    }
                }
                if ($(this).attr("value") == "Paypal") {
                    $(".payment_dtl").not(".PP").hide();
                    $(".PP").show();
                    if (document.getElementById('amount').value != '') {


                        document.getElementById('extrainfo').innerHTML = '<p> <b>Subtotal</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) +
                            '</p><b>Surcharge</b>: $0.00 <p> <b>Total</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) + '</p>';
                    }
                    document.getElementById('ccNo').removeAttribute("required");
                    document.getElementById('ExpiryMonth').removeAttribute("required");
                    document.getElementById('ExpiryYear').removeAttribute("required");
                    document.getElementById('CVV').removeAttribute("required");
                    document.getElementById('chkDD').removeAttribute("required");
                    document.getElementById('DDAccNum').removeAttribute("required");
                    document.getElementById('DDBranchNum').removeAttribute("required");
                    document.getElementById('DDAccName').removeAttribute("required");
                }
                if ($(this).attr("value") == "BPAY") {
                    $(".payment_dtl").not(".BP").hide();
                    $(".BP").show();
                    if (document.getElementById('amount').value != '') {


                        document.getElementById('extrainfo').innerHTML = '<p> <b>Subtotal</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) +
                            '</p><b>Surcharge</b>: $0.00 <p> <b>Total</b>: $' + parseFloat(Math.round(document.getElementById('amount').value * 100) / 100).toFixed(2) + '</p>';
                    }
                    document.getElementById('ccNo').removeAttribute("required");
                    document.getElementById('ExpiryMonth').removeAttribute("required");
                    document.getElementById('ExpiryYear').removeAttribute("required");
                    document.getElementById('CVV').removeAttribute("required");
                    document.getElementById('chkDD').removeAttribute("required");
                    document.getElementById('DDAccNum').removeAttribute("required");
                    document.getElementById('DDBranchNum').removeAttribute("required");
                    document.getElementById('DDAccName').removeAttribute("required");
                }
            });



        });


    </script>

    <script>
        jQuery(document).ready(function ($) {
            $("#top_menu #menu").responsiveMenu();
        });
        function Validate() {
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



            document.getElementById('ccNo').removeAttribute("required");
            document.getElementById('ExpiryMonth').removeAttribute("required");
            document.getElementById('ExpiryYear').removeAttribute("required");
            document.getElementById('CVV').removeAttribute("required");



        }
        function ValidateCC() {
            document.getElementById('chkDD').removeAttribute("required");
            document.getElementById('DDAccNum').removeAttribute("required");
            document.getElementById('DDBranchNum').removeAttribute("required");
            document.getElementById('DDAccName').removeAttribute("required");
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

<div id="successmsg" runat="server">                            <h1>
                                Successful Payment!!
                            </h1>
    <br />
    <br />
     <asp:Label ID="Label1" runat="server" Text="" ></asp:Label>
    <div style="margin-top:200px">
    <a style="cursor:pointer;" id="DDFilelink" runat="server" visible="false"> Click here to download ABA File</a>
        
        </div>
</div>

                            <br />
                            <br />
                            <div id="BPAY" runat="server">
                            <p style="text-align: center;">                                
                               <b>  <asp:Label ID="Label4" runat="server" Text="" Style="position:absolute;margin-top:53px; margin-left:120px; font-size:16px; color:darkblue;"></asp:Label></b>
                                <img src="Images/04A%20Biller%20Code%20Artwork%20-%20Does%20Not%20Accept%20Credit%20Cards%20Artwork.jpg" style="width:300px;height:300px;" />
                           </p>
                            <p style="text-align: center;"> <img alt="" src="Images/image002.png" />
                            </p>
                                </div>
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
                        <div><a href="http://www.linkedin.com/company/trumans" target="_blank">
                            <img src="Images/linkedin.png" alt="" /></a></div>
                        <div><a href="http://twitter.com/#!/Trumans_Au" target="_blank">
                            <img src="Images/twitter.png" alt="" /></a></div>
                        <div><a href="http://www.facebook.com/pages/Trumans/474724659210390" target="_blank">
                            <img src="Images/facebook.png" alt="" /></a></div>
                    </div>
                </div>
            </footer>
            <div id="preload_menu_bg"></div>
            </div>

    </form>
</body>
</html>
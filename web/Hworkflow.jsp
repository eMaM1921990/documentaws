

<%@page import="WSpatern.getHistoricalWorkflow"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="WSpatern.ValidTokenWS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ValidTokenWS valid = new ValidTokenWS();
    getHistoricalWorkflow get_w=new getHistoricalWorkflow();
    List<String> w_flowid=new ArrayList<String>();
    List<String> w_flowname=new ArrayList<String>();
    session = request.getSession();
    bean.LoginBeans login = (bean.LoginBeans) session.getAttribute("loginsession");

    if (login.getToken() != null || !login.getToken().isEmpty()) {
        valid.TokenStats(login.getToken());

        if (valid.valid == true) {
            get_w.getWorkFlow(login.getToken(), login.getStepType());
            w_flowid=get_w.w_flowid;
            w_flowname=get_w.w_flowname;
                    
        } else {

            response.sendRedirect(request.getContextPath() + "/Login.jsp");
        }

    } else {

        response.sendRedirect(request.getContextPath() + "/Login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Idocumenta</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css1/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css1/main.css" />
        <link rel="stylesheet" type="text/css" href="css1/style3.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" >
            $(document).ready(function()
            {
                $(".account").click(function()
                {
                    var X = $(this).attr('id');

                    if (X == 1)
                    {
                        $(".submenu").hide();
                        $(this).attr('id', '0');
                    }
                    else
                    {

                        $(".submenu").show();
                        $(this).attr('id', '1');
                    }

                });

                //Mouseup textarea false
                $(".submenu").mouseup(function()
                {
                    return false
                });
                $(".account").mouseup(function()
                {
                    return false
                });


                //Textarea without editing.
                $(document).mouseup(function()
                {
                    $(".submenu").hide();
                    $(".account").attr('id', '');
                });
                
                
                
                
                
                
                
                $(".accountw").click(function()
                {
                    var X = $(this).attr('id');

                    if (X == 1)
                    {
                        $(".submenuw").hide();
                        $(this).attr('id', '0');
                    }
                    else
                    {

                        $(".submenuw").show();
                        $(this).attr('id', '1');
                    }

                });

                //Mouseup textarea false
                $(".submenuw").mouseup(function()
                {
                    return false
                });
                $(".accountw").mouseup(function()
                {
                    return false
                });


                //Textarea without editing.
                $(document).mouseup(function()
                {
                    $(".submenuw").hide();
                    $(".accountw").attr('id', '');
                });

            });

        </script>
        <style>
            div.dropdown {
                color: #000;
                margin: 3px -22px 0 0;
                width: 143px;
                position: relative;
                height: 28px;
                text-align:left;
            }
            div.submenu
            {
                position: absolute;
                color:#000000;
                top: -12px;
                left: -10px;
                z-index: 100;
                width: 220px;
                display: none;
                margin-left: 10px;
                padding: 40px 0 5px;
                border-radius: 6px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.45);
            }

            .dropdown  li a {

                color: #000 !important;
                display: block;
                font-family: arial;
                cursor: pointer;
                text-decoration:none;
                font-size: 13px !important;
                line-height: 30px;
                padding-left:10px;
            }

            .dropdown li a:hover{
                color: #FFFFFF;
                text-decoration: none;

            }
            a.account {
                background: url("arrow.png") no-repeat scroll 185px 20px #333;
                color: #fff;
                cursor: pointer;
                display: block;
                font-size: 16px;
                height: 28px;
                line-height: 38px;
                margin: -11px 0 0 0px;
                position: absolute;
                text-decoration: none;
                width: 220px;
                z-index: 110;
                padding-bottom:38px;
                padding-left:10px;
            }
            .root
            {
                list-style:none;
                margin:0px;
                padding:0px;
                font-size: 11px;
                padding: 11px 0 0 0px;
                border-top:1px solid #dedede;
                background-color:#fff;
            }
        </style>
    </head>
    <body class="bg-col03">
        <div class="row bg-col02 brder-bottom01">
            <div class="container">
                <div class="logo-bx">
                    <a href="mainpage.jsp"> <img src="img/Idocumenta_logo.jpg" width="243" height="55"> </a>   </div>
            </div>
        </div>
        <div class="row bg-col04"> 
            <div class="row">
                <a href="#" id="trigger-overlay">
                    <div class="in-block actions float-l" id="test">Account Actions</div>
                </a>
                <div class="in-block float-r">
                    <a href="#"><span class="search"><img src="img/search.png"></span></a>
                    <a href="#"><span class="more-act"><img src="img/more-icons.png"></span></a></div>
                <div class="clear"></div>
            </div>
        </div>
        <div id="content" class="row">
            <ul class="list listing01">
                <li>
                    <div class="row">
                        <div class="in-block">
                            <a href="#"><span class="folder01"> &nbsp;></span></a>
                        </div>
                    </div>
                </li>
                <% for(int i=0;i<w_flowid.size();i++){%>
                <li>
                    <div class="row">
                        <div class="in-block float-l">
                            <a href="getWorkflowDetails?id=<%=w_flowid.get(i)%>"><span class="<%=w_flowname.get(i).substring(w_flowname.get(i).lastIndexOf(".") + 1, w_flowname.get(i).length())%> "><%=w_flowname.get(i)%></span></a>
                        </div>

                        <div class="clear"></div>
                    </div>
                </li>
                <%}%>
                

            </ul>
        </div>


        <div class="row footer brder-top02 bg-col02 rel">
            <div class="container center-text copyright rel">
                <p class="copy">© 2004-2014 Infrasoft</p>
                <p><a>About</a> | <a>Support</a> | <a>Legal</a></p>
            </div>
            <a href="#" class="close"><span>X</span></a>
        </div>
        <div class="overlay overlay-slidedown">
            <button type="button" class="overlay-close">Close</button>
            <nav>
                <ul><div class="dropdown">
                        <a class="account" >
                            <span>Profile</span>  </a>
                        <div class="submenu" style="display: none; ">
                            <ul class="root">
                                <li>
                                    <a href="#" >Edit Account</a>      </li>
                                <li>
                                    <a href="#" >Change Password</a>      </li>
                                
                            </ul>
                        </div>
                    </div>
                    <li class="seprator"></li>
                    <li><a href="mainpage.jsp"><i class="fa fa-file"></i>My Documenta</a></li>
                    <li><a href="#"><i class="fa fa-spinner"></i>Workflows</a></li>
                    <li><a href="#"><i class="fa fa-search"></i>Recent</a></li>
                    <li><a href="#"><i class="fa fa-star"></i>Favoraties</a></li>
                    <li class="seprator"></li>
                    <li><a href="Logout">Sign Out</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of service</a></li>
                    <li><a href="#">Desktop version</a></li>
                </ul>
            </nav>
        </div>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="js/mousetrap.min.js"></script>
        <script src="js/modernizr.custom.js"></script>
        <script src="js/classie.js"></script>
        <script src="js/cmdscriptmin.js"></script>
        <script src="js/custome.js"></script>
    </body>
</html>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="WSpatern.SubFolderWS"%>
<%@page import="WSpatern.RootFolderWS"%>
<%@page import="WSpatern.ValidTokenWS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    ValidTokenWS valid = new ValidTokenWS();
    RootFolderWS root = new RootFolderWS();
    SubFolderWS subfldr = new SubFolderWS();
    List<String> subfoldr = null;
    List<String> sunfolr_id = null;
    String Root = "root";
    String Root_id;
    session = request.getSession();
    bean.LoginBeans login = (bean.LoginBeans) session.getAttribute("loginsession");

    if (login.getToken() != null || !login.getToken().isEmpty()) {
        valid.TokenStats(login.getToken());

        if (valid.valid == true) {
            root.getRoot(login.getToken());
            Root = root.Root_folder;
            Root_id = root.Root_folder_Id;
            subfldr.getRoot(login.getToken(), Root_id);
            subfoldr = subfldr.sub_folder;
            sunfolr_id = subfldr.sub_folder_Id;
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
                
                
                
                
                   
                $(".accounth").click(function()
                {
                    var X = $(this).attr('id');

                    if (X == 1)
                    {
                        $(".submenuh").hide();
                        $(this).attr('id', '0');
                    }
                    else
                    {

                        $(".submenuh").show();
                        $(this).attr('id', '1');
                    }

                });

                //Mouseup textarea false
                $(".submenuh").mouseup(function()
                {
                    return false
                });
                $(".accounth").mouseup(function()
                {
                    return false
                });


                //Textarea without editing.
                $(document).mouseup(function()
                {
                    $(".submenuh").hide();
                    $(".accounth").attr('id', '');
                });
                
                    $(".workflowitems").hide();

    $(".workflowparent").click(function(event) {
        event.preventDefault();

             $('.workflowitems').slideToggle( "slow");

    });
    
                        $(".workflowhitems").hide();

    $(".workflowhparent").click(function(event) {
        event.preventDefault();

             $('.workflowhitems').slideToggle( "slow");

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
                z-index: 9999;
                width: 220px;
                display: none;
                margin-left: 10px;
                padding: 40px 0 5px;
                border-radius: 6px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.45);
            }
            
            div.submenuw
            {
                position: absolute;
                color:#000000;
                top: -12px;
                left: -10px;
              z-index: 99999;
                width: 220px;
                display: none;
                margin-left: 10px;
                padding: 40px 0 5px;
                border-radius: 6px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.45);
            }
            
            
            div.submenuh
            {
                position: absolute;
                color:#000000;
                top: -12px;
                left: -10px;
               z-index: 999999;
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
            
            
            a.accountw {
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
            
            
            a.accounth {
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
            
            ul.workflowhitems li, ul.workflowitems li {
  list-style-type: square;
  display: list-item;
  padding: 0;
  margin: 0;
  line-height: initial;
  margin-left: 35px;
  height: 25px;
  vertical-align: middle;
  font-size: 16px;
  cursor: pointer;
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
                    <div class="in-block actions float-l">Account Actions</div>
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
                            <a href="#"><span class="folder01"><%=Root%> &nbsp;></span></a>
                        </div>
                    </div>
                </li>
                <%for (int i = 0; i < sunfolr_id.size(); i++) {%>
                <li>
                    <div class="row">
                        <div class="in-block float-l">
                            <a href="subfolders.jsp?id=<%=sunfolr_id.get(i)%>"><span class="folder01"><%=subfoldr.get(i)%></span></a>
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
<li class="workflowparent"><a href="#"><i class="fa fa-spinner"></i>Workflows</a>

</li>
                        <ul  class="workflowitems" style="display:none;">
            <li>
                <a onclick="getWorkFlow('INFORMARE')">Information</a>      </li>
            <li>
                <a onclick="getWorkFlow('APROBARE')" >Approval</a>      </li>
             <li>
                <a onclick="getWorkFlow('ATRIBUIRE')" >Allocated</a>      </li>
              <li>
                <a onclick="getWorkFlow('RESPINS')">Rejected</a>      </li>

              <li>
                <a onclick="getWorkFlow('DELEGARE')" >Delegation of responsibility</a>      </li>
    </ul>

                    <li class="workflowhparent"><a href="#"><i class="fa fa-spinner"></i>Workflows History</a>

</li>
                        <ul  class="workflowhitems" style="display:none;">
            <li>
                <a onclick="gethWorkFlow('INFORMARE')">Information</a>      </li>
            <li>
                <a onclick="gethWorkFlow('APROBARE')" >Approval</a>      </li>
             <li>
                <a onclick="gethWorkFlow('ATRIBUIRE')" >Allocated</a>      </li>
              <li>
                <a onclick="gethWorkFlow('RESPINS')">Rejected</a>      </li>

              <li>
                <a onclick="gethWorkFlow('DELEGARE')" >Delegation of responsibility</a>      </li>
    </ul>
                    <!--<div class="dropdown">
                        <a class="accountw" >
                            <i class="fa fa-spinner"></i><span>Current Workflows</span>  </a>
                        <div class="submenuw" style="display: none; ">
                            <ul class="root">
                                <li>
                                    <a onclick="getWorkFlow('INFORMARE')">Information</a>      </li>
                                <li>
                                    <a onclick="getWorkFlow('APROBARE')" >Approval</a>      </li>
                                 <li>
                                    <a onclick="getWorkFlow('ATRIBUIRE')" >Allocated</a>      </li>
                                  <li>
                                    <a onclick="getWorkFlow('RESPINS')">Rejected</a>      </li>
                                  
                                  <li>
                                    <a onclick="getWorkFlow('DELEGARE')" >Delegation of responsibility</a>      </li>
                                
                            </ul>
                        </div>
                    </div> -->
                    <!--<div class="dropdown">
                        <a class="accounth" >
                            <i class="fa fa-spinner"></i><span>Historical Workflows</span>  </a>
                        <div class="submenuh" style="display: none; ">
                            <ul class="root">
                                <li>
                                    <a onclick="gethWorkFlow('INFORMARE')">Information</a>      </li>
                                <li>
                                    <a onclick="gethWorkFlow('APROBARE')" >Approval</a>      </li>
                                 <li>
                                    <a onclick="gethWorkFlow('ATRIBUIRE')" >Allocated</a>      </li>
                                  <li>
                                    <a onclick="gethWorkFlow('RESPINS')">Rejected</a>      </li>
                                  
                                  <li>
                                    <a onclick="gethWorkFlow('DELEGARE')" >Delegation of responsibility</a>      </li>
                                
                            </ul>
                        </div>
                    </div>-->
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
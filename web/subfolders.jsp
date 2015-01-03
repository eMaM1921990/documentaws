<%-- 
    Document   : newjsp
    Created on : Nov 1, 2014, 5:59:45 PM
    Author     : emam
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="WSpatern.ProprestiesFile"%>
<%@page import="WSpatern.ListOfFile"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="WSpatern.SubFolderWS"%>
<%@page import="WSpatern.RootFolderWS"%>
<%@page import="WSpatern.ValidTokenWS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ValidTokenWS valid = new ValidTokenWS();
    RootFolderWS root = new RootFolderWS();
    SubFolderWS subfldr = new SubFolderWS();
    ListOfFile list = new ListOfFile();
    ProprestiesFile prop = new ProprestiesFile();
    List<String> subfoldr = null;
    List<String> sunfolr_id = null;
    Vector<String> files = null;
    Vector<String> files_id = null;
    String Root = "";
    String Root_id;
    if (session.getAttribute("loginsession") == null) {

        RequestDispatcher re = request.getRequestDispatcher("Login.jsp");
        re.forward(request, response);
    } else {
        session = request.getSession();
        bean.LoginBeans login = (bean.LoginBeans) session.getAttribute("loginsession");
        valid.TokenStats(login.getToken());

        if (valid.valid == true) {
            // root.getRoot(login.getToken());
            // Root = root.Root_folder;
            // Root_id = root.Root_folder_Id;
            subfldr.getRoot(login.getToken(), request.getParameter("id"));
            subfoldr = subfldr.sub_folder;
            sunfolr_id = subfldr.sub_folder_Id;
            list.getFile(login.getToken(), request.getParameter("id"));
            files = list.files;
            files_id = list.files_Id;

        } else {
            RequestDispatcher re = request.getRequestDispatcher("Login.jsp");
            re.forward(request, response);

        }
    }

    

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Documenta</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css1/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css1/main.css" />
        <link rel="stylesheet" type="text/css" href="css1/style3.css" />
        <script src="js/custome.js"></script>
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
                    <div class="in-block actions float-l">Account Actions</div>
                </a>
                <div class="in-block float-r">
                    <a href="#"><span class="search"><img src="img/search.png"></span></a>
                    <a href="#"><span class="more-act"><img src="img/more-icons.png"></span></a></div>
                <div class="clear"></div>
            </div>
        </div>
        <div id="content" class="row">
            <ul id="triggerInfoOverlay" class="list listing01"> <!-- Ul to detect click events -->
                <li>
                    <div class="row" onclick="history.go(-1);">
                        <div class="in-block">
                            <a href="mainpage.jsp" ><span class="folder01">...</span></a>
                        </div>
                    </div>
                </li>
                <%for (int i = 0; i < subfoldr.size(); i++) {%>
                <li>
                    <div class="row">
                        <div class="in-block float-l">
                            <a href="subfolders.jsp?id=<%=sunfolr_id.get(i)%>"><span class="folder01"><%=subfoldr.get(i)%></span></a>
                        </div>

                        <div class="clear"></div>
                    </div>
                </li>
                <%}%>

                <%for (int i = 0; i < files.size(); i++) {

                %>
                <li>
                    <div class="row">
                        <div class="in-block float-l">
                            <span class="<%=files.get(i).substring(files.get(i).lastIndexOf(".") + 1, files.get(i).length())%>"><%=files.get(i)%></span>                        </div>
                        <div class="in-block float-r">
                            <a onclick="data('<%=files_id.get(i)%>', '<%=files.get(i)%>')"  data-info="triger" class="info01"></a>
                        </div>
                        <div class="clear"></div>


                    </div>


                </li>


                <%}%>
            </ul>
        </div>


        <div class="row footer brder-top02 bg-col02 rel">
            <div class="container center-text copyright rel">
                <p class="copy">&copy; 2004-2014 Infrasoft</p>
                <p><a>About</a> | <a>Support</a> | <a>Legal</a></p>
            </div>
            <a href="#" class="close"><span>X</span></a>
        </div>

        <div id="previewOverlay" >
            <div id="previewPopup"><div style="width: 100%; height: 40px; display: block; float: left; position: relative;"><div id="previewPopupX">x</div></div>
                <div id="review"></div>
               
            </div>
        </div>  

        <div id="workflowOverlay">
            <div id="workflowPopup">

            </div>
        </div>

        <div class="overlay overlay-slidedown">
            <button type="button" class="overlay-close">Close</button>

            <nav>
                <div class="dropdown">
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
                <ul>
                  
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

            <div class="foverlay overlay-slidedown">
                <button type="button" class="foverlay-close">Close</button>

                <nav>
                    <ul>
                        <li class="seprator"></li>




                        <li onClick="download()"><a style="cursor: pointer">Download</a></li>
                        <li ><a style="cursor: pointer" href="#" id="prop">Properties</a></li>
                        <li onClick="preview()" id="previewTriger" ><a style="cursor: pointer">Preview</a></li>
                        <li id="workflowTriger"><a href="#">Send to Workflow</a></li>
                        <li class="seprator"></li>
                    </ul>
                </nav>
            </div>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="js/mousetrap.min.js"></script>
        <script src="js/modernizr.custom.js"></script>
        <script src="js/classie.js"></script>
        <script src="js/cmdscriptmin.js"></script>



        <script type="text/javascript" src="js/popups.js"></script>

        <script type="text/javascript" src="js/main.js"></script>
    </body>

</html>
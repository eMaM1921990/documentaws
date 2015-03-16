<%-- 
    Document   : newjsp
    Created on : Nov 1, 2014, 5:59:45 PM
    Author     : emam
--%>
<%@page import="utils.CssClass"%>
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
    CssClass css = new CssClass();
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

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script src="js/custome.js"></script>
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

                    $('.workflowitems').slideToggle("slow");

                });

                $(".workflowhitems").hide();

                $(".workflowhparent").click(function(event) {
                    event.preventDefault();

                    $('.workflowhitems').slideToggle("slow");

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
                        <div onclick="data('<%=files_id.get(i)%>', '<%=files.get(i)%>')" class="in-block float-l opens">
                            <span class="<%=css.getCssClass(files.get(i).substring(files.get(i).lastIndexOf(".") + 1, files.get(i).length()))%> " ><%=files.get(i)%></span>  
                        </div>
                        <div class="in-block float-r">
                            <a onclick="data('<%=files_id.get(i)%>', '<%=files.get(i)%>')"  data-info="triger" class="info01"></a>
                        </div>
                        <div class="clear"></div>


                    </div>


                </li>


                <%}%>
            </ul>
        </div>

                <jsp:include page="footer_segment.jsp"/>
                    
    </body>

</html>
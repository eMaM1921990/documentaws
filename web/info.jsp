<%-- 
    Document   : abbastest
    Created on : Nov 3, 2014, 3:14:40 PM
    Author     : Dev
--%>
<%@page import="WSpatern.WorkFlow"%>
<%@page import="java.util.Date"%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.http.HttpEntity"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page import="org.apache.http.impl.client.DefaultHttpClient"%>
<%@page import="WSpatern.getFileSecuirty"%>
<%@page import="WSpatern.MetaData"%>
<%@page import="WSpatern.DownloadLink"%>
<%@page import="WSpatern.ValidTokenWS"%>
<%@page import="java.util.ArrayList"%>
<%@page import="WSpatern.ProprestiesFile"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ValidTokenWS valid = new ValidTokenWS();

    ProprestiesFile prop = new ProprestiesFile();

    MetaData meta = new MetaData();
    getFileSecuirty secure = new getFileSecuirty();
    WorkFlow flow = new WorkFlow();
    List<String> flowid = new ArrayList<String>();
    List<String> flowname = new ArrayList<String>();
    List<String> data = new ArrayList<String>();
    List<String> label = new ArrayList<String>();
    List<String> codAtribut = new ArrayList<String>();
    List<String> valoare = new ArrayList<String>();
    String link = "";
    bean.LoginBeans login = null;
    if (session.getAttribute("loginsession") != null) {
        session = request.getSession();
        login = (bean.LoginBeans) session.getAttribute("loginsession");
        valid.TokenStats(login.getToken());

        if (valid.valid == true) {

            prop.getProp(login.getToken(), request.getParameter("id"));
            data = prop.prop;
            label = prop.label;

            meta.getMeta(login.getToken(), request.getParameter("id"));
            codAtribut = meta.codAtribut;
            valoare = meta.valoare;
            secure.getSecuirty(login.getToken(), request.getParameter("id"));

        } else {

            RequestDispatcher re = request.getRequestDispatcher("Login.jsp");
            re.forward(request, response);
        }
    } else {
        RequestDispatcher re = request.getRequestDispatcher("Login.jsp");
        re.forward(request, response);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Documenta</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="css/custom.css" rel="stylesheet">
        <link href="css/mob_files.css" rel="stylesheet">
        <link href="css/mob_folders.css" rel="stylesheet">
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
                    <a href="mainpage.jsp"> <img src="img/documenta_logo_w.png" width="243" height="55"> </a>   </div>
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
            <div class="fileInfo"> 
                <div class="fixed-div">
                    <div class="controlBar"> 
                        <a onclick="history.go(-1);"><img id="arrowback" src="img/arrow-back.png" alt="Back Arrow" onclick="back()"></a>
                        <p id="actionsButtonP">
                            <span>Actions</span>
                            <img id="actionsButton" src="img/actions-button.png" alt="Actions Button" onclick="data('<%=request.getParameter("id")%>','<%=request.getParameter("name")%>')">
                       
                        </p>
                        <div class="clear"></div>
                    </div> <!-- .controlBar -->

                    <div class="infoMenu"> 
                        <span>File Name : <%=request.getParameter("name")%></span>
                        <ul>
                            <li id="generalDataTriger">General</li>
                            <li id="whohasaccesDataTriger">Who has Access</li>
                            <li id="metadataTriger">Meta Data</li>
                        </ul>
                    </div> <!-- .infoMenu -->
                </div> <!-- fixed-div -->
                <div class="infoData">
                    <div id="generalData">
                        <ul>
                            <%for (int i = 0; i < data.size(); i++) {%>
                            <li> <span class="float-l pdl"><%=label.get(i)%></span>  <span class="pdr"><%=data.get(i)%></span> </li>
                                <%}%>
                        </ul>
                    </div> <!-- generalData -->
                    <div id="whohasaccesData"> 
                        <table>
                            <tbody>
                                <tr style="font-weight: bold;">
                                    <td>Users</td>
                                    <td style="width: 50px;">Full</td>
                                    <td style="width: 50px;">Read</td>
                                    <td>Write</td>
                                </tr>  
                                <tr>
                                    <td style="min-width: 100px;"><%=secure.secName%></td>
                                    <td><%if (secure.hasFull.equals("1")) {%><input type="checkbox" checked="true" name="1" disabled/><%} else {%><input type="checkbox"  name="1" disabled/><%}%></td>
                                    <td><%if (secure.hasRead.equals("1")) {%><input type="checkbox" checked="true" name="2" disabled/><%} else {%><input type="checkbox"  name="2" disabled/><%}%></td>
                                    <td><%if (secure.hasWrite.equals("1")) {%><input type="checkbox" checked="true" name="3" disabled/><%} else {%><input type="checkbox"  name="3" disabled/><%}%></td>
                                </tr>
                            </tbody>
                        </table>


                    </div> <!-- .whohasaccesData -->
                    <div id="metadata"> 
                        <ul>
                            <li><span class="float-l pdl">Name</span><span class="pdr">Code</span></li>


                            <%for (int i = 0; i < codAtribut.size(); i++) {%>
                            <li> <span class="float-l pdl"><%=codAtribut.get(i)%></span>  <span class="pdr"><%=valoare.get(i)%></span> </li>
                                <%}%>
                        </ul>
                    </div> <!-- .metadata -->

                    <div class="clear"> </div>
                </div> <!-- .infoData -->
            </div> <!-- .fileInfo --> 






        </div>


       
                                <jsp:include page="footer_segment.jsp"/>
                                <script type="text/javascript" src="js/main.js"></script>
    </body>
</html>

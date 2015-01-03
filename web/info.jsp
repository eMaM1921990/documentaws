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
                    <a href="mainpage.jsp"> <img src="img/Idocumenta_logo.jpg" width="243" height="55"> </a> </div>
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
                            <%for (int i = 0; i < codAtribut.size(); i++) {%>
                            <li> <span class="float-l pdl"><%=codAtribut.get(i)%></span>  <span class="pdr"><%=valoare.get(i)%></span> </li>
                                <%}%>
                        </ul>
                    </div> <!-- .metadata -->

                    <div class="clear"> </div>
                </div> <!-- .infoData -->
            </div> <!-- .fileInfo --> 






        </div>


        <div class="row footer brder-top02 bg-col02 rel">
            <div class="container center-text copyright rel">
                <p class="copy">&COPY; 2004-2014 Infrasoft</p>
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
                    <!--<li><a href="#">Profile</a>
        <ul>
        <li><a href="#">Change Password</a></li>
        <li><a href="#">Logout</a></li>
        </ul>
</li>-->
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
        <script type="text/javascript" src="js/main.js"></script>
        <script type="text/javascript" src="js/popups.js"></script>
    </body>
</html>

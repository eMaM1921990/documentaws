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
        <jsp:include page="header_segment.jsp"/>
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

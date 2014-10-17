<%-- 
    Document   : Root
    Created on : Oct 13, 2014, 3:24:47 PM
    Author     : emam
--%>

<%@page import="java.util.Vector"%>
<%@page import="WSpatern.SubFolderWS"%>
<%@page import="WSpatern.RootFolderWS"%>
<%@page import="WSpatern.ValidTokenWS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ValidTokenWS valid = new ValidTokenWS();
    RootFolderWS root = new RootFolderWS();
    SubFolderWS subfldr = new SubFolderWS();
    Vector<String> subfoldr=null;
    Vector<String> sunfolr_id=null;
    session = request.getSession();
    bean.LoginBeans login = (bean.LoginBeans) session.getAttribute("loginsession");
    valid.TokenStats(login.getToken());
    String Root = "root";
    String Root_id;
    if (valid.valid == true) {
        root.getRoot(login.getToken());
        Root = root.Root_folder;
        Root_id = root.Root_folder_Id;
        subfldr.getRoot(login.getToken(), Root_id);
        subfoldr=subfldr.sub_folder;
        sunfolr_id=subfldr.sub_folder_Id;
    } else {

    }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Idocumenta</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body class="bg-col03">
        <div class="row bg-col02 brder-bottom01">
            <div class="container">
                <div class="logo-bx">
                    <img src="img/Idocumenta_logo.jpg">
                </div>
            </div>
        </div>
        <div class="row bg-col04"> 
            <div class="row">
                <a href="#">
                    <div class="in-block actions float-l">Account Actions</div>
                </a>
                <div class="in-block float-r">
                    <a href="#"><span class="search"><img src="img/search.png"></span></a>
                    <a href="#"><span class="more-act"><img src="img/more-icons.png"></span></a></div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="row">
            <ul class="list listing01">
                <li>
                    <div class="row">
                        <div class="in-block">
                            <a href="#"><span class="folder01">...&nbsp;<%=Root%> (ROOT)</span></a>
                        </div>
                    </div>
                </li>
                <%for(int i=0;i<subfoldr.size();i++){%>
                <li>
                    <div class="row">
                        <div class="in-block float-l">
                            <a href="#"><span class="folder01"><%=subfoldr.elementAt(i)%></span></a>
                        </div>
                        <div class="in-block float-r">
                            <a class="info01" href="#"></a>
                        </div>
                        <div class="clear"></div>
                    </div>
                </li>
<%}%>

            </ul>
        </div>


        <div class="row footer brder-top02 bg-col02 rel">
            <div class="container center-text copyright rel">
                <p class="copy">\A9 2004-20014 Infrasoft</p>
                <p><a>About</a> | <a>Support</a> | <a>Legal</a></p>
            </div>
            <a href="#" class="close"><span>X</span></a>
        </div>

    </body>
</html>

<%@page import="utils.CssClass"%>
<%@page import="WSpatern.Search"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="WSpatern.RootFolderWS"%>
<%@page import="WSpatern.ValidTokenWS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CssClass css = new CssClass();

    ValidTokenWS valid = new ValidTokenWS();
    RootFolderWS root = new RootFolderWS();
    Search subfldr = new Search();
    List<String> subfoldr = null;
    List<String> sunfolr_id = null;
    String Root = "root";
    String Root_id;
    session = request.getSession();
    bean.LoginBeans login = (bean.LoginBeans) session.getAttribute("loginsession");

    if (login.getToken() != null || !login.getToken().isEmpty()) {
        valid.TokenStats(login.getToken());

        if (valid.valid != true) {

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

        <link href="css/mob_files.css" rel="stylesheet">
        <link href="css/mob_folders.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css1/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css1/main.css" />
        <link rel="stylesheet" type="text/css" href="css1/style3.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <jsp:include page="header_segment.jsp"/>
    </head>
    <body class="bg-col03">
        <div class="row bg-col02 brder-bottom01">
            <div class="container">
                <div class="logo-bx">
                    <a href="mainpage.jsp"> <img src="img/documenta_logo_w.png" width="243" height="55"> </a>   </div>
            </div>
        </div>
        <jsp:include page="navigation.jsp"/>
        <div id="content" class="row">
            <form enctype='multipart/form-data' method="post" action="https://documenta-dms.com/DMSWS/api/v1/file/upload/" >
                <input type="hidden" name="dirId" value="${param.id}"/>
                <input type="hidden" name="token" value="<%=login.getToken()%>"/>

                <input type="hidden" name="userId" value="<%=login.getUserId()%>"/>
                File : <input type="file" name="fileData"/>
                <input type="submit" name="send" value="send"/>
            </form>
        </div>


        <jsp:include page="footer_segment.jsp" />

    </body>
</html>


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
      <jsp:include page="header_segment.jsp"/>
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


                <jsp:include page="footer_segment.jsp" />
       
    </body>
</html>
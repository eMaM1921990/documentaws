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
        <link href="css/mob_files.css" rel="stylesheet">
        <link href="css/mob_folders.css" rel="stylesheet">
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
                    <div class="row files">
                        <div onclick="data('<%=files_id.get(i)%>', '<%=files.get(i)%>')" class="in-block float-l opens">
                            <span class="<%=css.getCssClass(files.get(i).substring(files.get(i).lastIndexOf(".") + 1, files.get(i).length()))%> " ><%=files.get(i)%></span>  
                        </div>
                        <%-- <div class="in-block float-r">
                            <a onclick="data('<%=files_id.get(i)%>', '<%=files.get(i)%>')"  data-info="triger" class="info01"></a>
                        </div> --%>
                        <div class="clear"></div>


                    </div>


                </li>


                <%}%>
            </ul>
        </div>

                <jsp:include page="footer_segment.jsp"/>
                    
    </body>

</html>

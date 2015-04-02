
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
        
        <link href="css/mob_files.css" rel="stylesheet">
        <link href="css/mob_folders.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css1/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css1/main.css" />
        <link rel="stylesheet" type="text/css" href="css1/style3.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery/main.js"></script>
      <jsp:include page="header_segment.jsp"/>
    </head>
    <body class="bg-col03">
        <div class="row bg-col02 brder-bottom01">
            <div class="container">
                <div class="logo-bx">
                    <a href="mainpage.jsp"> <img src="img/documenta_logo_w.png" width="243" height="55"> </a>   </div>
            </div>
        </div>
        <div class="row breadcrumb">
  <span>Site &gt; Users &gt; i.adi</span>
        </div>
       <div class="row dmsIcons">
                           <a href="mainpage.jsp"> <img title="Home" src="img/home2.png"></a>
                            <a href="#" id="openSearch" onclick=""><img title="Search" src="img/search2.png"></a>
                            <a href="#" id="openUpload" onclick=""><img title="Upload" onclick="" src="img/upload2.png"></a>
                            <a href="#">  <img title="Add" src="img/add2.png"></a>
                            <a href="#">  <img title="MetaData" src="img/metadata.png"></a>
                            <a href="#" style="float:right;" onclick=""> <img id="trigger-overlay" title="Refresh" src="img/setting.png"></a>

                        </div>
<div class="row bg-col04"> 
            <div class="row search">
                
                                    <input type="text" id="searchitem">
                    <input type="hidden" id="dirid" value="19782">
                    <a href="#" id="search_btn"><span class="search"><img src="img/search.png"></span></a>
                <div class="clear"></div>
            </div>
        </div>
        
        <div class="row bg-col04"> 
            <div class="row upload">
                <span>Please select your file: </span>
                <button>Upload</button>
                <div class="clear"></div>
            </div>
        </div>
        <div id="content" class="row">
            <ul class="list listing01">
                <li>
                    <div class="row">
                        <div class="in-block">
                            <a href="#"><span style=" white-space: nowrap; " class="folder01"><%=Root%> &nbsp;></span></a>
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

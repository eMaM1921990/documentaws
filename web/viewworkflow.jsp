

<%@page import="utils.CssClass"%>
<%@page import="WSpatern.GetAllWorkflow"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="WSpatern.ValidTokenWS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CssClass css=new CssClass();
    ValidTokenWS valid = new ValidTokenWS();
    GetAllWorkflow get_w=new GetAllWorkflow();
    List<String> w_flowid=new ArrayList<String>();
    List<String> w_flowname=new ArrayList<String>();
    session = request.getSession();
    bean.LoginBeans login = (bean.LoginBeans) session.getAttribute("loginsession");

    if (login.getToken() != null || !login.getToken().isEmpty()) {
        valid.TokenStats(login.getToken());

        if (valid.valid == true) {
            get_w.getWorkFlow(login.getToken(), login.getStepType());
            w_flowid=get_w.w_flowid;
            w_flowname=get_w.w_flowname;
                    
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
                    <div class="in-block actions float-l" id="test">Account Actions</div>
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
                            <a href="#"><span class="folder01"> &nbsp;></span></a>
                        </div>
                    </div>
                </li>
                <% for(int i=0;i<w_flowid.size();i++){%>
                <li>
                    <div class="row">
                        <div class="in-block float-l">
                            <a href="getWorkflowDetails?id=<%=w_flowid.get(i)%>"><span class="<%=css.getCssClass(w_flowname.get(i).substring(w_flowname.get(i).lastIndexOf(".") + 1, w_flowname.get(i).length()))%> "><%=w_flowname.get(i)%></span></a>
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
<%-- 
    Document   : workflow
    Created on : Nov 26, 2014, 10:11:22 PM
    Author     : emam
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="WSpatern.WorkFlow"%>
<%@page import="WSpatern.ValidTokenWS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    ValidTokenWS valid = new ValidTokenWS();
    WorkFlow flow = new WorkFlow();
    List<String> flowid = new ArrayList<String>();
    List<String> flowname = new ArrayList<String>();
    bean.LoginBeans login = null;
    if (session.getAttribute("loginsession") != null) {
        session = request.getSession();
        login = (bean.LoginBeans) session.getAttribute("loginsession");
        valid.TokenStats(login.getToken());
        if (valid.valid == true) {
            flow.getWorkFlow(login.getToken(), request.getParameter("id"));
            flowid = flow.Flowid;
            flowname = flow.Flowname;
        }

    } else {

    }

%>

<html class=" js csstransitions"><head>
        <title>Workflow</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/mob_files.css" rel="stylesheet">
        <link href="css/mob_folders.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css1/normalize.css">
        <link rel="stylesheet" type="text/css" href="css1/main.css">
        <link rel="stylesheet" type="text/css" href="css1/style3.css">
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
                    <form>



                        <div class="infoMenu"> 
                            <span></span><span><%=request.getParameter("name")%></span>

                        </div> <!-- .infoMenu -->

                        <div class="form_box">
                            <ul>
                                <li> <span class="float-l">Workflow</span>	<select>
                                        <%for (int i = 0; i < flowid.size(); i++) {%>
                                        <option value="<%=flowid.get(i)%>"><%=flowname.get(i)%></option>
                                        <%}%>
                                    </select></li>
                                <li> <span class="float-l">Comments</span>	<span class="pdr"><textarea name="Comments" cols="" rows="" placeholder="Comments"></textarea></span></li>
                                <li> <span class="float-l">&nbsp;</span> <span class="pdr"><input name="submit" value="Submit" type="submit"></span></li>

                            </ul>
                        </div>
                    </form>
                </div> <!-- fixed-div -->

            </div> <!-- .fileInfo --> 





        </div>

                                        <jsp:include page="footer_segment.jsp"/>
    </body></html>

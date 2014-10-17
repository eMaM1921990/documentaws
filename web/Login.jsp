<%-- 
    Document   : Login
    Created on : Oct 9, 2014, 4:29:37 PM
    Author     : emam
--%>

<%@page import="java.net.URLDecoder"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%


 String userId="";
    String pass="";
    /*
    Cookie[] cookies = request.getCookies();     // request is an instance of type 
    //HttpServletRequest
    boolean foundCookie = false;
    String userId="";
    String pass="";
    for (int i = 0; i < cookies.length; i++) {
        Cookie c = cookies[i];
        if (c.getName().equals("username")) {
            userId = c.getValue();
            foundCookie = true;
        }

        if (c.getName().equals("pass")) {
            pass =  c.getValue();
            foundCookie = true;
        }
    }*/
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Idocumenta</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body class="bg-col01">
        <div class="row bg-col02 brder-bottom01">
            <div class="container">
                <div class="logo-bx">
                    <img src="img/Idocumenta_logo.jpg">
                </div>
            </div>
        </div>
        <div class="row bg-col03">
            <h6 class="img-heading brder-top01 brder-bottom02 center-text"><img src="img/lock.jpg"><span> Log in</span></h6>
        </div>

        <div class="row top-margin50">
            <div class="container">	
                <div class="heading-bx01 center-text"> <div class="line01"></div><span>Introduceti datele pentru autentificare</span></div>
                <form action="LoginServ" method="post">
                    <div class="md400-box01">
                        <div class="row">
                            <p class="top-margin32"><input class="username01 input" type="text" name="username" placeholder="Username" value="<%=userId%>"></p>
                        </div>
                        <div class="row">
                            <p class="top-margin26"><input class="password01 input" type="password" name="password" placeholder="Password" value="<%=pass%>"></p>
                        </div>
                        <div class="row">
                            
                            <p class="top-margin26"> <label><input class="" type="checkbox" name="remmber" value="on"/> Keep me logged in</label></p>
                        </div>
                        <div class="row">
                            
                            <p class="top-margin26 center-text"><input class="login-btn01 trans01" type="submit" value="Login"></p>
                        </div>

                    </div>
                </form>
            </div>
        </div>

        <div class="row footer brder-top02 bg-col02">
            <div class="container center-text copyright">
                <p class="copy">© 2004-20014 Infrasoft</p>
                <p><a>About</a> | <a>Support</a> | <a>Legal</a></p>
            </div>
        </div>

    </body>
</html>

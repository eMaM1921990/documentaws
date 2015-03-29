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







                $(".accountw").click(function()
                {
                    var X = $(this).attr('id');

                    if (X == 1)
                    {
                        $(".submenuw").hide();
                        $(this).attr('id', '0');
                    }
                    else
                    {

                        $(".submenuw").show();
                        $(this).attr('id', '1');
                    }

                });

                //Mouseup textarea false
                $(".submenuw").mouseup(function()
                {
                    return false
                });
                $(".accountw").mouseup(function()
                {
                    return false
                });


                //Textarea without editing.
                $(document).mouseup(function()
                {
                    $(".submenuw").hide();
                    $(".accountw").attr('id', '');
                });





                $(".accounth").click(function()
                {
                    var X = $(this).attr('id');

                    if (X == 1)
                    {
                        $(".submenuh").hide();
                        $(this).attr('id', '0');
                    }
                    else
                    {

                        $(".submenuh").show();
                        $(this).attr('id', '1');
                    }

                });

                //Mouseup textarea false
                $(".submenuh").mouseup(function()
                {
                    return false
                });
                $(".accounth").mouseup(function()
                {
                    return false
                });


                //Textarea without editing.
                $(document).mouseup(function()
                {
                    $(".submenuh").hide();
                    $(".accounth").attr('id', '');
                });

                $(".workflowitems").hide();

                $(".workflowparent").click(function(event) {
                    event.preventDefault();

                    $('.workflowitems').slideToggle("slow");

                });

                $(".workflowhitems").hide();

                $(".workflowhparent").click(function(event) {
                    event.preventDefault();

                    $('.workflowhitems').slideToggle("slow");

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
                z-index: 9999;
                width: 220px;
                display: none;
                margin-left: 10px;
                padding: 40px 0 5px;
                border-radius: 6px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.45);
            }

            div.submenuw
            {
                position: absolute;
                color:#000000;
                top: -12px;
                left: -10px;
                z-index: 99999;
                width: 220px;
                display: none;
                margin-left: 10px;
                padding: 40px 0 5px;
                border-radius: 6px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.45);
            }


            div.submenuh
            {
                position: absolute;
                color:#000000;
                top: -12px;
                left: -10px;
                z-index: 999999;
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


            a.accountw {
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


            a.accounth {
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

            ul.workflowhitems li, ul.workflowitems li {
                list-style-type: square;
                display: list-item;
                padding: 0;
                margin: 0;
                line-height: initial;
                margin-left: 35px;
                height: 25px;
                vertical-align: middle;
                font-size: 16px;
                cursor: pointer;
            }
        </style>
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
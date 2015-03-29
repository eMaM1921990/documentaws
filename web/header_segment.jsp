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
            
            
            
             .chatdiv {
                width: 95%;
                margin: 0 auto;
            }

            li.message {
                background: url(images/messageicon.PNG) no-repeat 5px 5px;    margin-top: 0.731em;    border-top: none;    padding-top: 0.654em;    padding-bottom: 0.731em;    padding-left: 3em;    padding-right: 1.462em;    position: relative;    background-color: white;    border-color: #e4e4e4;    border-style: solid;    border-width: 1px 0 0 0;    list-style: none;    color: #333333;    box-sizing: border-box;    -webkit-transition: background-color 0.5s ease-out;    -moz-transition: background-color 0.5s ease-out;    -o-transition: background-color 0.5s ease-out;    transition: background-color 0.5s ease-out;    line-height: 1.462em;    -moz-box-sizing: border-box;
            }

            .dms_section_title_side_colaborare {
                /* width: 7em; */    margin-right: 1em;    float: left;    text-align: right;    font-weight: 600;    overflow: hidden;
            }

            time.dms_datetime_label {
                visibility: visible;    border-radius: 2px;    height: 10.5px;    overflow: visible;    position: absolute;    right: 1.5em;    bottom: 100%;    margin: 0;    padding: 0 5px;    background-color: inherit;    border: 0;    font-size: 11px;
            }

            .dms_section_text {
                position: relative;    overflow: hidden;    word-wrap: break-word;    min-height: 1.462em;
            }

            input#textarea_mesaj_colaborare {
                -webkit-box-shadow: 0 1px 0 #fff,0 2px 1px rgba(0,0,0,0.1) inset;    -moz-box-shadow: 0 1px 0 #fff,0 2px 1px rgba(0,0,0,0.1) inset;    box-shadow: 0 1px 0 #fff,0 2px 1px rgba(0,0,0,0.1) inset;    height: 37px;    margin: 0;    vertical-align: top;    top: 0;    color: #333333;    border-width: 0.077em;    border-style: solid;    position: relative;    overflow: hidden;    padding: 0.654em;    -moz-box-sizing: border-box;    box-sizing: border-box;    /* margin-right: 5px; */    margin-left: 7px;    width: 69%;    background-color: white;    border-color: silver;    border-radius: 2px;    left: 0;    font-family: Helvetica, "Segoe UI", Arial, sans-serif !important;    font-size: 13px !important;    outline: 0;    line-height: inherit;    resize: none;    overflow-y: auto;
            }

            input#button_mesaj_colaborare {
                display: inline-block;    padding: 6px 12px;    margin-right: 5px;    float: right;    margin-bottom: 0;    font-size: 14px;    background-color: #2471a0;    color: #FFF!important;    font-weight: 400;    line-height: 1.42857143;    text-align: center;    white-space: nowrap;    vertical-align: middle;    -ms-touch-action: manipulation;    touch-action: manipulation;    cursor: pointer;    -webkit-user-select: none;    -moz-user-select: none;    -ms-user-select: none;    user-select: none;    background-image: none;    border: 1px solid transparent;    border-radius: 4px;
            }
        </style>
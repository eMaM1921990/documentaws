<div class="row footer brder-top02 bg-col02">
    <div class="container center-text copyright">
        <p class="copy">&copy 2004-2014 Infrasoft</p>
        <p><a>About</a> | <a>Support</a> | <a>Legal</a></p>
    </div>
</div>



        <div id="previewOverlay" >
            <div id="previewPopup"><div style="width: 100%; height: 40px; display: block; float: left; position: relative;"><div id="previewPopupX">x</div></div>
                <div id="review"></div>

            </div>
        </div>  

        <div id="workflowOverlay">
            <div id="workflowPopup">
                 <div style="width: 100%; height: 40px; display: block; float: left; position: relative;">
                    <div id="workflowPopupX">x</div> </div>
                <div id="workflow"></div>
            </div>
        </div>
        <div class="foverlay overlay-slidedown">
            <button type="button" class="foverlay-close">Close</button>

            <nav>
                <h5>Select what you need</h5>
                <ul>
                    




                    <li class="download" onClick="download()"><a style="cursor: pointer">Download</a></li>
                    <li class="prop" ><a style="cursor: pointer" href="#" id="prop">Properties</a></li>
                    <li class="preview" onClick="preview()" id="previewTriger" ><a style="cursor: pointer">Preview</a></li>
                    <li class="workflow" id="workflowTriger"><a href="#">Send to Workflow</a></li>
                    
                </ul>
            </nav>
        </div>

 <div class="overlay overlay-slidedown">
            <button type="button" class="overlay-close">Close</button>
            <nav>
                <ul><div class="dropdown">
                        <a class="account" >
                            <span>Profile</span>  </a>
                        <div class="submenu" style="display: none; ">
                            <ul class="root">
                                <li>
                                    <a href="#" >Edit Account</a>      </li>
                                <li>
                                    <a href="#" >Change Password</a>      </li>

                            </ul>
                        </div>
                    </div>
                    <li class="seprator"></li>
                    <li><a href="mainpage.jsp"><i class="fa fa-file"></i>My Documenta</a></li>
                    <li class="workflowparent"><a href="#"><i class="fa fa-spinner"></i>Workflows</a>

                    </li>
                    <ul  class="workflowitems" style="display:none;">
                        <li>
                            <a onclick="getWorkFlow('INFORMARE')">Information</a>      </li>
                        <li>
                            <a onclick="getWorkFlow('APROBARE')" >Approval</a>      </li>
                        <li>
                            <a onclick="getWorkFlow('ATRIBUIRE')" >Allocated</a>      </li>
                        <li>
                            <a onclick="getWorkFlow('RESPINS')">Rejected</a>      </li>

                        <li>
                            <a onclick="getWorkFlow('DELEGARE')" >Delegation of responsibility</a>      </li>
                    </ul>

                    <li class="workflowhparent"><a href="#"><i class="fa fa-spinner"></i>Workflows History</a>

                    </li>
                    <ul  class="workflowhitems" style="display:none;">
                        <li>
                            <a onclick="gethWorkFlow('INFORMARE')">Information</a>      </li>
                        <li>
                            <a onclick="gethWorkFlow('APROBARE')" >Approval</a>      </li>
                        <li>
                            <a onclick="gethWorkFlow('ATRIBUIRE')" >Allocated</a>      </li>
                        <li>
                            <a onclick="gethWorkFlow('RESPINS')">Rejected</a>      </li>

                        <li>
                            <a onclick="gethWorkFlow('DELEGARE')" >Delegation of responsibility</a>      </li>
                    </ul>

                    <li><a href="#"><i class="fa fa-search"></i>Recent</a></li>
                    <li><a href="#"><i class="fa fa-star"></i>Favoraties</a></li>
                    <li class="seprator"></li>
                    <li><a href="Logout">Sign Out</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of service</a></li>
                    <li><a href="#">Desktop version</a></li>
                </ul>
            </nav>
        </div>

  
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="js/mousetrap.min.js"></script>
        <script src="js/modernizr.custom.js"></script>
        <script src="js/classie.js"></script>
        <script src="js/cmdscriptmin.js"></script>
        <script src="js/custome.js"></script>
        <script type="text/javascript" src="js/popups.js"></script>

        
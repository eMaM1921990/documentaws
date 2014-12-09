// Author : https://www.freelancer.in/u/veteranwebmaster.html

document.onload = mainfunc();

function mainfunc() {
	
	// Target this class .info01 to open the popup
	var deviceWidth = document.body.offsetWidth;
    
    var arrowback = document.getElementById('arrowback');
    var actionsMenu = document.getElementById('actionsMenu');
    actionsMenu.style.display = "none";
    var actionsButton = document.getElementById('actionsButton');
    var actionsButtonP = document.getElementById('actionsButtonP');

    actionsButtonP.onclick = function(){
        if (actionsMenu.style.display == "none") {
        actionsMenu.style.display = "block";
        }else{
            actionsMenu.style.display = "none";
        }
    }
    /*
var triger = document.getElementById('triggerInfoOverlay');
    triger.onclick = function(arg){
        var isItTriger = arg.target.getAttribute("data-info");
        if(isItTriger != null){
            gtOverlay.style.display = "block";
        }        
    
    		
    		}
    } // triger function ends  
  
     
if(deviceWidth > 1024){
                actionsButton.onclick = function(){
                    if(actionsMenu.style.display == "none"){                
                        actionsMenu.style.display = "block";
                }else{
                        actionsMenu.style.display = "none";
                }
                gtOverlay.onclick = function(arg){
                    console.log(arg.target);
                    if(arg.target.getAttribute("id") != "actionsButton"){
                    actionsMenu.style.display = "none";}
                }   
            }
        }else{
                actionsButton.onmouseover = function(){
                actionsMenu.style.display = "block";
                }
                gtOverlay.onclick = function(arg){
                    console.log(arg.target.getAttribute("id"));
                    if(arg.target.getAttribute("id") != "actionsButton"&&"actionsMenu"){
                    actionsMenu.style.display = "none";}
                }   
                /*actionsMenu.onmouseout = function(){
                    actionsMenu.style.display = "none";
                }
                
    */
    
		 document.body.onclick = function(arg){
                    if(arg.target.getAttribute("id") != "actionsButton"){
                    actionsMenu.style.display = "none";}

                }  

    arrowback.onclick = function(){
    } 
		

    var generalData = document.getElementById("generalData");
    var whohasaccesData = document.getElementById("whohasaccesData");
    var metadata = document.getElementById("metadata");
    var generalDataTriger = document.getElementById("generalDataTriger");
    var whohasaccesDataTriger = document.getElementById("whohasaccesDataTriger");
    var metadataTriger = document.getElementById("metadataTriger");
    
    whohasaccesData.style.display="none";
    metadata.style.display="none";

    generalDataTriger.onclick = function(){
        console.log("generalDataTriger");
        generalData.style.display = "block";
        whohasaccesData.style.display = "none";
        metadata.style.display = "none";
        generalDataTriger.style.color = "#fff";
        generalDataTriger.style.background = "#2DBAEF";
        whohasaccesDataTriger.style.color = "#fff";
        whohasaccesDataTriger.style.background = "#000";
        metadataTriger.style.color = "#fff";
        metadataTriger.style.background = "#000";
    }
    whohasaccesDataTriger.onclick = function(){
        console.log("whohasaccesDataTriger");
        generalData.style.display = "none";
        whohasaccesData.style.display = "block";
        metadata.style.display = "none";
        generalDataTriger.style.color = "#fff";
        generalDataTriger.style.background = "#000";
        whohasaccesDataTriger.style.color = "#fff";
        whohasaccesDataTriger.style.background = "#2DBAEF";
        metadataTriger.style.color = "#fff";
        metadataTriger.style.background = "#000";
    } 
    metadataTriger.onclick = function(){
        console.log("metadataTriger");
        generalData.style.display = "none";
        whohasaccesData.style.display = "none";
        metadata.style.display = "block";
        generalDataTriger.style.color = "#fff";
        generalDataTriger.style.background = "#000";
        whohasaccesDataTriger.style.color = "#fff";
        whohasaccesDataTriger.style.background = "#000";
        metadataTriger.style.color = "#fff";
        metadataTriger.style.background = "#2DBAEF";
    }  

    var previewOverlay = document.getElementById("previewOverlay");
    var previewTriger = document.getElementById("previewTriger");
    var previewPopup = document.getElementById("previewPopup");
    var previewPopupX = document.getElementById("previewPopupX");

    previewOverlay.style.display = "none";

    previewTriger.onclick = function(){
        previewOverlay.style.display ="block";
    }

    previewPopupX.onclick = function(){
        previewOverlay.style.display = "none";
    }
	
	
	var workflowOverlay = document.getElementById("workflowOverlay");
    var workflowTriger = document.getElementById("workflowTriger");
    var workflowPopup = document.getElementById("workflowPopup");
    var workflowPopupX = document.getElementById("workflowPopupX");

    workflowOverlay.style.display = "none";

    workflowTriger.onclick = function(){
        workflowOverlay.style.display ="block";
    }

    workflowPopupX.onclick = function(){
        workflowOverlay.style.display = "none";
    }

} // Main Finction Ends
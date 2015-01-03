// JavaScript Document

    var previewOverlay = document.getElementById("previewOverlay");
    var previewTriger = document.getElementById("previewTriger");
    var previewPopup = document.getElementById("previewPopup");
    var previewPopupX = document.getElementById("previewPopupX");

    previewOverlay.style.display = "none";

    previewTriger.onclick = function(){
        previewOverlay.style.display ="block";
        preview();
    };

    previewPopupX.onclick = function(){
        previewOverlay.style.display = "none";
    };
	
    var workflowOverlay = document.getElementById("workflowOverlay");
    var workflowTriger = document.getElementById("workflowTriger");
    var workflowPopup = document.getElementById("workflowPopup");
    var workflowPopupX = document.getElementById("workflowPopupX");

    workflowOverlay.style.display = "none";

    workflowTriger.onclick = function(){
       
        workflowOverlay.style.display ="block";
         workflow();
        
    };

    workflowPopupX.onclick = function(){
        workflowOverlay.style.display = "none";
    };
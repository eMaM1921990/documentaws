/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function goBack() {
    window.history.back();
}


$(document).ready(function() {

    $('#send').click(function() {
        
        var id = $('#workflw').val();
        var comment=$('#comments').val();
        var file=$('#fileid').val();
        $.get('SendWorkFlow', {id: id,com:comment,fil:file}, function(responseText) {
            alert('dsdsd');
          
            document.getElementById("workflowPopupX").click();
        });
    });
    
    $('#search_btn').click(function (){
       var item=$('#searchitem').val();
       var dirid=$('#dirid').val();
       $.get('search_result',{name:item,dirid:dirid},function(responseText){
           window.open(xmlHttpdownload.responseText,"_self");
       });
    
    });

});



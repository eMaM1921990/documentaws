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
            $('#menucatid').hide();
        });
    });

});
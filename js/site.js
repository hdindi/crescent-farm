/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$( document ).ready(function() {
$(function() {
   $('#upload_file').submit(function(e) {
      e.preventDefault();
      $.ajaxFileUpload({
         url         :'./upload/upload_file/', 
         secureuri      :false,
         fileElementId  :'userfile',
         dataType    : 'json',
         data        : {
            'title'           : $('#title').val(),
            'patient_id'           : $('#patient_id').val()
         },
         success  : function (data, status)
         {
            if(data.status != 'error')
            {
               $('#files').html('<p>Reloading files...</p>');
               refresh_files();
               $('#title').val('');
               $('#patient_id').val('');
            }
            alert(data.msg);
         }
      });
      return false;
   });
});
  setInterval(function refresh_files()
{
   $.get('./upload/files/')
   .success(function (data){
      $('#files').html(data);
   });
},5000
);

$('.delete_file_link').live('click', function(e) {
   e.preventDefault();
   if (confirm('Are you sure you want to delete this file?'))
   {
      var link = $(this);
      $.ajax({
         url         : '<?php echo base_url()?>/upload/delete_file/' + link.data('file_id'),
         dataType : 'json',
         success     : function (data)
         {
            files = $('#files');
            if (data.status === "success")
            {
               link.parents('li').fadeOut('fast', function() {
                  $(this).remove();
                  if (files.find('li').length == 0)
                  {
                     files.html('<p>No Files Uploaded</p>');
                  }
               });
            }
            else
            {
               alert(data.msg);
            }
         }
      });
   }
});
});
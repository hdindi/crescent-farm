// JavaScript Document
//Wait until the DOM is fully loaded
$(document).ready(function(){
    //Listen for the form submit
    $('#registerModalform').submit(save);
});
 
//The function that handles the process
function registerUser(event)
{
    //Stop the form from submitting
    event.preventDefault();
 
    //Collect our form data.
    var form_data = {
        Weight : $("[name='Weight']").val(),
        BP : $("[name='BP']").val(),
        Temperature : $("[name='Temperature']").val(),
        Height : $("[name='Height']").val(),
        OCS: $("[name='OCS']").val()
    };
 
    //Begin the ajax call
    $.ajax({
            url: "controller/modal",
            type: "POST",     
            data: form_data,
            dataType: "json",
            cache: false,
              
            success: function (json) {             
                if (json.error==1)
                {
                    //Show the user the errors.
                   $('#registerModalerror').html(json.message);
                } else {
                    //Hide our form
                    $('#registerModalform').slideUp();
                    //Show the success message
                    $('#registerModalerror').html(json.message).show();
                }             
            }
        });
}
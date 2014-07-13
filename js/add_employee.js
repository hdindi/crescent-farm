var readUrl   = 'administrator/admin/get_employee',
    updateUrl = 'administrator/admin/update_employee',
    delUrl    = 'administrator/admin/delete_employee',
    delHref,
    updateHref,
    updateId;


$( function() {
    
    $( '#tabs' ).tabs({
        fx: { height: 'toggle', opacity: 'toggle' }
    });
    
    readUsers();
    
    $( '#msgDialog' ).dialog({
        autoOpen: false,
        
        buttons: {
            'Ok': function() {
                $( this ).dialog( 'close' );
            }
        }
    });
    
    $( '#updateDialog' ).dialog({
        autoOpen: false,
        buttons: {
            'Return': function() {
                $( '#ajaxLoadAni' ).fadeIn( 'slow' );
                $( this ).dialog( 'close' );
                
                $.ajax({
                    url: updateHref,
                    type: 'POST',
                    data: $( '#updateDialog form' ).serialize(),
                    
                    success: function( response ) {
                        
                        $( '#msgDialog > p' ).html( response );
                        $( '#msgDialog' ).dialog( 'option', 'title', 'Success' ).dialog( 'open' );
                        
                        $( '#ajaxLoadAni' ).fadeOut( 'slow' );
                        
                        //--- update row in table with new values ---
                        var transaction_type = $( 'tr#' + updateId + ' td' )[ 1 ];
                        var commodity_name = $( 'tr#' + updateId + ' td' )[ 2 ];
                        var expiry_date = $( 'tr#' + updateId + ' td' )[ 3 ];
						var batch_number = $('tr#' + updateId + 'td' )[4];
						var total_quantity = $('tr#' + updateId + 'td' )[5];
						var request_order_id = $('tr#' + updateId + 'td' )[6];
                                                var employee_type = $('tr#' + updateId + 'td' )[7];
						var employee_name = $('tr#' + updateId + 'td' )[8];
                        
                        $( transaction_type ).html( $( '#transaction_type' ).val() );
                        $( commodity_name ).html( $( '#commodity_name' ).val() );
                        $( expiry_date ).html( $( '#expiry_date' ).val() );
                        $( batch_number ).html( $( '#batch_number' ).val() );
                        $( total_quantity ).html( $( '#total_quantity' ).val() );
                        $( request_order_id ).html( $( '#request_order_id' ).val() ); 
                        $( employee_type ).html( $( '#employee_type' ).val() );
                        $( employee_name ).html( $( '#employee_name' ).val() );
                       
                        //--- clear form ---
                        $( '#updateDialog form input' ).val( '' );
                        
                    } //end success
                    
                }); //end ajax()
            },
            
            'Cancel': function() {
                $( this ).dialog( 'close' );
            }
        },
        width: '350px'
    }); //end update dialog
    
    $( '#delConfDialog' ).dialog({
        autoOpen: false,
        
        buttons: {
            'No': function() {
                $( this ).dialog( 'close' );
            },
            
            'Yes': function() {
                //display ajax loader animation here...
                $( '#ajaxLoadAni' ).fadeIn( 'slow' );
                
                $( this ).dialog( 'close' );
                
                $.ajax({
                    url: delHref,
                    
                    success: function( response ) {
                        //hide ajax loader animation here...
                        $( '#ajaxLoadAni' ).fadeOut( 'slow' );
                        
                        $( '#msgDialog > p' ).html( response );
                        $( '#msgDialog' ).dialog( 'option', 'title', 'Success' ).dialog( 'open' );
                        
                        $( 'a[href=' + delHref + ']' ).parents( 'tr' )
                        .fadeOut( 'slow', function() {
                            $( this ).remove();
                        });
                        
                    } //end success
                });
                
            } //end Yes
            
        } //end buttons
        
    }); //end dialog
    
    $( '#records' ).delegate( 'a.updateBtn', 'click', function() {
        updateHref = $( this ).attr( 'href' );
        updateId = $( this ).parents( 'tr' ).attr( "id" );
        
        $( '#ajaxLoadAni' ).fadeIn( 'slow' );
        
        $.ajax({
            url: 'user_transactions/return_details/' + updateId,
            dataType: 'json',
            
            success: function(response) {
                console.log(response);
                $( '#transaction_type' ).val(response[0].transaction_type);
                //alert(response[0].transaction_type);
                $( '#commodity_name' ).val(response[0].commodity_name);
				$( '#batch_number' ).val(response[0].batch_number);
                $( '#expiry_date' ).val(response[0].expiry_date);
				$( '#total_qantity').val(response[0].total_quantity)
                $( '#request_order_id' ).val(response[0].request_order_id);
                $( '#department').val(response[0].type)
                $( '#employee_name' ).val(response[0].sname);
                $( '#ajaxLoadAni' ).fadeOut( 'slow' );
                
                //--- assign id to hidden field ---
                $( '#userId' ).val( updateId );
                
                $( '#updateDialog' ).dialog( 'open' );
            }
        });
        
        return false;
    }); //end update delegate
    
    $( '#records' ).delegate( 'a.deleteBtn', 'click', function() {
        delHref = $( this ).attr( 'href' );
        
        $( '#delConfDialog' ).dialog( 'open' );
        
        return false;
    
    }); //end delete delegate
    
    
    // --- Create Record with Validation ---
    $( '#create form' ).validate({
        rules: {
            cName: { required: true },
            cSurname: { required: true },
			cAddress: { required: true },
			cEmployeetype: { required: true },
			cNhifno: { required: true}
            //cDate: {required: true, date: true }
        },
        
        
        //uncomment this block of code if you want to display custom messages
        messages: {
            cName: { required: "Name is required." },
            cSurname: {
                required: "surName is required.",
               
            },
			cAddress: {
				required: "Address of the employee is required."
			},
			cEmployeetype: {
				required: "employee type is required"
			}
        },
        
        
        submitHandler: function( form ) {
            $( '#ajaxLoadAni' ).fadeIn( 'slow' );
            
            $.ajax({
                url: 'user_transactions/get_employee',
                type: 'POST',
                data: $( form ).serialize(),
                
                success: function( response ) {
                    $( '#msgDialog > p' ).html( response );
                    $( '#msgDialog' ).dialog( 'option', 'title', 'Success' ).dialog( 'open' );
                    
                    //clear all input fields in create form
                    $( 'input', this ).val( '' );
                    
                    //refresh list of users by reading it
                    readUsers();
                    
                    //open Read tab
                    $( '#tabs' ).tabs( 'select', 0 );
                }
            });
            
            return false;
        }
    });
    
}); //end document ready


function readUsers() {
    //display ajax loader animation
    $( '#ajaxLoadAni' ).fadeIn( 'slow' );
    
    $.ajax({
        url: 'administrator/admin/get_employee',
        dataType: 'json',
        success: function( response ) {
            
            for( var i in response ) {
                //alert(response[i].employee_id)
                response[ i ].updateLink = updateUrl + '/' + response[ i ].employee_id;
                response[ i ].deleteLink = delUrl + '/' + response[ i ].employee_id;
            }
            //  console.log(response)
            //clear old rows
            $( '#records' ).html( '' );
            
            //append new rows
            $( '#readTemplate' ).render( response ).appendTo( "#records" );
            
            //hide ajax loader animation here...
            $( '#ajaxLoadAni' ).fadeOut( 'slow' );
        }
    });
} // end readrequest
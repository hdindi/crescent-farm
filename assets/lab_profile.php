<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Lab tech</title>
<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->


<!--<style>
body { font-size: 62.5%; }
label, input { display:block; }
input.text { margin-bottom:12px; width:95%; padding: .4em; }
fieldset { padding:0; border:0; margin-top:25px; }
h1 { font-size: 1.2em; margin: .6em 0; }
div#users-contain { width: 350px; margin: 20px 0; }
div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
.ui-dialog .ui-state-error { padding: .3em; }
.validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>!-->


<script>
$(function() {
var weight = $( "#Weight" ),
BP = $( "#BP" ),
temperature = $( "#temperature" ),
BMI= $( "#BMI" ),
height = $( "#Height" ),
ocs= $( "#OCS" ),
allFields = $( [] ).add( weight ).add( BP ).add( temperature ).add( BMI ).add( height ).add( ocs ),
tips = $( ".validateTips" );
function updateTips( t ) {
tips
.text( t )
.addClass( "ui-state-highlight" );
setTimeout(function() {
tips.removeClass( "ui-state-highlight", 1500 );
}, 500 );
}

$( "#dialog-form" ).dialog({
autoOpen: false,
height: 500,
width: 600,
modal: true,
buttons: {

Cancel: function() {
$( this ).dialog( "close" );
}
},
close: function() {
allFields.val( "" ).removeClass( "ui-state-error" );
}
});
$( "#create-user" )
.button()
.click(function() {
$( "#dialog-form" ).dialog( "open" );
});
});

</script>


 <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
    </style>

    <link rel="stylesheet" href="/resources/demos/style.css" />
    <link href="http://192.168.0.109/take/assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://192.168.0.109/take/assets/css/bootstrap.min.css" media="screen"/>
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="http://192.168.0.109/take/assets/chosen-master/chosen/chosen.css" />
       
       <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
       <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    
    
</head>

<body>

      <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">

             <a class="brand" href="#">CAREtech</a>
          <div class="nav-collapse collapse">
                    <p class="navbar-text pull-right">
                      Logged in as <a href="#" class="navbar-link">Username</a>
                    </p>
          </div>

                              <ul class="nav">
                              <li><a href='<?php echo site_url('lab/patient_management')?>'>Patients</a></li>
                              <li><a href='<?php echo site_url('lab/lab_tests')?>'>lab Check up</a></li>
                              <li><a href='<?php echo site_url('lab/tests')?>'>Tests</a></li>
                              <li><a href='<?php echo site_url('home/do_logout')?>'> Logout</a></li>
                              </ul>
         </div>  
      </div>



     <div class="container-fluid" > 
         <div class="row-fluid">

                  <div class="span3">
                       <div class="well sidebar-nav">
                               <ul class="nav nav-list">
                                     <li class="nav-header">Active patients</li>
              
                                          <?php foreach($patients as $active){?>
          
                                          <p> 
                                          <?php echo anchor('lab_profile/details/'.$active['id']."/".$active['patientid'],$active['fname']." ".$active['lname']." ".$active['sname'])."</br>"; ?>
                                          <?php }
                                          ?>
                                          </p>

                              </ul>
                       </div><!--/.well -->
        </div><!--/span-->





                        <div id="dialog-form" title="Create new user">
<p class="validateTips">All form fields are required.</p>
<?php if($this->uri->segment(3)){?>
<form action="<?php echo base_url()?>lab_profile/add_results" method="post">
<input type="hidden" name="visitid" value="<?php echo $this->uri->segment(3)?>">
<label for="lab_results">Lab Results</label>
<textarea rows="5" cols="70" name="lab_results" id="lab_results"></textarea>
<input type="submit" name="save" value="Save" class="save">
</form>
</div>
   <?php } ?> 
       

               <!-- <div class="span9 offset4">
               <div class="hero-unit">
               <p>Visit Information</p>
               </div>
               </div>-->
        
 
                 <div class="span9">
                     <div class="hero-unit">
           <p><b>Bio Data</b></p>
           <?php
		   if($this->uri->segment(3))
		   {
		   foreach($bio_data as $visit_info){
			   
			   ?>
         <?php
             $dob =  $visit_info['dob'];
            $age = date_diff(date_create($dob), date_create('now'))->y;  
             //replace  $visit_info['dob'] with $age
            ?>
               <table>
            <tr>
            <td>Patient ID: </td>
			<td><?php echo $visit_info['id']."<br>"; ?></td>
             <td>Patient Name:</td>
            <td><?php echo $visit_info['fname']." ".$visit_info['lname']." ".$visit_info['sname'];?></td>
			</tr>
            <tr>
            <td>National ID:</td>
            <td><?php echo $visit_info['nationalid'];?></td>
            <td>Phone Number:</td>
            <td><?php echo $visit_info['phone'];?></td>
            </tr>
            <tr>
            <td>Age:</td>
            <td><?php echo $age;?></td>
            </tr>
           <tr>
            <td>Gender:</td>
            <td><?php echo $visit_info['sex'];?></td>
            </tr>
            <tr>
            <td>City:</td>
            <td><?php echo $visit_info['city'];?></td>
            </tr>
             </table>

           <?php }
		   ?>
          
<?php } ?>
         </div>
                 </div>



              <div class="span9 offset3">
          <div class="hero-unit">
            <p>Checkup Information</p>
           
           <table>
          <?php if($this->uri->segment(4)){?>
            <?php foreach($details as $checkup){ ?>
            <tr>
            <td>Lab Tests:</td>
            <td><?php $labs=json_decode($checkup['lab_tests']);
			foreach($labs as $tests){
				echo $tests. " ";
				}?></td>
            </tr>
            <tr>
            <td>Provisional Diagnosis:</td>
            <td><?php echo $checkup['provisional']?></td>
            </tr>
            
     <?php }
		  }?>
     </table>
          </div>
              </div>


              <div class="span9 offset3">
          <div class="hero-unit">
           <p>Test Results</p>
          
         
          <button id="create-user">Add Test Results</button>
          </div>
              </div>


     </div><!--/span-->
         <footer>
                  <p>&copy; CAREtech 2013</p>
         </footer>
  </div><!--container fluid-->
  
</body>
</html>

         
         
            
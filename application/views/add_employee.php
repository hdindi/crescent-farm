<?php 
$this->load->view('header');
?><div id="update_form" style="display:none !important;">
                                            
                                           
  <?php // Change the css classes to suit your needs    

$attributes = array('class' => '', 'id' => '');
echo form_open('administrator/admin/update_profile', $attributes); ?>
  <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            Personal Information
          </h2>
        </div>
      </li>
      <input type="hidden" value="<?php echo $employee_id; ?>" name="employee_id" id="employee_id" class="employee_id"/>
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="nationalid">
          National ID / Passport<span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="number" class="form-number-input  form-textbox validate[required, Numeric]" id="nationalid" name="nationalid" style="width:204px" size="23" maxlength="8" data-type="input-number" value="<?php echo $id_no; ?>" />
        </div>
      </li>
      
      
      
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="userfile">
          Image<span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
      <input type="file" name="userfile" size="20" />
</div>
      </li>
      
      
           
      
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="sname">
          Sur - name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="sname" name="sname" size="30"  value="<?php echo $l_name; ?>"/>
        </div>
      </li>
      <li class="form-line form-line-column" id="id_36">
        <label class="form-label-top" id="label_36" for="fname">
          First Name<span class="form-required">*</span>
        </label>
        <div id="cid_36" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="fname" name="fname" size="30" value="<?php echo $f_name; ?>" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_35">
        <label class="form-label-top" id="label_35" for="lname">
          Other Name<span class="form-required">*</span>
        </label>
        <div id="cid_35" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="lname" name="lname" size="30" value="<?php echo $other_name; ?>" />
        </div>
      </li>
      <li class="form-line" id="id_10">
        <label class="form-label-top" id="label_10" for="dob">
          Date Of Birth<span class="form-required">*</span>
        </label>
        <div id="cid_10" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="dob" name="dob" value="<?php echo $dob; ?>" size="20" />
        </div>
      </li>
      <li class="form-line" id="id_29">
        <label class="form-label-left" id="label_29" for="gender">
          Gender<span class="form-required">*</span>
        </label>
        <div id="cid_29" class="form-input">
          <div class="form-multiple-column">
              <span class="form-radio-item"><select name="sex"> <option  name="sex" value="<?php echo $gender; ?>"> <?php echo $gender; ?> </option> <option name="sex" value="Female">Female</option> <option name="sex" value="Male">Male</option></select>
              </span>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_37">
        <label class="form-label-left" id="label_37" for="input_37"> Marital Status </label>
        <div id="cid_37" class="form-input">
          <div class="form-multiple-column">
              
              <span class="form-radio-item"><select name="maritalstatus">
                      <option  name="maritalstatus" value="<?php echo $marital_status; ?>"> <?php echo $marital_status; ?> </option>
                      <option name="maritalstatus" value="Single">Single</option> 
                      <option name="maritalstatus" value="Married">Married</option>
                  <option name="maritalstatus" value="Divorced">Divorced</option>
                  </select>
              </span>
         
              
          </div>
        </div>
      </li>
      <li id="cid_31" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_31" class="form-header">
            Contact Information
          </h2>
        </div>
      </li>
      <li class="form-line form-line-column form-line-column-clear" id="id_11">
        <label class="form-label-top" id="label_11" for="phone"> Phone Number </label>
        <div id="cid_11" class="form-input-wide">
            <input type="text" class=" form-textbox" id="phone" name="phone" value="<?php echo $phone_no; ?>" size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_12">
        <label class="form-label-top" id="label_12" for="email"> E-mail </label>
        <div id="cid_12" class="form-input-wide">
            <input type="email" class=" form-textbox validate[Email]" id="email" name="email" value="<?php echo $email; ?>" size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="address">
        <label class="form-label-top" id="label_13" for="address"> Residence </label>
        <div id="cid_13" class="form-input-wide">
          <input type="text" class=" form-textbox" id="address" name="address" value="<?php  echo $residence; ?>"  size="30" />
        </div>
      </li>
      
      <li id="cid_32" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_32" class="form-header">
            Next Of Kin
          </h2>
        </div>
      </li>
      <li class="form-line form-line-column" id="id_34">
        <label class="form-label-top" id="label_34" for="input_34"> Kin's FIRST Name </label>
        <div id="cid_34" class="form-input-wide">
            <input type="text" class=" form-textbox" id="kinfname" name="kinfname" value="<?php echo $next_of_kin_fname; ?>" size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_34">
        <label class="form-label-top" id="label_34" for="input_34"> Kin's last Name </label>
        <div id="cid_34" class="form-input-wide">
            <input type="text" class=" form-textbox" id="kinlname" name="kinlname" value="<?php echo $next_of_kin_lname; ?>" size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_21">
        <label class="form-label-top" id="label_21" for="input_21"> Kin's Relation </label>
        <div id="cid_21" class="form-input-wide">
            <input type="text" class=" form-textbox" id="kinrelation" value="<?php echo $next_of_kin_relation; ?>" name="kinrelation" size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_22">
        <label class="form-label-top" id="label_22" for="input_22"> Kin's Phone Number </label>
        <div id="cid_22" class="form-input-wide">
            <input type="text" class=" form-textbox" id="kinphone" name="kinphone"  value="<?php echo $next_of_kin_phone_no; ?>" size="30" />
        </div>
      </li>
	  
	  
	   <li id="cid_32" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_32" class="form-header">
            Employment Information
          </h2>
        </div>
      </li>
	  <li class="form-line" id="id_38">
        <label class="form-label-left" id="label_38" for="input_38"> Employment Category </label>
        <div id="cid_38" class="form-input">
          <div id="cid_22" class="form-input-wide">
                   
		
                        
		<!-- <td>!--><select data-placeholder="Medicine Name" style="width:300px;" class="chzn-select" tabindex="6" name="employment_category" required>
                          <option value="<?php echo $department; ?>"> <?php echo $department; ?>  </option>
                          <?php foreach($departments as $department_name){?>
                          <option  value="<?php echo $department_name['department_name']?>">
                            <?php echo $department_name['department_name'] ?>
                          </option>
                          <?php //$result = $_POST['packageid'];
                          //$result_explode = explode('|', $result);
                          
                          } ?>
                        </select><!--</td>!-->
        </div>
        </div>
      </li>
      <li class="form-line form-line-column" id="id_21">
        <label class="form-label-top" id="label_21" for="input_21">Employment Class </label>
        <div id="cid_22" class="form-input-wide">
		<select class="form-dropdown validate[required]" style="width:210px" id="employment_class" name="employment_class">
                    <option value="<?php echo $global; ?>"><?php echo $global; ?>  </option>
                    <option value="Yes">Global</option>
                    <option value="No">Local</option>
              </select>
        </div>
      </li>
      <li class="form-line form-line-column form-line-column-clear" id="id_11">
        <label class="form-label-top" id="label_11" for="dept"> Department  </label>
        <div id="cid_11" class="form-input-wide">
            <input type="text" class=" form-textbox" id="dept" name="dept" value="<?php echo $dept; ?>" size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_22">
        <label class="form-label-top" id="label_22" for="input_22">Shwari Member </label>
        <div id="cid_22" class="form-input-wide">
		<select class="form-dropdown validate[required]" style="width:210px" id="package" name="package">
            // choose a member from the shawri member table in the database,
          </select>
        </div>
      </li>

     
      <li class="form-line" id="id_27">
        <div id="cid_27" class="form-input-wide">
          <div style="text-align:left" class="form-buttons-wrapper">
              <input type="submit" value="upload" />	
          </div>
        </div>
      </li>
      <li style="display:none">
        Should be Empty:
        <input type="text" name="website" value="" />
      </li>
    </ul>
  </div>
  <input type="hidden" id="simple_spc" name="simple_spc" value="31363593518559" />
  <script type="text/javascript">
  document.getElementById("si" + "mple" + "_spc").value = "31363593518559-31363593518559";
  </script>
<!--</form>-->
<?php echo form_close(); ?>

						<p class="center">
							
						</p>
						<div class="clearfix"></div>
                                        </div>


			<div>
				<ul class="breadcrumb">
					<li>
                                            <a href="<?php echo base_url(); ?>/crescenthome">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="<?php echo base_url(); ?>/crescenthome">Dashboard</a>
					</li>
				</ul>
			</div>
			<div class="sortable row-fluid">
				<a data-rel="tooltip" title="6 new members." class="well span3 top-block" href="#">
					<span class="icon32 icon-red icon-user"></span>
					<div>Total Members</div>
					<div>507</div>
					<span class="notification">6</span>
				</a>

				<a data-rel="tooltip" title="4 new pro members." class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-star-on"></span>
					<div>Pro Members</div>
					<div>228</div>
					<span class="notification green">4</span>
				</a>

				<a data-rel="tooltip" title="$34 new sales." class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-cart"></span>
					<div>Sales</div>
					<div>$13320</div>
					<span class="notification yellow">$34</span>
				</a>
				
				<a data-rel="tooltip" title="12 new messages." class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-envelope-closed"></span>
					<div>Messages</div>
					<div>25</div>
					<span class="notification red">12</span>
				</a>
			</div>
			
			<div class="row-fluid">
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-info-sign"></i> Introduction</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						
						<p class="center">
							
					<div class="well" style="margin-top: 200px;">
					
                                            
                                            
                                            
                                            
                                            
      <base href="<?php echo base_url() ?>" />

<link type="text/css" rel="stylesheet" href="<?php echo base_url(); ?>assets/css/smoothness/jquery-ui-1.8.2.custom.css" />
<link type="text/css" rel="stylesheet" href="<?php echo base_url(); ?>assets/css/styles.css" />
   <link rel="stylesheet" href="" />
  
    


            <div id="ajaxLoadAni">
    <img src="<?php echo base_url()?>assets/img/ajax-loader.gif" alt="Ajax Loading Animation" />
    <span>Loading...</span>
</div>

<div id="tabs">
    
    <ul>
        <li><a href="#read">Employee Data</a></li>
       
    </ul>
    
    <div id="read">
        <table id="records"></table>
    </div>
    
</div> <!-- end tabs -->

<!-- update form in dialog box -->
<div id="updateDialog" title="Update">
    <div>
        <form action="" method="post">
           <p>
               <label for="f_name">   Employee First Name:</label>
               <input placeholder="   " type="text" id="f_name" name="f_name" />
           </p>
           <p>
               <label for="other_name">   Other  Name:</label>
               <input placeholder="   " type="text" id="other_name" name="other_name" />
           </p>
           
           <p>
               <label for="l_name">Employee Last Name:</label>
               <input type="text" id="l_name" name="l_name" />
           </p>
		     <p>
            
               <label for="dob">Date of  Birth:</label>
               <input placeholder="  year-m-d " type="text" id="dob"  name="dob" />
               <span class="error"> Invalid Date.(mm/dd/yyyy or mm-dd-yyyy)
</span>
               
           </p>
		   <p>
               <label for="gender">Gender:</label>
               <input type="text" id="gender"   name="gender" />
           </p>
		      <p>
               <label for="marital_status">Marital Status:</label>
               <input type="text" id="marital_status"  name="marital_status" />
           </p>
           <p>
               <label for="phone_no">Phone Number :</label>
               <input type="text" id="phone_no"  name="phone_no" />
           </p>
		   <p>
               <label for="email">Email :</label>
               <input type="email" id="email"  name="email" />
           </p>
            <p>
               <label for="residence">Residence:</label>
               <input type="text" id="residence"  name="residence" />
           </p>
            <p>
               <label for="employee_name">Employment Category:</label>
               <input type="text" id="employment_category"  name="employment_category" />
           </p>
		
           	   
         <input type="hidden" id="employee_id" name="emploee_id" />
           
           <p>
               <label>&nbsp;</label>
               <input type="submit" name="createSubmit"  id="btnSubmit" value="Submit" />
           </p>
        </form>
    </div>
</div>

<!-- delete confirmation dialog box -->
<div id="delConfDialog" title="Confirm">
    <p>Do you want to delete Employee Details ? <span></span></p>
</div>


<!-- message dialog box -->
<div id="msgDialog"><p></p></div>


<script type="text/javascript" src="<?php echo base_url()."assets/js/jquery-1.4.2.min.js"?>"></script>
<script type="text/javascript" src="<?php echo base_url()."assets/js/jquery-ui-1.8.2.min.js"?>"></script>
<script type="text/javascript" src="<?php echo base_url()."assets/js/jquery-templ.js"?>"></script>
<script type="text/javascript" src="<?php echo base_url()."assets/js/jquery.validate.min.js"?>"></script>

<script type="text/template" id="readTemplate">
    <tr id="${employee_id}">
        <td>${f_name}</td>
        <td>${l_name}</td>
        <td>${other_name}</td>
        <td>${id_no}</td>
        <td>${dob}</td>
		<td>${gender}</td>
        <td>${marital_status}</td>
		<td>${phone_no}</td>
                    <td>${email}</td>
                        <td>${date_added}</td>
                            <td>${residence}</td>
                                <td>${employment_category}</td>
                                    <td>${next_of_kin_fname}</td>
                                        <td>${next_of_kin_lname}</td>
                                            <td>${next_of_kin_phone_no}</td>
		
		
        <td><a class="updateBtn" href="${updateLink}">Update Employee Details</a> | <a class="deleteBtn" href="${deleteLink}">Delete Employee Details</a></td>
    </tr>
</script>

<script type="text/javascript" src="<?php echo base_url()."assets/js/add_employee.js"?>"></script>






                              
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
		</div>
		
						</p>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
					
			
				  

		  
       
<?php //include('footer.php'); 
//$this->load->view('administrator/footer');
?>

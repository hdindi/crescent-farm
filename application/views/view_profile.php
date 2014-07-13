<?php 
$this->load->view('administrator/header');
?>

<?php 

      $employee_id = $this->session->userdata('id');
      $f_name = $this->session->userdata('Fname');
      $l_name = $this->session->userdata('Lname');
      $other_name = $this->session->userdata('other_name');
      $id_no = $this->session->userdata('id_no');
      $dob = $this->session->userdata('dob');
      $gender = $this->session->userdata('gender');
      $marital_status = $this->session->userdata('marital_status');
      $phone_no = $this->session->userdata('phone_no');
      $email = $this->session->userdata('email');
      $residence = $this->session->userdata('residence');
      $next_of_kin_fname = $this->session->userdata('next_of_kin_fname');
      $next_of_kin_lname = $this->session->userdata('next_of_kin_lname');
      $next_of_kin_relation = $this->session->userdata('next_of_kin_relation');
      $next_of_kin_phone_no = $this->session->userdata('next_of_kin_phone_no');
      $user_name = $this->session->userdata('user_name');
      $dept = $this->session->userdata('dept');
      $employee_category = $this->session->userdata('employment_category');
      $is_global = $this->session->userdata('is_global');
      $department = $this->session->userdata('department');
      //$dept = $this->session->userdate('dept');
      //echo $dept;
      if($is_global === "Yes"){
          $global = "Global";
      }else{
          $global = "Local";
      }
      




?>

			<div>
				<ul class="breadcrumb">
					<li>
						<a href="#">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">Dashboard</a>
					</li>
				</ul>
			</div>
			<div class="sortable row-fluid">
				
			</div>
			
			<div class="row-fluid">
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-info-sign"></i> My Profile</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						
                                            
                                            
                                           
  <?php // Change the css classes to suit your needs    

$attributes = array('class' => '', 'id' => '');
echo form_open('administrator/admin/update_profile', $attributes); ?>
  <div class="form-all">
    <ul class="form-section">
      <li id="cid_1" class="form-input-wide">
        <div class="form-header-group">
          
        </div>
      </li>
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
            <button id="input_27" type="submit" class="form-submit-button form-submit-button-simple_carolina_blue">
              Update  My Profile
            </button>	
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
				</div>
			</div>
					
			<div class="row-fluid sortable">
				
			</div><!--/row-->

			<div class="row-fluid sortable">
				
			</div><!--/row-->
				  

		  
       
<?php //include('footer.php'); 
$this->load->view('administrator/footer');
?>

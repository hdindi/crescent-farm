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
						<h2><i class="icon-info-sign"></i> Employee Details</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						
						<p class="center">
			
                                                    
                                                    
                                                                 
<div id="employee_table">  
<table cellpadding="0"  style="width:100% !important;" cellspacing="0" border="0" class="display" id="table_employee">
	<thead>
		<tr>
			<th>Employee Name</th>
                        
			<th>Identification Number</th>
			
                        <th>Gender</th>
                   
                        <th> Phone Number</th>
                        
                        <th> Residence</th>
                        <th> Next of Kin Name </th>
                        <th> Next of Kin Relation</th>
                        <th> Next of Kin Phone Number</th>
                        
                        <th> Department </th>
                        <th> Employee Class</th>
                        <th>View </th>
                        <th> Edit </th>
                        <th>  Delete </th>
                        
		</tr>
	</thead>
	
	<tbody>
		 <?php foreach($employee_details as $employee ):?>
		<tr class="odd gradeX">
			<td><?php echo $employee['employee_name'];?></td>
                        <td ><?php echo $employee['id_no'];?></td>
			
			<td><?php echo $employee['gender'];?></td>
			
                        <td><?php echo $employee['phone_no'];?></td>
			
                        <td><?php echo $employee['residence'];?></td>
			<td ><?php echo $employee['next_of_kin_name'];?></td>
                        <td><?php echo $employee['next_of_kin_relation'];?></td>
			<td><?php echo $employee['next_of_kin_phone_no'];?></td>
			
                        <td><?php echo $employee['department_name'];?></td>
			<td><?php echo $employee['employee_class'];?></td>
                        
                        <td><a class="view" href="#view_details">View</a>
                        </td>
                        <td> 
                            <a class="edit" href="#edit_details">Edit </a>
                              </td>
                        <td> 
                            
                            <a class="delete" href="#delete_details" > Delete Employee</a>
                            <input type="hidden" name="employee_id" value="<?php echo $employee['employee_id'];?>" />
                            
                            
                           
                      
</td>

		</tr>
               <?php endforeach;?>
	</tbody>
</table>

</div>
 
                          
                                                    
                                                    
						</p>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
					
			
				  

<fieldset id="delete_details" style="display:none !important;">
        

         
                                <p>Are you sure you want to delete employee details? <hr>
        <li>
              <?php // Change the css classes to suit your needs    

$attributes = array('class' => '', 'id' => '');
echo form_open('administrator/admin/delete_employee', $attributes); ?>
                            
            <input type="hidden"  name="user_id_delete" id="user_id_delete" readonly />
            <button class="btn btn-mini yes"  id="yes" >Yes</button>
        
             <!--</form>-->
<?php echo form_close(); ?>
        </li> <li> <button class="btn btn-mini no" id="employee_no"  >No</button> </li> 
                       </p>
                       
       
             
      
     
      
              </fieldset>










<div id="view_details" style="display:none !important;">
                                            
                                           
  <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            Personal Information
          </h2>
        </div>
      </li>
      <input type="hidden"  name="" id="user_id_view" readonly />
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="nationalid">
          National ID / Passport<span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input  form-textbox validate[required, Numeric]" id="id_no_view"  readonly name="id_no_view" style="width:204px" size="23" maxlength="8" data-type="input-number" />
        </div>
      </li>
      
      
      
      
      
           
      
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="sname">
          Sur - name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="sur_name_view" readonly name="" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_36">
        <label class="form-label-top" id="label_36" for="f_name">
          First Name<span class="form-required">*</span>
        </label>
        <div id="cid_36" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="first_name_view" readonly name="first_name_view" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_35">
        <label class="form-label-top" id="label_35" for="lname">
          Other Name<span class="form-required">*</span>
        </label>
        <div id="cid_35" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="o_name_view" readonly name="o_name_view" size="30"  />
        </div>
      </li>
      <li class="form-line" id="id_10">
        <label class="form-label-top" id="label_10" for="dob">
          Date Of Birth<span class="form-required">*</span>
        </label>
        <div id="cid_10" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="dateob_view" readonly name="dateob_view"  />
        </div>
      </li>
      <li class="form-line" id="id_29">
        <label class="form-label-left" id="label_29" for="user_sex">
          Gender<span class="form-required">*</span>
        </label>
        <div id="cid_29" class="form-input">
          <div class="form-multiple-column">
              <span class="form-radio-item"><select id="user_sex_view" readonly name="user_sex_view">
                      <option  name="user_sex" >  </option> 
                      <option name="user_sex" value="Female">Female</option> 
                      <option name="user_sex" value="Male">Male</option
                      ></select>
              </span>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_37">
        <label class="form-label-left" id="label_37" for="input_37"> Marital Status </label>
        <div id="cid_37" class="form-input">
          <div class="form-multiple-column">
              
              <span class="form-radio-item"><select  id="marital_status_view" readonly name="marital_status_view">
                      <option  name="marital_status" >  </option>
                      <option name="marital_status" value="Single">Single</option> 
                      <option name="marital_status" value="Married">Married</option>
                  <option name="marital_status" value="Divorced">Divorced</option>
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
            <input type="text" class=" form-textbox" id="phone_no_view" readonly name="phone_no_view"  size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_12">
        <label class="form-label-top" id="label_12" for="email"> E-mail </label>
        <div id="cid_12" class="form-input-wide">
            <input type="email" class=" form-textbox validate[Email]" id="e_mail_view" readonly name="e_mail_view"  size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" >
        <label class="form-label-top" id="label_13" for="address"> Residence </label>
        <div id="cid_13" class="form-input-wide">
            <input type="text" class=" form-textbox" id="user_residence_view"  readonly name="user_residence_view"   size="300" />
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
            <input type="text" class=" form-textbox" id="kinf_name_view" readonly name="kinf_name_view"  size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_34">
        <label class="form-label-top" id="label_34" for="input_34"> Kin's last Name </label>
        <div id="cid_34" class="form-input-wide">
            <input type="text" class=" form-textbox" id="kinl_name_view" readonly name="kinl_name_view"  size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_21">
        <label class="form-label-top" id="label_21" for="input_21"> Kin's Relation </label>
        <div id="cid_21" class="form-input-wide">
            <input type="text" class=" form-textbox" id="kin_relation_view" readonly name="kin_relation_view" size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_22">
        <label class="form-label-top" id="label_22" for="input_22"> Kin's Phone Number </label>
        <div id="cid_22" class="form-input-wide">
            <input type="text" class=" form-textbox" id="kin_sphone_view"  readonly name="kin_sphone_view"   size="30" />
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
                   
		
                        
		 <span class="form-radio-item"><select  id="employmentcategory_view" readonly name="employmentcategory_view">
                      <option  name="employmentcategory_view" >  </option>
                      <?php foreach($departments as $department_name){?>
                          <option name="employmentcategory_view"  value="<?php echo $department_name['department_name']?>">
                            <?php echo $department_name['department_name'] ?>
                          </option>
                          <?php //$result = $_POST['packageid'];
                          //$result_explode = explode('|', $result);
                          
                          } ?>
                  </select>
              </span>
        </div>
        </div>
      </li>
      <li class="form-line form-line-column" id="id_21">
        <label class="form-label-top" id="label_21" for="input_21">Employment Class </label>
        <div id="cid_22" class="form-input-wide">
		<select class="form-dropdown validate[required]" style="width:210px" readonly id="employmentclass_view" name="employmentclass_view">
                    <option name="employmentclass_view"> </option>
                    <option value="Yes">Global</option>
                    <option value="No">Local</option>
              </select>
        </div>
      </li>
      <li class="form-line form-line-column" id="id_21">
        <label class="form-label-top" id="label_21" for="input_21"> Is Active? </label>
        <div id="cid_22" class="form-input-wide">
		<select class="form-dropdown validate[required]" style="width:210px" id="is_active_view" >
                    <option > </option>
                    <option  value="Yes">Active</option>
                    <option  value="No">In-Active</option>
              </select>
        </div>
      </li>
      <li class="form-line form-line-column" id="id_22">
        <label class="form-label-top" id="label_23" for="input_23"> Member Name :  </label>
        <div id="cid_22" class="form-input-wide">
            <input type="text" class=" form-textbox" id="member_name_view"    size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_22">
        <label class="form-label-top" id="label_24" for="input_24"> Branch Name : </label>
        <div id="cid_22" class="form-input-wide">
            <input type="text" class=" form-textbox" id="branch_name_view"    size="30" />
        </div>
      </li>
      
      <li class="form-line form-line-column" id="id_22">
        <label class="form-label-top" id="label_22" for="input_22">Shwari Member </label>
        <div id="cid_22" class="form-input-wide">
		<select class="form-dropdown validate[required]" style="width:210px"  readonly id="shwari_member_view" name="shwari_member_view">
           
          </select>
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


						<p class="center">
							
						</p>
						<div class="clearfix"></div>
                                        </div>
<!--  End of Edit Employee Details -->



















<!-- Edit User Details Begins from here -->

<div id="edit_details" style="display:none !important;">
                                            
                                           
  <?php // Change the css classes to suit your needs    

$attributes = array('class' => '', 'id' => '');
echo form_open('administrator/admin/update_employee_details', $attributes); ?>
  <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            Personal Information
          </h2>
        </div>
      </li>
      <input type="hidden"  name="user_id" id="user_id" />
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="nationalid">
          National ID / Passport<span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input  form-textbox validate[required, Numeric]" id="id_no" name="id_no" style="width:204px" size="23" maxlength="8" data-type="input-number" />
        </div>
      </li>
      
      
      
      
      
           
      
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="sname">
          Sur - name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="sur_name" name="sur_name" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_36">
        <label class="form-label-top" id="label_36" for="f_name">
          First Name<span class="form-required">*</span>
        </label>
        <div id="cid_36" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="first_name" name="first_name" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_35">
        <label class="form-label-top" id="label_35" for="lname">
          Other Name<span class="form-required">*</span>
        </label>
        <div id="cid_35" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="o_name" name="o_name" size="30"  />
        </div>
      </li>
      <li class="form-line" id="id_10">
        <label class="form-label-top" id="label_10" for="dob">
          Date Of Birth<span class="form-required">*</span>
        </label>
        <div id="cid_10" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="dateob" name="dateob"  />
        </div>
      </li>
      <li class="form-line" id="id_29">
        <label class="form-label-left" id="label_29" for="user_sex">
          Gender<span class="form-required">*</span>
        </label>
        <div id="cid_29" class="form-input">
          <div class="form-multiple-column">
              <span class="form-radio-item"><select id="user_sex" name="user_sex">
                      <option  name="user_sex" >  </option> 
                      <option name="user_sex" value="Female">Female</option> 
                      <option name="user_sex" value="Male">Male</option
                      ></select>
              </span>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_37">
        <label class="form-label-left" id="label_37" for="input_37"> Marital Status </label>
        <div id="cid_37" class="form-input">
          <div class="form-multiple-column">
              
              <span class="form-radio-item"><select  id="marital_status" name="marital_status">
                      <option  name="marital_status" >  </option>
                      <option name="marital_status" value="Single">Single</option> 
                      <option name="marital_status" value="Married">Married</option>
                  <option name="marital_status" value="Divorced">Divorced</option>
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
            <input type="text" class=" form-textbox" id="phone_no" name="phone_no"  size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_12">
        <label class="form-label-top" id="label_12" for="email"> E-mail </label>
        <div id="cid_12" class="form-input-wide">
            <input type="email" class=" form-textbox validate[Email]" id="e_mail" name="e_mail"  size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" >
        <label class="form-label-top" id="label_13" for="address"> Residence </label>
        <div id="cid_13" class="form-input-wide">
          <input type="text" class=" form-textbox" id="user_residence" name="user_residence"   size="300" />
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
            <input type="text" class=" form-textbox" id="kinf_name" name="kinf_name"  size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_34">
        <label class="form-label-top" id="label_34" for="input_34"> Kin's last Name </label>
        <div id="cid_34" class="form-input-wide">
            <input type="text" class=" form-textbox" id="kinl_name" name="kinl_name"  size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_21">
        <label class="form-label-top" id="label_21" for="input_21"> Kin's Relation </label>
        <div id="cid_21" class="form-input-wide">
            <input type="text" class=" form-textbox" id="kin_relation"  name="kin_relation" size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_22">
        <label class="form-label-top" id="label_22" for="input_22"> Kin's Phone Number </label>
        <div id="cid_22" class="form-input-wide">
            <input type="text" class=" form-textbox" id="kin_sphone" name="kin_sphone"   size="30" />
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
                   
		
                        
		 <span class="form-radio-item">
                     <select  id="employmentcategory" name="employmentcategory">
                      <option  name="employmentcategory" >  </option>
                      <?php foreach($departments as $department_name){?>
                          <option name="employmentcategory"  value="<?php echo $department_name['department_name']?>">
                            <?php echo $department_name['department_name'] ?>
                          </option>
                          <?php //$result = $_POST['packageid'];
                          //$result_explode = explode('|', $result);
                          
                          } ?>
                  </select>
              </span>
        </div>
        </div>
      </li>
      <li class="form-line form-line-column" id="id_21">
        <label class="form-label-top" id="label_21" for="input_21">Employment Class </label>
        <div id="cid_22" class="form-input-wide">
		<select  style="width:210px" id="employmentclass" name="employmentclass">
                    <option name="employmentclass" > </option>
                    <option  name="employmentclass" value="Global Employee">Global Employee</option>
                    <option name="employmentclass" value="Member Employee">Member Employee</option>
                    <option name="employmentclass" value="Branch Employee">Branch Employee </option>
              </select>
        </div>
      </li>
      
       <li class="form-line form-line-column" id="id_21">
        <label class="form-label-top" id="label_21" for="input_21"> Is Active? </label>
        <div id="cid_22" class="form-input-wide">
		<select  style="width:210px" id="is_active" name="is_active">
                    <option name="is_active"> </option>
                    <option name="is_active" value="Yes">Active</option>
                    <option name="is_active" value="No">In-Active</option>
              </select>
        </div>
      </li>
      <li class="form-line form-line-column" id="id_22">
        <label class="form-label-top" id="label_23" for="input_23"> Member Name :  </label>
        <div id="cid_22" class="form-input-wide">
            <input type="text" class=" form-textbox" id="member_name" name="member_name"   size="30" />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_22">
        <label class="form-label-top" id="label_24" for="input_24"> Branch Name : </label>
        <div id="cid_22" class="form-input-wide">
            <input type="text" class=" form-textbox" id="branch_name" name="branch_name"   size="30" />
        </div>
      </li>
      
      <li class="form-line form-line-column" id="id_22">
        <label class="form-label-top" id="label_22" for="input_22">Shwari Member </label>
        <div id="cid_22" class="form-input-wide">
		<select class="form-dropdown validate[required]" style="width:210px" id="shwari_member" name="shwari_member">
            // choose a member from the shawri member table in the database,
          </select>
        </div>
      </li>

     
      <li class="form-line" id="id_27">
        <div id="cid_27" class="form-input-wide">
          <div style="text-align:left" class="form-buttons-wrapper">
              <input type="submit" value="Update User Details" />	
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
<!--  End of Edit Employee Details -->


<!--Update User Profile Starts From here -->

<div id="update_form" style="display:none !important;">
                                            
                                           
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
              <span class="form-radio-item"><select id="sex"  name="sex"> <option  name="sex" value="<?php echo $gender; ?>"> <?php echo $gender; ?> </option> <option name="sex" value="Female">Female</option> <option name="sex" value="Male">Male</option></select>
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
              <input type="submit" value="Update My Profile" />	
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

<!--Update Logged In User Profile Ends from here -->


       
<?php  
$this->load->view('administrator/footer');
?>

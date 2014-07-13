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
			
                                                    
                                                    
                                                                 
<div id="banch_table">  
<table cellpadding="0"  style="width:100% !important;" cellspacing="0" border="0" class="display" id="table_branch">
	<thead>
		<tr>
                    <th>Member Name</th>
			<th>Branch Name</th>
                        
			<th>Category</th>
			
                        <th>Address</th>
                   
                        <th>Phone Number</th>
                        <th> E-mail</th>
                        <th> Is Active </th>
                        <th> Location</th>
                        <th> Description </th>
                        
                        <th> Date Added </th>
                        <th>View</th>
                        <th>Edit</th>
                        <th>Delete </th>
                        
		</tr>
	</thead>
	
	<tbody>
		 <?php foreach($branch_details as $branch ):?>
		<tr class="odd gradeX">
			<td><?php echo $branch['member_name'];?></td>
                        <td><?php echo $branch['branch_name'];?></td>
                        <td ><?php echo $branch['category'];?></td>
			
			<td><?php echo $branch['address'];?></td>
			
                        <td><?php echo $branch['phone_no'];?></td>
			
                        <td><?php echo $branch['email'];?></td>
			<td ><?php echo $branch['is_active'];?></td>
                        <td><?php echo $branch['location'];?></td>
			<td><?php echo $branch['description'];?></td>
			
                        <td><?php echo $branch['date_added'];?></td>
			
                        <td><a class="branch_view" href="#view_branch_details">View</a>
                        </td>
                        <td> 
                            <a class="branch_edit" href="#edit_branch_details">Edit </a>
                              </td>
                        <td> 
                            
                            <a class="branch_delete" href="#delete_branch_details" > Delete</a>
                            <input type="hidden" name="branch_id" value="<?php echo $branch['branch_id'];?>" />
                            
                            
                           
                      
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
					
			










<div id="view_branch_details" style="display:none !important;">
                                            
                                           
  <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            Member Information
          </h2>
        </div>
      </li>
      <input type="hidden"  name="" id="branch_id_view" readonly />
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="nationalid">
          Branch Name <span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input  form-textbox validate[required, Numeric]" id="branch_name_view"  readonly name="" style="width:204px" size="23" maxlength="8"  />
        </div>
      </li>
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="nationalid">
          Member Name <span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input  form-textbox validate[required, Numeric]" id="member_branch_name_view"  readonly name="" style="width:204px" size="23" maxlength="8"  />
        </div>
      </li>
      
      
      
      
      
           
      
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="sname">
          Category <span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="branch_category_view" readonly name="" size="30"  />
        </div>
      </li>
      
      <li class="form-line" id="id_29">
        <label class="form-label-left" id="label_29" for="member_active_view">
          Is Active? <span class="form-required">*</span>
        </label>
        <div id="cid_29" class="form-input">
          <div class="form-multiple-column">
              <span class="form-radio-item"><select id="branch_active_view"  name="branch_active_view">
                      <option name="branch_active_view"> </option>
                      <option name="branch_active_view" value="Yes">Yes</option> 
                      <option name="branch_active_view" value="No">No</option
                      ></select>
              </span>
          </div>
        </div>
      </li>
      <li class="form-line form-line-column" >
        <label class="form-label-top" id="label_13" for="address"> Description </label>
        <div id="cid_13" class="form-input-wide">
            <input type="text" class=" form-textbox" id="branch_description_view"  readonly name="branch_description_view"   size="300" />
        </div>
      </li>
      
      <li id="cid_31" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_31" class="form-header">
            Contact Information
          </h2>
        </div>
      </li>
      <li class="form-line" id="id_37">
        <label class="form-label-left" id="label_37" for="input_37"> Location </label>
        <div id="cid_37" class="form-input">
          <div class="form-multiple-column">
              
              <span class="form-radio-item">
                  <input type="text" class="branhc_location_view" id="branch_location_view" readonly name=""/>
              </span>
         
              
          </div>
        </div>
      </li>
       <li class="form-line form-line-column" id="id_35">
        <label class="form-label-top" id="label_35" for="lname">
          Phone Number<span class="form-required">*</span>
        </label>
        <div id="cid_35" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="branch_phone_no_view" readonly name="" size="30"  />
        </div>
      </li>
      
      
     
      <li class="form-line" id="id_10">
        <label class="form-label-top" id="label_10" for="dob">
          Email<span class="form-required">*</span>
        </label>
        <div id="cid_10" class="form-input-wide">
            <input type="email" class=" form-textbox validate[required]" id="branch_email_view" readonly name=""  />
        </div>
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



				  

<fieldset id="delete_branch_details" style="display:none !important;">
        

         
                                <p>Are you sure you want to delete Branch details? <hr>
        <li>
              <?php // Change the css classes to suit your needs    

$attributes = array('class' => '', 'id' => '');
echo form_open('administrator/admin/delete_branch', $attributes); ?>
                            
            <input type="hidden"  name="branch_id_delete" id="branch_id_delete" readonly />
            <button class="btn btn-mini yes"  id="yes" >Yes</button>
        
             <!--</form>-->
<?php echo form_close(); ?>
        </li> <li> <button class="btn btn-mini no" id="branch_no"  >No</button> </li> 
                       </p>
                       
       
             
      
     
      
              </fieldset>
















<!-- Edit Member Details Begins from here -->




<div id="edit_branch_details" style="display:none !important;">
           
    
                                          
  <?php // Change the css classes to suit your needs    

$attributes = array('class' => '', 'id' => '');
echo form_open('administrator/admin/update_branch_details', $attributes); ?>
                                           
  <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            Member Information
          </h2>
        </div>
      </li>
      <input type="hidden"  name="branch_id_edit" id="branch_id_edit" readonly />
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="member_name">
          Member Name <span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input  form-textbox validate[required, Numeric]" id="member_branch_name_edit"   name="member_branch_name_edit" style="width:204px" size="23" maxlength="8"  />
        </div>
      </li>
      
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="branch_name">
          Branch Name <span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input  form-textbox validate[required, Numeric]" id="branch_name_edit"   name="branch_name_edit" style="width:204px" size="23" maxlength="8"  />
        </div>
      </li>
    
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="category">
          Category <span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="branch_category_edit"  name="branch_category_edit" size="30"  />
        </div>
      </li>
      
      <li class="form-line" id="id_29">
        <label class="form-label-left" id="label_29" for="is_active">
          Is Active? <span class="form-required">*</span>
        </label>
        <div id="cid_29" class="form-input">
          <div class="form-multiple-column">
              <span class="form-radio-item"> <select  style="width:210px;" id="branch_active_edit" name="branch_active_edit">
                    <option name="branch_active_edit" > </option>
                    <option name="branch_active_edit" value="Yes">Yes</option>
                    <option name="branch_active_edit" value="No">No</option>
              </select>
              </span>
          </div>
        </div>
      </li>
      <li class="form-line form-line-column" >
        <label class="form-label-top" id="label_13" for="description"> Description </label>
        <div id="cid_13" class="form-input-wide">
            <input type="text" class=" form-textbox" id="branch_description_edit"   name="branch_description_edit"   size="300" />
        </div>
      </li>
      
      <li id="cid_31" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_31" class="form-header">
            Contact Information
          </h2>
        </div>
      </li>
      <li class="form-line" id="id_37">
        <label class="form-label-left" id="label_37" for="location"> Location </label>
        <div id="cid_37" class="form-input">
          <div class="form-multiple-column">
              
              <span class="form-radio-item">
                  <input type="text" class="branch_location_edit" id="branch_location_edit"  name="branch_location_edit"/>
              </span>
         
              
          </div>
        </div>
      </li>
      
       <li class="form-line form-line-column" id="id_35">
        <label class="form-label-top" id="label_35" for="branch_phone_no">
          Phone Number<span class="form-required">*</span>
        </label>
        <div id="cid_35" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="branch_phone_no_edit"  name="branch_phone_no_edit" size="30"  />
        </div>
      </li>
      
      <li class="form-line form-line-column" id="id_36">
        <label class="form-label-top" id="label_36" for="branch_address">
          Address <span class="form-required">*</span>
        </label>
        <div id="cid_36" class="form-input-wide">
            <input type="text" class=" form-textbox validate[required]" id="branch_address_edit"  name="branch_address_adit" size="30"  />
        </div>
      </li>
     
      <li class="form-line" id="id_10">
        <label class="form-label-top" id="label_10" for="branch_email">
          Email<span class="form-required">*</span>
        </label>
        <div id="cid_10" class="form-input-wide">
            <input type="email" class=" form-textbox validate[required]" id="branch_email_edit"  name="branch_email_edit"  />
        </div>
      </li>
      
      <li class="form-line" id="id_10">
       
        <div id="cid_10" class="form-input-wide">
            <input type="submit" class=" form-textbox validate[required]"    />
        </div>
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
                                                
                                                <!--</form>-->
<?php echo form_close(); ?>
                                        </div>



<!--  End of Edit Employee Details -->


<!--Update Member Profile Starts From here -->





<!--Update   Member Profile Ends from here -->


       
<?php  
$this->load->view('administrator/footer');
?>

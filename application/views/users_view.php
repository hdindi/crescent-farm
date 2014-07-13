<?php 
$this->load->view('header');
?>


			<div>
				<ul class="breadcrumb">
					<li>
                                            <a href="<?php echo base_url(); ?>admin_profile">Home</a> <span class="divider">/</span>
					</li>
					<li>
                                            <a href="<?php base_url();?>admin_profile">Dashboard</a>
					</li>
				</ul>
			</div>



			<div class="sortable row-fluid">
				<a data-rel="tooltip" title="Total Members" class="well span3 top-block" href="#">
					<span class="icon32 icon-red icon-user"></span>
					<div>Total Number of  Users</div>
                                        <div id="member_list"></div>
					<span class="notification">6</span>
				</a>
                            <a data-rel="tooltip" title="Total Branches" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-cart"></span>
					<div>Total Employees To-Date</div>
					<div id="branch_list"></div>
					<span class="notification yellow">$34</span>
				</a>

				<a data-rel="tooltip" title="Total Employees" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-star-on"></span>
					<div>Total Units</div>
					<div id="employee_list"></div>
					<span class="notification green">4</span>
				</a>

				
				
				<a data-rel="tooltip" title="Total Patients" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-envelope-closed"></span>
                                        <div>Total Drivers</div>
					<div id="patient_list"></div>
					<span class="notification red">12</span>
				</a>
			</div>
			
			<div class="row-fluid">
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-info-sign"></i> User Details</h2>
						<div class="box-icon">
							<a href="#add_zone" class="btn  btn-round"><i class="icon icon-add"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                                            <div>
                                              
                                            </div>
						
						<p class="center">
			
                                                    
                                                    
                                                                 
<div id="zone_table">  
    <div> <a class="add_zone btn btn-success" id="add_user" href="#add_user_window">
										<i class="icon-plus-sign icon-white"></i>  
										Add User                                            
									</a> </div>
    <div> <a class="export_user_report btn btn-success" id="export_user_report" href="<?php echo base_url();?>admin_profile/export_users_report">
										<i class="icon-plus-sign icon-white"></i>  
										Export User Report                                            
									</a> </div>
<table cellpadding="0"  style="width:auto !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_employee">
	<thead>
		<tr>
			<th>User Name:</th>
                        
			<th>First Name:</th>
			
                        <th>Sur Name:</th>
                   
                        <th> Other Name:</th>
                        <th>Employee Type :</th>
                        <th>Is Active  :</th>
                        <th>Date Added :</th>
                        <th>Action</th>
                        
                        
                        
		</tr>
	</thead>
	
	<tbody>
		 <?php foreach($users as $users_details ):?>
		<tr class="odd gradeX">
			<td class="center"><?php echo $users_details['user_name'];?></td>
                        <td class="center" ><?php echo $users_details['f_name'];?></td>
			
			<td class="center" ><?php echo $users_details['s_name'];?></td>
			
                        <td class="center" ><?php echo $users_details['other_name'];?></td>
                        <td class="center" ><?php echo $users_details['employee_type'];?></td>
			
			<td class="center" ><?php echo $users_details['is_active'];?></td>
			
                        <td class="center" ><?php echo $users_details['date_added'];?></td>
			
                        
                        
        
            <td class="center">
									<a class=" view_user btn btn-success" href="#view_details">
										<i class="icon-zoom-in icon-white"></i>  
										View                                            
									</a>
									<a class=" edit_user btn btn-info" href="#edit_details">
										<i class="icon-edit icon-white"></i>  
										Edit                                            
									</a>
									<a class=" delete_user btn btn-danger" href="#delete_details">
										<i class="icon-trash icon-white"></i> 
										Delete
									</a>
                
                            <input type="hidden" name="user_id" value="<?php echo $users_details['user_id'];?>" />
                            
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
        

         
                                <p>Are you sure you want to delete the Specified Zone? <hr>
        <li>
              <?php // Change the css classes to suit your needs    

$attributes = array('class' => '', 'id' => '');
echo form_open('admin_profile/delete_user', $attributes); ?>
                            
            <input type="hidden"  name="user_id_delete" id="user_id_delete" readonly />
            <button class="btn btn-mini yes"  id="yes" >Yes</button>
        
             <!--</form>-->
<?php echo form_close(); ?>
        </li> <li> <button class="btn btn-mini no" id="zone_no"  >No</button> </li> 
                       </p>
                       
       
             
      
     
      
              </fieldset>














<!-- Edit User Details Begins from here -->

<div id="add_user_window" style="display:none !important;">
 
    <form class="add_user_form" id="add_user_form" method="post" >
         
  <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            User Information
          </h2>
        </div>
      </li>
     
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="user_name">
          User Name<span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input user_name form-textbox validate[required, Numeric]" id="user_name" name="add_user_name" style="width:204px" size="23" maxlength="8" data-type="input-number" />
        </div>
      </li>
      
      
      
      
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="f_name">
          First Name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox f_name validate[required]" id="f_name" name="add_f_name" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="s_name">
          Sur Name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox zone_rate validate[required]" id="s_name" name="add_s_name" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="other_name">
          Other Name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox zone_rate validate[required]" id="other_name" name="add_other_name" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="employee_type">
          Employee Type<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <select name="add_employee_type">
                <?php ?>
                <option>Select Employee Type</option>
                <option value="Administrator">Administrator</option>
                <option value="Director">Director</option>
                <option value="Manager">Manager</option>
                <option value="Accounts">Accounts</option>
            </select>
        </div>
      </li>
      
      <li class="form-line form-line-column" id="id_36">
        <label class="form-label-top" id="label_36" for="is_active">
          Is Active ?<span class="form-required">*</span>
        </label>
        <div id="cid_36" class="form-input-wide">
            <select name="add_is_active">
                <option value="Yes" >Yes</option>
                <option value="No">No</option>
            </select>    
        </div>
      </li>
     
     
      <li class="form-line" id="id_27">
        <div id="cid_27" class="form-input-wide">
          <div style="text-align:left" class="form-buttons-wrapper">
              <input type="submit" id="add_user_button" class="add_user_button" value="Add New User Details" />	
          </div>
        </div>
      </li>
     
    </ul>
  </div>
     
    </form>
  
    
    


						<p class="center">
							
						</p>
						<div class="clearfix"></div>
                                        </div>
<!--  End of Edit Employee Details -->







<!-- View User Details Begins from here -->

<div id="view_details" style="display:none !important;">
      
  <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            User Information
          </h2>
        </div>
      </li>
      <input type="hidden"  name="user_id_v" id="user_id_v" />
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="user_name_v">
          User Name<span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input user_name_v form-textbox validate[required, Numeric]" readonly="" id="user_name_v" name="user_name_v" style="width:204px" size="23" maxlength="8" data-type="input-number" />
        </div>
      </li>
      
      
      
      
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="f_name_v">
          First Name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox f_name_v validate[required]" id="f_name_v" readonly="" name="f_name_v" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="s_name_v">
          Sur Name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox s_name_v validate[required]" id="s_name_v" readonly="" name="s_name_v" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="other_name_v">
          Other Name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox other_name_v validate[required]" id="other_name_v" readonly="" name="other_name_v" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="employee_type_v">
          Employee Type<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox employee_type_v validate[required]" id="employee_type_v" readonly="" name="employee_type_v" size="30"  />
        </div>
      </li>
      
      <li class="form-line form-line-column" id="id_36">
        <label class="form-label-top" id="label_36" for="is_active_v">
          Is Active ?<span class="form-required">*</span>
        </label>
        <div id="cid_36" class="form-input-wide">
            <input type="text" class=" form-textbox is_active_v validate[required]" id="is_active_v" readonly="" name="is_active_v" size="30"  />
        </div>
      </li>
     
     
     
     
    </ul>
  </div>
     
   
    


						<p class="center">
							
						</p>
						<div class="clearfix"></div>
                                        </div>
<!--  End of View Employee Details -->
























<!-- Edit User Details Begins from here -->

<div id="edit_details" style="display:none !important;">
 
    <form class="update_user_form" id="update_user_form" action="<?php echo base_url(); ?>admin_profile/update_user_details">
         
  <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            User Information
          </h2>
        </div>
      </li>
      <input type="hidden"  name="user_id" id="edit_user_id" />
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="user_name">
          User Name<span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input user_name form-textbox validate[required, Numeric]" id="edit_user_name" name="user_name" style="width:204px" size="23" maxlength="8" data-type="input-number" />
        </div>
      </li>
      
      
      
      
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="f_name">
          First Name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox f_name validate[required]" id="edit_f_name" name="f_name" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="s_name">
          Sur Name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox zone_rate validate[required]" id="edit_s_name" name="s_name" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="other_name">
          Other Name<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox zone_rate validate[required]" id="edit_other_name" name="other_name" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="employee_type">
          Employee Type<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <!--<input type="text" class=" form-textbox zone_rate validate[required]" id="edit_employee_type" name="employee_type" size="30"  />-->
            <select name="employee_type" id="edit_employee_type">
                <?php ?>
                <option>Select Employee Type</option>
                <option value="Administrator">Administrator</option>
                <option value="Director">Director</option>
                <option value="Manager">Manager</option>
                <option value="Accounts">Accounts</option>
            </select>
        </div>
      </li>
      
      <li class="form-line form-line-column" id="id_36">
        <label class="form-label-top" id="label_36" for="is_active">
          Is Active ?<span class="form-required">*</span>
        </label>
        <div id="cid_36" class="form-input-wide">
            <!--<input type="text" class=" form-textbox is_active validate[required]" id="edit_is_active" name="is_active" size="30"  />-->
            <select name="is_active" id="edit_is_active">
                <option value="Yes">Yes</option>
                <option value="No">No</option>
            </select>
        </div>
      </li>
     
     
      <li class="form-line" id="id_27">
        <div id="cid_27" class="form-input-wide">
          <div style="text-align:left" class="form-buttons-wrapper">
              <input type="submit" id="update_user_button" class="update_user_button" value="Update User Details" />	
          </div>
        </div>
      </li>
     
    </ul>
  </div>
     
    </form>
  
    
    


						<p class="center">
							
						</p>
						<div class="clearfix"></div>
                                        </div>
<!--  End of Edit Employee Details -->
















       
<?php  
$this->load->view('footer');
?>

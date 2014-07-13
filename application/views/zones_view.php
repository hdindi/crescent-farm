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
					<span class="icon32 icon-color icon-user"></span>
					<div>Total Employees To-Date</div>
					<div id="branch_list"></div>
					<span class="notification yellow">$34</span>
				</a>

				<a data-rel="tooltip" title="Total Employees" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-book"></span>
					<div>Total Zones</div>
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
						<h2><i class="icon-info-sign"></i> Zone Details</h2>
						<div class="box-icon">
							<a href="#add_zone" class="btn  btn-round"><i class="icon icon-add"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                                            <div>
                                                <fieldset>
                                                    <!-- Edit User Details Begins from here -->

                                                    <div id="" class="" style="display:none !important;">
                           
                                                        <div id="add_zone_window" class="add_zone_window">
               
                                                            <form id="add_new_zone_form" class="add_new_zone_form">
                                                                 <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            Zone Information
          </h2>
        </div>
      </li>
     
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="add_zone_name">
          Zone Name<span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input add_zone_name form-textbox validate[required, Numeric]" id="add_zone_name" name="add_zone_name" style="width:204px" size="23" maxlength="8" data-type="input-number" />
        </div>
      </li>
      
      
      
      
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="add_zone_rate">
          Zone Rate<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox add_zone_rate validate[required]" id="add_zone_rate" name="add_zone_rate" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_36">
        <label class="form-label-top" id="label_36" for="add_f_name">
          Is Active ?<span class="form-required">*</span>
        </label>
        <div id="cid_36" class="form-input-wide">
            <select name="add_is_active" class="" id="add_is_active">
                <option name="add_is_active" value="Active">Active</option>
                <option name="add_is_active" value="In Active">In Active</option>
            </select>
        </div>
      </li>
     
     
      <li class="form-line" id="id_27">
        <div id="cid_27" class="form-input-wide">
          <div style="text-align:left" class="form-buttons-wrapper">
              <input type="submit" id="add_zone_button" value="Add New Zone" />	
          </div>
        </div>
      </li>
      <li style="display:none">
        Should be Empty:
        <input type="text" name="website" value="" />
      </li>
    </ul>
  </div>
                                                            </form>
 
 

						<p class="center">
							
						</p>
						<div class="clearfix"></div>
                                                        </div>
                
                                        </div>
<!--  End of Add Zone Details -->


                                                </fieldset>
                                            </div>
						
						<p class="center">
			
                                                    
                                                    
                                                                 
<div id="zone_table">  
    <div> <a class="add_zone btn btn-success" id="add_zone" href="#add_zone_window">
										<i class="icon-plus-sign icon-white"></i>  
										Add Zone                                            
									</a> </div>
    
    <div> <a class="export_zone_report btn btn-success" id="export_zone_report" href="<?php echo base_url(); ?>admin_profile/export_zones_report">
										<i class="icon-plus-sign icon-white"></i>  
										Export Zone Report
									</a> </div>
<table cellpadding="0"  style="width:100% !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_employee">
	<thead>
		<tr>
			<th>Zone Name:</th>
                        
			<th>Zone Rate:</th>
                        <th>Active ? :</th>
			
                        <th>Date Added:</th>
                   
                        <th> Transaction  By:</th>
                        <th>Action :</th>
                        
                        
                        
		</tr>
	</thead>
	
	<tbody>
		 <?php foreach($zones as $zones_details ):?>
		<tr class="odd gradeX">
			<td class="center"><?php echo $zones_details['zone_name'];?></td>
                        <td class="center" ><?php echo $zones_details['zone_rate'];?></td>
                      <?php 
            if ($zones_details['is_active']==='Active') {
                ?>
                        <td class="center"><span class="label label-success"><?php echo $zones_details['is_active']; ?></span></td>
                    <?php
    
} elseif ($zones_details['is_active']==='In Active') {
    
    ?>
          <td class="center"><span class="label label-important"><?php echo $zones_details['is_active']; ?></span></td>
                                      
        <?php
}
                        
                     ?>
			
			<td class="center" ><?php echo $zones_details['date_added'];?></td>
			
                        <td class="center" ><?php echo $zones_details['user_name'];?></td>
			
                        
                        
        
            <td class="center">
									<a class=" view btn btn-success" href="#view_details">
										<i class="icon-zoom-in icon-white"></i>  
										View                                            
									</a>
									<a class=" edit btn btn-info" href="#edit_details">
										<i class="icon-edit icon-white"></i>  
										Edit                                            
									</a>
									<a class=" delete btn btn-danger" href="#delete_details">
										<i class="icon-trash icon-white"></i> 
										Delete
									</a>
                
                            <input type="hidden" name="user_id" value="<?php echo $zones_details['user_id'];?>" />
                            <input type="hidden" name="zone_id" value="<?php echo $zones_details['zone_id']; ?>"/>
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
            <form id="delete_zone_form" class="delete_zone_form">
                                    
            <input type="hidden"  name="zone_id_delete" id="zone_id_delete" readonly />
            <input type="submit" class="delete_zone_button" id="delete_zone_button" value="Yes"/>
        
        
            </form>
      
        </li> <li> <button class="btn btn-mini no" id="zone_no"  >No</button> </li> 
                       </p>
                       
       
             
      
     
      
              </fieldset>



























<!-- Edit User Details Begins from here -->

<div id="edit_details" style="display:none !important;">
 
    <form class="update_zone_form" id="update_zone_form" action="<?php echo base_url(); ?>admin_profile/update_zone_details">
         
  <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            Zone Information
          </h2>
        </div>
      </li>
      <input type="hidden"  name="zone_id" id="zone_id" />
      <li class="form-line" id="id_5">
        <label class="form-label-top" id="label_5" for="zone_name">
          Zone Name<span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input-wide">
            
            <input type="text" class="form-number-input zone_name form-textbox validate[required, Numeric]" id="zone_name" name="zone_name" style="width:204px" size="23" maxlength="8" data-type="input-number" />
        </div>
      </li>
      
      
      
      
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="zone_rate">
          Zone Rate<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox zone_rate validate[required]" id="zone_rate" name="zone_rate" size="30"  />
        </div>
      </li>
      <li class="form-line form-line-column" id="id_36">
        <label class="form-label-top" id="label_36" for="f_name">
          Is Active ?<span class="form-required">*</span>
        </label>
        <div id="cid_36" class="form-input-wide">
            <input type="text" class=" form-textbox is_active validate[required]" id="is_active" name="is_active" size="30"  />
        </div>
      </li>
     
     
      <li class="form-line" id="id_27">
        <div id="cid_27" class="form-input-wide">
          <div style="text-align:left" class="form-buttons-wrapper">
              <input type="submit" id="update_zone_button" class="update_zone_button" value="Update Zone Details" />	
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

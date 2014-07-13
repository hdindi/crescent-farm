<?php 
$this->load->view('header');
?>
<div>
				<ul class="breadcrumb">
					<li>
                                            <a href="<?php base_url(); ?>crescenthome">Home</a> <span class="divider">/</span>
					</li>
					<li>
                                            <a href="<?php base_url(); ?>crescenthome">Dashboard</a>
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
						<h2><i class="icon-info-sign"></i> Zone Details</h2>
						<div class="box-icon">
							<a href="#add_zone" class="btn  btn-round"><i class="icon icon-add"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                                      
						
						<p class="center">
			
                                                    
                                                    
                                                                 
<div id="zone_table">  
<table cellpadding="0"  style="width:100% !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_employee">
	<thead>
		<tr>
			<th>Bonus Amount:</th>
                        
                        <th>Transaction Date :</th>
                   
                        <th> Transaction  By:</th>
                        <th>Action :</th>
                        
                        
                        
		</tr>
	</thead>
	
	<tbody>
		 <?php foreach($bonus_amount as $bonus_amount_details ):?>
		<tr class="odd gradeX">
			<td class="center"><?php echo $bonus_amount_details['bonus_amount'];?></td>
                        
			<td class="center" ><?php echo $bonus_amount_details['date_added'];?></td>
			
                        <td class="center" ><?php echo $bonus_amount_details['user_name'];?></td>
			
                        
                        
        
            <td class="center">
									
									<a class=" bonus_amount_edit btn btn-info" href="#edit_details">
										<i class="icon-edit icon-white"></i>  
										Edit                                            
									</a>
									
                
                            <input type="hidden" name="bonus_amount_id" value="<?php echo $bonus_amount_details['bonus_amount_id'];?>" />
                            <input type="hidden" name="bonus_amount" value="<?php echo $bonus_amount_details['bonus_amount']; ?>"/>
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
					
			
				  

























<!-- Edit User Details Begins from here -->

<div id="edit_details" style="display:none !important;">
 
    <form class="update_bonus_amount_form" id="update_bonus_amount_form" method="post" >
         
  <div class="form-all">
    <ul class="form-section">
      
      <li id="cid_30" class="form-input-wide">
        <div class="form-header-group">
          <h2 id="header_30" class="form-header">
            Bonus Amount Information
          </h2>
        </div>
      </li>
      <input type="hidden"  name="edit_bonus_amount_id" id="edit_bonus_amount_id" />
    
      
      
      
      
      
      <li class="form-line form-line-column" id="id_6">
        <label class="form-label-top" id="label_6" for="standard_rate">
          Standard Rate<span class="form-required">*</span>
        </label>
        <div id="cid_6" class="form-input-wide">
            <input type="text" class=" form-textbox edit_bonus_amount validate[required]" id="edit_bonus_amount" name="edit_bonus_amount" size="30"  />
        </div>
      </li>
      
     
     
      <li class="form-line" id="id_27">
        <div id="cid_27" class="form-input-wide">
          <div style="text-align:left" class="form-buttons-wrapper">
              <input type="submit" id="update_bonus_button" class="update_bonus_button" value="Update Bonus Amount Details" />	
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

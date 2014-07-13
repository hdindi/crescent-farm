<html>
<head>
<title>Upload Form</title>
</head>
<body>

<?php echo $error;?>

<?php echo form_open_multipart('administrator/upload/do_upload');?>

<input type="file" name="userfile" size="20" />

<br /><br />

<input type="submit" value="upload" />

</form>

</body>
</html>





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
						<h2><i class="icon-info-sign"></i> Update Profile Details</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						
                                            
                                            
  
<?php echo $error;?>

<?php echo form_open_multipart('administrator/upload/do_upload');?>

<input type="file" name="userfile" size="20" />

<br /><br />

<input type="submit" value="upload" />

</form>

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

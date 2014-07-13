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

<div id="add_employee"></div>
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
				<a data-rel="tooltip" title="Total Members" class="well span3 top-block" href="#">
					<span class="icon32 icon-red icon-user"></span>
					<div>Total Members YTD</div>
                                        <div id="member_list"></div>
					<span class="notification">6</span>
				</a>
                            <a data-rel="tooltip" title="Total Branches" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-cart"></span>
					<div>Total Branches YTD</div>
					<div id="branch_list"></div>
					<span class="notification yellow">$34</span>
				</a>

				<a data-rel="tooltip" title="Total Employees" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-star-on"></span>
					<div>Employees YTD</div>
					<div id="employee_list"></div>
					<span class="notification green">4</span>
				</a>

				
				
				<a data-rel="tooltip" title="Total Patients" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-envelope-closed"></span>
                                        <div>Patients YTD</div>
					<div id="patient_list"></div>
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
						<h1>Charisma <small>free, premium quality, responsive, multiple skin admin template.</small></h1>
						<p>Its a live demo of the template. I have created Charisma to ease the repeat work I have to do on my projects. Now I re-use Charisma as a base for my admin panel work and I am sharing it with you :)</p>
						<p><b>All pages in the menu are functional, take a look at all, please share this with your followers.</b></p>
						
						<p class="center">
							
						</p>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
					
			<div class="row-fluid sortable">
				<div class="box span4">
					<div class="box-header well">
						<h2><i class="icon-th"></i> Tabs</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ul class="nav nav-tabs" id="myTab">
							<li class="active"><a href="#info">Info</a></li>
							<li><a href="#custom">Custom</a></li>
							<li><a href="#messages">Messages</a></li>
						</ul>
						 
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active" id="info">
								<h3>Charisma <small>a fully featued template</small></h3>
                                                               
								<p>Its a fully featured, responsive template for your admin panel. Its optimized for tablet and mobile phones. Scan the QR code below to view it in your mobile device.</p> <img alt="QR Code" class="charisma_qr center" src="img/qrcode136.png" />
							
                                                                
                                                        </div>
							<div class="tab-pane" id="custom">
								<h3>Custom <small>small text</small></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor.</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare nulla. Donec consectetur, velit a pharetra ultricies, diam lorem lacinia risus, ac commodo orci erat eu massa. Sed sit amet nulla ipsum. Donec felis mauris, vulputate sed tempor at, aliquam a ligula. Pellentesque non pulvinar nisi.</p>
							</div>
							<div class="tab-pane" id="messages">
								<h3>Messages <small>small text</small></h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare nulla. Donec consectetur, velit a pharetra ultricies, diam lorem lacinia risus, ac commodo orci erat eu massa. Sed sit amet nulla ipsum. Donec felis mauris, vulputate sed tempor at, aliquam a ligula. Pellentesque non pulvinar nisi.</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor.</p>
							</div>
						</div>
					</div>
				</div><!--/span-->
						
				<div class="box span4">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-user"></i> Member Activity</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<div class="box-content">
							<ul class="dashboard-list">
								<li>
									<a href="#">
										<img class="dashboard-avatar" alt="Usman" src="http://www.gravatar.com/avatar/<?php echo md5( strtolower( trim( "usman@halalit.net" ) ) ); ?>.png?s=50"></a>
										<strong>Name:</strong> <a href="#">Usman
									</a><br>
									<strong>Since:</strong> 17/05/2012<br>
									<strong>Status:</strong> <span class="label label-success">Approved</span>                                  
								</li>
								<li>
									<a href="#">
										<img class="dashboard-avatar" alt="Sheikh Heera" src="http://www.gravatar.com/avatar/<?php echo md5( strtolower( trim( "heerasheikh@ymail.com" ) ) ); ?>.png?s=50"></a>
										<strong>Name:</strong> <a href="#">Sheikh Heera
									</a><br>
									<strong>Since:</strong> 17/05/2012<br>
									<strong>Status:</strong> <span class="label label-warning">Pending</span>                                 
								</li>
								<li>
									<a href="#">
										<img class="dashboard-avatar" alt="Abdullah" src="http://www.gravatar.com/avatar/<?php echo md5( strtolower( trim( "abdullah123456@abc.com" ) ) ); ?>.png?s=50"></a>
										<strong>Name:</strong> <a href="#">Abdullah
									</a><br>
									<strong>Since:</strong> 25/05/2012<br>
									<strong>Status:</strong> <span class="label label-important">Banned</span>                                  
								</li>
								<li>
									<a href="#">
										<img class="dashboard-avatar" alt="Saruar Ahmed" src="http://www.gravatar.com/avatar/<?php echo md5( strtolower( trim( "saruarall@gmail.com" ) ) ); ?>.png?s=50"></a>
										<strong>Name:</strong> <a href="#">Saruar Ahmed
									</a><br>
									<strong>Since:</strong> 17/05/2012<br>
									<strong>Status:</strong> <span class="label label-info">Updates</span>                                  
								</li>
							</ul>
						</div>
					</div>
				</div><!--/span-->
						
				<div class="box span4">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-list-alt"></i> Realtime Traffic</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<div id="realtimechart" style="height:190px;"></div>
							<p class="clearfix">You can update a chart periodically to get a real-time effect by using a timer to insert the new data in the plot and redraw it.</p>
							<p>Time between updates: <input id="updateInterval" type="text" value="" style="text-align: right; width:5em"> milliseconds</p>
					</div>
				</div><!--/span-->
			</div><!--/row-->

			<div class="row-fluid sortable">
				<div class="box span4">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-list"></i> Buttons</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content buttons">
						<p class="btn-group">
							  <button class="btn">Left</button>
							  <button class="btn">Middle</button>
							  <button class="btn">Right</button>
						</p>
						<p>
							<button class="btn btn-small"><i class="icon-star"></i> Icon button</button>
							<button class="btn btn-small btn-primary">Small button</button>
							<button class="btn btn-small btn-danger">Small button</button>
						</p>
						<p>
							<button class="btn btn-small btn-warning">Small button</button>
							<button class="btn btn-small btn-success">Small button</button>
							<button class="btn btn-small btn-info">Small button</button>
						</p>
						<p>
							<button class="btn btn-small btn-inverse">Small button</button>
							<button class="btn btn-large btn-primary btn-round">Round button</button>
							<button class="btn btn-large btn-round"><i class="icon-ok"></i></button>
							<button class="btn btn-primary"><i class="icon-edit icon-white"></i></button>
						</p>
						<p>
							<button class="btn btn-mini">Mini button</button>
							<button class="btn btn-mini btn-primary">Mini button</button>
							<button class="btn btn-mini btn-danger">Mini button</button>
							<button class="btn btn-mini btn-warning">Mini button</button>
						</p>
						<p>
							<button class="btn btn-mini btn-info">Mini button</button>
							<button class="btn btn-mini btn-success">Mini button</button>
							<button class="btn btn-mini btn-inverse">Mini button</button>
						</p>
					</div>
				</div><!--/span-->
					
				<div class="box span4">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-list"></i> Buttons</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content  buttons">
						<p>
							<button class="btn btn-large">Large button</button>
							<button class="btn btn-large btn-primary">Large button</button>
						</p>
						<p>
							<button class="btn btn-large btn-danger">Large button</button>
							<button class="btn btn-large btn-warning">Large button</button>
						</p>
						<p>
							<button class="btn btn-large btn-success">Large button</button>
							<button class="btn btn-large btn-info">Large button</button>
						</p>
						<p>
							<button class="btn btn-large btn-inverse">Large button</button>
						</p>
						<div class="btn-group">
							<button class="btn btn-large">Large Dropdown</button>
							<button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="icon-star"></i> Action</a></li>
								<li><a href="#"><i class="icon-tag"></i> Another action</a></li>
								<li><a href="#"><i class="icon-download-alt"></i> Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="icon-tint"></i> Separated link</a></li>
							</ul>
						</div>
						
					</div>
				</div><!--/span-->
					
				<div class="box span4">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-list"></i> Weekly Stat</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ul class="dashboard-list">
							<li>
								<a href="#">
									<i class="icon-arrow-up"></i>                               
									<span class="green">92</span>
									New Comments                                    
								</a>
							</li>
						  <li>
							<a href="#">
							  <i class="icon-arrow-down"></i>
							  <span class="red">15</span>
							  New Registrations
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-minus"></i>
							  <span class="blue">36</span>
							  New Articles                                    
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-comment"></i>
							  <span class="yellow">45</span>
							  User reviews                                    
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-arrow-up"></i>                               
							  <span class="green">112</span>
							  New Comments                                    
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-arrow-down"></i>
							  <span class="red">31</span>
							  New Registrations
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-minus"></i>
							  <span class="blue">93</span>
							  New Articles                                    
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-comment"></i>
							  <span class="yellow">254</span>
							  User reviews                                    
							</a>
						  </li>
						</ul>
					</div>
				</div><!--/span-->
			</div><!--/row-->
				  

		  
       
<?php //include('footer.php'); 
$this->load->view('administrator/footer');
?>

<?php $employee_type = $this->session->userdata('employee_type'); 
 //echo 'Employee Type'.$employee_type.'</br>';
?><!DOCTYPE html>
<html lang="en">
<head>
	
	<meta charset="utf-8">
        <title>SHWARI</title>
<link rel='shortcut icon' href='<?php echo base_url() ?>assets/img/favicon.ico' type='image/x-icon' />

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- The styles -->
	<link id="bs-css" href="<?php echo base_url() ?>admin_assets/css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="<?php echo base_url() ?>admin_assets/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="<?php echo base_url() ?>admin_assets/css/charisma-app.css" rel="stylesheet">
	<link href="<?php echo base_url() ?>admin_assets/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='<?php echo base_url() ?>admin_assets/css/fullcalendar.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='<?php echo base_url() ?>admin_assets/css/chosen.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/uniform.default.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/colorbox.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/jquery.cleditor.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/jquery.noty.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/noty_theme_default.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/elfinder.min.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/elfinder.theme.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/opa-icons.css' rel='stylesheet'>
	<link href='<?php echo base_url() ?>admin_assets/css/uploadify.css' rel='stylesheet'>

	
        
        
        
		
</head>

<body>
	<?php if(!isset($no_visible_elements) || !$no_visible_elements)	{
     if ($employee_type === 'Administrator') {
         
     
            ?>
	<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
                            <a class="brand" href="<?php echo base_url() ?>crescenthome"> <img alt="Crescent Farm Logo" style="height: 40px !important; width: 40px !important;" src="<?php echo base_url()?>assets/img/crescentlogo.png" /> <span>CRESCENT FARM ENT.</span></a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone"> Change Theme / Skin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> Classic</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> Redy</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> Journal</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> Simplex</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> Slate</a></li>
						<li><a data-value="spacelab" href="#"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> United</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> <?php
                                                $f_name = $this->session->userdata('Fname');
                                                $s_name = $this->session->userdata('Lname');
                                                echo ' '.$f_name.' '.$s_name.' ';
                                                ?></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
                                            <li><a href="#">Profile</a></li>
                                                <li class="divider"></li>
                                                <li><a href="<?php  echo base_url()?>crescenthome/do_logout">Logout</a></li>
				
					</ul>
				</div>
				<!-- user dropdown ends -->
                                
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends -->
        <?php } elseif ($employee_type === 'Director') { ?>
            <!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
                            <a class="brand" href="<?php echo base_url() ?>crescenthome"> <img alt="Crescent Farm Logo" style="height: 40px !important; width: 40px !important;" src="<?php echo base_url()?>assets/img/crescentlogo.png" /> <span>CRESCENT FARM ENT.</span></a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone"> Change Theme / Skin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> Classic</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> Redy</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> Journal</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> Simplex</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> Slate</a></li>
						<li><a data-value="spacelab" href="#"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> United</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> <?php
                                                $f_name = $this->session->userdata('Fname');
                                                $s_name = $this->session->userdata('Lname');
                                                echo ' '.$f_name.' '.$s_name.' ';
                                                ?></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
                                           
						<li class="divider"></li>
                                                <li class="divider"></li>
                                                <li><a href="<?php  echo base_url()?>crescenthome/do_logout">Logout</a></li>
				
					</ul>
				</div>
				<!-- user dropdown ends -->
                                
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends --><?php
     
 } elseif ($employee_type === 'Manager') {?>
     <!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
                            <a class="brand" href="<?php echo base_url() ?>crescenthome"> <img alt="Crescent Farm Logo" style="height: 40px !important; width: 40px !important;" src="<?php echo base_url()?>assets/img/crescentlogo.png" /> <span>CRESCENT FARM ENT.</span></a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone"> Change Theme / Skin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> Classic</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> Redy</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> Journal</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> Simplex</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> Slate</a></li>
						<li><a data-value="spacelab" href="#"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> United</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> <?php
                                                $f_name = $this->session->userdata('Fname');
                                                $s_name = $this->session->userdata('Lname');
                                                echo ' '.$f_name.' '.$s_name.' ';
                                                ?></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
                                           
						<li class="divider"></li>
                                                <li class="divider"></li>
                                                <li><a href="<?php  echo base_url()?>crescenthome/do_logout">Logout</a></li>
				
					</ul>
				</div>
				<!-- user dropdown ends -->
                                
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends -->
     <?php
     
 } elseif ($employee_type === 'Accounts') {?>
     <!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
                            <a class="brand" href="<?php echo base_url() ?>crescenthome"> <img alt="Crescent Farm Logo" style="height: 40px !important; width: 40px !important;" src="<?php echo base_url()?>assets/img/crescentlogo.png" /> <span>CRESCENT FARM ENT.</span></a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone"> Change Theme / Skin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> Classic</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> Redy</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> Journal</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> Simplex</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> Slate</a></li>
						<li><a data-value="spacelab" href="#"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> United</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> <?php
                                                $f_name = $this->session->userdata('Fname');
                                                $s_name = $this->session->userdata('Lname');
                                                echo ' '.$f_name.' '.$s_name.' ';
                                                ?></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
                                           
						<li class="divider"></li>
                                                <li class="divider"></li>
                                                <li><a href="<?php  echo base_url()?>crescenthome/do_logout">Logout</a></li>
				
					</ul>
				</div>
				<!-- user dropdown ends -->
                                
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends -->
     <?php
     
 }
        ?><?PHP
        
     } ?>
	<div class="container-fluid">
		<div class="row-fluid">
		<?php if(!isset($no_visible_elements) || !$no_visible_elements) {
    if ($employee_type === 'Administrator') {
    

                    ?>
		
			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Main</li>
						<li><a class="ajax-link" href="<?php echo base_url() ?>admin_profile/index"><i class="icon-home"></i><span class="hidden-tablet"> Home</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>admin_profile/zones"><i class="icon-list"></i><span class="hidden-tablet">Zones</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>admin_profile/users"><i class="icon-user"></i><span class="hidden-tablet"> Users</span></a></li>
						<li><a class="ajax-link" href="<?php echo base_url() ?>admin_profile/employees"><i class="icon-user"></i><span class="hidden-tablet"> Employees</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url();?>admin_profile/units"><i class="icon-plane"></i><span class="hidden-tablet"> Units</span></a></li>
						<li><a class="ajax-link" href="<?php echo base_url();?>crescenthome/do_logout"><i class="icon-lock"></i><span class="hidden-tablet"> Log out</span></a></li>
						</ul>
					<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts -->
                <?php }
 elseif ($employee_type === 'Director') {
    ?><!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Main</li>
						<li><a class="ajax-link" href="<?php echo base_url() ?>operations/delivery_report"><i class="icon-home"></i><span class="hidden-tablet"> Daily Operations Report</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>operations/fuel_usage_management_report"><i class="icon-eye-open"></i><span class="hidden-tablet">Fuel Usage Report</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>operations/fuel_stock_movement_report"><i class="icon-edit"></i><span class="hidden-tablet"> Fuel Stock Report</span></a></li>
						<li><a class="ajax-link" href="<?php echo base_url() ?>operations/driver_daily_performance"><i class="icon-lock"></i><span class="hidden-tablet">Driver Daily Performance Report</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>operations/driver_bonus_report"><i class="icon-lock"></i><span class="hidden-tablet">Driver Bonus Report</span></a></li>
                                                
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>crescenthome/logout"><i class="icon-lock"></i><span class="hidden-tablet"> Log out</span></a></li>
						
                                        </ul>
					<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts --><?php 
 } elseif ($employee_type === 'Manager') {
  ?><!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Main</li>
						<li><a class="ajax-link" href="<?php echo base_url() ?>administrator/admin/"><i class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>administrator/admin/employee"><i class="icon-eye-open"></i><span class="hidden-tablet">Employee</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>administrator/admin/member"><i class="icon-edit"></i><span class="hidden-tablet"> Members</span></a></li>
						<li><a class="ajax-link" href="<?php echo base_url() ?>administrator/admin/branch"><i class="icon-list-alt"></i><span class="hidden-tablet"> Branch</span></a></li>
						<li><a class="ajax-link" href="typography.html"><i class="icon-font"></i><span class="hidden-tablet"> Typography</span></a></li>
						<li><a class="ajax-link" href="gallery.html"><i class="icon-picture"></i><span class="hidden-tablet"> Gallery</span></a></li>
						<li class="nav-header hidden-tablet">Sample Section</li>
						<li><a class="ajax-link" href="table.html"><i class="icon-align-justify"></i><span class="hidden-tablet"> Tables</span></a></li>
						<li><a class="ajax-link" href="calendar.html"><i class="icon-calendar"></i><span class="hidden-tablet"> Calendar</span></a></li>
						<li><a class="ajax-link" href="grid.html"><i class="icon-th"></i><span class="hidden-tablet"> Grid</span></a></li>
						<li><a class="ajax-link" href="file-manager.html"><i class="icon-folder-open"></i><span class="hidden-tablet"> File Manager</span></a></li>
						<li><a href="tour.html"><i class="icon-globe"></i><span class="hidden-tablet"> Tour</span></a></li>
						<li><a class="ajax-link" href="icon.html"><i class="icon-star"></i><span class="hidden-tablet"> Icons</span></a></li>
						<li><a href="error.html"><i class="icon-ban-circle"></i><span class="hidden-tablet"> Error Page</span></a></li>
						<li><a href="login.html"><i class="icon-lock"></i><span class="hidden-tablet"> Login Page</span></a></li>
					</ul>
					<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts --><?php   
 } elseif ($employee_type === 'Accounts') {
   ?><!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Main</li>
						<li><a class="ajax-link" href="<?php echo base_url() ?>operations/"><i class="icon-home"></i><span class="hidden-tablet"> Daily Operations</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>operations/view_operations_data"><i class="icon-home"></i><span class="hidden-tablet"> View Daily Operations</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>operations/fuel_usage"><i class="icon-eye-open"></i><span class="hidden-tablet">Fuel Usage</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>operations/get_fuel_usage_details"><i class="icon-eye-open"></i><span class="hidden-tablet">View Fuel Usage Details</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>operations/driver_bonus_report"><i class="icon-calendar"></i><span class="hidden-tablet">Driver Bonus Report</span></a></li>
                                                <li><a class="ajax-link" href="<?php echo base_url() ?>operations/fuel_stock_data"><i class="icon-edit"></i><span class="hidden-tablet"> Fuel Stock Data</span></a></li>
						<li><a class="ajax-link" href="<?php echo base_url() ?>crescenthome/logout"><i class="icon-lock"></i><span class="hidden-tablet"> Log out</span></a></li>
								</ul>
					<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts --><?php  
 }
    ?><?php       
     } ?><?php
     ?>

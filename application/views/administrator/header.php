<!DOCTYPE html>
<html lang="en">
<head>
	<!--
		Charisma v1.0.0

		Copyright 2012 Muhammad Usman
		Licensed under the Apache License v2.0
		http://www.apache.org/licenses/LICENSE-2.0

		http://usman.it
		http://twitter.com/halalit_usman
	-->
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

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
        
        
        
		
</head>

<body>
	<?php if(!isset($no_visible_elements) || !$no_visible_elements)	{ ?>
	<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
                            <a class="brand" href="<?php echo base_url() ?>administrator/admin/"> <img alt="Shwari Logo" src="<?php echo base_url()?>assets/img/shwari.png" /> <span>Shwari</span></a>
				
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
						<i class="icon-user"></i><span class="hidden-phone"> admin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
                                            <li><a href="<?php echo base_url() ?>administrator/admin/view_profile">Profile</a></li>
						<li class="divider"></li>
                                            <li><a id="update_profile" href="#update_form">Update My Profile</a>
<!--                                            <a id="prescribe" href="#dialog" class="btn btn-large btn-success" >Add Medicine</a>
      -->
                                            </li>
						<li class="divider"></li>
                                                <li><a href="<?php  echo base_url()?>administrator/admin/change_profile_pic">Change Profile Pic</a></li>
                                                <li class="divider"></li>
                                                <li><a href="<?php  echo base_url()?>home/do_logout">Logout</a></li>
				
					</ul>
				</div>
				<!-- user dropdown ends -->
                                
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="#">Visit Site</a></li>
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
	<?php } ?>
	<div class="container-fluid">
		<div class="row-fluid">
		<?php if(!isset($no_visible_elements) || !$no_visible_elements) { ?>
		
			<!-- left menu starts -->
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
			<!-- content starts -->
			<?php } ?>

<?php 
$this->load->view('administrator/header');
?>


        <?php 
foreach($css_files as $file): ?>
    <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
 
<?php endforeach; ?>
          
<?php foreach($js_files as $file): ?>
 
    <script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>
 
        
        <style type='text/css'>
body
{
    font-family: Arial;
    font-size: 14px;
}
a {
    color: blue;
    text-decoration: none;
    font-size: 14px;
}
a:hover
{
    text-decoration: underline;
}
</style>
						
						<p class="center">
							
					 <!-- Beginning header -->
    <div>
        <a href='<?php echo site_url('administrator/admin/members')?>'>View Branches</a> | 
        <a href='<?php echo site_url('administrator/admin')?>'>Home</a> |
        <a href='<?php echo site_url('administrator/admin/employee')?>'>View All Transactions</a> |
        
    </div>
<!-- End of header-->
    <div style='height:20px;'></div>  
    <div>
        <?php echo $output; ?>
 
    </div>
						</p>
						
                                                
                                                       
<?php //include('footer.php'); 
$this->load->view('administrator/footer');
?>

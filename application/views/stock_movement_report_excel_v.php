<?php 
$this->load->view('header');
?>
			<div class="row-fluid">
				<div class="box span12">
					
					<div class="box-content">
                                            
			
                                                    
                                                    
                                                                 
<div id="fuel_stock_table">  
<table cellpadding="0"  style="width:auto !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_employee">
	<thead>
		<tr>
			<th> Unit Code:</th>
                        
			<th>Driver Code:</th>
                        <th>Delivery No :</th>
                        <th> Month : </th>
                        <th>Year : </th>
                        <th> Opening Bal : </th>
                        <th> Issue : </th>
                        <th> Closing Bal : </th>
                        <th>Date Added:</th>
                   
                        <th> Transaction  By:</th>
                 
                        
                        
                        
		</tr>
	</thead>
	
	<tbody>
		 <?php foreach($fuel_stocks as $fuel_stocks_details ):?>
		<tr class="odd gradeX">
                    <td class="center"><input/><?php echo $fuel_stocks_details['unit_code'];?></td>
                        <td class="center" ><?php echo $fuel_stocks_details['driver_code'];?></td>
                        <td class="center"><?php echo $fuel_stocks_details['delivery_no']; ?></td>
                        <td class="center"><?php echo $fuel_stocks_details['month']; ?></td>
                        <td class="center"> <?php echo $fuel_stocks_details['year']; ?></td>
                        <td class="center"> <?php echo $fuel_stocks_details['opening_bal']; ?></td>
                        <td class="center"><?php echo $fuel_stocks_details['issue']; ?></td>
                        <td class="center"><?php echo $fuel_stocks_details['closing_bal']; ?></td>
                        
			
			<td class="center" ><?php echo $fuel_stocks_details['date_added'];?></td>
			
                        <td class="center" ><?php echo $fuel_stocks_details['user_name'];?></td>
			
                        
           
		</tr>
               <?php endforeach;?>
	</tbody>
</table>

</div>
 
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
					
			
				  




























       
<?php  
$this->load->view('footer');
?>

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
        <div>Total Units To-Date</div>
        <div id="branch_list"></div>
        <span class="notification yellow">$34</span>
    </a>

    <a data-rel="tooltip" title="Total Units" class="well span3 top-block" href="#">
        <span class="icon32 icon-color icon-star-on"></span>
        <div>Total Units</div>
        <div id="fuel_usage_details_list"></div>
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
            <h2><i class="icon-info-sign"></i> Fuel Stock Movement Report</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
               
            </div>
        </div>
        <div class="box-content">



            <p class="center">




            <div id="fuel_usage_details_table">  
                
    <div> <a class="export_user_report btn btn-success" id="export_user_report" href="<?php echo base_url();?>operations/export_fuel_stock_report">
										<i class="icon-plus-sign icon-white"></i>  
										Export Stock Movement Report                                            
									</a> </div>

                <table cellpadding="0"  style="width:auto !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_fuel_usage_details">
                    <thead>
                        <tr>


                            <th>Unit Code:</th>

                            <th>Driver Code:</th>
                            <th>Delivery Number:</th>
                            <th>Month:</th>

                            <th>Year</th>
                            <th>Fuel Name</th>
                            <th>OPening Balance:</th>
                            <th> Issue  : </th>
                            <th>Closing Balance :</th>
                            <th>Transaction Date :</th>
                            <th>Batch Number :</th>
                  



                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($fuel_stock_movement_details as $fuel_stock_movement_detail): ?>
                            <tr class="odd gradeX">

                                <td class="center" ><?php echo $fuel_stock_movement_detail['unit_code']; ?></td>

                                <td class="center" ><?php echo $fuel_stock_movement_detail['driver_code']; ?></td>

                                <td class="center" ><?php echo $fuel_stock_movement_detail['delivery_no']; ?></td>
                                
                                <td class="center" ><?php echo $fuel_stock_movement_detail['month']; ?></td>

                                <td class="center" ><?php echo $fuel_stock_movement_detail['year']; ?></td>
                                
                                <td class="center" ><?php echo $fuel_stock_movement_detail['fuel_name']; ?></td>

                                <td class="center" ><?php echo $fuel_stock_movement_detail['opening_bal']; ?></td>
                                <td class="center" ><?php echo $fuel_stock_movement_detail['issue']; ?></td>

                                <td class="center" ><?php echo $fuel_stock_movement_detail['closing_bal']; ?></td>
                                
                                <td class="center"><?php echo $fuel_stock_movement_detail['date_added']; ?></td>


                                <td class="center" ><?php echo $fuel_stock_movement_detail['batch_number']; ?></td>




                               

                            </tr>
<?php endforeach; ?>
                    </tbody>
                </table>

            </div>




            </p>
            <div class="clearfix"></div>
        </div>
    </div>
</div>






























<?php
$this->load->view('footer');
?>

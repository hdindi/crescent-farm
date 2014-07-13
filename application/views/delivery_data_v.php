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
        <div id="delivery_list"></div>
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
            <h2><i class="icon-info-sign"></i> Delivery Details</h2>
            <div class="box-icon">
                <a href="#add_delivery" class="btn  btn-round"><i class="icon icon-add"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">



            <p class="center">




            <div id="delivery_table">  
                
    <div> <a class="export_user_report btn btn-success" id="export_user_report" href="<?php echo base_url();?>operations/export_delivery_report">
										<i class="icon-plus-sign icon-white"></i>  
										Export Delivery Report                                            
									</a> </div>

                <table cellpadding="0"  style="width:auto !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_delivery">
                    <thead>
                        <tr>

                            
                            <th>W/B Ticket No:</th>
                            <th>Unit Code:</th>
                            <th>Driver Code:</th>
                            <th>Zone:</th>
                            <th>Zone Rate:</th>
                            <th>Tonnage:</th>
                            <th>Amount:</th>
                            <th>Delivery Date : </th>
                            <th>Transaction Date :</th>
                            <th>Transaction By :</th>




                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($delivery_data as $delivery_data_details): ?>
                            <tr class="odd gradeX">

                                <td class="center" ><?php echo $delivery_data_details['delivery_no']; ?></td>
                                <td class="center" ><?php echo $delivery_data_details['unit_code']; ?></td>
                                <td class="center" ><?php echo $delivery_data_details['driver_code']; ?></td>
                                <th class="center"><?php echo $delivery_data_details['zone_name']; ?></th>
                                <td class="center" ><?php echo $delivery_data_details['zone_rate']; ?></td>
                                <td class="center" ><?php echo $delivery_data_details['tonnage']; ?></td>
                                <td class="center" ><?php echo $delivery_data_details['amount']; ?></td>
                                <th class="center"><?php echo $delivery_data_details['delivery_date']; ?></th>
                                <td class="center" ><?php echo $delivery_data_details['date_added']; ?></td>
                                <td class="center" ><?php echo $delivery_data_details['user_name']; ?></td>






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

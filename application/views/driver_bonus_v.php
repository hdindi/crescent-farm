<?php
$this->load->view('header');
?><div>
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


<div style="display: none !important;" class="">
    <fieldset id="filter_bonus_data_form" class="filter_bonus_data_form">
        <h4>Filter Data </h4>
        <form action="<?php echo base_url(); ?>operations/driver_bonus_report" method="post">
            <label class="label">Driver Code :</label>
            <div class="controls">
                <select id="filter_driver_code" name="filter_driver_code" data-rel="chosen">
                    <?php foreach ($drivers as $driver_details) {
                        ?>

                        <option name="driver_code" value="All">All</option>
                        <option name="filter_driver_code" id="filter_driver_code" value="<?php echo $driver_details['driver_code']; ?>"><?php echo $driver_details['driver_code']; ?>|<?php echo $driver_details['f_name']; ?>|<?php echo $driver_details['s_name'] ?></option>
                    <?php } ?>
                </select>
            </div>
            <br>

            <label class="label">
                Date From : 
            </label>
            <input type="text" class="datepicker" id="date_from" name="date_from"/>
            <br>
            <label class="label">
                Date To : </label>
            <input type="text" class="datepicker" id="date_to" name="date_to"/>
            <br>
            <button id="filter_bonus_button" class="filter_bonus_button btn btn-round btn-success" > Filter Information</button>
        </form>
    </fieldset>

</div>

<div style="display: none !important;">
    <h4>Filter Data </h4>
    <fieldset id="export_filter_bonus_data_form" class="export_filter_bonus_data_form">
        <form action="<?php echo base_url(); ?>operations/export_driver_bonus_report" method="post">
            <label class="label">Driver Code :</label>
            <div class="controls">
                <select id="driver_code" name="driver_code" data-rel="">
                    <option name="driver_code" value="All">All</option>
                    <?php foreach ($drivers as $driver_details) {
                        ?>
                        <option name="driver_code" id="driver_code" value="<?php echo $driver_details['driver_code']; ?>"><?php echo $driver_details['driver_code']; ?>|<?php echo $driver_details['f_name']; ?>|<?php echo $driver_details['s_name'] ?></option>
                    <?php } ?>
                </select>
            </div>
            <br>

            <label class="label">
                Date From : 
            </label>
            <input type="text" class="datepicker" id="export_date_from" name="date_from"/>
            <br>
            <label class="label">
                Date To : </label>
            <input type="text" class="datepicker" id="export_date_to" name="date_to"/>
            <br>
            <button id="export_bonus_filter_button" class="export_bonus_filter_button btn btn-round btn-success" > Export Filtered Information</button>

        </form>

    </fieldset>

</div>

<div class="row-fluid">
    <div class="box span12">
        <div class="box-header well">
            <h2><i class="icon-info-sign"></i> Delivery Details</h2>
            <div class="box-icon">
                <a href="#add_delivery" class="btn  btn-round"><i class="icon icon-add"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
            </div>
        </div>
        <div class="box-content">



            <p class="center">




            <div id="delivery_table">  

                <div> <a class="export_bonus_report btn btn-success" id="export_bonus_report" href="#export_filter_bonus_data_form">
                        <i class="icon-plus-sign icon-white"></i>  
                        Export Driver Daily Performance Report                                            
                    </a> </div>


                <div>
                    <a id="filter_bonus_data" class="filter_bonus_data btn btn-success" href="#filter_bonus_data_form"><i class="icon-white icon-zoom-in"></i>Filter Data </a>
                </div>

                <table cellpadding="0"  style="width:auto !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_delivery">
                    <thead>
                        <tr>

                            <th>Delivery Date</th>
                            <th>W/B Ticket No:</th>
                            <th>Unit Code:</th>
                            <th>Driver Code:</th>
                            <th>Zone:</th>
                            <th>Zone Rate:</th>
                            <th>Standard Tonne : </th>
                            <th>Tonne Delivered:</th>
                            <th>Bonus Tonne : </th>
                            <th>Bonus Earned :</th>
                            <th>Amount:</th>
                            <th>Transaction Date :</th>




                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($driver_bonus as $driver_bonus_details): ?>
                            <tr class="odd gradeX">

                                <td class="center"><?php echo $driver_bonus_details['delivery_date']; ?></td`>
                                <td class="center" ><?php echo $driver_bonus_details['delivery_no']; ?></td>
                                <td class="center" ><?php echo $driver_bonus_details['unit_code']; ?></td>
                                <td class="center" ><?php echo $driver_bonus_details['driver_code']; ?></td>
                                <td class="center"><?php echo $driver_bonus_details['zone_name']; ?></td>
                                <td class="center" ><?php echo $driver_bonus_details['zone_rate']; ?></td>
                                <td class="center"><?php echo $driver_bonus_details['standard_tonne']; ?></td>
                                <td class="center" ><?php echo $driver_bonus_details['tonnage']; ?></td>
                                <?php
                                $standard_tonne = $driver_bonus_details['standard_tonne'];
                                $tonnage = $driver_bonus_details['tonnage'];
                                $bonus_tonne = $tonnage - $standard_tonne;

                                if ($bonus_tonne >= 0) {
                                    ?>
                                    <td class="center"><span class="label label-success"><?php echo $bonus_tonne; ?></span></td>
                                    <?php
                                } else if ($bonus_tonne < 0) {
                                    ?>
                                    <td class="center"><span class="label label-important"><?php echo $bonus_tonne; ?></span></td>
                                    <?php
                                }

                                $bonus_amount = $driver_bonus_details['bonus_amount'];
                                $total_bonus_amount = $bonus_amount * $bonus_tonne;
                                if ($total_bonus_amount >= 0) {
                                    ?>
                                    <td class="center"><?php echo $total_bonus_amount; ?></td>
                                    <?php
                                } else {
                                    ?>
                                    <td class="center"><?php echo "0"; ?></td>
                                    <?php
                                }
                                ?>

                                <td class="center" ><?php echo $driver_bonus_details['amount']; ?></td>
                                <td class="center" ><?php echo $driver_bonus_details['date_added']; ?></td>






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

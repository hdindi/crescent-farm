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

                <table cellpadding="0"  style="width:auto !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_delivery">
                    <thead>
                        <tr>


                            <th>Unit Code:</th>

                            <th>Driver Code:</th>
                            <th>Zone:</th>
                            <th>W/B Ticket No:</th>
                            <th>Tonnage:</th>
                            <th>Delivery Date : </th>
                            <th>Transaction Date :</th>
                            <th>Action</th>



                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($operations_data as $operations_data_details): ?>
                            <tr class="odd gradeX">

                                <td class="center" ><?php echo $operations_data_details['unit_code']; ?></td>

                                <td class="center" ><?php echo $operations_data_details['driver_code']; ?></td>

                                <td class="center" ><?php echo $operations_data_details['zone_name']; ?></td>

                                <td class="center" ><?php echo $operations_data_details['delivery_no']; ?></td>
                                <th class="center"><?php echo $operations_data_details['tonnage']; ?></th>


                                <td class="center" ><?php echo $operations_data_details['delivery_date']; ?></td>

                                <td class="center" ><?php echo $operations_data_details['date_added']; ?></td>




                                <td class="center">
                                    <a class=" view_delivery btn btn-success" href="#view_details">
                                        <i class="icon-zoom-in icon-white"></i>  
                                        View                                            
                                    </a>
                                    <a class=" edit_delivery btn btn-info" href="#edit_details">
                                        <i class="icon-edit icon-white"></i>  
                                        Edit                                            
                                    </a>


                                    <input type="hidden" id="delivery_id" name="delivery_id" value="<?php echo $operations_data_details['delivery_id']; ?>" />

                                </td>

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










<!-- View User Details Begins from here -->

<div id="hide" style="display:none !important;">
    <fieldset id="view_details" class="view_details">
        <div class="form-all">
            <ul class="form-section">

                <li id="cid_30" class="form-input-wide">
                    <div class="form-header-group">
                        <h2 id="header_30" class="form-header">
                            Daily  Delivery Information
                        </h2>
                    </div>
                </li>
                <input type="hidden"  name="delivery_id_v" id="delivery_id_v" />






                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="unit_code_v">
                        Unit Code : <span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox unit_code_v validate[required]" id="unit_code_v" readonly="" name="unit_code_v" size="30"  />

                        
                        
                        
                   
                    
                    
                    </div>
                </li>


                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="driver_code_v">
                        Driver Code<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox driver_code_v validate[required]" id="driver_code_v" readonly="" name="driver_code_v" size="30"  />


                  
                    </div>
                </li>


                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="zone_name_v">
                        Zone Name :<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox zone_name_v validate[required]" id="zone_name_v" readonly="" name="zone_name_v" size="30"  />

                        
                    </div>
                </li>


                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="weigh_bridge_ticket_number_v">
                        Weigh Bridge TIcket Number :<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox weigh_bridge_ticket_number_v validate[required]" id="weigh_bridge_ticket_number_v" readonly="" name="weigh_bridge_ticket_number_v" size="30"  />

                        
                    </div>
                </li>
                
                
                
                 <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="tonnage_v">
                      Tonnage  :<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox tonnage_v validate[required]" id="tonnage_v" readonly="" name="tonnage_v" size="30"  />

                        
                    </div>
                </li>
                 <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="delivery_date_v">
                       Delivery Date :<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox delivery_date_v validate[required]" id="delivery_date_v" readonly="" name="weigh_bridge_ticket_number_v" size="30"  />

                        
                    </div>
                </li>





            </ul>
        </div>


    </fieldset>




    <p class="center">

    </p>
    <div class="clearfix"></div>
</div>
<!--  End of View Unit Details -->



















<!-- Edit User Details Begins from here -->

<div id="edit_details" style="display:none !important;">

    <form class="update_delivery_form" id="update_delivery_form" method="post">

        <div class="form-all">
            <ul class="form-section">

                <li id="cid_30" class="form-input-wide">
                    <div class="form-header-group">
                        <h2 id="header_30" class="form-header">
                            Daily Delivery Information
                        </h2>
                    </div>
                </li>
                <input type="hidden"  name="edit_delivery_id" id="edit_delivery_id" />






                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="unit_code">
                        Unit Code : <span class="form-required">*</span>
                    </label>
                    
                        <div class="">
                            <select id="edit_unit_code" name="edit_unit_code" data-rel="">
                               
                                <?php foreach ($units as $unit) {
                                    ?>
                                    <option name="edit_unit_code" id="edit_unit_code" value="<?php echo $unit['unit_code']; ?>"><?php echo $unit['unit_code']; ?></option>
                                <?php } ?>
                            </select>
                        </div>

                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="edit_driver_code">
                        Driver Code : <span class="form-required">*</span>
                    </label>
                    
                        <div class="controls">
                            <select id="edit_driver_code" name="edit_driver_code" data-rel="chosen">
                                <?php foreach ($drivers as $driver_details) {
                                    ?>
                                    <option name="edit_driver_code" id="edit_driver_code" value="<?php echo $driver_details['driver_code']; ?>"><?php echo $driver_details['driver_code']; ?></option>
                                <?php } ?>
                            </select>
                        </div>

                </li>
                
                
                
                
                
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="edit_zone_name">
                         Zone Name<span class="form-required">*</span>
                    </label>
                 <div class="">
                            <select id="edit_zone_name" name="edit_zone_name" data-rel="chosen">
                                <?php foreach ($zones as $zone_details) {
                                    ?>
                                    <option name="edit_zone_name" id="edit_zone_name" value="<?php echo $zone_details['zone_name']; ?>"><?php echo $zone_details['zone_name']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="weigh_bridge_ticket_number">
                        Weight Bridge Ticket Number<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox weigh_bridge_ticket_number validate[required]" id="weigh_bridge_ticket_number" name="weigh_bridge_ticket_number" size="30"  />
                    </div>
                </li>
                
                  <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="tonnage">
                     Tonnage : <span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox edit_tonnage validate[required]" id="edit_tonnage" name="edit_tonnage" size="30"  />
                    </div>
                </li>
                
                
                
                 <div class="control-group">
                        <label class="control-label" for="date01">Delivery Date : </label>
                        <div class="controls">
                            <input type="date" class="input-xlarge edit_delivery_date datepicker" name="edit_delivery_date" id="edit_delivery_date" >
                        </div>
                    </div>
                
                
                



              

                <li class="form-line" id="id_27">
                    <div id="cid_27" class="form-input-wide">
                        <div style="text-align:left" class="form-buttons-wrapper">
                            <input type="submit" id="update_delivery_button" class="update_delivery_button" value="Update Delivery Details" />	
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
<!--  End of Edit Unit Details -->





<?php
$this->load->view('footer');
?>

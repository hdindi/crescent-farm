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


<div>
    <div>
        <a class=" issue_receive btn btn-success" id="issue_receive" href="#issue_receive_option"> <i class="icon-add icon-white"></i>  
            Issue/Receive Stock                                            
        </a>
    </div>
</div>





<div style="display: none !important;">
    <div id="issue_receive_option" class="issue_receive_option">
        <div class="breadcrumb">
            Do you want to Issue Fuel or Receive Fuel ? 
            <hr>

            <a class=" receive_stock_link btn btn-success" href="#receive_stock"> <i class="icon-shopping-cart icon-white"></i>  
                Receive Stock                                            
            </a>
            <hr>
            <a class=" issue_stock_link btn btn-success" href="#issue_stock"> <i class="icon-shopping-cart icon-white"></i>  
                Issue Stock                                            
            </a>
        </div>
    </div>
</div>






<div style="display: none !important;">
    <div id="receive_stock">
        <div class="form-header-group">
            <h2 id="header_30" class="form-header">
                Record Received Stock Fuel
            </h2>
        </div>

        <div >

            <div class="form-all">
                <form class="receive_fuel_form" id="receive_fuel_form" method="post" >

                    <ul class="form-section">
                        <li id="cid_30" class="form-input-wide">

                        </li>

                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="name_of_receiver">
                                Name of Receiver :<span class="form-required">*</span>
                            </label>
                            <div id="cid_6" class="form-input-wide">
                                <input type="text" class=" form-textbox name_of_receiver validate[required]"  style="width: 60px !important;" id="name_of_receiver" name="name_of_receiver" size="30"  />
                            </div>
                        </li>

                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="delivery_note_no">
                                Delivery Note Number :<span class="form-required">*</span>
                            </label>
                            <div id="cid_6" class="form-input-wide">
                                <input type="text" class=" form-textbox delivery_note_no validate[required]" style="width: 60px !important;" id="delivery_note_no" name="delivery_note_no" size="30"  />
                            </div>
                        </li>
                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="quantity_received">
                                Quantity Received(Litres) :<span class="form-required">*</span>
                            </label>
                            <div id="cid_6" class="form-input-wide">
                                <input type="text" class=" form-textbox quantity_received validate[required]" style="width: 60px !important;" id="quantity_received" name="quantity_received" size="30"  />
                            </div>
                        </li>




                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="received_date">
                                Date :<span class="form-required">*</span>
                            </label>
                            <div id="cid_6" class="form-input-wide">
                                <input type="text" class="input-xlarge edit_fuel_usage_details_date datepicker" style="width: 100px !important;"  name="received_date" id="received_date" >


                            </div>
                        </li>
                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="received_fuel_name">
                                Fuel Name : <span class="form-required">*</span>
                            </label>

                            <div class="controls">
                                <select id="edit_driver_code" name="received_fuel_name" data-rel="">
                                    <?php foreach ($fuel as $fuel_details) {
                                        ?>
                                        <option name="received_fuel_name" id="received_fuel_name" value="<?php echo $fuel_details['fuel_name']; ?>"><?php echo $fuel_details['fuel_name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                        </li>
                        <li class="form-line" id="id_27">
                            <div id="cid_27" class="form-input-wide">
                                <div style="text-align:left" class="form-buttons-wrapper">
                                    <input type="submit" id="receive_fuel_button" class="receive_fuel_button" value="Add Fuel stock"/>
                                </div>
                        </li>

                    </ul>


                </form>


            </div>
        </div>
    </div>
</div>




<div style="display: none !important;">
    <fieldset id="issue_stock">
        <div class="form-header-group">
            <h2 id="header_30" class="form-header">
                Record Issued Stock Fuel
            </h2>
        </div>

        <div class="form-all">
            <form class="issue_stock_fuel_form" id="issue_stock_fuel_form" method="post">




                <ul class="form-section">


                    <li class="form-line form-line-column" id="id_6">
                        <label class="form-label-top" id="label_6" for="received_date">
                            Date :<span class="form-required">*</span>
                        </label>
                        <div id="cid_6" class="form-input-wide">
                            <input type="text" class="input-xlarge issue_date datepicker" style="width: 100px !important;"  name="issue_date" id="issue_date" >


                        </div>
                    </li>

                    <li class="form-line form-line-column" id="id_6">
                        <label class="form-label-top" id="label_6" for="issue_unit_code">
                            Unit Code : <span class="form-required">*</span>
                        </label>

                        <div class="">
                            <select id="edit_unit_code" name="issue_unit_code" data-rel="">

                                <?php foreach ($units as $unit) {
                                    ?>
                                    <option name="issue_unit_code" id="isue_unit_code" value="<?php echo $unit['unit_code']; ?>"><?php echo $unit['unit_code']; ?></option>
                                <?php } ?>
                            </select>
                        </div>

                    </li>
                    <li class="form-line form-line-column" id="id_6">
                        <label class="form-label-top" id="label_6" for="issue_driver_code">
                            Driver Code : <span class="form-required">*</span>
                        </label>

                        <div class="controls">
                            <select id="edit_driver_code" name="issue_driver_code" data-rel="chosen">
                                <?php foreach ($drivers as $driver_details) {
                                    ?>
                                    <option name="issue_driver_code" id="issue_driver_code" value="<?php echo $driver_details['driver_code']; ?>"><?php echo $driver_details['driver_code']; ?></option>
                                <?php } ?>
                            </select>
                        </div>

                    </li>

                    <li class="form-line form-line-column" id="id_6">
                        <label class="form-label-top" id="label_6" for="issue_fuel_name">
                            Fuel Name : <span class="form-required">*</span>
                        </label>

                        <div class="controls">
                            <select id="edit_driver_code" name="issue_fuel_name" data-rel="">
                                <?php foreach ($fuel as $fuel_details) {
                                    ?>
                                    <option name="issue_fuel_name" id="issue_fuel_name" value="<?php echo $fuel_details['fuel_name']; ?>"><?php echo $fuel_details['fuel_name']; ?></option>
                                <?php } ?>
                            </select>
                        </div>

                    </li>
                    <li class="form-line form-line-column" id="id_6">
                        <label class="form-label-top" id="label_6" for="issue_delivery_note_no">
                            Delivery Note Number :<span class="form-required">*</span>
                        </label>
                        <div id="cid_6" class="form-input-wide">

                            <div id="cid_6" class="form-input-wide">
                                <input type="text" class=" form-textbox issue_delivery_note_no validate[required]" style="width: 60px !important;" id="issue_delivery_note_no" name="issue_delivery_note_no" size="30"  />
                            </div>

                        </div>
                    </li>

                    <li class="form-line form-line-column" id="id_6">
                        <label class="form-label-top" id="label_6" for="issue_batch_number">
                            Batch Number :<span class="form-required">*</span>
                        </label>
                        <div id="cid_6" class="form-input-wide">

                            <div class="controls">
                                <select id="issue_batch_number" name="issue_batch_number" data-rel="">
                                    <?php foreach ($batch_number as $batch_number_details) {
                                        ?>
                                        <option name="issue_batch_number" id="issue_batch_number" value="<?php echo $batch_number_details['batch_number']; ?>"><?php echo $batch_number_details['batch_number']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                        </div>
                    </li>

                    <li class="form-line form-line-column" id="id_6">
                        <label class="form-label-top" id="label_6" for="quantity_issued">
                            Quantity Issued(Litres) :<span class="form-required">*</span>
                        </label>
                        <div id="cid_6" class="form-input-wide">
                            <input type="text" class=" form-textbox quantity_issued validate[required]" style="width: 60px !important;" id="quantity_issued" name="quantity_issued" size="30"  />
                        </div>
                    </li>



                    <li class="form-line" id="id_27">
                        <div id="cid_27" class="form-input-wide">
                            <div style="text-align:left" class="form-buttons-wrapper">
                                <input type="submit" id="issue_stock_fuel_button" class="issue_stock_fuel_button" value="Issue Fuel stock"/>
                            </div>
                    </li>

                </ul>





            </form>




        </div>





    </fieldset>
</div>




<div class="row-fluid">
    <div class="box span12">
        <div class="box-header well">
            <h2><i class="icon-info-sign"></i> Received Stock Details</h2>
            <div class="box-icon">
                <a href="#add_fuel_usage_details" class="btn  btn-round"><i class="icon icon-add"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
            </div>
        </div>
        <div class="box-content">



            <p class="center">




            <div id="fuel_usage_details_table"> 
                
                
                
    <div> <a class="export_user_report btn btn-success" id="export_user_report" href="<?php echo base_url();?>operations/export_received_stock_report">
										<i class="icon-plus-sign icon-white"></i>  
										Export Received Stock Report                                            
									</a> </div>

                <table cellpadding="0"  style="width:auto !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_fuel_usage_details">
                    <thead>
                        <tr>


                            <th>Receiver:</th>

                            <th>Delivery No:</th>
                            <th>Batch No:</th>
                            <th>Date:</th>
                            <th>Received Qty:</th>
                            <th>Remaining Qty:</th>
                            <th> Fuel  : </th>
                            <th>Transaction Date :</th>
                            <th>Action</th>



                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($stock as $stock_details): ?>
                            <tr class="odd gradeX">

                                <td class="center" ><?php echo $stock_details['receiver_name']; ?></td>

                                <td class="center" ><?php echo $stock_details['delivery_note_no']; ?></td>
                                <td class="center" ><?php echo $stock_details['batch_number']; ?></td>

                                <td class="center" ><?php echo $stock_details['date']; ?></td>

                                <td class="center" ><?php echo $stock_details['quantity_received']; ?></td>
                                <td class="center" ><?php echo $stock_details['quantity_remaining']; ?></td>
                                <th class="center"><?php echo $stock_details['fuel_name']; ?></th>




                                <td class="center" ><?php echo $stock_details['date_added']; ?></td>




                                <td class="center">
                                    <a class=" view_received_stock_details btn btn-success" href="#view_stock_receive_details">
                                        <i class="icon-zoom-in icon-white"></i>  
                                        View                                            
                                    </a>
                                    <a class=" edit_received_stock_details btn btn-info" href="#edit_stock_receive_details">
                                        <i class="icon-edit icon-white"></i>  
                                        Edit                                            
                                    </a>


                                    <input type="hidden" id="fuel_usage_id" name="stock_id" value="<?php echo $stock_details['stock_id']; ?>" />

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



<div>
    <fieldset>





        <div style="display: none !important;">
            <div id="view_stock_receive_details">
                <div class="form-header-group">
                    <h2 id="header_30" class="form-header">
                        Record Received Stock Fuel
                    </h2>
                </div>

                <div >

                    <div class="form-all">


                        <ul class="form-section">
                            <li id="cid_30" class="form-input-wide">

                            </li>

                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="name_of_receiver_v">
                                    Name of Receiver :<span class="form-required">*</span>
                                </label>
                                <div id="cid_6" class="form-input-wide">
                                    <input type="text" class=" form-textbox name_of_receiver_v validate[required]" readonly="" style="width: 60px !important;" id="name_of_receiver_v" name="name_of_receiver_v" size="30"  />
                                </div>
                            </li>

                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="delivery_note_no_v">
                                    Delivery Note Number :<span class="form-required">*</span>
                                </label>
                                <div id="cid_6" class="form-input-wide">
                                    <input type="text" class=" form-textbox delivery_note_no_v validate[required]" readonly="" style="width: 60px !important;" id="delivery_note_no_v" name="delivery_note_no_v" size="30"  />
                                </div>
                            </li>
                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="quantity_received_v">
                                    Quantity Received(Litres) :<span class="form-required">*</span>
                                </label>
                                <div id="cid_6" class="form-input-wide">
                                    <input type="text" class=" form-textbox quantity_received_v validate[required]" readonly="" style="width: 60px !important;" id="quantity_received_v" name="quantity_received_v" size="30"  />
                                </div>
                            </li>




                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="received_date_v">
                                    Date :<span class="form-required">*</span>
                                </label>
                                <div id="cid_6" class="form-input-wide">
                                    <input type="text" class="input-xlarge received_date_v datepicker" readonly="" style="width: 100px !important;"  name="received_date_v" id="received_date_v" >


                                </div>
                            </li>
                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="received_fuel_name_v">
                                    Fuel Name : <span class="form-required">*</span>
                                </label>

                                <div class="controls">



                                    <input type="text" class="received_fuel_name_v" readonly="" id="received_fuel_name_v"/>
                                </div>

                            </li>


                        </ul>





                    </div>
                </div>
            </div>
        </div>


    </fieldset>
</div>







<div>
    <fieldset>





        <div style="display: none !important;">
            <div id="edit_stock_receive_details">
                <div class="form-header-group">
                    <h2 id="header_30" class="form-header">
                        Record Received Stock Fuel
                    </h2>
                </div>

                <div >

                    <div class="form-all">
                        <form class="edit_receive_fuel_form" id="edit_receive_fuel_form" method="post" >

                            <input type="hidden" class="edit_stock_id" name="edit_stock_id" id="edit_stock_id"/>
                            <ul class="form-section">
                                <li id="cid_30" class="form-input-wide">

                                </li>

                                <li class="form-line form-line-column" id="id_6">
                                    <label class="form-label-top" id="label_6" for="edit_name_of_receiver">
                                        Name of Receiver :<span class="form-required">*</span>
                                    </label>
                                    <div id="cid_6" class="form-input-wide">
                                        <input type="text" class=" form-textbox edit_name_of_receiver validate[required]"  style="width: 60px !important;" id="edit_name_of_receiver" name="edit_name_of_receiver" size="30"  />
                                    </div>
                                </li>

                                <li class="form-line form-line-column" id="id_6">
                                    <label class="form-label-top" id="label_6" for="edit_delivery_note_no">
                                        Delivery Note Number :<span class="form-required">*</span>
                                    </label>
                                    <div id="cid_6" class="form-input-wide">
                                        <input type="text" class=" form-textbox edit_delivery_note_no validate[required]" style="width: 60px !important;" id="edit_delivery_note_no" name="edit_delivery_note_no" size="30"  />
                                    </div>
                                </li>
                                <li class="form-line form-line-column" id="id_6">
                                    <label class="form-label-top" id="label_6" for="edit_quantity_received">
                                        Quantity Received(Litres) :<span class="form-required">*</span>
                                    </label>
                                    <div id="cid_6" class="form-input-wide">
                                        <input type="text" class=" form-textbox edit_quantity_received validate[required]" style="width: 60px !important;" id="edit_quantity_received" name="edit_quantity_received" size="30"  />
                                    </div>
                                </li>




                                <li class="form-line form-line-column" id="id_6">
                                    <label class="form-label-top" id="label_6" for="edit_received_date">
                                        Date :<span class="form-required">*</span>
                                    </label>
                                    <div id="cid_6" class="form-input-wide">
                                        <input type="text" class="input-xlarge edit_received_date datepicker" style="width: 100px !important;"  name="edit_received_date" id="edit_received_date" >


                                    </div>
                                </li>
                                <li class="form-line form-line-column" id="id_6">
                                    <label class="form-label-top" id="label_6" for="edit_received_fuel_name">
                                        Fuel Name : <span class="form-required">*</span>
                                    </label>

                                    <div class="controls">
                                        <select id="edit_received_fuel_name" name="edit_received_fuel_name" data-rel="">
                                            <?php foreach ($fuel as $fuel_details) {
                                                ?>
                                                <option name="edit_received_fuel_name" id="edit_received_fuel_name" value="<?php echo $fuel_details['fuel_name']; ?>"><?php echo $fuel_details['fuel_name']; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>

                                </li>
                                <li class="form-line" id="id_27">
                                    <div id="cid_27" class="form-input-wide">
                                        <div style="text-align:left" class="form-buttons-wrapper">
                                            <input type="submit" id="edit_receive_fuel_button" class="edit_receive_fuel_button" value="Update Fuel Stock Details"/>
                                        </div>
                                </li>

                            </ul>


                        </form>


                    </div>
                </div>
            </div>
        </div>


    </fieldset>
</div>


<div class="row-fluid">
    <div class="box span12">
        <div class="box-header well">
            <h2><i class="icon-info-sign"></i> Stock Issuing Details</h2>
            <div class="box-icon">
                <a href="#add_fuel_usage_details" class="btn  btn-round"><i class="icon icon-add"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
            </div>
        </div>
        <div class="box-content">



            <p class="center">




            <div id="fuel_usage_details_table">  

                <table cellpadding="0"  style="width:auto !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_fuel_usage_details">
                    <thead>
                        <tr>


                            <th>Unit Code:</th>

                            <th>Driver Code:</th>
                            <th>Fuel:</th>
                            <th>Litre Issued:</th>
                            <th>Delivery  No:</th>
                            <th>Batch No:</th>
                            <th> Date : </th>
                            <th>Transaction Date :</th>
                            <th>Action</th>



                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($stock_movement as $stock_movement_details): ?>
                            <tr class="odd gradeX">

                                <td class="center" ><?php echo $stock_movement_details['unit_code']; ?></td>

                                <td class="center" ><?php echo $stock_movement_details['driver_code']; ?></td>

                                <td class="center" ><?php echo $stock_movement_details['fuel_name']; ?></td>

                                <td class="center" ><?php echo $stock_movement_details['quantity_issued']; ?></td>
                                <th class="center"><?php echo $stock_movement_details['delivery_note_no']; ?></th>
                                <th class="center"><?php echo $stock_movement_details['batch_number']; ?></th>


                                <td class="center" ><?php echo $stock_movement_details['date']; ?></td>

                                <td class="center" ><?php echo $stock_movement_details['date_added']; ?></td>




                                <td class="center">
                                    <a class=" view_issued_stock_details btn btn-success" href="#view_stock_issue_details">
                                        <i class="icon-zoom-in icon-white"></i>  
                                        View                                            
                                    </a>
                                    <a class=" edit_issued_stock_details btn btn-info" href="#edit_stock_issue_details">
                                        <i class="icon-edit icon-white"></i>  
                                        Edit                                            
                                    </a>


                                    <input type="hidden" id="stock_movement_id" name="stock_movement_id" value="<?php echo $stock_movement_details['stock_movement_id']; ?>" />
                                    <input type="hidden" id="stock_id" name="stock_id" value="<?php echo $stock_movement_details['stock_id']; ?>" />

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
                <input type="hidden"  name="fuel_usage_details_id_v" id="fuel_usage_details_id_v" />






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
                    <label class="form-label-top" id="label_6" for="fuel_type_v">
                        Fuel Type :<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox fuel_type_v validate[required]" id="fuel_type_v" readonly="" name="fuel_type_v" size="30"  />


                    </div>
                </li>


                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="litres_v">
                        Litres :<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox litres_v validate[required]" id="litres_v" readonly="" name="litres_v" size="30"  />


                    </div>
                </li>



                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="km_covered_v">
                        Km Covered  :<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox km_covered_v validate[required]" id="km_covered_v" readonly="" name="km_covered_v" size="30"  />


                    </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="fuel_usage_details_date_v">
                        Date :<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox fuel_usage_details_date_v validate[required]" id="fuel_usage_details_date_v" readonly="" name="weigh_bridge_ticket_number_v" size="30"  />


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

    <form class="update_fuel_usage_details_form" id="update_fuel_usage_details_form" method="post">

        <div class="form-all">
            <ul class="form-section">

                <li id="cid_30" class="form-input-wide">
                    <div class="form-header-group">
                        <h2 id="header_30" class="form-header">
                            Daily Delivery Information
                        </h2>
                    </div>
                </li>
                <input type="hidden"  name="edit_fuel_usage_details_id" id="edit_fuel_usage_details_id" />






                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="edit_unit_code">
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
                    <label class="form-label-top" id="label_6" for="edit_fuel_type">
                        Zone Name<span class="form-required">*</span>
                    </label>
                    <div class="">
                        <select id="edit_zone_name" name="edit_fuel_type" data-rel="chosen">
                            <?php foreach ($fuel as $fuel_details) {
                                ?>
                                <option name="edit_fuel_type" id="edit_zone_name" value="<?php echo $fuel_details['fuel_name']; ?>"><?php echo $fuel_details['fuel_name']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="litre">
                        Litres :<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox edit_litres validate[required]" id="edit_litres" name="edit_litres" size="30"  />
                    </div>
                </li>

                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="edit_km_covered">
                        Km's Covered : <span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox edit_km_covered validate[required]" id="edit_km_covered" name="edit_km_covered" size="30"  />
                    </div>
                </li>



                <div class="control-group">
                    <label class="control-label" for="date01"> Date : </label>
                    <div class="controls">
                        <input type="text" class="input-xlarge edit_fuel_usage_details_date datepicker" name="edit_fuel_usage_details_date" id="edit_fuel_usage_details_date" >
                    </div>
                </div>








                <li class="form-line" id="id_27">
                    <div id="cid_27" class="form-input-wide">
                        <div style="text-align:left" class="form-buttons-wrapper">
                            <input type="submit" id="update_fuel_usage_details_button" class="update_fuel_usage_details_button" value="Update Fuel Usage Details" />	
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



<div>
    <fieldset>




        <div style="display: none !important;">
            <fieldset id="edit_stock_issue_details">
                <div class="form-header-group">
                    <h2 id="header_30" class="form-header">
                        Record Issued Stock Fuel
                    </h2>
                </div>

                <div class="form-all">
                    <form class="edit_issue_stock_fuel_form" id="edit_issue_stock_fuel_form" method="post">

                        <input type="hidden" class="edit_issue_stock_movement_id" id="edit_issue_stock_movement_id" name="edit_issue_stock_movement_id"/>
                        <input type="hidden" class="edit_issue_stock_id" id="edit_issue_stock_id" name="edit_issue_stock_id"/>


                        <ul class="form-section">


                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="edit_issue_received_date">
                                    Date :<span class="form-required">*</span>
                                </label>
                                <div id="cid_6" class="form-input-wide">
                                    <input type="text" class="input-xlarge edit_issue_received_date datepicker" style="width: 100px !important;"  name="edit_issue_received_date" id="edit_issue_received_date" >


                                </div>
                            </li>

                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="edit_issue_unit_code">
                                    Unit Code : <span class="form-required">*</span>
                                </label>

                                <div class="">
                                    <select id="edit_issue_unit_code" name="edit_issue_unit_code" data-rel="">

                                        <?php foreach ($units as $unit) {
                                            ?>
                                            <option name="edit_issue_unit_code" id="edit_issue_unit_code" value="<?php echo $unit['unit_code']; ?>"><?php echo $unit['unit_code']; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>

                            </li>
                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="edit_issue_driver_code">
                                    Driver Code : <span class="form-required">*</span>
                                </label>

                                <div class="controls">
                                    <select id="edit_issue_driver_code" name="edit_issue_driver_code" data-rel="">
                                        <?php foreach ($drivers as $driver_details) {
                                            ?>
                                            <option name="edit_issue_driver_code" id="edit_issue_driver_code" value="<?php echo $driver_details['driver_code']; ?>"><?php echo $driver_details['driver_code']; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>

                            </li>

                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="edit_issue_fuel_name">
                                    Fuel Name : <span class="form-required">*</span>
                                </label>

                                <div class="controls">
                                    <select id="edit_issue_fuel_name" name="edit_issue_fuel_name" data-rel="">
                                        <?php foreach ($fuel as $fuel_details) {
                                            ?>
                                            <option name="edit_issue_fuel_name" id="edit_issue_fuel_name" value="<?php echo $fuel_details['fuel_name']; ?>"><?php echo $fuel_details['fuel_name']; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>

                            </li>
                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="edit_issue_delivery_note_no">
                                    Delivery Note Number :<span class="form-required">*</span>
                                </label>
                                <div id="cid_6" class="form-input-wide">

                                    <div id="cid_6" class="form-input-wide">
                                        <input type="text" class=" form-textbox edit_issue_delivery_note_no validate[required]" style="width: 60px !important;" id="edit_issue_delivery_note_no" name="edit_issue_delivery_note_no" size="30"  />
                                    </div>

                                </div>
                            </li>

                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="edit_issue_batch_number">
                                    Batch Number :<span class="form-required">*</span>
                                </label>
                                <div id="cid_6" class="form-input-wide">

                                    <div class="controls">
                                        <select id="issue_batch_number" name="edit_issue_batch_number" data-rel="">
                                            <?php foreach ($batch_number as $batch_number_details) {
                                                ?>
                                                <option name="edit_issue_batch_number" id="edit_issue_batch_number" value="<?php echo $batch_number_details['batch_number']; ?>"><?php echo $batch_number_details['batch_number']; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>

                                </div>
                            </li>

                            <li class="form-line form-line-column" id="id_6">
                                <label class="form-label-top" id="label_6" for="edit_quantity_issued">
                                    Quantity Issued(Litres) :<span class="form-required">*</span>
                                </label>
                                <div id="cid_6" class="form-input-wide">
                                    <input type="text" class=" form-textbox edit_quantity_issued validate[required]" style="width: 60px !important;" id="edit_quantity_issued" name="edit_quantity_issued" size="30"  />
                                </div>
                            </li>



                            <li class="form-line" id="id_27">
                                <div id="cid_27" class="form-input-wide">
                                    <div style="text-align:left" class="form-buttons-wrapper">
                                        <input type="submit" id="edit_issue_stock_fuel_button" class="edit_issue_stock_fuel_button" value="Update Issued Fuel stock"/>
                                    </div>
                            </li>

                        </ul>





                    </form>




                </div>





            </fieldset>
        </div>




    </fieldset>
</div>







<div>
    <fieldset>




        <div style="display: none !important;">
            <fieldset id="view_stock_issue_details">
                <div class="form-header-group">
                    <h2 id="header_30" class="form-header">
                        View Issued Stock Fuel
                    </h2>
                </div>

                <div class="form-all">




                    <ul class="form-section">


                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="view_issue_received_date">
                                Date :<span class="form-required">*</span>
                            </label>
                            <div id="cid_6" class="form-input-wide">
                                <input type="text" class="input-xlarge view_issue_received_date datepicker" style="width: 100px !important;"  name="view_issue_received_date" id="view_issue_received_date" >


                            </div>
                        </li>

                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="view_issue_unit_code">
                                Unit Code : <span class="form-required">*</span>
                            </label>

                            <div class="">
                                <input type="text" class="view_issue_unit_code"  id="view_issue_unit_code" readonly=""/>
                            </div>

                        </li>
                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="view_issue_driver_code">
                                Driver Code : <span class="form-required">*</span>
                            </label>

                            <div class="controls">
                                <input type="text" class="view_issue_driver_code" readonly="" id="view_issue_driver_code"/>
                            </div>

                        </li>

                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="view_issue_fuel_name">
                                Fuel Name : <span class="form-required">*</span>
                            </label>

                            <div class="controls">
                                <input type="text" class="view_issue_fuel_name" readonly="" id="view_issue_fuel_name"/>
                            </div>

                        </li>
                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="view_issue_delivery_note_no">
                                Delivery Note Number :<span class="form-required">*</span>
                            </label>
                            <div id="cid_6" class="form-input-wide">

                                <div id="cid_6" class="form-input-wide">
                                    <input type="text" class=" form-textbox view_issue_delivery_note_no validate[required]" readonly="" style="width: 60px !important;" id="view_issue_delivery_note_no" name="view_issue_delivery_note_no" size="30"  />
                                </div>

                            </div>
                        </li>

                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="view_issue_batch_number">
                                Batch Number :<span class="form-required">*</span>
                            </label>
                            <div id="cid_6" class="form-input-wide">

                                <div class="controls">
                                    <input type="text" class="view_issue_batch_number" readonly="" id="view_issue_batch_number"/>
                                </div>

                            </div>
                        </li>

                        <li class="form-line form-line-column" id="id_6">
                            <label class="form-label-top" id="label_6" for="view_quantity_issued">
                                Quantity Issued(Litres) :<span class="form-required">*</span>
                            </label>
                            <div id="cid_6" class="form-input-wide">
                                <input type="text" class=" form-textbox view_quantity_issued validate[required]" readonly="" style="width: 60px !important;" id="view_quantity_issued" name="view_quantity_issued" size="30"  />
                            </div>
                        </li>





                    </ul>








                </div>





            </fieldset>
        </div>




    </fieldset>
</div>





<?php
$this->load->view('footer');
?>

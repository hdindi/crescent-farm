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
            <h2><i class="icon-info-sign"></i> Delivery Details</h2>
            <div class="box-icon">
                <a href="#add_fuel_usage_details" class="btn  btn-round"><i class="icon icon-add"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
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
                            <th>Fuel Type:</th>
                            <th>Litres:</th>
                            <th>Km Covered:</th>
                            <th> Date : </th>
                            <th>Transaction Date :</th>
                            <th>Action</th>



                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($fuel_usage as $fuel_usage_details): ?>
                            <tr class="odd gradeX">

                                <td class="center" ><?php echo $fuel_usage_details['unit_code']; ?></td>

                                <td class="center" ><?php echo $fuel_usage_details['driver_code']; ?></td>

                                <td class="center" ><?php echo $fuel_usage_details['fuel_type']; ?></td>

                                <td class="center" ><?php echo $fuel_usage_details['estimated_fuel_used']; ?></td>
                                <th class="center"><?php echo $fuel_usage_details['km_covered']; ?></th>


                                <td class="center" ><?php echo $fuel_usage_details['date']; ?></td>

                                <td class="center" ><?php echo $fuel_usage_details['date_added']; ?></td>




                                <td class="center">
                                    <a class=" view_fuel_usage_details btn btn-success" href="#view_details">
                                        <i class="icon-zoom-in icon-white"></i>  
                                        View                                            
                                    </a>
                                    <a class=" edit_fuel_usage_details btn btn-info" href="#edit_details">
                                        <i class="icon-edit icon-white"></i>  
                                        Edit                                            
                                    </a>


                                    <input type="hidden" id="fuel_usage_id" name="fuel_usage_id" value="<?php echo $fuel_usage_details['fuel_usage_id']; ?>" />

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
                        <input type="text" class=" form-textbox fuel_usage_details_date_v validate[required]" id="fuel_usage_details_date_v" readonly="" name="fuel_usage_details_date_v" size="30"  />

                        
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





<?php
$this->load->view('footer');
?>

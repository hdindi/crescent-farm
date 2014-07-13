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
        <div id="unit_list"></div>
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
            <h2><i class="icon-info-sign"></i> Unit Details</h2>
            <div class="box-icon">
                <a href="#add_unit" class="btn  btn-round"><i class="icon icon-add"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <div>
                <fieldset>
                    <!-- Edit User Details Begins from here -->

                    <div id="" class="" style="display:none !important;">

                        <div id="add_unit_window" class="add_unit_window">

                            <form id="add_new_unit_form" class="add_new_unit_form">
                                <div class="form-all">
                                    <ul class="form-section">

                                        <li id="cid_30" class="form-input-wide">
                                            <div class="form-header-group">
                                                <h2 id="header_30" class="form-header">
                                                    New Unit Information
                                                </h2>
                                            </div>
                                        </li>
                                        <li class="form-line" id="id_5">
                                            <label class="form-label-top" id="label_5" for="add_unit_name">
                                                Unit Name<span class="form-required">*</span>
                                            </label>
                                            <div id="cid_5" class="form-input-wide">

                                                <input type="text" class="form-number-input add_unit_name form-textbox validate[required, Numeric]" id="add_unit_name" name="add_unit_name" style="width:204px" data-type="input-number" />
                                            </div>
                                        </li>





                                        <li class="form-line form-line-column" id="id_6">
                                            <label class="form-label-top" id="label_6" for="add_unit_type">
                                                Unit Type<span class="form-required">*</span>
                                            </label>
                                            <div id="cid_6" class="form-input-wide">
                                                <select class="add_unit_type" id="add_unit_type" name="add_unit_type">
                                                    <option>Please Select Unit Type</option>
                                                    <option value="Cane Transport Tractor" id="add_unit_type" name="add_unit_type" class="add_unit_type">Cane Transport Tractor</option>
                                                    <option value="Loader" id="add_unit_type"  name="add_unit_type" class="add_unit_type">Loader</option>
                                                    <option value="Pick Up" id="add_unit_type" class="add_unit_type" name="add_unit_type">Pick Up</option>
                                                    <option value="Car" class="add_unit_type" id="add_unit_type" name="add_unit_type" >Car</option>
                                                    <option value="Tractor" class="add_unit_type" id="add_unit_type" name="add_unit_type" >Tractor</option>
                                                </select>
                                                
                                            </div>
                                        </li>
                                        <li class="form-line form-line-column" id="id_6">
                                            <label class="form-label-top" id="label_6" for="add_registration_number">
                                                Registration Number<span class="form-required">*</span>
                                            </label>
                                            <div id="cid_6" class="form-input-wide">
                                                <input type="text" class=" form-textbox add_registration_number validate[required]" id="add_registration_number" name="add_registration_number" size="30"  />
                                            </div>
                                        </li>

                                     

                                        <li class="form-line form-line-column" id="id_36">
                                            <label class="form-label-top" id="label_36" for="add_is_active">
                                                Is Active ?<span class="form-required">*</span>
                                            </label>
                                            <div id="cid_36" class="form-input-wide">
                                                <select name="add_is_active" class="" id="add_is_active">
                                                    <option name="add_is_active" value="Active">Active</option>
                                                    <option name="add_is_active" value="In Active">In Active</option>
                                                </select>
                                            </div>
                                        </li>


                                        <li class="form-line" id="id_27">
                                            <div id="cid_27" class="form-input-wide">
                                                <div style="text-align:left" class="form-buttons-wrapper">
                                                    <input type="submit" id="add_new_unit_button" class="add_new_unit_button" value="Add New Unit" />	
                                                </div>
                                            </div>
                                        </li>
                                        <li style="display:none">
                                            Should be Empty:
                                            <input type="text" name="website" value="" />
                                        </li>
                                    </ul>
                                </div>
                            </form>



                            <p class="center">

                            </p>
                            <div class="clearfix"></div>
                        </div>

                    </div>
                    <!--  End of Add Zone Details -->


                </fieldset>
            </div>

            <p class="center">




            <div id="unit_table">  
             
                <table cellpadding="0"  style="width:100% !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_unit">
                    <thead>
                        <tr>

                            <th>Delivery Date:</th>
                            <th>Registration No:</th>

                            <th>Unit Code:</th>

                            <th> Driver Code:</th>

                            <th>Delivery Number:</th>
                            <th>Tonnage</th>
                            <th>Amount</th>
                            <th>Date Added :</th>
                         



                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($daily_operation_report as $daily_operation_report_details): ?>
                            <tr class="odd gradeX">

                                <td class="center" ><?php echo $daily_operation_report_details['delivery_date']; ?></td>

                                <td class="center" ><?php echo $daily_operation_report_details['registration_number']; ?></td>

                                <td class="center" ><?php echo $daily_operation_report_details['unit_code']; ?></td>
                                <td class="center"><?php echo $daily_operation_report_details['driver_code'];?></td>
                                <td class="center"><?php echo $daily_operation_report_details['delivery_no']; ?></td>
                                <td class="center"><?php echo $daily_operation_report_details['tonnage']; ?></td>
                                <td><?php echo $daily_operation_report_details['amount']; ?></td>

                                


                                <td class="center" ><?php echo $daily_operation_report_details['date_added']; ?></td>





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




<fieldset id="delete_details" style="display:none !important;">



    <p>Are you sure you want to delete the Specified Unit? <hr>
    <li>
        <form id="delete_unit_form" class="delete_unit_form">
            <input type="hidden"  name="unit_id_delete" id="unit_id_delete" readonly />
            <input type="submit" class="delete_unit_button" id="delete_unit_button" value="Yes"/>

        </form>
        <!--</form>-->

    </li> <li> <button class="btn btn-mini no" id="unit_no"  >No</button> </li> 
</p>






</fieldset>









<!-- View User Details Begins from here -->

<div id="" style="display:none !important;">
    <fieldset id="view_details" class="view_details">
        <div class="form-all">
            <ul class="form-section">

                <li id="cid_30" class="form-input-wide">
                    <div class="form-header-group">
                        <h2 id="header_30" class="form-header">
                            Unit Information
                        </h2>
                    </div>
                </li>
                <input type="hidden"  name="unit_id_v" id="unit_id_v" />






                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="unit_name_v">
                        Unit Name<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox unit_name_v validate[required]" id="unit_name_v" readonly="" name="unit_name_v" size="30"  />
                    </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="unit_code_v">
                        Unit Code<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox unit_code_v validate[required]" id="unit_code_v" readonly="" name="unit_code_v" size="30"  />
                    </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="registration_number_v">
                        Registration Number<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox registration_number_v validate[required]" id="registration_number_v" readonly="" name="registration_number_v" size="30"  />
                    </div>
                </li>



                <li class="form-line form-line-column" id="id_36">
                    <label class="form-label-top" id="label_36" for="is_active_v">
                        Is Active ?<span class="form-required">*</span>
                    </label>
                    <div id="cid_36" class="form-input-wide">
                        <input type="text" class=" form-textbox is_active_v validate[required]" id="is_active_v" readonly="" name="is_active_v" size="30"  />
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

    <form class="update_unit_form" id="update_unit_form" action="<?php echo base_url(); ?>admin_profile/update_unit_details">

        <div class="form-all">
            <ul class="form-section">

                <li id="cid_30" class="form-input-wide">
                    <div class="form-header-group">
                        <h2 id="header_30" class="form-header">
                            Unit Information
                        </h2>
                    </div>
                </li>
                <input type="hidden"  name="edit_unit_id" id="edit_unit_id" />






                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="unit_name">
                        Unit Name<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox unit_name validate[required]" id="unit_name" name="unit_name" size="30"  />
                    </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="unit_code">
                        Unit Code<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox unit_code validate[required]" id="unit_code" name="unit_code" size="30"  />
                    </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="registration_number">
                        Registration Number<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox registration_number validate[required]" id="registration_number" name="registration_number" size="30"  />
                    </div>
                </li>



                <li class="form-line form-line-column" id="id_36">
                    <label class="form-label-top" id="label_36" for="is_active">
                        Is Active ?<span class="form-required">*</span>
                    </label>
                    <div id="cid_36" class="form-input-wide">
                        <select name="is_active_edit" id="is_active_edit">
                            <option id="is_active_edit" value="Active">Active</option>
                            <option id="is_active_edit" value="In Active">In Active</option>
                        </select>   
                    </div>
                </li>


                <li class="form-line" id="id_27">
                    <div id="cid_27" class="form-input-wide">
                        <div style="text-align:left" class="form-buttons-wrapper">
                            <input type="submit" id="update_unit_button" class="update_unit_button" value="Update Unit Details" />	
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

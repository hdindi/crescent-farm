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
        <div>Total Employees To-Date</div>
        <div id="branch_list"></div>
        <span class="notification yellow">$34</span>
    </a>

    <a data-rel="tooltip" title="Total Employees" class="well span3 top-block" href="#">
        <span class="icon32 icon-color icon-star-on"></span>
        <div>Total Units</div>
        <div id="employee_list"></div>
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
            <h2><i class="icon-info-sign"></i> User Details</h2>
            <div class="box-icon">
                <a href="#add_zone" class="btn  btn-round"><i class="icon icon-add"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <div>
                <fieldset>
                    <!-- Edit User Details Begins from here -->

                    <div id="" class="" style="display:none !important;">

                        <div id="add_employee_window" class="add_employee_window">

                            <form id="add_new_employee_form" class="add_new_employee_form">
                                <div class="form-all">
                                    <ul class="form-section">

                                        <li id="cid_30" class="form-input-wide">
                                            <div class="form-header-group">
                                                <h2 id="header_30" class="form-header">
                                                    New Employee Information
                                                </h2>
                                            </div>
                                        </li>
                                        <li class="form-line" id="id_5">
                                            <label class="form-label-top" id="label_5" for="add_f_name">
                                                First Name<span class="form-required">*</span>
                                            </label>
                                            <div id="cid_5" class="form-input-wide">

                                                <input type="text" class="form-number-input add_f_name form-textbox validate[required, Numeric]" id="add_f_name" name="add_f_name" style="width:204px" size="23" maxlength="8" data-type="input-number" />
                                            </div>
                                        </li>





                                        <li class="form-line form-line-column" id="id_6">
                                            <label class="form-label-top" id="label_6" for="add_s_name">
                                                Sur Name<span class="form-required">*</span>
                                            </label>
                                            <div id="cid_6" class="form-input-wide">
                                                <input type="text" class=" form-textbox add_s_name validate[required]" id="add_s_name" name="add_s_name" size="30"  />
                                            </div>
                                        </li>
                                        <li class="form-line form-line-column" id="id_6">
                                            <label class="form-label-top" id="label_6" for="add_o_name">
                                                Other Name<span class="form-required">*</span>
                                            </label>
                                            <div id="cid_6" class="form-input-wide">
                                                <input type="text" class=" form-textbox add_o_name validate[required]" id="add_o_name" name="add_o_name" size="30"  />
                                            </div>
                                        </li>

                                        <li class="form-line form-line-column" id="id_6">
                                            <label class="form-label-top" id="label_6" for="identification_number">
                                                Identification Number<span class="form-required">*</span>
                                            </label>
                                            <div id="cid_6" class="form-input-wide">
                                                <input type="text" class=" form-textbox add_s_name validate[required]" id="identification_number" name="identification_number" size="30"  />
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
                                                    <input type="submit" id="add_employee_button" value="Add New Employee" />	
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




            <div id="employee_table">  
                <div> <a class="add_employee btn btn-success" id="add_employee" href="#add_employee_window">
                        <i class="icon-plus-sign icon-white"></i>  
                        Add Employee                                         
                    </a> </div>
                <div> <a class="export_employee_report btn btn-success" id="export_employee_report" href="<?php echo base_url(); ?>admin_profile/export_employees_report">
                        <i class="icon-plus-sign icon-white"></i>  
                        Export Employees Report
                    </a> </div>
                <table cellpadding="0"  style="width:auto !important;" cellspacing="0" border="0" class="table table-striped table-bordered bootstrap-datatable datatable" id="table_employee">
                    <thead>
                        <tr>


                            <th>First Name:</th>

                            <th>Sur Name:</th>

                            <th> Other Name:</th>
                            <th> Driver Code :</th>
                            <th>Identification Number  :</th>
                            <th>Is Active ? :</th>
                            <th>Date Added :</th>
                            <th>Action</th>



                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($employees as $employees_details): ?>
                            <tr class="odd gradeX">

                                <td class="center" ><?php echo $employees_details['f_name']; ?></td>

                                <td class="center" ><?php echo $employees_details['s_name']; ?></td>

                                <td class="center" ><?php echo $employees_details['other_name']; ?></td>
                                <td class="center" ><?php echo $employees_details['driver_code']; ?></td>

                                <td class="center" ><?php echo $employees_details['identification_no']; ?></td>
                                
                                <?php if($employees_details['is_active']==='Active'){
                                    ?>
                                <td class="center"><span class="label label-success"><?php echo $employees_details['is_active']; ?></span></td>
                                        <?php
                                    
                                } elseif ($employees_details['is_active']==='In Active') {
                                    ?>
                                <td class="center"><span class="label label-important"><?php echo $employees_details['is_active']; ?></span></td>
                                
                                <?php
                                
                            }
?>
                              

                                <td class="center" ><?php echo $employees_details['date_added']; ?></td>




                                <td class="center">
                                    <a class=" view_employee btn btn-success" href="#view_details">
                                        <i class="icon-zoom-in icon-white"></i>  
                                        View                                            
                                    </a>
                                    <a class=" edit_employee btn btn-info" href="#edit_details">
                                        <i class="icon-edit icon-white"></i>  
                                        Edit                                            
                                    </a>
                                    <a class=" delete_employee btn btn-danger" href="#delete_details">
                                        <i class="icon-trash icon-white"></i> 
                                        Delete
                                    </a>

                                    <input type="hidden" id="employee_id" name="employee_id" value="<?php echo $employees_details['employee_id']; ?>" />

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




<fieldset id="delete_details" style="display:none !important;">



    <p>Are you sure you want to delete the Specified Employee? <hr>
    <li>
        <?php
// Change the css classes to suit your needs    

        $attributes = array('class' => '', 'id' => '');
        echo form_open('admin_profile/delete_employee', $attributes);
        ?>

        <input type="hidden"  name="employee_id_delete" id="employee_id_delete" readonly />
        <button class="btn btn-mini yes"  id="yes" >Yes</button>

        <!--</form>-->
        <?php echo form_close(); ?>
    </li> <li> <button class="btn btn-mini no" id="employee_no"  >No</button> </li> 
</p>






</fieldset>









<!-- View User Details Begins from here -->

<div id="view_details" style="display:none !important;">

    <div class="form-all">
        <ul class="form-section">

            <li id="cid_30" class="form-input-wide">
                <div class="form-header-group">
                    <h2 id="header_30" class="form-header">
                        User Information
                    </h2>
                </div>
            </li>
            <input type="hidden"  name="employee_id_v" id="employee_id_v" />
            





            <li class="form-line form-line-column" id="id_6">
                <label class="form-label-top" id="label_6" for="f_name_v">
                    First Name<span class="form-required">*</span>
                </label>
                <div id="cid_6" class="form-input-wide">
                    <input type="text" class=" form-textbox f_name_v validate[required]" id="f_name_v" readonly="" name="f_name_v" size="30"  />
                </div>
            </li>
            <li class="form-line form-line-column" id="id_6">
                <label class="form-label-top" id="label_6" for="s_name_v">
                    Sur Name<span class="form-required">*</span>
                </label>
                <div id="cid_6" class="form-input-wide">
                    <input type="text" class=" form-textbox s_name_v validate[required]" id="s_name_v" readonly="" name="s_name_v" size="30"  />
                </div>
            </li>
            <li class="form-line form-line-column" id="id_6">
                <label class="form-label-top" id="label_6" for="other_name_v">
                    Other Name<span class="form-required">*</span>
                </label>
                <div id="cid_6" class="form-input-wide">
                    <input type="text" class=" form-textbox other_name_v validate[required]" id="other_name_v" readonly="" name="other_name_v" size="30"  />
                </div>
            </li>
             <li class="form-line form-line-column" id="id_6">
                <label class="form-label-top" id="label_6" for="other_name_v">
                    Driver Code<span class="form-required">*</span>
                </label>
                <div id="cid_6" class="form-input-wide">
                    <input type="text" class=" form-textbox driver_code_v validate[required]" id="driver_code_v" readonly="" name="driver_code_v" size="30"  />
                </div>
            </li>
            <li class="form-line form-line-column" id="id_6">
                <label class="form-label-top" id="label_6" for="identification_number_v">
                    Identification Number<span class="form-required">*</span>
                </label>
                <div id="cid_6" class="form-input-wide">
                    <input type="text" class=" form-textbox identification_number_v validate[required]" id="identification_number_v" readonly="" name="identification_number_v" size="30"  />
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





    <p class="center">

    </p>
    <div class="clearfix"></div>
</div>
<!--  End of View Employee Details -->



















<!-- Edit User Details Begins from here -->

<div id="edit_details" style="display:none !important;">

    <form class="update_employee_form" id="update_employee_form" action="<?php echo base_url(); ?>admin_profile/update_employee_details">

        <div class="form-all">
            <ul class="form-section">

                <li id="cid_30" class="form-input-wide">
                    <div class="form-header-group">
                        <h2 id="header_30" class="form-header">
                            User Information
                        </h2>
                    </div>
                </li>
                <input type="hidden"  name="edit_employee_id" id="edit_employee_id" />
               





                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="f_name">
                        First Name<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox f_name validate[required]" id="f_name" name="f_name" size="30"  />
                    </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="s_name">
                        Sur Name<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox zone_rate validate[required]" id="s_name" name="s_name" size="30"  />
                    </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="other_name">
                        Other Name<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox zone_rate validate[required]" id="other_name" name="other_name" size="30"  />
                    </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="driver_code">
                         Driver Code<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox driver_code validate[required]" id="driver_code" name="driver_code" size="30"  />
                    </div>
                </li>
                <li class="form-line form-line-column" id="id_6">
                    <label class="form-label-top" id="label_6" for="identification_no">
                        Identification  Number<span class="form-required">*</span>
                    </label>
                    <div id="cid_6" class="form-input-wide">
                        <input type="text" class=" form-textbox identification_no validate[required]" id="identification_no" name="identification_no" size="30"  />
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
                            <input type="submit" id="update_employee_button" class="update_employee_button" value="Update Employee Details" />	
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
<!--  End of Edit Employee Details -->





<?php
$this->load->view('footer');
?>

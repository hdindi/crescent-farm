<?php
$this->load->view('header');
?>

<div>
    <ul class="breadcrumb">
        <li>
            <a href="<?php base_url(); ?>crescenthome">Home</a> <span class="divider">/</span>
        </li>
        <li>
            <a href="<?php base_url(); ?>crescenthome">Daily Operations</a>
        </li>
    </ul>
</div>



<div class="row-fluid sortable">
    <div class="box span12">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-edit"></i> Daily Fuel Usage</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        
        
        
        
        <div class="box-content">
            <form id="save_fuel_used_form" action="<?php echo base_url(); ?>operations/operations_data" method="post" class="form-horizontal save_fuel_used_form operations_data_form">
                <fieldset>
                    <legend>Daily Operations Data Feeder Form</legend>
                    
                    
                    <div class="control-group">
                        <label class="control-label" for="date01"> Date : </label>
                        <div class="controls">
                            <input type="text" class="input-xlarge datepicker" name="date" id="date01" >
                        </div>
                    </div>
                    
                    
                    <div class="control-group">
                        <label class="control-label" for="selectError">Unit Code: </label>
                        <div class="controls">
                            <select id="selectError" name="unit_code" data-rel="chosen">
                                <?php foreach ($units as $unit) {
                                    ?>
                                <option name="unit_code" value="<?php echo $unit['unit_code']; ?>"><?php echo $unit['unit_code']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="selectError1">Driver Code :</label>
                        <div class="controls">
                            <select id="" name="driver_code"  data-rel="chosen">
                                <?php foreach ($drivers as $driver) {
                                    ?>
                                    <option name="driver_code" value="<?php echo $driver['driver_code']; ?>"><?php echo $driver['driver_code']; ?>(<?php echo $driver['f_name']; ?>.<?php echo $driver['s_name']; ?>.<?php echo $driver['other_name']; ?>)</option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>



                    <div class="control-group">
                        <label class="control-label" for="selectError2"> Fuel Type: </label>
                        <div class="controls">
                            <select data-placeholder="Please select Fuel Type" name="fuel_type" id="" data-rel="chosen">
                                <option value=""></option>
                                <?php foreach ($fuel as $fuel_details) {
                                    
                                ?>
                                <option name="fuel_type" value="<?php echo $fuel_details['fuel_name']; ?>"><?php echo $fuel_details['fuel_name']; ?></option>
                                <?php
                                    }
                                ?>


                            </select>
                        </div>
                    </div>
                    


                    
                    

                    <div class="control-group">
                        <label class="control-label" for="focusedInput">Litres :</label>
                        <div class="controls">
                            <input class="input-xlarge focused" id="focusedInput" name="litres" type="number" placeholder="Fuel in Litres" >
                        </div>
                    </div>



                    <div class="control-group">
                        <label class="control-label" for="focusedInput">K.m Covered :</label>
                        <div class="controls">
                            <input class="input-xlarge focused" id="focusedInput" name="km" type="number" placeholder="K.m Covered">
                        </div>
                    </div>

                    



                    <div class="form-actions">
                        <button type="submit" id="save_fuel_used_button" class="btn btn-primary save_fuel_used_button ">Save Data</button>
                        <button type="reset" class="btn">Cancel</button>
                    </div>
                </fieldset>
            </form>   

        </div>
        
        
        
        
        
        
        
        
        
        
        
    </div><!--/span-->

</div><!--/row-->



<?php
$this->load->view('footer');
?>

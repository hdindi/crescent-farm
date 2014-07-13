<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Operations extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->database();
        $this->load->helper('form');
        $this->load->helper('security');
        $this->load->helper('url');
    }
    
    
    public function base() {
        $base = base_url();
        echo 'Base Url :  '.$base.'</br>';
        
    }

    public function index() {

        $data['zones'] = $this->get_zone_name();
        $data['units'] = $this->get_unit_code();
        $data['drivers'] = $this->get_driver_code();

        $this->load->view('daily_operations', $data);
    }

    public function get_zone_name() {
        $sql = "SELECT * FROM ZONE WHERE zone.is_active='Active'";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function get_fuel() {
        $sql = "SELECT * FROM fuel";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function get_unit_code() {
        $sql = "SELECT * FROM unit WHERE unit.is_active='Active'";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function get_driver_code() {
        $sql = "SELECT * FROM employees WHERE driver_code IS NOT NULL";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function operations_data() {
        $this->get_zone_rate();
        $this->save_operations_data();
    }

    public function get_zone_rate() {
        $zone_name = $this->input->post('zone_name');
        $sql = "SELECT * FROM ZONE WHERE ZONE.is_active='Active' and zone.zone_name='$zone_name'";
        $sql = $this->db->query($sql);
        foreach ($sql->result() as $value) {
            //echo 'Rate ---->>>>'. $value->zone_rate.'</br>';
            return $value->zone_rate;
        }
    }

    public function get_standard_tonne_rate() {
        $sql = "SELECT standard_tonne_amount FROM standard_tonne";
        $sql = $this->db->query($sql);
        foreach ($sql->result() as $value) {
            //echo 'Rate ---->>>>'. $value->zone_rate.'</br>';
            return $value->standard_tonne_amount;
        }
    }

    public function get_bonus_amount() {
        $sql = "SELECT bonus_amount FROM bonus_amount";
        $sql = $this->db->query($sql);
        foreach ($sql->result() as $value) {
            //echo 'Rate ---->>>>'. $value->zone_rate.'</br>';
            return $value->bonus_amount;
        }
    }

    public function save_operations_data() {

        $zone_name = $this->input->post('zone_name');
        $unit_code = $this->input->post('unit_code');
        $drive_code = $this->input->post('driver_code');
        $weighbridgeticketnumber = $this->input->post('weigh_bridge_ticket_number');
        $tonnage = $this->input->post('tonnage');
        $date = $this->input->post('date');
        $zone_rate = $this->get_zone_rate();
        //echo 'Zone Rate'.$zone_rate.'</br>';
        $zone_rate = floatval($zone_rate);
        $tonnage = floatval($tonnage);
        $total_amount = $zone_rate * $tonnage;
        $standard_tonne_rate = $this->get_standard_tonne_rate();
        $bonus_amount = $this->get_bonus_amount();
        $user_id = $this->session->userdata('id');

        $this->db->trans_start();
        $data = array(
            'delivery_date' => $date,
            'delivery_no' => $weighbridgeticketnumber,
            'unit_code' => $unit_code,
            'driver_code' => $drive_code,
            'tonnage' => $tonnage,
            'amount' => $total_amount,
            'zone_name' => $zone_name,
            'zone_rate' => $zone_rate,
            'user_id' => $user_id,
            'standard_tonne' => $standard_tonne_rate,
            'bonus_amount' => $bonus_amount
        );
        $this->db->insert('delivery', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function view_operations_data() {
        $data['zones'] = $this->get_zone_name();
        $data['units'] = $this->get_unit_code();
        $data['drivers'] = $this->get_driver_code();
        $data['operations_data'] = $this->get_operations_data();
        $this->load->view('operatons_data_v', $data);
    }

    public function get_operations_data() {
        $sql = "SELECT * FROM delivery";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function daily_operation_report() {
        $data['daily_operation_report'] = $this->get_daily_operation_report();
        $this->load->view('daily_operation_report_v', $data);
    }

    public function get_daily_operation_report() {
        $sql = "SELECT delivery.delivery_id,delivery.delivery_date,delivery.delivery_no,"
                . "delivery.unit_code,delivery.driver_code,delivery.tonnage,delivery.amount,"
                . "delivery.date_added,delivery.user_id,users.f_name,users.s_name,users.other_name, "
                . "unit.unit_name,unit.registration_number, employees.f_name,employees.s_name FROM delivery "
                . "INNER JOIN users ON users.user_id = delivery.user_id INNER JOIN unit ON unit.unit_code = "
                . "delivery.unit_code INNER JOIN employees ON employees.driver_code = delivery.driver_code";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function get_delivery_details() {
        $delivery_details = $this->get_delivery_datails_data();
        if (empty($delivery_details)) {
            
        } else {
            echo json_encode($delivery_details);
        }
    }

    public function get_delivery_datails_data() {
        $delivery_id = $this->uri->segment(3);

        $sql = "SELECT * FROM delivery WHERE delivery.delivery_id='$delivery_id'";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function update_delivery_details() {

        $this->update_delivery_data();
        $this->get_update_zone_rate();
    }

    public function update_delivery_data() {


        $this->db->trans_start();
        $edit_delivery_id = $this->input->post('edit_delivery_id');
        $edit_unit_code = $this->input->post('edit_unit_code');
        $edit_driver_code = $this->input->post('edit_driver_code');
        $edit_zone_name = $this->input->post('edit_zone_name');
        $weigh_bridge_ticket_number = $this->input->post('weigh_bridge_ticket_number');
        $edit_tonnage = $this->input->post('edit_tonnage');
        $edit_delivery_date = $this->input->post('edit_delivery_date');
        $zone_rate = $this->get_update_zone_rate();
        //echo 'Zone Rate'.$zone_rate.'</br>';
        $zone_rate = floatval($zone_rate);
        $tonnage = floatval($edit_tonnage);
        $total_amount = $zone_rate * $tonnage;
        $user_id = $this->session->userdata('id');
        $data = array(
            'delivery_date' => $edit_delivery_date,
            'delivery_no' => $weigh_bridge_ticket_number,
            'unit_code' => $edit_unit_code,
            'driver_code' => $edit_driver_code,
            'tonnage' => $edit_tonnage,
            'amount' => $total_amount,
            'user_id' => $user_id
        );
        $this->db->where('delivery_id', $edit_delivery_id);
        $this->db->update('delivery', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function get_update_zone_rate() {
        $zone_name = $this->input->post('edit_zone_name');
        $sql = "SELECT * FROM ZONE WHERE ZONE.is_active='Active' and zone.zone_name='$zone_name'";
        $sql = $this->db->query($sql);
        foreach ($sql->result() as $value) {
            //echo 'Rate ---->>>>'. $value->zone_rate.'</br>';
            return $value->zone_rate;
        }
    }

    public function fuel_usage() {
        $data['fuel'] = $this->get_fuel();
        $data['units'] = $this->get_unit_code();
        $data['drivers'] = $this->get_driver_code();
        $this->load->view('fuel_usage_v', $data);
    }

    public function add_fuel_usage() {
        $this->db->trans_start();
        $date = $this->input->post('date');
        $unit_code = $this->input->post('unit_code');
        $driver_code = $this->input->post('driver_code');
        $fuel_type = $this->input->post('fuel_type');
        $litres = $this->input->post('litres');
        $litres = floatval($litres);
        $km_covered = $this->input->post('km');
        $km_covered = floatval($km_covered);
        $user_id = $this->session->userdata('id');
        $litre_per_km = 1;
        $litre_per_km = floatval($litre_per_km);
        $actual_fuel_used = $km_covered * $litre_per_km;
        $actual_fuel_used = floatval($actual_fuel_used);
        $fuel_variance = $litres - $actual_fuel_used;
        $data = array(
            'date' => $date,
            'unit_code' => $unit_code,
            'driver_code' => $driver_code,
            'fuel_type' => $fuel_type,
            'estimated_fuel_used' => $litres,
            'km_covered' => $km_covered,
            'actual_fuel_used' => $actual_fuel_used,
            'user_id' => $user_id,
            'fuel_variance' => $fuel_variance
        );
        $this->db->insert('fuel_usage', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function get_fuel_usage_details() {
        $data['fuel_usage'] = $this->get_fuel_usage_datails_1();
        $data['fuel'] = $this->get_fuel();
        $data['units'] = $this->get_unit_code();
        $data['drivers'] = $this->get_driver_code();
        $this->load->view('fuel_usage_details_v', $data);
    }

    public function get_fuel_usage_datails_1() {
        $sql = "SELECT * FROM fuel_usage";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function get_fuel_usage_detail() {
        $details = $this->get_fuel_usage_detailsss();
        if (empty($details)) {
            
        } else {


            echo json_encode($details);
        }
    }

    public function get_fuel_usage_detailsss() {
        $fuel_usage_id = $this->uri->segment(3);
        $sql = "SELECT * FROM fuel_usage WHERE fuel_usage_id='$fuel_usage_id'";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function update_fuel_usage_details() {
        $this->db->trans_start();

        $fuel_usage_id = $this->input->post('edit_fuel_usage_details_id');
        $unit_code = $this->input->post('edit_unit_code');
        $driver_code = $this->input->post('edit_driver_code');
        $fuel_type = $this->input->post('edit_fuel_type');
        $litres = $this->input->post('edit_litres');
        $km_covered = $this->input->post('edit_km_covered');
        $date = $this->input->post('edit_fuel_usage_details_date');
        $user_id = $this->session->userdata('id');
        $litre_per_km = 1;
        $litre_per_km = floatval($litre_per_km);
        $actual_fuel_used = $km_covered * $litre_per_km;
        $actual_fuel_used = floatval($actual_fuel_used);
        $fuel_variance = $litres - $actual_fuel_used;
        $data = array(
            'unit_code' => $unit_code,
            'driver_code' => $driver_code,
            'fuel_type' => $fuel_type,
            'estimated_fuel_used' => $litres,
            'km_covered' => $km_covered,
            'actual_fuel_used' => $actual_fuel_used,
            'date' => $date,
            'fuel_variance' => $fuel_variance
        );
        $this->db->where('fuel_usage_id', $fuel_usage_id);
        $this->db->update('fuel_usage', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function fuel_usage_management_report() {

        $data['fuel_usage'] = $this->fuel_usage_management_report_1();
        $this->load->view('fuel_usage_report_v', $data);
    }

    public function fuel_usage_management_report_1() {
        $sql = "SELECT fuel_usage.fuel_type,fuel_usage.date,fuel_usage.unit_code,fuel_usage.driver_code,fuel_usage.actual_fuel_used,fuel_usage.estimated_fuel_used,fuel_usage.fuel_variance,fuel_usage.km_covered,fuel_usage.date_added,users.user_name FROM `fuel_usage` inner join users on users.user_id = fuel_usage.user_id";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function fuel_stock_data() {
        $data['fuel'] = $this->get_fuel();
        $data['units'] = $this->get_unit_code();
        $data['drivers'] = $this->get_driver_code();
        $data['stock'] = $this->get_stock();
        $data['stock_movement'] = $this->get_stock_movement();
        $data['delivery_note_no'] = $this->get_delivery_note_no();
        $data['batch_number'] = $this->get_batch_number();
        $this->load->view('fuel_stock_data_v', $data);
    }

    public function get_stock() {
        $sql = "SELECT * FROM STOCK";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function get_stock_movement() {
        $sql = "SELECT * FROM STOCK_MOVEMENT";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function get_max_batch_number() {
        $sql = "SELECT MAX(batch_number) as batch_number FROM stock";
        $sql = $this->db->query($sql);
        foreach ($sql->result() as $value) {
            //echo 'Batch Number ---->>>>' . $value->batch_number . '</br>';
            return $value->batch_number;
        }
    }

    public function add_received_stock() {
        $this->db->trans_start();
        $last_inserted_batch_number = $this->get_max_batch_number();
        $number_one = 1;
        $new_batch_number = $last_inserted_batch_number + $number_one;
        $name_of_receiver = $this->input->post('name_of_receiver');
        $delivery_note_no = $this->input->post('delivery_note_no');
        $quantity_received = $this->input->post('quantity_received');
        $received_date = $this->input->post('received_date');
        $received_fuel_name = $this->input->post('received_fuel_name');
        $user_id = $this->session->userdata('id');
        $data = array(
            'receiver_name' => $name_of_receiver,
            'delivery_note_no' => $delivery_note_no,
            'quantity_received' => $quantity_received,
            'date' => $received_date,
            'fuel_name' => $received_fuel_name,
            'quantity_remaining' => $quantity_received,
            'batch_number' => $new_batch_number,
            'user_id' => $user_id
        );
        $this->db->insert('stock', $data);
        $stock_id = $this->db->insert_id();
        $n_a = "N/A";
        $year = date('Y');
        $month = date('F');
        $zero = 0;
        $quantity_received = intval($quantity_received);
        $zero = intval($zero);
        $closing_balance = $quantity_received - $zero;
        $user_id = $this->session->userdata('id');
        $data1 = array(
            'unit_code' => $n_a,
            'driver_code' => $n_a,
            'delivery_no' => $delivery_note_no,
            'month' => $month,
            'year' => $year,
            'opening_bal' => $quantity_received,
            'issue' => $zero,
            'closing_bal' => $closing_balance,
            'stock_id' => $stock_id,
            'stock_movement_id' => $zero,
            'user_id' => $user_id
        );
        $this->db->insert('fuel_stock_movement_bin', $data1);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function get_delivery_note_no() {
        $sql = "SELECT * FROM STOCK WHERE quantity_remaining >0";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function get_batch_number() {
        $sql = "SELECT * FROM STOCK WHERE quantity_remaining >0";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function add_issued_stock() {
        $this->get_quantity_remaining();
        $this->insert_issued_stock();
        $this->get_stock_id();
    }

    public function get_quantity_remaining() {
        $issued_batch_number = $this->input->post('issue_batch_number');
        $sql = "SELECT quantity_remaining FROM stock WHERE batch_number='$issued_batch_number'";
        $sql = $this->db->query($sql);
        foreach ($sql->result() as $value) {
            //echo 'Batch Number ---->>>>' . $value->quantity_remaining . '</br>';
            return $value->quantity_remaining;
        }
    }

    public function get_stock_id() {
        $issued_batch_number = $this->input->post('issue_batch_number');
        $sql = "SELECT stock_id FROM stock WHERE batch_number='$issued_batch_number'";
        $sql = $this->db->query($sql);
        foreach ($sql->result() as $value) {
            //echo 'Stock Id ---->>>>' . $value->stock_id . '</br>';
            return $value->stock_id;
        }
    }

    public function insert_issued_stock() {
        $this->db->trans_start();
        $issue_date = $this->input->post('issue_date');
        $issue_unit_code = $this->input->post('issue_unit_code');
        $issue_driver_code = $this->input->post('issue_driver_code');
        $issue_fuel_name = $this->input->post('issue_fuel_name');
        $issue_delivery_note_no = $this->input->post('issue_delivery_note_no');
        $issued_batch_number = $this->input->post('issue_batch_number');
        $quantity_issued = $this->input->post('quantity_issued');
        $main_stock_quantity_remaining = $this->get_quantity_remaining();
        $updated_remaining_stock_quantity = $main_stock_quantity_remaining - $quantity_issued;
        $user_id = $this->session->userdata('id');
        $data = array(
            'date' => $issue_date,
            'unit_code' => $issue_unit_code,
            'driver_code' => $issue_driver_code,
            'fuel_name' => $issue_fuel_name,
            'delivery_note_no' => $issue_delivery_note_no,
            'quantity_issued' => $quantity_issued,
            'batch_number' => $issued_batch_number,
            'user_id' => $user_id
        );
        $this->db->insert('stock_movement', $data);
        $stock_movement_id = $this->db->insert_id();
        $stock_id = $this->get_stock_id();
        $data2 = array(
            'quantity_remaining' => $updated_remaining_stock_quantity,
            'user_id' => $user_id
        );
        $this->db->where('batch_number', $issued_batch_number);
        $this->db->update('stock', $data2);
        $month = date('F');
        $year = date('Y');
        $data3 = array(
            'unit_code' => $issue_unit_code,
            'driver_code' => $issue_driver_code,
            'delivery_no' => $issue_delivery_note_no,
            'month' => $month,
            'year' => $year,
            'opening_bal' => $main_stock_quantity_remaining,
            'issue' => $quantity_issued,
            'closing_bal' => $updated_remaining_stock_quantity,
            'stock_id' => $stock_id,
            'stock_movement_id' => $stock_movement_id,
            'user_id' => $user_id
        );
        $this->db->insert('fuel_stock_movement_bin', $data3);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function get_received_stock_details() {
        $received_stock_details = $this->get_received_stock_details1();
        if (empty($received_stock_details)) {
            
        } else {
            echo json_encode($received_stock_details);
        }
    }

    public function get_received_stock_details1() {
        $stock_id = $this->uri->segment(3);
        $sql = "SELECT * FROM STOCK where STOCK.stock_id='$stock_id'";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function get_issued_stock_details() {
        $received_stock_details = $this->get_issued_stock_details1();
        if (empty($received_stock_details)) {
            
        } else {
            echo json_encode($received_stock_details);
        }
    }

    public function get_issued_stock_details1() {
        $stock_movement_id = $this->uri->segment(3);
        $sql = "SELECT * from stock_movement where stock_movement_id='$stock_movement_id'";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function get_main_stock_quantity_remaining() {
        $issued_batch_number = $this->input->post('edit_issue_batch_number');
        $sql = "SELECT quantity_remaining FROM stock WHERE batch_number='$issued_batch_number'";
        $sql = $this->db->query($sql);
        foreach ($sql->result() as $value) {
            //echo 'Stock Id ---->>>>' . $value->quantity_remaining . '</br>';
            return $value->quantity_remaining;
        }
    }

    public function get_stock_movement_quantity_remaining() {
        $stock_movement_id = $this->input->post('edit_issue_stock_movement_id');
        $sql = "SELECT quantity_issued FROM stock_movement WHERE stock_movement_id='$stock_movement_id'";
        $sql = $this->db->query($sql);
        foreach ($sql->result() as $value) {
           // echo 'Stock Id ---->>>>' . $value->quantity_issued . '</br>';
            return $value->quantity_issued;
        }
    }

    public function update_issued_stock() {
        $this->update_issued_stock_1();
        $this->get_stock_movement_quantity_remaining();
        $this->get_main_stock_quantity_remaining();
    }

    public function update_issued_stock_1() {
        $this->db->trans_start();
        $edit_issue_stock_movement_id = $this->input->post('edit_issue_stock_movement_id');
        $edit_issue_received_date = $this->input->post('edit_issue_received_date');
        $edit_issue_unit_code = $this->input->post('edit_issue_unit_code');
        $edit_issue_driver_code = $this->input->post('edit_issue_driver_code');
        $edit_issue_fuel_name = $this->input->post('edit_issue_fuel_name');
        $edit_issue_delivery_note_no = $this->input->post('edit_issue_delivery_note_no');
        $edit_issue_batch_number = $this->input->post('edit_issue_batch_number');
        $edit_quantity_issued = $this->input->post('edit_quantity_issued');
        $stock_movement_quantity_remaining = $this->get_stock_movement_quantity_remaining();
        $main_stock_quantity_remaining = $this->get_main_stock_quantity_remaining();
        $month = date('F');
        $year = date('Y');
        $user_id = $this->session->userdata('id');
        if ($edit_quantity_issued === $stock_movement_quantity_remaining) {
            $data = array(
                'batch_number' => $edit_issue_batch_number,
                'delivery_note_no' => $edit_issue_delivery_note_no,
                'driver_code' => $edit_issue_driver_code,
                'fuel_name' => $edit_issue_fuel_name,
                'date' => $edit_issue_received_date,
                'unit_code' => $edit_issue_unit_code,
                'quantity_issued' => $edit_quantity_issued,
                'user_id' => $user_id
            );
            $this->db->where('stock_movement_id', $edit_issue_stock_movement_id);
            $this->db->update('stock_movement', $data);
            $month = date('F');
            $year = date('Y');



            $data2 = array(
                'unit_code' => $edit_issue_unit_code,
                'driver_code' => $edit_issue_driver_code,
                'delivery_no' => $edit_issue_delivery_note_no,
                'month' => $month,
                'year' => $year,
                'user_id' => $user_id
            );
            $this->db->where('stock_movement_id', $edit_issue_stock_movement_id);
            $this->db->update('fuel_stock_movement_bin', $data2);
        } elseif ($edit_quantity_issued != $stock_movement_quantity_remaining) {

            $stock = $stock_movement_quantity_remaining + $main_stock_quantity_remaining;


            $main_stock_quantity = $stock - $edit_quantity_issued;

            $data3 = array(
                'quantity_remaining' => $main_stock_quantity,
                'user_id' => $user_id
            );
            $this->db->where('batch_number', $edit_issue_batch_number);
            $this->db->update('stock', $data3);
            $data4 = array(
                'unit_code' => $edit_issue_unit_code,
                'driver_code' => $edit_issue_driver_code,
                'delivery_note_no' => $edit_issue_delivery_note_no,
                'quantity_issued' => $edit_quantity_issued,
                'fuel_name' => $edit_issue_fuel_name,
                'batch_number' => $edit_issue_batch_number,
                'date' => $edit_issue_received_date,
                'user_id' => $user_id
            );
            $this->db->where('stock_movement_id', $edit_issue_stock_movement_id);
            $this->db->update('stock_movement', $data4);

            $data4 = array(
                'batch_number' => $edit_issue_batch_number,
                'delivery_no' => $edit_issue_delivery_note_no,
                'driver_code' => $edit_issue_driver_code,
                'fuel_name' => $edit_issue_fuel_name,
                'date' => $edit_issue_received_date,
                'unit_code' => $edit_issue_unit_code,
                'opening_bal' => $stock,
                'issue' => $edit_quantity_issued,
                'closing_bal' => $main_stock_quantity,
                'month' => $month,
                'year' => $year,
                'user_id' => $user_id
            );

            $this->db->where('stock_movement_id', $edit_issue_stock_movement_id);
            $this->db->update('fuel_stock_movement_bin', $data4);
        }


        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function update_received_stock() {
        $this->db->trans_start();
        $edit_name_of_receiver = $this->input->post('edit_name_of_receiver');
        $edit_delivery_note_no = $this->input->post('edit_delivery_note_no');
        $edit_quantity_received = $this->input->post('edit_quantity_received');
        $edit_received_date = $this->input->post('edit_received_date');
        $edit_received_fuel_name = $this->input->post('edit_received_fuel_name');
        $edit_stock_id = $this->input->post('edit_stock_id');
        $user_id = $this->session->userdata('id');

        $data = array(
            'receiver_name' => $edit_name_of_receiver,
            'delivery_note_no' => $edit_delivery_note_no,
            'date' => $edit_received_date,
            'quantity_remaining' => $edit_quantity_received,
            'fuel_name' => $edit_received_fuel_name,
            'user_id' => $user_id
        );
        $this->db->where('stock_id', $edit_stock_id);
        $this->db->update('stock', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function stock_movement_report() {

        $data['fuel_stocks'] = $this->stock_movement_report_data();
        $this->load->view('stock_movement_report_v', $data);
    }

    public function stock_movement_report_excel() {

        $data['fuel_stocks'] = $this->stock_movement_report_data();
        $this->load->view('stock_movement_report_excel_v', $data);
    }

    public function excel_export() {
        $this->load->library('excel');
        $objReader = PHPExcel_IOFactory::createReader('HTML');
        $excel_report = $this->stock_movement_report_excel();
        $objPHPExcel = $objReader->load($excel_report);

        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $objWriter->save("myExcelFile.xlsx");
    }

    public function stock_movement_report_data() {
        $sql = "SELECT * FROM FUEL_STOCK_MOVEMENT_BIN INNER JOIN USERS ON USERS.USER_ID = FUEL_STOCK_MOVEMENT_BIN.USER_ID";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function exportResults() {

        $this->load->database();
        $query = $this->db->query("
        SELECT * FROM fuel_usage LIMIT 10");
        $results = $query->result_array();
        //$objPHPExcel = new Excel();
//load our new PHPExcel library
        $this->load->library('excel');



        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Fuel Usage Report');
        $this->excel->getActiveSheet()->SetCellValue('A1', "DATE");
        $this->excel->getActiveSheet()->SetCellValue('B1', "UNIT CODE");
        $this->excel->getActiveSheet()->SetCellValue('C1', "DRIVER CODE");
        $this->excel->getActiveSheet()->SetCellValue('D1', "FUEL TYPE");
        $this->excel->getActiveSheet()->SetCellValue('E1', "FUEL USED");
        $this->excel->getActiveSheet()->SetCellValue('F1', "ESTIMATED FUEL");
        $this->excel->getActiveSheet()->SetCellValue('G1', "FUEL VARIANCE");
        $this->excel->getActiveSheet()->SetCellValue('H1', "KM COVERED");



        $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);

        $author = $this->session->userdata('user_name');

        $this->excel->getActiveSheet()->getComment('G1')->setAuthor('System Report');
        $this->excel->getActiveSheet()->getComment('G1')->getText()->createTextRun('System Report');

        //$this->excel->getFont()->setBold(true);

        $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);

        $this->excel->getActiveSheet()->getComment('G1')->getText()->createTextRun("\r\n");

        $this->excel->getActiveSheet()->getComment('G1')->getText()->createTextRun('Fuel Variance(Difference between fuel used and budgeted fuel)');





        $i = 2;
        foreach ($results as $result) {

            $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["date"]);
            $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["unit_code"]);
            $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["driver_code"]);
            $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["fuel_type"]);
            $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["actual_fuel_used"]);
            $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["estimated_fuel_used"]);
            $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["fuel_variance"]);
            $this->excel->getActiveSheet()->SetCellValue('H' . $i, $result["km_covered"]);




            $objConditional1 = new PHPExcel_Style_Conditional();
            $objConditional1->setConditionType(PHPExcel_Style_Conditional::CONDITION_CELLIS);
            $objConditional1->setOperatorType(PHPExcel_Style_Conditional::OPERATOR_LESSTHAN);
            $objConditional1->addCondition('0');
            $objConditional1->getStyle()->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_RED);
            $objConditional1->getStyle()->getFont()->setBold(true);

            $objConditional2 = new PHPExcel_Style_Conditional();
            $objConditional2->setConditionType(PHPExcel_Style_Conditional::CONDITION_CELLIS);
            $objConditional2->setOperatorType(PHPExcel_Style_Conditional::OPERATOR_GREATERTHANOREQUAL);
            $objConditional2->addCondition('0');
            $objConditional2->getStyle()->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_GREEN);
            $objConditional2->getStyle()->getFont()->setBold(true);

            $conditionalStyles = $this->excel->getActiveSheet()->getStyle('G' . $i)->getConditionalStyles();
            array_push($conditionalStyles, $objConditional1);
            array_push($conditionalStyles, $objConditional2);
            $this->excel->getActiveSheet()->getStyle('G' . $i)->setConditionalStyles($conditionalStyles);

            $i++;
        }




        $filename = "just_some_random_name.xlsx";
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename=' . $filename);

        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');



        $objWriter->save('php://output');

        $this->excel->disconnectWorksheets();
    }

    public function delivery_report() {
        $data['delivery_data'] = $this->delivery_report_data();
        $this->load->view('delivery_data_v', $data);
    }

    public function delivery_report_data() {
        $sql = "SELECT delivery.delivery_date,delivery.delivery_no,delivery.unit_code,delivery.driver_code,"
                . "delivery.zone_name,delivery.zone_rate,delivery.tonnage,delivery.amount,delivery.date_added,"
                . "users.user_name FROM DELIVERY INNER JOIN USERS ON USERS.USER_ID = DELIVERY.USER_ID";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function export_delivery_report() {







        $this->load->database();
        $query = $this->db->query("SELECT fuel_usage.fuel_type,fuel_usage.date,fuel_usage.unit_code,fuel_usage.driver_code,fuel_usage.actual_fuel_used,fuel_usage.estimated_fuel_used,fuel_usage.fuel_variance,fuel_usage.km_covered,fuel_usage.date_added,users.user_name FROM `fuel_usage` inner join users on users.user_id = fuel_usage.user_id");
        $results = $query->result_array();
        //$objPHPExcel = new Excel();
//load our new PHPExcel library
        $this->load->library('excel');



        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Fuel Usage Report');
        $this->excel->getActiveSheet()->SetCellValue('A1', "Unit Code");
        $this->excel->getActiveSheet()->SetCellValue('B1', "Driver Code ");
        $this->excel->getActiveSheet()->SetCellValue('C1', "Fuel Type");
        $this->excel->getActiveSheet()->SetCellValue('D1', "Fuel Issued");
        $this->excel->getActiveSheet()->SetCellValue('E1', "Fuel Used");
        $this->excel->getActiveSheet()->SetCellValue('F1', "Fuel Variance");

        $this->excel->getActiveSheet()->SetCellValue('G1', "Km Covered");
        $this->excel->getActiveSheet()->SetCellValue('H1', "Issue Date");
        $this->excel->getActiveSheet()->SetCellValue('I1', "Transaction Date");
        $this->excel->getActiveSheet()->SetCellValue('J1', "Transaction By");



        $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);




        $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setBold(true);





        $i = 2;
        foreach ($results as $result) {

            $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["unit_code"]);
            $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["driver_code"]);
            $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["fuel_type"]);
            $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["estimated_fuel_used"]);
            $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["actual_fuel_used"]);
            $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["fuel_variance"]);
            $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["km_covered"]);
            $this->excel->getActiveSheet()->SetCellValue('H' . $i, $result["date"]);
            $this->excel->getActiveSheet()->SetCellValue('I' . $i, $result["date_added"]);
            $this->excel->getActiveSheet()->SetCellValue('J' . $i, $result["user_name"]);



            $objConditional1 = new PHPExcel_Style_Conditional();
            $objConditional1->setConditionType(PHPExcel_Style_Conditional::CONDITION_CELLIS);
            $objConditional1->setOperatorType(PHPExcel_Style_Conditional::OPERATOR_LESSTHAN);
            $objConditional1->addCondition('0');
            $objConditional1->getStyle()->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_RED);
            $objConditional1->getStyle()->getFont()->setBold(true);

            $objConditional2 = new PHPExcel_Style_Conditional();
            $objConditional2->setConditionType(PHPExcel_Style_Conditional::CONDITION_CELLIS);
            $objConditional2->setOperatorType(PHPExcel_Style_Conditional::OPERATOR_GREATERTHANOREQUAL);
            $objConditional2->addCondition('0');
            $objConditional2->getStyle()->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_GREEN);
            $objConditional2->getStyle()->getFont()->setBold(true);

            $conditionalStyles = $this->excel->getActiveSheet()->getStyle('F' . $i)->getConditionalStyles();
            array_push($conditionalStyles, $objConditional1);
            array_push($conditionalStyles, $objConditional2);
            $this->excel->getActiveSheet()->getStyle('F' . $i)->setConditionalStyles($conditionalStyles);


            $i++;
        }




        $filename = "Fuel Usage Report.xlsx";
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename=' . $filename);

        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');



        $objWriter->save('php://output');

        $this->excel->disconnectWorksheets();
    }

    public function fuel_usage_report() {
        $data['fuel_usage_data'] = $this->fuel_usage_report_data();
        $this->load->view('fuel_usage_report_v', $data);
    }

    public function fuel_usage_report_data() {
        $sql = "SELECT fuel_usage.fuel_type,fuel_usage.date,fuel_usage.unit_code,fuel_usage.driver_code,fuel_usage.actual_fuel_used,fuel_usage.estimated_fuel_used,fuel_usage.fuel_variance,fuel_usage.km_covered,fuel_usage.date_added,users.user_name FROM `fuel_usage` inner join users on users.user_id = fuel_usage.user_id";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function fuel_stock_movement_report() {
        $data['fuel_stock_movement_details'] = $this->fuel_stock_movement_data();
        $this->load->view('fuel_stock_movement_v', $data);
    }

    public function fuel_stock_movement_data() {
        $sql = "SELECT * FROM `fuel_stock_movement_bin`";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function export_received_stock_report() {







        $this->load->database();
        $query = $this->db->query("SELECT fuel_usage.fuel_type,fuel_usage.date,fuel_usage.unit_code,fuel_usage.driver_code,fuel_usage.actual_fuel_used,fuel_usage.estimated_fuel_used,fuel_usage.fuel_variance,fuel_usage.km_covered,fuel_usage.date_added,users.user_name FROM `fuel_usage` inner join users on users.user_id = fuel_usage.user_id");
        $results = $query->result_array();
        //$objPHPExcel = new Excel();
//load our new PHPExcel library
        $this->load->library('excel');



        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Fuel Usage Report');
        $this->excel->getActiveSheet()->SetCellValue('A1', "Unit Code");
        $this->excel->getActiveSheet()->SetCellValue('B1', "Driver Code ");
        $this->excel->getActiveSheet()->SetCellValue('C1', "Fuel Type");
        $this->excel->getActiveSheet()->SetCellValue('D1', "Fuel Issued");
        $this->excel->getActiveSheet()->SetCellValue('E1', "Fuel Used");
        $this->excel->getActiveSheet()->SetCellValue('F1', "Fuel Variance");

        $this->excel->getActiveSheet()->SetCellValue('G1', "Km Covered");
        $this->excel->getActiveSheet()->SetCellValue('H1', "Issue Date");
        $this->excel->getActiveSheet()->SetCellValue('I1', "Transaction Date");
        $this->excel->getActiveSheet()->SetCellValue('J1', "Transaction By");



        $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);




        $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setBold(true);





        $i = 2;
        foreach ($results as $result) {

            $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["unit_code"]);
            $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["driver_code"]);
            $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["fuel_type"]);
            $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["estimated_fuel_used"]);
            $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["actual_fuel_used"]);
            $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["fuel_variance"]);
            $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["km_covered"]);
            $this->excel->getActiveSheet()->SetCellValue('H' . $i, $result["date"]);
            $this->excel->getActiveSheet()->SetCellValue('I' . $i, $result["date_added"]);
            $this->excel->getActiveSheet()->SetCellValue('J' . $i, $result["user_name"]);



            $objConditional1 = new PHPExcel_Style_Conditional();
            $objConditional1->setConditionType(PHPExcel_Style_Conditional::CONDITION_CELLIS);
            $objConditional1->setOperatorType(PHPExcel_Style_Conditional::OPERATOR_LESSTHAN);
            $objConditional1->addCondition('0');
            $objConditional1->getStyle()->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_RED);
            $objConditional1->getStyle()->getFont()->setBold(true);

            $objConditional2 = new PHPExcel_Style_Conditional();
            $objConditional2->setConditionType(PHPExcel_Style_Conditional::CONDITION_CELLIS);
            $objConditional2->setOperatorType(PHPExcel_Style_Conditional::OPERATOR_GREATERTHANOREQUAL);
            $objConditional2->addCondition('0');
            $objConditional2->getStyle()->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_GREEN);
            $objConditional2->getStyle()->getFont()->setBold(true);

            $conditionalStyles = $this->excel->getActiveSheet()->getStyle('F' . $i)->getConditionalStyles();
            array_push($conditionalStyles, $objConditional1);
            array_push($conditionalStyles, $objConditional2);
            $this->excel->getActiveSheet()->getStyle('F' . $i)->setConditionalStyles($conditionalStyles);


            $i++;
        }




        $filename = "Fuel Usage Report.xlsx";
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename=' . $filename);

        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');



        $objWriter->save('php://output');

        $this->excel->disconnectWorksheets();
    }

    public function export_fuel_stock_report() {






        $this->load->database();
        $query = $this->db->query("SELECT FUEL_STOCK_MOVEMENT_BIN.unit_code,FUEL_STOCK_MOVEMENT_BIN.driver_code,FUEL_STOCK_MOVEMENT_BIN.delivery_no,FUEL_STOCK_MOVEMENT_BIN.month,FUEL_STOCK_MOVEMENT_BIN.year,FUEL_STOCK_MOVEMENT_BIN.opening_bal,FUEL_STOCK_MOVEMENT_BIN.issue,FUEL_STOCK_MOVEMENT_BIN.closing_bal,FUEL_STOCK_MOVEMENT_BIN.date_added,FUEL_STOCK_MOVEMENT_BIN.batch_number,FUEL_STOCK_MOVEMENT_BIN.fuel_name,users.user_name FROM FUEL_STOCK_MOVEMENT_BIN INNER JOIN USERS ON USERS.USER_ID = FUEL_STOCK_MOVEMENT_BIN.USER_ID");
        $results = $query->result_array();
        //$objPHPExcel = new Excel();
//load our new PHPExcel library
        $this->load->library('excel');



        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Fuel stock Movement Report');
        $this->excel->getActiveSheet()->SetCellValue('A1', "Unit Code");
        $this->excel->getActiveSheet()->SetCellValue('B1', "Driver Code ");
        $this->excel->getActiveSheet()->SetCellValue('C1', "Delivery Number");
        $this->excel->getActiveSheet()->SetCellValue('D1', "Month");
        $this->excel->getActiveSheet()->SetCellValue('E1', "Year");
        $this->excel->getActiveSheet()->SetCellValue('F1', "Fuel Name");

        $this->excel->getActiveSheet()->SetCellValue('G1', "OPening Balance");
        $this->excel->getActiveSheet()->SetCellValue('H1', "Issue ");
        $this->excel->getActiveSheet()->SetCellValue('I1', "Closing Balance");
        $this->excel->getActiveSheet()->SetCellValue('J1', "Transaction Date");

        $this->excel->getActiveSheet()->SetCellValue('K1', "Batch Number");
        $this->excel->getActiveSheet()->SetCellValue('L1', "Transaction By");



        $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);




        $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setBold(true);


        $this->excel->getActiveSheet()->getStyle('K1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('K1')->getFont()->setBold(true);
        $this->excel->getActiveSheet()->getStyle('L1')->getFont()->setSize(15);
        //make the font become bold
        $this->excel->getActiveSheet()->getStyle('L1')->getFont()->setBold(true);





        $i = 2;
        foreach ($results as $result) {

            $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["unit_code"]);
            $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["driver_code"]);
            $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["delivery_no"]);
            $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["month"]);
            $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["year"]);
            $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["fuel_name"]);
            $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["opening_bal"]);
            $this->excel->getActiveSheet()->SetCellValue('H' . $i, $result["issue"]);
            $this->excel->getActiveSheet()->SetCellValue('I' . $i, $result["closing_bal"]);
            $this->excel->getActiveSheet()->SetCellValue('J' . $i, $result["date_added"]);

            $this->excel->getActiveSheet()->SetCellValue('K' . $i, $result["batch_number"]);
            $this->excel->getActiveSheet()->SetCellValue('L' . $i, $result["user_name"]);





            $i++;
        }




        $filename = "Fuel Usage Report.xlsx";
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename=' . $filename);

        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');



        $objWriter->save('php://output');

        $this->excel->disconnectWorksheets();
    }

    public function driver_daily_performance() {
        $data['driver_daily_performance'] = $this->get_driver_daily_performance();
        $data['drivers'] = $this->get_driver_code();
        $this->load->view('driver_daily_performance_v', $data);
    }

    public function get_driver_daily_performance() {
        $date_from = $this->input->post('date_from');
        $date_to = $this->input->post('date_to');
        $driver_code = $this->input->post('filter_driver_code');

        if (empty($driver_code)) {
            $sql = "SELECT delivery.delivery_date,delivery.delivery_no,delivery.unit_code,delivery.driver_code,delivery.zone_name,delivery.zone_rate,delivery.tonnage,delivery.amount,delivery.date_added,users.user_name FROM `delivery` INNER JOIN users on users.user_id = delivery.user_id";
            $result = $this->db->query($sql);
            return $result->result_array();
        } else {
            $sql = "SELECT delivery.delivery_date,delivery.delivery_no,delivery.unit_code,delivery.driver_code,delivery.zone_name,delivery.zone_rate,delivery.tonnage,delivery.amount,delivery.date_added,users.user_name FROM `delivery` INNER JOIN users on users.user_id = delivery.user_id WHERE delivery_date <='$date_to' AND delivery_date >='$date_from' AND driver_code='$driver_code'";
            $result = $this->db->query($sql);
            return $result->result_array();
        }
    }

    public function export_driver_daily_performance() {

        $date_from = $this->input->post('date_from');
        $date_to = $this->input->post('date_to');
        $driver_code = $this->input->post('driver_code');

        if (empty($driver_code)) {
            $this->load->database();
            $query = $this->db->query("SELECT delivery.delivery_date,delivery.delivery_no,delivery.unit_code,delivery.driver_code,delivery.zone_name,delivery.zone_rate,delivery.tonnage,delivery.amount,delivery.date_added,users.user_name FROM `delivery` INNER JOIN users on users.user_id = delivery.user_id");
            $results = $query->result_array();

            $this->load->library('excel');



            $this->excel->setActiveSheetIndex(0);
            $this->excel->getActiveSheet()->setTitle('Dirver Daily Performance Report');
            $this->excel->getActiveSheet()->SetCellValue('A1', "Delivery Date");
            $this->excel->getActiveSheet()->SetCellValue('B1', "Weigh Bridge Ticket No ");
            $this->excel->getActiveSheet()->SetCellValue('C1', "Unit Code");
            $this->excel->getActiveSheet()->SetCellValue('D1', "Driver Code");
            $this->excel->getActiveSheet()->SetCellValue('E1', "Zone");
            $this->excel->getActiveSheet()->SetCellValue('F1', "Zone Rate");
            $this->excel->getActiveSheet()->SetCellValue('G1', "Tonnage");
            $this->excel->getActiveSheet()->SetCellValue('H1', "Amount ");
            $this->excel->getActiveSheet()->SetCellValue('I1', "Transaction Date");
            $this->excel->getActiveSheet()->SetCellValue('J1', "Transaction By");



            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);




            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setBold(true);






            $i = 2;
            foreach ($results as $result) {

                $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["delivery_date"]);
                $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["delivery_no"]);
                $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["unit_code"]);
                $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["driver_code"]);
                $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["zone_name"]);
                $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["zone_rate"]);
                $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["tonnage"]);
                $this->excel->getActiveSheet()->SetCellValue('H' . $i, $result["amount"]);
                $this->excel->getActiveSheet()->SetCellValue('I' . $i, $result["date_added"]);
                $this->excel->getActiveSheet()->SetCellValue('J' . $i, $result["user_name"]);





                $i++;
            }




            $filename = "Dirver Daily Performance.xlsx";
            header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
            header("Cache-Control: no-store, no-cache, must-revalidate");
            header("Cache-Control: post-check=0, pre-check=0", false);
            header("Pragma: no-cache");
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename=' . $filename);

            $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');



            $objWriter->save('php://output');

            $this->excel->disconnectWorksheets();
        } else {
            $this->load->database();
            $query = $this->db->query("SELECT delivery.delivery_date,delivery.delivery_no,delivery.unit_code,delivery.driver_code,delivery.zone_name,delivery.zone_rate,delivery.tonnage,delivery.amount,delivery.date_added,users.user_name FROM `delivery` INNER JOIN users on users.user_id = delivery.user_id WHERE delivery.delivery_date <='$date_to' AND delivery.delivery_date >='$date_from' AND delivery.driver_code='$driver_code'");
            $results = $query->result_array();

            $this->load->library('excel');



            $this->excel->setActiveSheetIndex(0);
            $this->excel->getActiveSheet()->setTitle('Dirver Daily Performance Report');
            $this->excel->getActiveSheet()->SetCellValue('A1', "Delivery Date");
            $this->excel->getActiveSheet()->SetCellValue('B1', "Weigh Bridge Ticket No ");
            $this->excel->getActiveSheet()->SetCellValue('C1', "Unit Code");
            $this->excel->getActiveSheet()->SetCellValue('D1', "Dirver Code");
            $this->excel->getActiveSheet()->SetCellValue('E1', "Zone");
            $this->excel->getActiveSheet()->SetCellValue('F1', "Zone Rate");

            $this->excel->getActiveSheet()->SetCellValue('G1', "Tonnage");
            $this->excel->getActiveSheet()->SetCellValue('H1', "Amount ");
            $this->excel->getActiveSheet()->SetCellValue('I1', "Transaction Date");
            $this->excel->getActiveSheet()->SetCellValue('J1', "Transaction By");



            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);




            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setBold(true);







            $i = 2;
            foreach ($results as $result) {

                $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["delivery_date"]);
                $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["delivery_no"]);
                $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["unit_code"]);
                $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["driver_code"]);
                $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["zone_name"]);
                $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["zone_rate"]);
                $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["tonnage"]);
                $this->excel->getActiveSheet()->SetCellValue('H' . $i, $result["amount"]);
                $this->excel->getActiveSheet()->SetCellValue('I' . $i, $result["date_added"]);
                $this->excel->getActiveSheet()->SetCellValue('J' . $i, $result["user_name"]);

                $i++;
            }




            $filename = "Driver Daily Performance.xlsx";
            header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
            header("Cache-Control: no-store, no-cache, must-revalidate");
            header("Cache-Control: post-check=0, pre-check=0", false);
            header("Pragma: no-cache");
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename=' . $filename);

            $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');



            $objWriter->save('php://output');

            $this->excel->disconnectWorksheets();
        }
    }

    public function get_standard_tonne() {
        $sql = "SELECT standard_tonne.standard_tonne_id,standard_tonne.standard_tonne_amount,users.user_name,standard_tonne.date_added FROM standard_tonne INNER JOIN users ON users.user_id=standard_tonne.user_id";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function standard_tonne() {
        $data['standard_tonnes'] = $this->get_standard_tonne();
        $this->load->view('standard_tonne_v', $data);
    }

    public function update_standard_tonne_rate() {
        $this->db->trans_start();
        $edit_standard_tonne_id = $this->input->post('edit_standard_tonne_id');
        $edit_standard_tonne_amount = $this->input->post('edit_standard_tonne_amount');
        $user_id = $this->session->userdata('id');
        $data = array(
            'standard_tonne_amount' => $edit_standard_tonne_amount,
            'user_id' => $user_id
        );
        $this->db->where('standard_tonne_id', $edit_standard_tonne_id);
        $this->db->update('standard_tonne', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function driver_bonus_report() {

        $data['driver_bonus'] = $this->get_driver_bonus();
        $this->load->view('driver_bonus_v', $data);
    }

    public function get_driver_bonus() {

        $filter_driver_code = $this->input->post('filter_driver_code');
        $date_from = $this->input->post('date_from');
        $date_to = $this->input->post('date_to');
        if (empty($filter_driver_code)) {
            $sql = "SELECT * FROM DELIVERY";
            $result = $this->db->query($sql);
            return $result->result_array();
        } else {
            $sql = "SELECT * FROM DELIVERY WHERE delivery.delivery_date <='$date_to' AND delivery.delivery_date >='$date_from' AND delivery.driver_code='$filter_driver_code'";
            $result = $this->db->query($sql);
            return $result->result_array();
        }
    }

    public function export_driver_bonus_report() {

        $filter_driver_code = $this->input->post('driver_code');
        $date_from = $this->input->post('date_from');
        $date_to = $this->input->post('date_to');
        if ($filter_driver_code === "All" && empty($date_to)) {
            $sql = "SELECT * FROM DELIVERY WHERE  delivery.delivery_date >='$date_from' AND delivery.driver_code='$filter_driver_code'";
            $result = $this->db->query($sql);
            $results = $result->result_array();

            $this->load->library('excel');



            $this->excel->setActiveSheetIndex(0);
            $this->excel->getActiveSheet()->setTitle('Dirver Bonus Report');
            $this->excel->getActiveSheet()->SetCellValue('A1', "Delivery Date");
            $this->excel->getActiveSheet()->SetCellValue('B1', "Weigh Bridge Ticket No ");
            $this->excel->getActiveSheet()->SetCellValue('C1', "Unit Code");
            $this->excel->getActiveSheet()->SetCellValue('D1', "Dirver Code");
            $this->excel->getActiveSheet()->SetCellValue('E1', "Zone");
            $this->excel->getActiveSheet()->SetCellValue('F1', "Zone Rate");

            $this->excel->getActiveSheet()->SetCellValue('G1', "Standard Tonne");
            $this->excel->getActiveSheet()->SetCellValue('H1', "Tonnes Delivered ");
            $this->excel->getActiveSheet()->SetCellValue('I1', "Bonus Tonne");
            $this->excel->getActiveSheet()->SetCellValue('J1', "Bonus Amount");

            $this->excel->getActiveSheet()->SetCellValue('K1', "Amount");
            $this->excel->getActiveSheet()->SetCellValue('L1', "Transaction Date");



            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);




            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setBold(true);


            $this->excel->getActiveSheet()->getStyle('K1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('K1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('L1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('L1')->getFont()->setBold(true);







            $i = 2;
            foreach ($results as $result) {

                $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["delivery_date"]);
                $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["delivery_no"]);
                $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["unit_code"]);
                $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["driver_code"]);
                $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["zone_name"]);
                $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["zone_rate"]);
                $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["standard_tonne"]);
                $this->excel->getActiveSheet()->SetCellValue('H' . $i, $result["tonnage"]);
                $delivered_tonne = $result["tonnage"];
                $standard_tonne = $result["standard_tonne"];
                $bonus_tonne = $delivered_tonne - $standard_tonne;
                $this->excel->getActiveSheet()->SetCellValue('I' . $i, $bonus_tonne);
                $bonus_amount = $result['bonus_amount'];
                $total_bonus_amount = $bonus_amount * $bonus_tonne;
                $this->excel->getActiveSheet()->SetCellValue('J' . $i, $total_bonus_amount);
                $this->excel->getActiveSheet()->SetCellValue('K' . $i, $result["amount"]);
                $this->excel->getActiveSheet()->SetCellValue('L' . $i, $result["date_added"]);

                $i++;
            }




            $filename = "Driver Bonus Report.xlsx";
            header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
            header("Cache-Control: no-store, no-cache, must-revalidate");
            header("Cache-Control: post-check=0, pre-check=0", false);
            header("Pragma: no-cache");
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename=' . $filename);

            $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');



            $objWriter->save('php://output');

            $this->excel->disconnectWorksheets();
        } elseif (isset($filter_driver_code) && empty($date_from)) {
            $sql = "SELECT * FROM DELIVERY WHERE delivery.delivery_date <='$date_to'  AND delivery.driver_code='$filter_driver_code'";
            $result = $this->db->query($sql);


            $results = $result->result_array();

            $this->load->library('excel');



            $this->excel->setActiveSheetIndex(0);
            $this->excel->getActiveSheet()->setTitle('Dirver Bonus Report');
            $this->excel->getActiveSheet()->SetCellValue('A1', "Delivery Date");
            $this->excel->getActiveSheet()->SetCellValue('B1', "Weigh Bridge Ticket No ");
            $this->excel->getActiveSheet()->SetCellValue('C1', "Unit Code");
            $this->excel->getActiveSheet()->SetCellValue('D1', "Dirver Code");
            $this->excel->getActiveSheet()->SetCellValue('E1', "Zone");
            $this->excel->getActiveSheet()->SetCellValue('F1', "Zone Rate");

            $this->excel->getActiveSheet()->SetCellValue('G1', "Standard Tonne");
            $this->excel->getActiveSheet()->SetCellValue('H1', "Tonnes Delivered ");
            $this->excel->getActiveSheet()->SetCellValue('I1', "Bonus Tonne");
            $this->excel->getActiveSheet()->SetCellValue('J1', "Bonus Amount");

            $this->excel->getActiveSheet()->SetCellValue('K1', "Amount");
            $this->excel->getActiveSheet()->SetCellValue('L1', "Transaction Date");



            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);




            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setBold(true);


            $this->excel->getActiveSheet()->getStyle('K1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('K1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('L1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('L1')->getFont()->setBold(true);







            $i = 2;
            foreach ($results as $result) {

                $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["delivery_date"]);
                $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["delivery_no"]);
                $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["unit_code"]);
                $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["driver_code"]);
                $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["zone_name"]);
                $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["zone_rate"]);
                $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["standard_tonne"]);
                $this->excel->getActiveSheet()->SetCellValue('H' . $i, $result["tonnage"]);
                $delivered_tonne = $result["tonnage"];
                $standard_tonne = $result["standard_tonne"];
                $bonus_tonne = $delivered_tonne - $standard_tonne;
                $this->excel->getActiveSheet()->SetCellValue('I' . $i, $bonus_tonne);
                $bonus_amount = $result['bonus_amount'];
                $total_bonus_amount = $bonus_amount * $bonus_tonne;
                $this->excel->getActiveSheet()->SetCellValue('J' . $i, $total_bonus_amount);
                $this->excel->getActiveSheet()->SetCellValue('K' . $i, $result["amount"]);
                $this->excel->getActiveSheet()->SetCellValue('L' . $i, $result["date_added"]);

                $i++;
            }




            $filename = "Driver Bonus Report.xlsx";
            header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
            header("Cache-Control: no-store, no-cache, must-revalidate");
            header("Cache-Control: post-check=0, pre-check=0", false);
            header("Pragma: no-cache");
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename=' . $filename);

            $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');



            $objWriter->save('php://output');

            $this->excel->disconnectWorksheets();
        } elseif ($filter_driver_code = "All") {
            $sql = "SELECT * FROM DELIVERY";
            $result = $this->db->query($sql);


            $results = $result->result_array();

            $this->load->library('excel');



            $this->excel->setActiveSheetIndex(0);
            $this->excel->getActiveSheet()->setTitle('Dirver Bonus Report');
            $this->excel->getActiveSheet()->SetCellValue('A1', "Delivery Date");
            $this->excel->getActiveSheet()->SetCellValue('B1', "Weigh Bridge Ticket No ");
            $this->excel->getActiveSheet()->SetCellValue('C1', "Unit Code");
            $this->excel->getActiveSheet()->SetCellValue('D1', "Dirver Code");
            $this->excel->getActiveSheet()->SetCellValue('E1', "Zone");
            $this->excel->getActiveSheet()->SetCellValue('F1', "Zone Rate");

            $this->excel->getActiveSheet()->SetCellValue('G1', "Standard Tonne");
            $this->excel->getActiveSheet()->SetCellValue('H1', "Tonnes Delivered ");
            $this->excel->getActiveSheet()->SetCellValue('I1', "Bonus Tonne");
            $this->excel->getActiveSheet()->SetCellValue('J1', "Bonus Amount");

            $this->excel->getActiveSheet()->SetCellValue('K1', "Amount");
            $this->excel->getActiveSheet()->SetCellValue('L1', "Transaction Date");



            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);




            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setBold(true);


            $this->excel->getActiveSheet()->getStyle('K1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('K1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('L1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('L1')->getFont()->setBold(true);







            $i = 2;
            foreach ($results as $result) {

                $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["delivery_date"]);
                $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["delivery_no"]);
                $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["unit_code"]);
                $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["driver_code"]);
                $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["zone_name"]);
                $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["zone_rate"]);
                $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["standard_tonne"]);
                $this->excel->getActiveSheet()->SetCellValue('H' . $i, $result["tonnage"]);
                $delivered_tonne = $result["tonnage"];
                $standard_tonne = $result["standard_tonne"];
                $bonus_tonne = $delivered_tonne - $standard_tonne;
                $this->excel->getActiveSheet()->SetCellValue('I' . $i, $bonus_tonne);
                $bonus_amount = $result['bonus_amount'];
                $total_bonus_amount = $bonus_amount * $bonus_tonne;
                $this->excel->getActiveSheet()->SetCellValue('J' . $i, $total_bonus_amount);
                $this->excel->getActiveSheet()->SetCellValue('K' . $i, $result["amount"]);
                $this->excel->getActiveSheet()->SetCellValue('L' . $i, $result["date_added"]);

                $i++;
            }




            $filename = "Driver Bonus Report.xlsx";
            header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
            header("Cache-Control: no-store, no-cache, must-revalidate");
            header("Cache-Control: post-check=0, pre-check=0", false);
            header("Pragma: no-cache");
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename=' . $filename);

            $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');



            $objWriter->save('php://output');

            $this->excel->disconnectWorksheets();
        } elseif (isset($date_from) && isset($date_to) && isset($filter_driver_code)) {
            $sql = "SELECT * FROM DELIVERY WHERE delivery.delivery_date <='$date_to' AND delivery.delivery_date >='$date_from' AND delivery.driver_code='$filter_driver_code'";
            $result = $this->db->query($sql);


            $results = $result->result_array();

            $this->load->library('excel');



            $this->excel->setActiveSheetIndex(0);
            $this->excel->getActiveSheet()->setTitle('Dirver Bonus Report');
            $this->excel->getActiveSheet()->SetCellValue('A1', "Delivery Date");
            $this->excel->getActiveSheet()->SetCellValue('B1', "Weigh Bridge Ticket No ");
            $this->excel->getActiveSheet()->SetCellValue('C1', "Unit Code");
            $this->excel->getActiveSheet()->SetCellValue('D1', "Dirver Code");
            $this->excel->getActiveSheet()->SetCellValue('E1', "Zone");
            $this->excel->getActiveSheet()->SetCellValue('F1', "Zone Rate");

            $this->excel->getActiveSheet()->SetCellValue('G1', "Standard Tonne");
            $this->excel->getActiveSheet()->SetCellValue('H1', "Tonnes Delivered ");
            $this->excel->getActiveSheet()->SetCellValue('I1', "Bonus Tonne");
            $this->excel->getActiveSheet()->SetCellValue('J1', "Bonus Amount");

            $this->excel->getActiveSheet()->SetCellValue('K1', "Amount");
            $this->excel->getActiveSheet()->SetCellValue('L1', "Transaction Date");



            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('B1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('C1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('D1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('E1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('F1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('G1')->getFont()->setBold(true);




            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('H1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('I1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('J1')->getFont()->setBold(true);


            $this->excel->getActiveSheet()->getStyle('K1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('K1')->getFont()->setBold(true);
            $this->excel->getActiveSheet()->getStyle('L1')->getFont()->setSize(15);
            //make the font become bold
            $this->excel->getActiveSheet()->getStyle('L1')->getFont()->setBold(true);







            $i = 2;
            foreach ($results as $result) {

                $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["delivery_date"]);
                $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["delivery_no"]);
                $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["unit_code"]);
                $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["driver_code"]);
                $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["zone_name"]);
                $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["zone_rate"]);
                $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["standard_tonne"]);
                $this->excel->getActiveSheet()->SetCellValue('H' . $i, $result["tonnage"]);
                $delivered_tonne = $result["tonnage"];
                $standard_tonne = $result["standard_tonne"];
                $bonus_tonne = $delivered_tonne - $standard_tonne;
                $this->excel->getActiveSheet()->SetCellValue('I' . $i, $bonus_tonne);
                $bonus_amount = $result['bonus_amount'];
                $total_bonus_amount = $bonus_amount * $bonus_tonne;
                $this->excel->getActiveSheet()->SetCellValue('J' . $i, $total_bonus_amount);
                $this->excel->getActiveSheet()->SetCellValue('K' . $i, $result["amount"]);
                $this->excel->getActiveSheet()->SetCellValue('L' . $i, $result["date_added"]);

                $i++;
            }




            $filename = "Driver Bonus Report.xlsx";
            header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
            header("Cache-Control: no-store, no-cache, must-revalidate");
            header("Cache-Control: post-check=0, pre-check=0", false);
            header("Pragma: no-cache");
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename=' . $filename);

            $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel2007');



            $objWriter->save('php://output');

            $this->excel->disconnectWorksheets();
        }
    }

    public function get_bonus_tonne_data() {
        $sql = "SELECT bonus_amount.bonus_amount_id,bonus_amount.bonus_amount,users.user_name,bonus_amount.date_added FROM bonus_amount INNER JOIN users ON users.user_id=bonus_amount.user_id";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    public function bonus_tonne() {
        $data['bonus_amount'] = $this->get_bonus_tonne_data();
        $this->load->view('bonus_amount_v', $data);
    }

    public function update_bonus_tonne_rate() {
        $this->db->trans_start();
        $edit_bonus_amount_id = $this->input->post('edit_bonus_amount_id');
        $edit_bonus_amount = $this->input->post('edit_bonus_amount');
        $user_id = $this->session->userdata('id');
        $data = array(
            'bonus_amount' => $edit_bonus_amount,
            'user_id' => $user_id
        );
        $this->db->where('bonus_amount_id', $edit_bonus_amount_id);
        $this->db->update('bonus_amount', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

}

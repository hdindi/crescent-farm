<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Admin_profile extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->database();
        $this->load->helper('form');
        $this->load->helper('security');
        $this->load->helper('url');
    }

    public function index() {



        $this->load->view('admin_profile');
    }

    public function zones() {

        $data['zones'] = $this->admin_profile_model->all_zones();
        $this->load->view('zones_view', $data);
    }

    public function get_zone_details() {
        $zone_id = $this->uri->segment(3);
        $zone_details = $this->admin_profile_model->get_zone_details();
        if (empty($zone_details)) {
            
        } else {

            echo json_encode($zone_details);
        }
    }

    public function get_user_details() {
        $user_id = $this->uri->segment(3);
        $user_details = $this->admin_profile_model->get_user_details();
        if (empty($user_details)) {
            
        } else {
            echo json_encode($user_details);
        }
    }

    public function update_user_details() {
        
        $user_id = $this->input->post('user_id');
        $s_name = $this->input->post('s_name');
        $f_name = $this->input->post('f_name');
        $user_name = $this->input->post('user_name');
        $other_name = $this->input->post('other_name');
        $employee_type = $this->input->post('employee_type');
        $this->db->trans_start();
        $data = array(
            'f_name'=>$f_name,
            's_name'=>$s_name,
            'user_name'=>$user_name,
            'other_name'=>$other_name,
            'employee_type'=>$employee_type
        );
        $this->db->where('user_id',$user_id);
        $this->db->update('users',$data);
        $this->db->trans_complete();
        if($this->db->trans_status()===FALSE){
            
        }
        
    }

    public function add_new_user() {
        $user_name = $this->input->post('add_user_name');
        $f_name = $this->input->post('add_f_name');
        $s_name = $this->input->post('add_s_name');
        $other_name = $this->input->post('add_other_name');
        $employee_type = $this->input->post('add_employee_type');
        $is_active = $this->input->post('add_is_active');
        $password = '123456';
        $password = md5($password);
        $this->db->trans_start();
        $data = array(
            'user_name' => $user_name,
            'f_name' => $f_name,
            's_name' => $s_name,
            'other_name' => $other_name,
            'employee_type' => $employee_type,
            'is_active' => $is_active,
            'password'=>$password
        );
        $this->db->insert('users', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        } else {
            redirect('admin_profile/users');
        }
    }

    public function add_new_zone() {
        $zone_name = $this->input->post('add_zone_name');
        $zone_rate = $this->input->post('add_zone_rate');
        $is_active = $this->input->post('add_is_active');
        $user_id = $this->session->userdata('id');
        $this->db->trans_start();
        $data = array(
            'zone_name' => $zone_name,
            'zone_rate' => $zone_rate,
            'is_active' => $is_active,
            'user_id' => $user_id
        );

        $this->db->insert('zone', $data);
        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE) {
            // generate an error... or use the log_message() function to log your error
        } else {
            //redirect('admin_profile/zones');
        }
    }

    public function delete_zone() {
        $zone_id_delete = $this->input->post('zone_id_delete');
        $this->db->trans_start();
        $in_active = 'In Active';
        $data = array(
            'is_active' => $in_active
        );
        $this->db->where('zone_id', $zone_id_delete);
        $this->db->update('zone', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function users() {
        $data['users'] = $this->admin_profile_model->all_users();
        $this->load->view('users_view', $data);
    }

    public function employees() {
        $data['employees'] = $this->admin_profile_model->all_employees();
        $this->load->view('employees_view', $data);
    }

    public function error_page() {
        $this->load->view('error');
    }

    public function icon_page() {
        $this->load->view('icon');
    }

    public function typography_page() {
        $this->load->view('typography');
    }

    public function add_user_details() {
        $this->add_new_user(); 
    }

    public function get_employee_details() {
        $employee_id = $this->uri->segment(3);
        $employee_details = $this->admin_profile_model->get_employee_details();
        if (empty($employee_details)) {
            
        } else {
            echo json_encode($employee_details);
        }
    }

    public function get_max_driver_code() {
        $this->db->select_max('driver_code');
        $query = $this->db->get('employees');

        foreach ($query->result() as $row) {
            echo $row->driver_code;
            return $row->driver_code;
        }
    }

    public function add_new_employee() {
        $this->db->trans_start();

        $add_f_name = $this->input->post('add_f_name');
        $add_s_name = $this->input->post('add_s_name');
        $add_other_name = $this->input->post('add_o_name');
        $identification_no = $this->input->post('identification_number');
        $is_active = $this->input->post('add_is_active');
        $previous_driver_code = $this->get_max_driver_code();
        $previous_driver_code = strval($previous_driver_code);
        $one = 1;
        $new_driver_code = $previous_driver_code + $one;
        $new_driver_code = strval($new_driver_code);

        $nine = substr($previous_driver_code, -1);
        echo 'Nine' . $nine . '</br>';
        $nine_1 = substr($previous_driver_code, 2, 1);
        echo 'Nine One' . $nine_1 . '</br>';
        $nine_2 = substr($previous_driver_code, 1, 1);
        echo 'Nine Two' . $nine_2 . '</br>';
        $nine_4 = substr($previous_driver_code, 0, 1);
        echo 'Nine 4' . $nine_4 . '</br>';
        $zero_1 = substr($previous_driver_code, 0, 1);
        $zero_1 = strval($zero_1);
        echo 'Zero 1' . $zero_1 . '</br>';
        $zero_2 = substr($previous_driver_code, 1, 1);
        $zero_2 = strval($zero_2);
        echo 'Zero 2' . $zero_2 . '</br>';
        $zero_3 = substr($previous_driver_code, 2, 1);
        $zero_3 = strval($zero_3);
        echo 'Zero 3' . $zero_3 . '</br>';
        $zero = '0';
        $zero_4 = substr($previous_driver_code, 3, 1);

        if ($zero_1 == "0" && $zero_2 == "0" && $zero_3 == "0" && $zero_4 == "0" && $zero_4 != "9") {
            $one = 1;
            $one = strval($one);

            $user_id = $this->session->userdata('id');
            $data = array(
                'f_name' => $add_f_name,
                's_name' => $add_s_name,
                'other_name' => $add_other_name,
                'driver_code' => $one,
                'is_active' => $is_active,
                'user_id' => $user_id,
                'identification_no' => $identification_no
            );
            echo 'FIVE without nine';

            $this->db->insert('employees', $data);
        } elseif ($zero_1 == "0" && $zero_2 == "0" && $zero_3 == "0" && $zero_4 != "0" && $zero_4 != "9") {
            $one = 1;
            $new_driver_code = $previous_driver_code + $one;
            $zero = 0;
            $driver_code = $zero . $zero . $zero . $new_driver_code;
            $new_driver_code = strval($driver_code);
            $user_id = $this->session->userdata('id');
            $data = array(
                'f_name' => $add_f_name,
                's_name' => $add_s_name,
                'other_name' => $add_other_name,
                'driver_code' => $driver_code,
                'is_active' => $is_active,
                'user_id' => $user_id,
                'identification_no' => $identification_no
            );
            echo 'FIVE with nine';

            $this->db->insert('employees', $data);
        } elseif ($zero_1 == "0" && $zero_2 == "0" && $zero_3 == "0" && $zero_4 != "0" && $zero_4 == "9") {
            $one = 1;
            $new_driver_code = $previous_driver_code + $one;
            $zero = 0;
            $driver_code = $zero . $zero . $new_driver_code;
            $new_driver_code = strval($driver_code);
            $user_id = $this->session->userdata('id');
            $data = array(
                'f_name' => $add_f_name,
                's_name' => $add_s_name,
                'other_name' => $add_other_name,
                'driver_code' => $driver_code,
                'is_active' => $is_active,
                'user_id' => $user_id,
                'identification_no' => $identification_no
            );
            echo 'FIVE with nine';

            $this->db->insert('employees', $data);
        } elseif ($zero_1 == "0" && $zero_2 == "0" && $zero_3 != "0" && $zero_3 != "9") {
            $one = 1;
            $new_driver_code = $previous_driver_code + $one;
            $zero = 0;
            $driver_code = $zero . $zero . $new_driver_code;
            $new_driver_code = strval($driver_code);
            $user_id = $this->session->userdata('id');
            $data = array(
                'f_name' => $add_f_name,
                's_name' => $add_s_name,
                'other_name' => $add_other_name,
                'driver_code' => $driver_code,
                'is_active' => $is_active,
                'user_id' => $user_id,
                'identification_no' => $identification_no
            );
            echo 'FOUR without nine';
            $this->db->insert('employees', $data);
        } elseif ($zero_1 == "0" && $zero_2 == "0" && $zero_3 != "0" && $zero_3 == "9") {
            $one = 1;
            $new_driver_code = $previous_driver_code + $one;
            $zero = 0;
            $driver_code = $zero . $new_driver_code;
            $new_driver_code = strval($driver_code);
            $user_id = $this->session->userdata('id');
            $data = array(
                'f_name' => $add_f_name,
                's_name' => $add_s_name,
                'other_name' => $add_other_name,
                'driver_code' => $driver_code,
                'is_active' => $is_active,
                'user_id' => $user_id,
                'identification_no' => $identification_no
            );
            echo 'FOUR with nine';
            $this->db->insert('employees', $data);
        } elseif ($zero_1 == "0" && $zero_2 != "0" && $zero_2 != "9") {
            $one = 1;
            $new_driver_code = $previous_driver_code + $one;
            $zero = 0;
            $driver_code = $zero . $new_driver_code;
            $new_driver_code = strval($driver_code);
            $user_id = $this->session->userdata('id');
            $data = array(
                'f_name' => $add_f_name,
                's_name' => $add_s_name,
                'other_name' => $add_other_name,
                'driver_code' => $driver_code,
                'is_active' => $is_active,
                'user_id' => $user_id,
                'identification_no' => $identification_no
            );
            echo 'THREE with zero and no nine';
            $this->db->insert('employees', $data);
        } elseif ($zero_1 == "0" && $zero_2 != "0" && $zero_2 == "9") {
            $one = 1;
            $new_driver_code = $previous_driver_code + $one;
            $zero = 0;
            $driver_code = $new_driver_code;
            $new_driver_code = strval($driver_code);
            $user_id = $this->session->userdata('id');
            $data = array(
                'f_name' => $add_f_name,
                's_name' => $add_s_name,
                'other_name' => $add_other_name,
                'driver_code' => $driver_code,
                'is_active' => $is_active,
                'user_id' => $user_id,
                'identification_no' => $identification_no
            );
            echo 'THREE with zero and no nine';
            $this->db->insert('employees', $data);
        } elseif ($zero_1 != "0" && $zero_1 == "9") {
            $one = 1;
            $new_driver_code = $previous_driver_code + $one;
            $zero = 0;
            $driver_code = $new_driver_code;
            $new_driver_code = strval($driver_code);
            $user_id = $this->session->userdata('id');
            $data = array(
                'f_name' => $add_f_name,
                's_name' => $add_s_name,
                'other_name' => $add_other_name,
                'driver_code' => $driver_code,
                'is_active' => $is_active,
                'user_id' => $user_id,
                'identification_no' => $identification_no
            );
            echo 'THREE with nine';
            $this->db->insert('employees', $data);
        }

        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function update_employee_details() {
        $this->db->trans_start();
        $employee_id = $this->input->post('edit_employee_id');
        $f_name = $this->input->post('f_name');
        $s_name = $this->input->post('s_name');
        $other_name = $this->input->post('other_name');
        $identification_number = $this->input->post('identification_no');
        $is_active = $this->input->post('is_active_edit');
        $driver_code = $this->input->post('driver_code');
        echo 'Driver Code' . $driver_code . '</br>';
        $data = array(
            'f_name' => $f_name,
            's_name' => $s_name,
            'other_name' => $other_name,
            'identification_no' => $identification_number,
            'is_active' => $is_active,
            'driver_code' => $driver_code
        );
        $this->db->where('employee_id', $employee_id);
        $this->db->update('employees', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function units() {
        $data['units'] = $this->admin_profile_model->all_units();
        $this->load->view('units_view', $data);
    }

    public function get_unit_details() {
        $unit_detail = $this->admin_profile_model->get_unit_details();
        if (empty($unit_detail)) {
            
        } else {

            echo json_encode($unit_detail);
        }
    }

    public function delete_unit() {
        $unit_id_delete = $this->input->post('unit_id_delete');
        $is_active = 'In Active';
        $this->db->trans_start();
        $data = array(
            'is_active' => $is_active
        );
        $this->db->where('unit_id', $unit_id_delete);
        $this->db->update('unit', $data);
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }

    public function update_unit_details() {
        $unit_name = $this->input->post('unit_name');
        $unit_code = $this->input->post('unit_code');
        $registration_number = $this->input->post('registration_number');
        $is_active_edit = $this->input->post('is_active_edit');
    }

    public function get_max_unit_code() {
        $this->db->select_max('unit_code');
        $query = $this->db->get('unit');

        foreach ($query->result() as $row) {
            echo $row->unit_code;
            $unit_code = $row->unit_code;
            $max_unit_code_last_value = substr($unit_code, 6,3);
            echo 'Max Unit Code'.$max_unit_code_last_value;
            return $row->unit_code;
        }
    }

    public function add_new_unit() {
        $this->db->trans_start();
        $add_unit_name = $this->input->post('add_unit_name');
        $add_unit_type = $this->input->post('add_unit_type');
        echo 'Unit Type'.$add_unit_type.'</br>';
        $add_registration_number = $this->input->post('add_registration_number');
        $add_is_active = $this->input->post('add_is_active');
        $cane_transport_tractor = "Cane Transport Tractor";
        $loader = "Loader";
        $pick_up = "Pick Up";
        $car = "Car";
        $tractor = "Tractor";
        $zero = 0;
           $user_id = $this->session->userdata('id');
        

        if ($car === $add_unit_type) {
            echo 'CAR'.'</br>';
            $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$zero,
                'user_id'=>$user_id
            );
            $this->db->insert('unit',$data);
            
        } elseif ($loader === $add_unit_type) {
            echo 'LOADER'.'</br>';
              $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$zero,
                'user_id'=>$user_id
            );
            $this->db->insert('unit',$data);
            
        } elseif ($pick_up === $add_unit_type) {
            echo 'PICK UP'.'</br>';
              $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$zero,
                'user_id'=>$user_id
            );
            $this->db->insert('unit',$data);
            
        } elseif ($tractor === $add_unit_type) {
            echo 'TRACTOR'.'</br>';
              $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$zero,
                'user_id'=>$user_id
            );
            $this->db->insert('unit',$data);
            
        } elseif ($cane_transport_tractor === $add_unit_type) {
            echo 'CANE TRANSPORT TRACTOR'.'</br>';
            $max_unit_code = $this->get_max_unit_code();
            
            $max_unit_code_last_value = substr($max_unit_code, 6,3);
            $ones = substr($max_unit_code, 8,1);
            $tens = substr($max_unit_code, 7,1);
            $hundreds = substr($max_unit_code, 6,1);
            $unit_code_base = "80_01_";
            $one = 1;
            $nine =9;
            $string_ones = strval($ones);
            $string_tens = strval($tens);
            $string_hundreds = strval($hundreds);
            if (empty($max_unit_code)) {
                echo 'EMPTY MAX CODE'.'</br>';
                $unit_code_number = "80_01_001";
                
                $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$unit_code_number,
                'user_id'=>$user_id
            );
            $this->db->insert('unit',$data);
            }  elseif ($string_ones !="9" && $string_tens==="0" && $string_hundreds==="0" ) {
                echo 'UNIT CODE IS IN ONES LESS THAN NINE'.'</br>';
                echo 'Max Unit Code'.$max_unit_code_last_value.'</br>';
               $new_unit_code_number = $max_unit_code_last_value+$one;
               echo 'New Unit Code Number'.$new_unit_code_number.'</br>';
               $new_unit_code_number = strval($new_unit_code_number);
                   echo 'New Unit Code Number'.$new_unit_code_number.'</br>';
               $new_unit_code_base = $unit_code_base.$zero.$zero.$new_unit_code_number;
                   echo 'New Unit Code Number'.$new_unit_code_base.'</br>';
                
                $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$new_unit_code_base,
                'user_id'=>$user_id
            );
                $this->db->insert('unit',$data);
                
            } elseif ($string_ones ==="9" && $string_tens==="0" && $string_hundreds==="0") {
                echo 'UNIT CODE IS IN ONES IN NINE '.'</br>';
                
                 $new_unit_code_number = $max_unit_code_last_value+$one;
               $new_unit_code_number = strval($unit_code_number);
               $new_unit_code_base = $unit_code_base.$zero.$new_unit_code_number;
                
                $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$new_unit_code_base,
                'user_id'=>$user_id
            );
                $this->db->insert('unit',$data);
            }elseif ($tens>=1 && $string_tens!="9") {
                echo 'UNIT CODE IS IN TENS LESS THAN NINE'.'</br>';
                
                 $new_unit_code_number = $max_unit_code_last_value+$one;
               $new_unit_code_number = strval($unit_code_number);
               $new_unit_code_base = $unit_code_base.$zero.$new_unit_code_number;
                
                $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$new_unit_code_base,
                'user_id'=>$user_id
            );
                $this->db->insert('unit',$data);
            }elseif ($tens>=1 && $string_tens==="9") {
                
                echo 'UNIT CODE IS IN TENS EQUALS TO NINE'.'</br>';
                 $new_unit_code_number = $max_unit_code_last_value+$one;
               $new_unit_code_number = strval($unit_code_number);
               $new_unit_code_base = $unit_code_base.$new_unit_code_number;
                
                $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$new_unit_code_base,
                'user_id'=>$user_id
            );
                $this->db->insert('unit',$data);
                
            }
            elseif ($hundreds>=1 && $string_hundreds!="9") {
                
                echo 'UNIT CODE IS IN HUNDREDS LESS THAN NINE'.'</br>';
                
                 $new_unit_code_number = $max_unit_code_last_value+$one;
               $new_unit_code_number = strval($unit_code_number);
               $new_unit_code_base = $unit_code_base.$new_unit_code_number;
                
                $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$new_unit_code_base,
                'user_id'=>$user_id
            );
                $this->db->insert('unit',$data);
                
            }
             elseif ($hundreds>=1 && $string_hundreds==="9") {
                echo 'UNIT CODE IS IN HUNDREDS EQUALS TO NINE'.'</br>';
                
                 $new_unit_code_number = $max_unit_code_last_value+$one;
               $new_unit_code_number = strval($unit_code_number);
               $new_unit_code_base = $unit_code_base.$new_unit_code_number;
                
                $data = array(
                'unit_name'=>$add_unit_name,
                'registration_number'=>$add_registration_number,
                'is_active'=>$add_is_active,
                'unit_type'=>$add_unit_type,
                'unit_code'=>$new_unit_code_base,
                'user_id'=>$user_id
            );
                $this->db->insert('unit',$data);
                
            }
            
        }
        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE) {
            
        }
    }
    
    
    public function export_units_report() {
        
          

        $this->load->database();
        $query = $this->db->query("SELECT unit.unit_name,unit.registration_number,"
                . "unit.unit_code,unit.date_added,unit.is_active,unit.unit_type,users.user_name"
                . " FROM `unit` INNER JOIN users ON users.user_id=unit.user_id");
        $results = $query->result_array();
        //$objPHPExcel = new Excel();
//load our new PHPExcel library
        $this->load->library('excel');



        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Units Report');
        $this->excel->getActiveSheet()->SetCellValue('A1', "UNIT NAME");
        $this->excel->getActiveSheet()->SetCellValue('B1', "REGISTRATION NUMBER");
        $this->excel->getActiveSheet()->SetCellValue('C1', "UNIT CODE");
        $this->excel->getActiveSheet()->SetCellValue('D1', "UNIT TYPE");
        $this->excel->getActiveSheet()->SetCellValue('E1', "DATE ADDED");
        $this->excel->getActiveSheet()->SetCellValue('F1', "STATUS");
        $this->excel->getActiveSheet()->SetCellValue('G1', "ADDED BY");



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

    



        $i = 2;
        foreach ($results as $result) {

            $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["unit_name"]);
            $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["registration_number"]);
            $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["unit_code"]);
            $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["unit_type"]);
            $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["date_added"]);
            $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["is_active"]);
            $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["user_name"]);




            $i++;
        }




        $filename = "units_report.xlsx";
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
    
    
    
    public function export_zones_report() {
        
        
        
      
        
          

        $this->load->database();
        $query = $this->db->query("SELECT zone.zone_name,zone.zone_rate,zone.date_added,"
                . "zone.is_active,users.user_name FROM `zone` INNER JOIN users ON users.user_id = zone.user_id");
        $results = $query->result_array();
        //$objPHPExcel = new Excel();
//load our new PHPExcel library
        $this->load->library('excel');



        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Zones Report');
        $this->excel->getActiveSheet()->SetCellValue('A1', "ZONE NAME");
        $this->excel->getActiveSheet()->SetCellValue('B1', "ZONE RATE");
        $this->excel->getActiveSheet()->SetCellValue('C1', "DATE ADDED");
        $this->excel->getActiveSheet()->SetCellValue('D1', "ADDED BY");
        $this->excel->getActiveSheet()->SetCellValue('E1', "STATUS");



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

    



        $i = 2;
        foreach ($results as $result) {

            $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["zone_name"]);
            $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["zone_rate"]);
            $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["date_added"]);
            $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["user_name"]);
            $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["is_active"]);




            $i++;
        }




        $filename = "zones_report.xlsx";
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
    
    public function export_employees_report() {
     
        
        
          

        $this->load->database();
        $query = $this->db->query("SELECT employees.f_name,employees.s_name,employees.other_name,employees.driver_code,"
                . "employees.identification_no,employees.nhif_no,employees.nssf_no,employees.kra_pin,employees.is_active,"
                . "employees.date_added,users.user_name FROM `employees` INNER JOIN users ON users.user_id = employees.user_id");
        $results = $query->result_array();
        //$objPHPExcel = new Excel();
//load our new PHPExcel library
        $this->load->library('excel');



        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Employees Report');
        $this->excel->getActiveSheet()->SetCellValue('A1', "FIRST NAME");
        $this->excel->getActiveSheet()->SetCellValue('B1', "SUR NAME ");
        $this->excel->getActiveSheet()->SetCellValue('C1', "DRIVER CODE");
        $this->excel->getActiveSheet()->SetCellValue('D1', "IDENTIFICATION NUMBER");
        $this->excel->getActiveSheet()->SetCellValue('E1', "STATUS");
        $this->excel->getActiveSheet()->SetCellValue('F1', "DATE ADDED");
        $this->excel->getActiveSheet()->SetCellValue('G1', "ADDED BY");



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

    



        $i = 2;
        foreach ($results as $result) {

            $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["f_name"]);
            $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["s_name"]);
            $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["driver_code"]);
            $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["identification_no"]);
            $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["is_active"]);
            $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["date_added"]);
            $this->excel->getActiveSheet()->SetCellValue('G' . $i, $result["user_name"]);




            $i++;
        }




        $filename = "employees_report.xlsx";
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
    
    public function export_users_report() {
        
        
        
          

        $this->load->database();
        $query = $this->db->query("SELECT * FROM `users`");
        $results = $query->result_array();
        //$objPHPExcel = new Excel();
//load our new PHPExcel library
        $this->load->library('excel');



        $this->excel->setActiveSheetIndex(0);
        $this->excel->getActiveSheet()->setTitle('Users Report');
        $this->excel->getActiveSheet()->SetCellValue('A1', "FIRST NAME");
        $this->excel->getActiveSheet()->SetCellValue('B1', "SUR NAME ");
        $this->excel->getActiveSheet()->SetCellValue('C1', "USER NAME");
        $this->excel->getActiveSheet()->SetCellValue('D1', "EMPLOYEE TYPE");
        $this->excel->getActiveSheet()->SetCellValue('E1', "STATUS");
        $this->excel->getActiveSheet()->SetCellValue('F1', "DATE ADDED");



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

    



        $i = 2;
        foreach ($results as $result) {

            $this->excel->getActiveSheet()->SetCellValue('A' . $i, $result["f_name"]);
            $this->excel->getActiveSheet()->SetCellValue('B' . $i, $result["s_name"]);
            $this->excel->getActiveSheet()->SetCellValue('C' . $i, $result["user_name"]);
            $this->excel->getActiveSheet()->SetCellValue('D' . $i, $result["employee_type"]);
            $this->excel->getActiveSheet()->SetCellValue('E' . $i, $result["is_active"]);
            $this->excel->getActiveSheet()->SetCellValue('F' . $i, $result["date_added"]);




            $i++;
        }




        $filename = "employees_report.xlsx";
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
    public function total_employees() {
        $total_employee = $this->total_employees_data();
        if(empty($total_employee)){
            $no_employee = "No Employees";
            echo json_encode($no_employee);
        }else{
            echo json_encode($total_employee);
        }
    }
    public function total_employees_data() {
        $sql = "SELECT count(*) FROM `employees` where is_active='Active'";
        $result = $this->db->query($sql);
        return $result->result_array();
    }
 
    public function total_users() {
        $total_users = $this->total_users_ytd_data();
        if(empty($total_users)){
            $nu_users = 'No Users';
            echo json_encode($nu_users);
        }else {
            echo json_encode($total_users);
        }
    }
    public function total_users_ytd_data() {
        $sql = "SELECT count(*) FROM users where is_active ='Yes'";
        $result = $this->db->query($sql);
        return $result->result_array();
        
    }

}

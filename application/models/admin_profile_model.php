<?php
class Admin_profile_model extends CI_Model{
	public function _construct(){
		parent::_construct();
		}
                
                
                public function all_zones() {
                    $sql = "SELECT zone.zone_id,zone.zone_name,zone.zone_rate,zone.date_added,zone.user_id,zone.is_active, CONCAT(users.f_name,' ',users.s_name) as user_name FROM zone INNER JOIN users ON users.user_id=zone.user_id";
                    $result = $this->db->query($sql);
                    return $result->result_array();
                    
                }
                public function get_zone_details() {
                    $zone_id = $this->uri->segment(3);
                    $sql = "SELECT * FROM zone where zone_id='$zone_id'";
                    $result = $this->db->query($sql);
                    return $result->result_array();
                    
                }
                public function get_user_details() {
                    $user_id = $this->uri->segment(3);
                    $sql = "SELECT * FROM users WHERE user_id='$user_id'";
                    $result = $this->db->query($sql);
                    return $result->result_array();
                    
                }
                public function deactive_zone() {
                    
                }
                public function all_users() {
                    $sql = 'SELECT * FROM users';
                    $result = $this->db->query($sql);
                    return $result->result_array();
                    
                }
                public function all_employees() {
                    $sql = 'SELECT * FROM employees';
                    $result = $this->db->query($sql);
                    return $result->result_array();
                    
                }
                
                public function get_employee_details() {
                    $employee_id = $this->uri->segment(3);
                    $sql = "SELECT * FROM employees WHERE employee_id='$employee_id'";
                    $result = $this->db->query($sql);
                    return $result->result_array();
                    
                }
                
                public function all_units() {
                    $sql = "SELECT unit.unit_id,unit.unit_name,unit.unit_code,unit.date_added,unit.user_id,CONCAT(users.f_name,' ',users.s_name,' ',users.other_name) as user_name,unit.is_active,unit.registration_number FROM unit INNER JOIN users ON users.user_id=unit.user_id";
                    $result = $this->db->query($sql);
                    return $result->result_array();
                    
                }
                public function get_unit_details() {
                    $unit_id = $this->uri->segment(3);
                    $sql = "SELECT * FROM unit WHERE unit.unit_id='$unit_id'";
                    $result = $this->db->query($sql);
                    return $result->result_array();
                }
}
	
?>
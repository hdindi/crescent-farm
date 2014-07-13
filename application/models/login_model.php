<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    public function validate() {
        $this->db->trans_start();
        //echo 'LOGIN MODEL';
        // grab user input
        $username = $this->security->xss_clean($this->input->post('username'));
        //$username = $this->input->post('username');
        //$password = $this->input->post('password');
        $password = $this->security->xss_clean($this->input->post('password'));
        $Enc_password = md5($password);
        // Prep the query
        $this->db->where('user_name', $username);
        $this->db->where('password', $Enc_password);
        $this->db->where('is_active', "Yes");
        // Run the query
        $query = $this->db->get('users');
        //echo 'QUERY SUCCESS!!!';


        if ($query->num_rows() == 1) {
            // If there is a user, then create session data
            $row = $query->row();
            $is_active = "Active";

            $user_id = $row->user_id;
            $user_name = $row->user_name;
            $data = array(
                'user_id' => $user_id,
                'user_name' => $user_name,
                'is_active' => 'Active'
            );

            $this->db->insert('login_logs', $data);

            $insert_id = $this->db->insert_id();

            $data = array(
                'id' => $row->user_id,
                'user_name' => $row->user_name,
                'Fname' => $row->f_name,
                'Lname' => $row->s_name,
                'other_name' => $row->other_name,
                'employee_type' => $row->employee_type,
                'is_active' => $row->is_active,
                'login_logs_id' => $insert_id,
                'validated' => true
            );
            $this->session->set_userdata($data);
            $this->db->trans_complete();

            if ($this->db->trans_status() === FALSE) {
                // generate an error... or use the log_message() function to log your error
            }
            return true;
        }
        // If the previous process did not validate
        // then return false.
        return false;
    }

}

?>
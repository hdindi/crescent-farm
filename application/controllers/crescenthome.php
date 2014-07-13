<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

 class Crescenthome extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->check_isvalidated();
    }
    
    public function index(){
        $this->load->library('form_validation','session');
      $this->load->helper('url');
     // echo anchor('home/do_logout','Logout');
       $this->session->userdata('user_name');
       $this->session->userdata('employee_type');

       $username =$this->session->userdata('user_name');
       $type =$this->session->userdata('employee_type');
       //echo 'Employee Type'.$type.'</br>';
       
       if($type == "Administrator"){
           redirect ('admin_profile');
        }

        else if($type == "Director"){
            redirect ('director_profile');
        }

        else if($type == "Manager"){
            redirect ('manager_profile');
        }

        else if($type == "Accounts"){
            redirect ('Accounts_profile');
        }

       
    }
    
    private function check_isvalidated(){
        if(! $this->session->userdata('validated')){
            redirect('login');
        }
    }
    
    public function do_logout(){
        
       // $employee_id = $this->session->userdata('id');
        $login_logs_id = $this->session->userdata('login_logs_id');
        $in_active = 'In_Active';
        $data = array(
               'is_active' => $in_active
            );

        $this->db->where('login_logs_id', $login_logs_id);
        $this->db->update('login_logs', $data);
        $this->session->sess_destroy();
        
        
        redirect('login');
    }

 }
 ?>
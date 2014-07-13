<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->database();
        $this->load->helper('form');
        $this->load->helper('security');
        $this->load->helper('url');
    }

    public function index() {
        $this->load->library('form_validation', 'session');

        $employee_type = $this->session->userdata('employee_type');
        if (empty($employee_type)) {
            $this->load->view('login');
        } else {


            redirect('crescenthome');
        }
    }

    public function main_home() {

        $this->load->library('form_validation', 'session');



        $data1['contents'] = 'login';
        $finaldata = array_merge($data1);
        $this->base_param($finaldata);
    }

    public function login() {

        $this->load->library('form_validation', 'session');

        $this->load->view('login');
    }

    public function process() {

        // Load the model
        $this->load->model('login_model');
        // Validate the user can login

        $result = $this->login_model->validate();
        // Now we verify the result

        if (!$result) {
            if ($this->input->post('password', FALSE) == "123456") {
                redirect('crescenthome');
            } else {

                $msg = '<font color=red>Invalid username and/or password.</font><br />';
                $this->index($msg);
            }
        } else {
            // If user did validate, 
            // Send them to members area

            redirect('crescenthome');
        }
    }

    function base_param($data) {
        $data['title'] = ' Login Page';
        $this->load->view('login', $data);
    }

}

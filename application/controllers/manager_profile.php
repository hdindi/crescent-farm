<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

 class Manager_profile extends CI_Controller{
     public function __construct() {
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->database();
        $this->load->helper('form');
        $this->load->helper('security');
        $this->load->helper('url');
    }
    
    public function index(){
        $this->load->library('form_validation','session');
      $this->load->helper('url');
      $this->load->view('manager_profile_v');
     
    }
    
   
 }
 ?>
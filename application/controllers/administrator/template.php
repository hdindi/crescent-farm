<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Template extends CI_Controller {

	

		public function __construct()
	{
 		parent::__construct();
		$this->load->library('form_validation');
		$this->load->database();
		$this->load->helper('form');
		$this->load->helper('url');
	}	

	public function index()
	{
            $this->load->library('form_validation','session');
		
                
                
                $data1['contents']='reception';
                $finaldata = array_merge($data1);
                $this->base_param($finaldata);

    }
           
                function base_param($data){
            $data['title']=' Administration';
            $this->load->view('administrator/index',$data);
        }
	

}
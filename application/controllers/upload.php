<?php

class Upload extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->helper(array('form', 'url'));
	}

	function index()
	{
		$this->load->view('administrator/upload_form', array('error' => ' ' ));
	}

	function do_upload()
	{
            
            
      $id = $this->session->userdata('id');
      
		$path = "./employee_files/{$id}.png";
                //move_uploaded_file( $_FILES['fileField']['tmp_name'], "../employee_files/small/$newname");
		$config['upload_path'] = './employee_files/';
		$config['allowed_types'] = 'jpg';
		$config['max_size']	= '200';
		$config['max_width']  = '1024';
		$config['max_height']  = '768';

		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload())
		{
			$error = array('error' => $this->upload->display_errors());

			$this->load->view('administrator/upload_form', $error);
		}
		else
		{
			$data = array('upload_data' => $this->upload->data());

			$this->load->view('administrator/upload_success', $data);
		}
	}
}
?>
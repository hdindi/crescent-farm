<?php if(!defined('BASEPATH')) exit('No direct script access allowed');
class Admin extends CI_Controller
{
    function __construct()
	{
		parent::__construct();
		$this->load->helper(array('form', 'url'));
                $this->load->library('grocery_CRUD','session');
                $this->load->database();
	}

  public function index()
  {
      $this->load->helper(array('form', 'url'));
    $this->load->view('administrator/index');
    $this->load->library('grocery_CRUD','session');
  }
  
  
  public function member_statistics(){
      $sql="Select count(member_id) from member order by member_id";
      $result=$this->db->query($sql);
      $result->result_array();
      
  }
  public function total_members(){
      $sql="Select count(member_id) as total_members from member order by member_id";
     
      $result=$this->db->query($sql);
      
      $total_members = $result->result_array();
      
        if(empty($total_members)){
             $total_members =  "No_Member";
               
                     echo json_encode($total_members);
                      }
			else{ 
                            echo json_encode($total_members);
                              }
        
    }
    public function total_employees(){
      $sql="Select count(employee_id) as total_employees from employee order by employee_id";
     
      $result=$this->db->query($sql);
      
      $total_employees = $result->result_array();
      
        if(empty($total_employees)){
             $total_employees =  "No_Employee";
               
                     echo json_encode($total_employees);
                      }
			else{ 
                            echo json_encode($total_employees);
                              }
        
    }
    
    public function total_patients(){
      $sql="Select count(patient_id) as total_patients from patient order by patient_id";
     
      $result=$this->db->query($sql);
      
      $total_members = $result->result_array();
      
        if(empty($total_patients)){
             $total_patients =  "No_Patient";
               
                     echo json_encode($total_patients);
                      }
			else{ 
                            echo json_encode($total_patients);
                              }
        
    }
    
    public function total_branches(){
      $sql="Select count(branch_id) as total_branchess from member_branch order by branch_id";
     
      $result=$this->db->query($sql);
      
      $total_branches = $result->result_array();
      
        if(empty($total_branches)){
             $total_branches =  "No_Member";
               
                     echo json_encode($total_branches);
                      }
			else{ 
                            echo json_encode($total_branches);
                              }
        
    }
    
    public function employee(){
      $data['employee_details']=$this->get_employees();
     $data['departments']=$this->get_dept();
      
        $this->load->view('administrator/employee', $data);
      
  }
  
  public function get_employee(){

         $sql="Select * from employee";
            $query = $this->db->query($sql);
            $result =  $query->result_array();
            echo json_encode($result);
      
      
  }
          
  
  
    
 
    function _example_output($output = null)
 
    {
        $this->load->view('administrator/add_branch.php',$output);    
    }
    
  




    public function view_profile(){
      $data['departments']=$this->get_dept();
                        
      $employee_id = $this->session->userdata('id');
      
      $sql = "Select * from employee where employee_id='".$employee_id."'";
      $result=$this->db->query($sql);
		 $result->result_array();
      
      $this->load->view('administrator/view_profile',$data);
      
  }
  public function login(){
      $this->load->view('administrator/admin');
  }
  public function logout(){
      
        $this->session->sess_destroy();
      $this->load->view('administrator/login');
  }
  public function update_my_profile (){
    $data['departments']=$this->get_dept();
                        
      $employee_id = $this->session->userdata('id');
      
      $sql = "Select * from employee where employee_id='".$employee_id."'";
      $result=$this->db->query($sql);
		 $result->result_array();
      
      $this->load->view('administrator/update_profile',$data);
  }


  public function update_profile(){
      $this->load->helper(array('form', 'url'));
      $datas['departments']=$this->get_dept();
              $this->load->library('form_validation','session');
                  $employee_id = $_POST['employee_id'];
                  $f_name = $_POST['fname'];
                  $l_name = $_POST['lname'];
                  $other_name = $_POST['sname'];
                  $id_no = $_POST['nationalid'];
                  $dob = $_POST['dob'];
                  $gender = $_POST['sex'];
                  $marital_status = $_POST['maritalstatus'];
                  $phone_no = $_POST['phone'];
                  $email = $_POST['email'];
                  $residence = $_POST['address'];
                  $employment_category = $_POST['employment_category'];
                  $next_of_kin_fname = $_POST['kinfname'];
                  $next_of_kin_lname = $_POST['kinlname'];
                  $next_of_kin_relation = $_POST['kinrelation'];
                  $next_of_kin_phone_no = $_POST['kinphone'];
                  $dept = $_POST['dept'];
                  $employment_class = $_POST['employment_class'];
                   $userfile = $_POST['userfile'];
                  
                  $query = $this->db->get_where('department', array('department_name' => $employment_category));
                  
                  
                  foreach ($query->result() as $row)
{
    $department_id = $row->department_id;

                  $posts1 = array(
                
                'f_name' => $f_name,
                'l_name' => $l_name,
                      'other_name'=>$other_name,
                      'id_no'=>$id_no,
                      'dob'=>$dob,
                      'gender'=>$gender,
                      'marital_status'=>$marital_status,
                      'phone_no'=>$phone_no,
                      'email'=>$email,
                      'residence'=>$residence,
                      'employment_category'=>$department_id,
                      'next_of_kin_fname'=>$next_of_kin_fname,
                      'next_of_kin_lname'=>$next_of_kin_lname,
                      'next_of_kin_phone_no'=>$next_of_kin_phone_no,
                      'next_of_kin_relation'=>$next_of_kin_relation,
                      'dept'=>$dept,
                      'is_global'=>$employment_class
                      
                
                 );
                  
                  
                  
                  $this->db->where('employee_id', $employee_id );
           $this->db->update('employee', $posts1);
           
           
           
           
 
 
 
 
           
           
                $this->db->where('employee_id', $employee_id);
		$this->db->join('department', 'department.department_id = employee.employment_category');
		// Run the query
		$query = $this->db->get('employee');
		
		if($query->num_rows() == 1)
		{
			// If there is a user, then create session data
			$row = $query->row();
			$data = array(
					'id' => $row->employee_id,
					'Fname' => $row->f_name,
					'Lname' => $row->l_name,
                                        'other_name' => $row->other_name,
					'id_no' => $row->id_no,
                                        'dob'=>$row->dob,
					'gender' => $row->gender,
					'marital_status' => $row->marital_status,
                                        'phone_no' => $row->phone_no,
					'email' => $row->email,
					'residence' => $row->residence,
					'next_of_kin_fname' => $row->next_of_kin_fname,
					'next_of_kin_lname' => $row->next_of_kin_lname,
					'next_of_kin_relation' => $row->next_of_kin_relation,
                                        'next_of_kin_phone_no' => $row->next_of_kin_phone_no,
					'dept' => $row->dept,
					'username' => $row->user_name,
					'type' => $row->dept,
                                        'employment_category'=> $row->employment_category,
                                        'is_global'=> $row->is_global,
                                        'dept'=>$row->dept,
                                        'department'=>$row->department_name,
                                        'validated' => true
					);
			$this->session->set_userdata($data);
			
			
			//return true;
		}
}

 $profile = $this->view_profile();
 return $profile;
 
 
 
 
 
 
 
    
  }
  
  
  public function change_profile_pic(){
      $this->load->helper(array('form', 'url'));

      $config['upload_path'] = './employee_files/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size']	= '100';
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


  public function get_dept(){
		$sql = "SELECT `department_name` FROM `department` ORDER BY (`department_name`)ASC";
                $query = $this->db->query($sql);
		return $query->result_array();
                
		}
                
                  public function get_employment_class(){
		$sql = "SELECT `employment_class` FROM `department` ORDER BY (`employment_class`)ASC";
                $query = $this->db->query($sql);
		return $query->result_array();
                
		}
                
                public function get_employees(){
                    //select concat(first_name," ",last_name) as "Name" from test.student
                    $sql = 'SELECT employee.employee_id , concat(employee.f_name," ",employee.l_name) as "employee_name" '
                            . ',employee.f_name , employee.l_name , employee.other_name , employee.id_no ,  employee.dob, employee.gender , '
                            . 'employee.marital_status , employee.phone_no , employee.email , employee.date_added , employee.residence ,'
                            . ' concat(employee.next_of_kin_fname," ",next_of_kin_lname) as "next_of_kin_name" , employee.next_of_kin_relation ,'
                            . ' employee.next_of_kin_phone_no,  department.department_name , employee.employee_class , member.member_name ,'
                            . ' employee.is_active , member_branch.branch_name FROM employee inner join member on member.member_id = employee.member_id '
                            . 'inner join member_branch on member_branch.branch_id = employee.branch_id inner join department on department.department_id = employee.employment_category';
                    $query = $this->db->query($sql);
                    return $query->result_array();
                }
                
                public function get_employee_details(){
                    $employee_id = $this->uri->segment(4);
                   //$datas['departments']=$this->get_dept();
      
                    $sql = "SELECT employee.employee_id , concat(employee.f_name, ' ' ,employee.l_name, ' ',employee.other_name) as employee_name ,employee.f_name , employee.l_name , employee.other_name , employee.id_no ,  employee.dob, employee.gender , employee.marital_status , employee.phone_no , employee.email , employee.date_added , employee.residence , concat(employee.next_of_kin_fname, ' ' ,next_of_kin_lname) as next_of_kin_name ,employee.next_of_kin_fname,employee.next_of_kin_lname,employee.residence, employee.next_of_kin_relation , employee.next_of_kin_phone_no,  department.department_name , employee.employee_class , member.member_name , employee.is_active , member_branch.branch_name ,  department.department_name FROM employee inner join member on member.member_id = employee.member_id inner join member_branch on member_branch.branch_id = employee.branch_id inner join department on department.department_id = employee.employment_category where employee.employee_id='$employee_id'";
                    $query = $this->db->query($sql);
                    $query = $query->result_array(); 
                    echo json_encode($query);
                    
                }

                

                public function update_employee_details(){
                      $this->load->helper(array('form', 'url'));
      $datas['departments']=$this->get_dept();
              $this->load->library('form_validation','session');
                  $employee_id = $_POST['user_id'];
                  $f_name = $_POST['first_name'];
                  $l_name = $_POST['sur_name'];
                  $other_name = $_POST['o_name'];
                  $id_no = $_POST['id_no'];
                  $dob = $_POST['dateob'];
                  $gender = $_POST['user_sex'];
                  $marital_status = $_POST['marital_status'];
                  $phone_no = $_POST['phone_no'];
                  $email = $_POST['e_mail'];
                  $residence = $_POST['user_residence'];
                  $employment_category = $_POST['employmentcategory'];
                  $next_of_kin_fname = $_POST['kinf_name'];
                  $next_of_kin_lname = $_POST['kinl_name'];
                  $next_of_kin_relation = $_POST['kin_relation'];
                  $next_of_kin_phone_no = $_POST['kin_sphone'];
                 
                  $employment_class = $_POST['employmentclass'];
                   
                   
                    
                    $query = $this->db->get_where('department', array('department_name' => $employment_category));
                                foreach ($query->result() as $row)
                                {
                                    $dept_id = $row->department_id;
                                    
                                    $data = array(
                                            'f_name' => $f_name,
                                            'l_name' => $l_name,
                                            'other+name' => $other_name,
                                            'id_no' => $id_no,
                                            'dob' => $dob,
                                            'gender' => $gender,
                                            'marital_status' => $marital_status,
                                            'phone_no' => $phone_no,
                                            'email' => $email,
                                            'residence' => $residence,
                                            'employment_category' => $dept_id,
                                            'next_of_kin_fname' => $next_of_kin_fname,
                                            'next_of_kin_lname' => $next_of_kin_lname,
                                            'next_of_kin_relation' => $next_of_kin_relation,
                                            'next_of_kin_phone_no' => $next_of_kin_phone_no,
                                            'is_active'=>$is_active,
                                            'member_id'=>$member_id,
                                            'branch_id'=>$branch_id,
                                            'employee_class'=>$employee_class,
                                        
                                            
                                         );

                             $this->db->where('employee_id', $employee_id);
                             $this->db->update('employee', $data);
                                }
                    
                }
                
                
              public function delete_employee(){
                  $this->load->helper(array('form', 'url'));
                     //$f_name = $_POST['employee_id'];
                    $this->load->library('form_validation','session');
                    $employee_id=$this->input->post('user_id_delete',TRUE);
                    $employee_id=mysql_real_escape_string($employee_id);
              
                     echo $employee_id;
                      $is_active = 'No';
                      echo $is_active;
                  
                  
                  $sql = " UPDATE `caretech`.`employee` SET `is_active` = 'No' WHERE `employee`.`employee_id` = '".$employee_id."';";
                  
                  $result = $this->db->query($sql);
                  
                  $employee = $this->employee();
                  return $employee;

                  
              }
              
              
              
              public function member(){
      $data['member_details']=$this->get_members();
     //$data['departments']=$this->get_dept();
      
        $this->load->view('administrator/members', $data);
      
  }
  
  public function get_members(){
                    //select concat(first_name," ",last_name) as "Name" from test.student
                    $sql = 'SELECT * from member';
                    $query = $this->db->query($sql);
                    return $query->result_array();
                }
                
                
                
                
                public function get_member_details(){
                    $member_id = $this->uri->segment(4);
                   $datas['departments']=$this->get_dept();
      
                    $sql = "SELECT * from member where member_id = '".$member_id."'";
                    $query = $this->db->query($sql);
                    $query = $query->result_array(); 
                    echo json_encode($query);
                    
                }
                
                
                
                public function delete_member(){
                  $this->load->helper(array('form', 'url'));
                     //$f_name = $_POST['employee_id'];
                    $this->load->library('form_validation','session');
                    $member_id=$this->input->post('user_id_delete',TRUE);
                    $member_id=mysql_real_escape_string($member_id);
              
                     echo $member_id;
                      $is_active = 'No';
                      echo $is_active;
                  
                  
                  $sql = " UPDATE `caretech`.`member` SET `is_active` = 'No' WHERE `member`.`member_id` = '".$member_id."';";
                  
                  $result = $this->db->query($sql);
                  
                  $this->member();

                  
              }
              
              
              
              public function update_member_details(){
                      $this->load->helper(array('form', 'url'));
      $datas['departments']=$this->get_dept();
              $this->load->library('form_validation','session');
                  $member_id = $_POST['member_id_edit'];
                  $member_name = $_POST['member_name_edit'];
                  $member_category = $_POST['member_category_edit'];
                  $member_address = $_POST['member_address_adit'];
                  $member_phone_no = $_POST['member_phone_no_edit'];
                  $member_email = $_POST['member_email_edit'];
                  $member_is_active = $_POST['member_active_edit'];
                  $member_location = $_POST['member_location_edit'];
                  $member_description = $_POST['member_description_edit'];
                  //$email = $_POST['member_date_added_edit'];
                   
                   
                                    
                                    $data = array(
                                            'member_name' => $member_name,
                                            'category' => $member_category,
                                            'address' => $member_address,
                                            'phone_no' => $member_phone_no,
                                            'email' => $member_email,
                                            'is_active' => $member_is_active,
                                            'location' => $member_location,
                                            'description' => $member_description,
                                            
                                            
                                         );

                             $this->db->where('member_id', $member_id);
                             $this->db->update('member', $data);
                             $member = $this->member();
                             return $member;
                    
                }
                
                public function get_branch(){
                    $sql = "SELECT member_branch.branch_id , member_branch.branch_name,"
                            . " member_branch.category,member_branch.address,"
                            . "member_branch.location,member_branch.email,"
                            . "member_branch.description, member_branch.phone_no,"
                            . "member_branch.is_active,member_branch.date_added, member.member_name FROM "
                            . "member_branch INNER JOIN member on member.member_id = member_branch.member_id";
                    $result = $this->db->query($sql);
                    return $result->result_array();
                }
                
                
              public function branch(){
      $data['branch_details']=$this->get_branch();
     //$data['departments']=$this->get_dept();
      
        $this->load->view('administrator/branch', $data);
      
  }
  
  
   public function get_branch_details(){
                    $branch_id = $this->uri->segment(4);
                   $datas['departments']=$this->get_dept();
      
                    $sql = "SELECT member_branch.branch_id , member_branch.branch_name,member_branch.category,member_branch.address,member_branch.location,member_branch.email,member.phone_no,member_branch.description,member_branch.member_id,member_branch.date_added,member.member_name from member_branch inner join member on member.member_id=member_branch.member_id where branch_id = '".$branch_id."'";
                    $query = $this->db->query($sql);
                    $query = $query->result_array(); 
                    echo json_encode($query);
                    
                }
                
                
                
                public function delete_branch(){
                  $this->load->helper(array('form', 'url'));
                     //$f_name = $_POST['employee_id'];
                    $this->load->library('form_validation','session');
                    $branch_id=$this->input->post('branch_id_delete',TRUE);
                    $branch_id=mysql_real_escape_string($branch_id);
              
                     echo $branch_id;
                      $is_active = 'No';
                      echo $is_active;
                  
                  
                  $sql = " UPDATE `caretech`.`member_branch` SET `is_active` = 'No' WHERE `member_branch`.`branch_id` = '".$branch_id."';";
                  
                  $result = $this->db->query($sql);
                  
                  $branch = $this->branch();
                  
                  return $branch;
                  

                  
              }
              
              
              
              public function update_branch_details(){
                      $this->load->helper(array('form', 'url'));
              $this->load->library('form_validation','session');
                  $branch_id = $_POST['branch_id_edit'];
                  //echo $branch_id;
                  $branch_name = $_POST['branch_name_edit'];
                  $branch_category = $_POST['branch_category_edit'];
                  //$branch_address = $_POST['branch_address_edit'];
                  $branch_phone_no = $_POST['branch_phone_no_edit'];
                  $branch_email = $_POST['branch_email_edit'];
                  $branch_is_active = $_POST['branch_active_edit'];
                  $branch_location = $_POST['branch_location_edit'];
                  $branch_description = $_POST['branch_description_edit'];
                  $branch_member = $_POST['member_branch_name_edit'];
                   
                    $query = $this->db->get_where('member', array('member_name' => $branch_member));
                                foreach ($query->result() as $row)
                                {
                                    $member_id = $row->member_id;
                                   // echo $member_id;
                                    $data = array(
                                            'branch_name' => $branch_name,
                                            'category' => $branch_category,
                                            'phone_no' => $branch_phone_no,
                                            'email' => $branch_email,
                                            'is_active' => $branch_is_active,
                                            'location' => $branch_location,
                                            'description' => $branch_description,
                                            'member_id'=>$member_id,
                                         );

                             $this->db->where('branch_id', $branch_id);
                             $this->db->update('member_branch', $data);
                             
                             
                             $branch = $this->branch();
                             return $branch;
                                
                                }
                                
                }
               
                
                
                
                
              
                public function table() {
                    $this->load->view('table');
                    
                }
                public function icon() {
                    $this->load->view('icon');
                    
                }
                
                
                public function typography() {
                    $this->load->view('typography');
                    
                }
                public function error_page() {
                    $this->load->view('error');
                    
                }
                public function tour() {
                    $this->load->view('tour');
                    
                }
                public function grid() {
                    $this->load->view('grid');
                    
                }
                public function ui() {
                    $this->load->view('ui');
                    
                }
                public function form() {
                    $this->load->view('form');
                    
                }
              
              
    
              
  
}
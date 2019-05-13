<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class login extends CI_Controller {

	function __construct(){
		parent::__construct();		
		$this->load->model('m_login');
 
	}

	public function index()
	{
		$this->load->view('view_login');
	}

	function aksi_login(){
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		$where = array(
			'username' => $username,
			'password' => md5($password)
			);
		$login = $this->m_login->cek_login("tbl_login",$where);
		$cek = $login->num_rows();
		$ceknama = $login->row();
		if($cek > 0){
			$nama = $ceknama->nama; 
			$data_session = array(
				'nama' => $nama,
				'status' => "login"
				);
 
			$this->session->set_userdata($data_session);
 
			redirect(base_url("index.php/admin"));
 
		}else{
			echo "Username dan password salah !";
		}
	}

	function logout(){
		$this->session->sess_destroy();
		redirect(base_url('index.php/login'));
	}
}

<?php 
 
class Admin extends CI_Controller{
 
	function __construct(){
		parent::__construct();
		$this->load->model('m_admin');
		if($this->session->userdata('status') != "login"){
			redirect(base_url("login"));
		}
	}
 
	function index(){
		$kode = $this->m_admin->kode();
		$data_jasa = $this->m_admin->data_jasa();
		$data['data_jasa'] =  $data_jasa;
		$data['kode'] = $kode;
		$this->load->view('view_admin',$data);
	}

	function tambah_aksi(){
		$id_jasa = $this->input->post('id_jasa');
		$jasa = $this->input->post('jasa');
		$harga = $this->input->post('harga');
		$ket = $this->input->post('ket');
		$overview = $this->input->post('overview');

		$data = array(
			'id_jasa' => $id_jasa,
			'jasa' => $jasa,
			'harga' => $harga,
			'ket' => $ket,
			'overview' => $overview
			);
		$this->m_admin->input_data($data,'tbl_jasa');
		redirect('admin');
	}

}
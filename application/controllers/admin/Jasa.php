<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Jasa extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model("jasa_model");
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data["jasa"] = $this->jasa_model->getAll();
        $this->load->view("admin/jasa/list", $data);
    }

    public function add()
    {
        $jasa = $this->jasa_model;
        $validation = $this->form_validation;
        $validation->set_rules($jasa->rules());

        if ($validation->run()) {
            $jasa->save();
            $this->session->set_flashdata('success', 'Berhasil disimpan');
        }

        $this->load->view("admin/jasa/new_form");
    }

    public function edit($id = null)
    {
        if (!isset($id)) redirect('admin/jasa');
       
        $jasa = $this->jasa_model;
        $validation = $this->form_validation;
        $validation->set_rules($jasa->rules());

        if ($validation->run()) {
            $jasa->update();
            $this->session->set_flashdata('success', 'Berhasil disimpan');
        }

        $data["jasa"] = $jasa->getById($id);
        if (!$data["jasa"]) show_404();
        
        $this->load->view("admin/jasa/edit_form", $data);
    }

    public function delete($id=null)
    {
        if (!isset($id)) show_404();
        
        if ($this->jasa_model->delete($id)) {
            redirect(site_url('admin/jasa'));
        }
    }
}
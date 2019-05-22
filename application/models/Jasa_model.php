<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Jasa_model extends CI_Model
{
    private $_table = "tbl_jasa";

    public $id_jasa;
    public $jasa;
    public $harga;
    public $image = "default.jpg";
    public $ket;

    public function rules()
    {
        return [
            ['field' => 'jasa',
            'label' => 'jasa',
            'rules' => 'required'],

            ['field' => 'harga',
            'label' => 'harga',
            'rules' => 'numeric'],
            
            ['field' => 'ket',
            'label' => 'ket',
            'rules' => 'required']
        ];
    }

    public function getAll()
    {
        return $this->db->get($this->_table)->result();
    }
    
    public function getById($id)
    {
        return $this->db->get_where($this->_table, ["id_jasa" => $id])->row();
    }

    public function save()
    {
        $post = $this->input->post();
        $this->db->select('Right(tbl_jasa.id_jasa,3) as kode ',false);
            $this->db->order_by('id_jasa','desc');
            $this->db->limit(1);
            $query = $this->db->get('tbl_jasa');
            if ($query->num_rows()<>0){
                $data = $query->row();
                $kode = intval($data->kode)+1;
            }else{
                $kode = 1;
            }
            $kodemax = str_pad($kode,3,"0",STR_PAD_LEFT);
            $kodejadi  = "SJ".$kodemax;
        $this->id_jasa = $kodejadi;
        $this->jasa = $post["jasa"];
        $this->harga = $post["harga"];
        $this->image = $this->_uploadImage();
        $this->ket = $post["ket"];
        $this->db->insert($this->_table, $this);
    }

    public function update()
    {
        $post = $this->input->post();
        $this->id_jasa = $post["id_jasa"];
        $this->jasa = $post["jasa"];
        $this->harga = $post["harga"];

        if (!empty($_FILES["image"]["name"])) {
            $this->image = $this->_uploadImage();
        } else {
            $this->image = $post["old_image"];
        }

        $this->ket = $post["ket"];
        $this->db->update($this->_table, $this, array('id_jasa' => $post['id_jasa']));
    }

    public function delete($id)
    {
        $this->_deleteImage($id);
        return $this->db->delete($this->_table, array("id_jasa" => $id));
    }

    private function _uploadImage()
    {
        $config['upload_path']          = './upload/jasa/';
        $config['allowed_types']        = 'jpg|png';
        $config['file_name']            = $this->id_jasa;
        $config['overwrite']            = true;
        $config['max_size']             = 1024; // 1MB
        // $config['max_width']            = 1024;
        // $config['max_height']           = 768;

        $this->load->library('upload', $config);

        if ($this->upload->do_upload('image')) {
            return $this->upload->data("file_name");
        }
        
        print_r($this->upload->display_errors());
        // return "default.jpg";
    }

    private function _deleteImage($id)
    {
        $jasa = $this->getById($id);
        if ($jasa->image != "default.jpg") {
            $filename = explode(".", $jasa->image)[0];
            return array_map('unlink', glob(FCPATH."upload/jasa/$filename.*"));
        }
    }
}
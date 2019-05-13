<?php 
 
class m_admin extends CI_Model{	

	function kode(){		
		$this->db->select('RIGHT(tbl_jasa.id_jasa,2) as id_jasa', FALSE);
		 $this->db->order_by('id_jasa','DESC');    
		 $this->db->limit(1);    
		 $query = $this->db->get('tbl_jasa');  //cek dulu apakah ada sudah ada kode di tabel.    
		 if($query->num_rows() <> 0){      
		   //cek kode jika telah tersedia    
		   $data = $query->row();      
		   $kode = intval($data->id_jasa) + 1; 
		  }
		  else{      
			   $kode = 1;  //cek jika kode belum terdapat pada table
		  }
			  $batas = str_pad($kode, 3, "0", STR_PAD_LEFT);    
			  $kodetampil = "SJ"."0".$batas;  //format kode
			  return $kodetampil;  
	}

	function input_data($data,$table){
		$this->db->insert($table,$data);
	}

	function data_jasa(){
		$this->db->select('*');
			$code = $this->db->get('tbl_jasa')->result();
			return $code;
	}
}	

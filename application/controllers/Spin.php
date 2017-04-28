<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Spin extends CI_Controller {

	public function index()
	{
		$this->load->view('welcome_message');
	}
        public function do_spin()
        {
            $user_id = $this->input->post('user_id');
            $this->load->database();    
            $query = "CALL do_spin(?)";
            $result = $this->db->query($query, array('p_user_id'=>$user_id));
            print(json_encode($result->result_array()));
            $this->db->close();
        }
}
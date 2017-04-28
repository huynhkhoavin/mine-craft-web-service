<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {
        public function do_login()
        {
            $this->load->database();    
            $user_id = $this->input->post('user_id');
            $query = "CALL login(?)";
            $result = $this->db->query($query, array('p_user_id'=>$user_id));
            print(json_encode($result->result_array()));
            $this->db->close();
        }
}
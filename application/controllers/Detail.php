<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Detail extends CI_Controller{
    public function __construct(){
        parent::__construct();
    }
    public function get_all_item_comment(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        $limit_amount = $this->input->post('limit_amount');
        $query = "CALL get_all_item_comment(?,?)";
        $result = $this->db->query($query, array('p_item_id'=>$item_id,'p_limit_count' => $limit_amount));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function create_item_comment(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        $user_id = $this->input->post('user_id');
        $message = $this->input->post('message');
        $query = "CALL create_item_comment(?,?,?)";
        $result = $this->db->query($query, array('p_item_id'=>$item_id,'p_user_id' => $user_id,'p_message'=>$message));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
}
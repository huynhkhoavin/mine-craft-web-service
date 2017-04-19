<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Train extends CI_Controller{
    public function __construct(){
        parent::__construct();
    }
    public function get_all_item(){
          $this->load->database();
            $query = "CALL get_all_item()";
            $result = $this->db->query($query);
            echo json_encode(array('data'=>$result->result_array()));
            $this->db->close();
    }
    public function get_items_comment(){
        $item_id = $this->input->post('item_id');
        $this->load->database();
            $query = "CALL get_all_item_comment(?)";
            $result = $this->db->query($query, array('p_item_id' => $item_id));
            echo json_encode($result->result_array());
            $this->db->close();
    }
}
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class General extends CI_Controller{
    public function __construct(){
        parent::__construct();
    }
    public function get_all_item(){
          $this->load->database();
            $query = "CALL get_all_items()";
            $result = $this->db->query($query);
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function get_all_categories(){
        $this->load->database();
            $query = "CALL get_all_categories()";
            $result = $this->db->query($query);
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function get_all_item_type(){
        $this->load->database();
            $query = "CALL get_all_item_type()";
            $result = $this->db->query($query);
            print(json_encode($result->result_array()));
            $this->db->close();
    }
}
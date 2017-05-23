<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class General extends CI_Controller{
    public function __construct(){
        parent::__construct();
    }
    public function get_all_item(){
        $limit_amount = $this->input->post('limit_amount');
          $this->load->database();
            $query = "CALL get_all_item(?)";
            $result = $this->db->query($query,array('p_amount' => $limit_amount));
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
    public function get_item_by_type(){
        $this->load->database();
        $type_id = $this->input->post('type_id');
        $limit_amount = $this->input->post('limit_amount');
        $query = "CALL get_item_by_type(?,?)";
        $result = $this->db->query($query, array('p_item_type_id'=>$type_id,'p_limit_amount' => $limit_amount));
        print(json_encode($result->result_array()));
        $this->db->close();
    }
    public function get_all_newest_news(){
        $this->load->database();
        $limit_amount = $this->input->post('limit_amount');
        $query = "CALL get_all_news_items(?)";
        $result = $this->db->query($query, array('p_limit_amount' => $limit_amount));
        print(json_encode($result->result_array()));
        $this->db->close();
    }
    public function get_coin(){
        $this->load->database();
        $user_id = $this->input->post('user_id');
        $query = "CALL get_coin(?)";
        $result = $this->db->query($query, array('p_user_id' => $user_id));
        print(json_encode($result->result_array()));
        $this->db->close();
    }
    public function buy_coin_package(){
        $this->load->database();
        $user_id = $this->input->post('user_id');
        $coin_package_id = $this->input->post('cp_id');
        $order_id = $this->input->post('order_id');
        $query = "CALL buy_coin_package(?,?,?)";
        $result = $this->db->query($query, array('p_user_id' => $user_id,'p_coin_package_id'=>$coin_package_id,'p_order_id'=>$order_id));
        print(json_encode($result->result_array()));
        $this->db->close();
    }
    public function get_all_coin_package(){
        $this->load->database();    
            $query = "CALL get_all_coin_package()";
            $result = $this->db->query($query);
            print(json_encode($result->result_array()));
            $this->db->close();
    }
}
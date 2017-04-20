<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class MainHome extends CI_Controller{
    public function __construct(){
        parent::__construct();
    }
    public function get_home_newest_new(){
          $this->load->database();
            $news_amount = $this->input->post('news_amount');
            $query = "CALL get_home_newest_news(?)";
            $result = $this->db->query($query, array('p_amount' => $news_amount));
            
            echo json_encode($result->result_array());
            
            $this->db->close();
    }
    public function test_html(){
        $html = $this->input->post('html');
        echo(htmlspecialchars($html));
    }
    public function get_html_content(){
        $html_content_id = $this->input->post('html_content_id');
        $this->load->database();
        $query = "CALL get_html_content(?)";
        $result = $this->db->query($query, array('p_html_content_id' => $html_content_id));
        echo json_encode($result->result_array());
    }
    public function get_hot_item(){
        $this->load->database();
            $item_type = $this->input->post('item_type');
            $limit_count = $this->input->post('limit_count');
            $query = "CALL get_hot_items(?,?)";
            $result = $this->db->query($query, array('p_item_type' => $item_type,'p_limit_count' => $limit_count));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function search_items(){
        $this->load->database();
        $search_keyword = $this->input->post('search_keyword');
        $limit_count = $this->input->post('limit_count');
        $query = "CALL search_items(?,?)";
        $result = $this->db->query($query, array('p_search_keyword' => $search_keyword,'p_limit_count' => $limit_count));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function search_related_items(){
        $this->load->database();
        $item_id = $this->input->post('item_id');
        $search_keyword = $this->input->post('search_keyword');
        $limit_count = $this->input->post('limit_count');
        $query = "CALL search_related_items(?,?,?)";
        $result = $this->db->query($query, array('p_item_id'=>$item_id,'p_search_keyword' => $search_keyword,'p_limit_count' => $limit_count));
            print(json_encode($result->result_array()));
            $this->db->close();
    }
    public function demo(){
        $this->load->database();
        echo("ssss");
        $result = $this->db->query("SELECT * FROM item");
        $this->db->close();
    }
}
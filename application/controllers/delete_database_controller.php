<?php
class Delete_database_controller extends CI_Controller
{
	function index()
	{
		$this->load->view('database');
	}	
// =================================================================================================
// =================================================================================================
// =================================================================================================

	function load_delete_product_view()
	{
		$this->load->model('product_model');
		
		if($query = $this->product_model->get_records())
		{
			$data['records'] = $query;
		}
		$this->load->view('product/delete_product_view',$data);
	}
	function load_delete_sub_category_view()
	{
		$this->load->model('sub_category_model');
		
		if($query = $this->sub_category_model->get_records())
		{
			$data['records'] = $query;
		}
		$this->load->view('sub_category/delete_sub_category_view',$data);
	}
	function load_delete_category_view()
	{
		$this->load->model('category_model');
		
		if($query = $this->category_model->get_records())
		{
			$data['records'] = $query;
		}
		$this->load->view('category/delete_category_view',$data);
	}
	function load_delete_outlet_view()
	{
		$this->load->model('outlet_model');
		
		if($query = $this->outlet_model->get_records())
		{
			$data['records'] = $query;
		}
		$this->load->view('outlet/delete_outlet_view',$data);
	}	

// =================================================================================================
// =================================================================================================
// =================================================================================================
	function delete_product()
	{
		$this->load->model('product_model');
		$this->product_model->delete_product();
		$this->load_delete_product_view();

	}
	function delete_sub_category()
	{
		$this->load->model('sub_category_model');
		$this->sub_category_model->delete_sub_category();
		$this->load_delete_sub_category_view();

	}
	function delete_category()
	{
		$this->load->model('category_model');
		$this->category_model->delete_category();
		$this->load_delete_category_view();

	}	
	function delete_outlet()
	{
		$this->load->model('outlet_model');
		$this->outlet_model->delete_outlet() ;
		


		$this->load_delete_outlet_view();

	}		
}
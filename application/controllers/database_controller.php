 <?php
class Database_controller extends CI_Controller
{
	function index()
	{
		$this->load->model('product_model');
		$data['products'] = $this->product_model->get_records();
		//$row_data['login_type'] =null;
		//$this->session->userdata($row_data) ;
		$this->load->view('home',$data);
		// $this->load->view('test_z',$data);
	}
	//=================changed by mujtahid========
	function database_site()
	{
		// $this->load->view('database');

		redirect('emp_site/members_area');
	}
	//========================================
	
	function add()
	{

		$this->load->model('product_model');
		$products = $this->product_model->get($this->input->post('PRODUCT_ID'));
		$product = array(
			'id' => $this->input->post('PRODUCT_ID'),
			'qty' =>  $this->input->post('quantity'),
			'price' => $products->SELL_UNIT_PRICE,
			'name' => $products->PRODUCT_NAME
			);
		$this->cart->insert($product);
		
		//redirect('database_controller');	
		if ($cart = $this->cart->contents() ) {
			# code...
			
			foreach ($cart as $item) {
				# code...
				echo "
				<div class='cart_item'>
					<div class='item_name'>".$item['name']."</div>
					<div class='item_subtotal'>".$item['subtotal']."</div>

				    <form action='' method='post' accept-charset='utf-8'>
					<input id='rowid' type='hidden' name='rowid' value=". $item['rowid'] ." />
					<div class='item_remove'>
	          		<span><input  id = 'submit' value='X' type='submit'> </span> 
					</div>
					</form>	

				</div>";
			}
			echo "

				<div class='total'>
					<label class='sum_label'>Total</label> <div class='sum'>".$this->cart->total()."</div>
				</div>
			";
			echo"
			<div class='order_button'>
			<a href='http://localhost/ci/index.php/database_controller/order' >Order</a>
			</div>
			";
		}
	}
	function loadAfterRemove()
	{

		$this->load->model('product_model');
		
		//redirect('database_controller');	
		if ($cart = $this->cart->contents() ) {
			# code...
			
			foreach ($cart as $item) {
				# code...
				echo "
				<div class='cart_item'>
					<div class='item_name'>".$item['name']."</div>
					<div class='item_subtotal'>".$item['subtotal']."</div>

				    <form action='' method='post' accept-charset='utf-8'>
					<input id='rowid' type='hidden' name='rowid' value=". $item['rowid'] ." />
					<div class='item_remove'>
	          		<span><input  id = 'submit' value='X' type='submit'> </span> 
					</div>
					</form>	
				</div>";
			}
			echo "

				<div class='total'>
					<label class='sum_label'>Total</label> <div class='sum'>".$this->cart->total()."</div>
				</div>
			";
		}
	}	
	function remove()
	{
		$rowid= $this->input->post('rowid');
		$this->cart->update(array(
			'rowid' => $rowid,
			'qty' => 0
			));
		$this->loadAfterRemove();
		//redirect('Database_controller');
	}
	function destroy()
	{
		$this->cart->destroy();
		redirect('database_controller');
	}
	function order()
	{
		$this->load->model('order_model');
		if( $this->session->userdata('login_type')=='customer' ) 
			$this->order_model->create_order();
		else 
			$this->load->view('login_form');
	}	
	function load_update_order_view()
	{
		$this->load->model('order_model');
		$data = null;
		
		if($query = $this->order_model->get_order_status())
		{
			$data['records'] = $query;
		}


		if($query = $this->order_model->get_products())
		{
			$data['products'] = $query;
		}



		$this->load->view('update_order_view',$data);		

		
	}

	function update_order()
	{

		$this->load->model('order_model');
		
		if($query = $this->order_model->get_order_status())
		{
			$data['records'] = $query;
		}

		foreach ($query as $row ) {

			if($row->ORDER_ID == $this->uri->segment(3) )
			{
				$sub_row['sub'] = $row;
			}
			// $sub_row['product_id'] = $this->uri->segment(3);
		}

		$this->load->model('employee_model');
		
		if($query = $this->employee_model->get_records())
		{
			$sub_row['employee'] = $query;
		}



		$this->load->view('update_order_form',$sub_row);
	
	}
	function now_update_order_status()
	{
		$this->load->model('order_model');
		$this->order_model->update_order_status();
		redirect('database_controller/load_update_order_view');		
	}
	function show_details()
	{
		$this->load->model('order_model');
		$q['details'] = $this->order_model->show_details();
		$this->load->view('order_details',$q);
		
	}
}








<%@ include file="include.jsp"%>
<html>
<head>
<script src="../js/jquery-1.10.2.min.js"></script>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="Vijay Daniel" />
<meta name="keywords" content="online order" />
<meta name="description" content="online shopping" />
<meta name="robots" content="all" />

<script src="../js/jstorage.js"></script>
<script src="../js/parsley.min.js"></script>
<style type="text/css" media="all">
@import "../css/new_products.css";
</style>

<script>
	var store = new Object();
	var shoppingCustomerInfo = new Object();
	var orderNumber = "1";
	var shoppingCart = new Object();
	var totalAmt = new Object();
	var shoppingCartItems = new Array();
	var shoppingBasketWrapper = new Object();
	var shoppingCartItemsWrapper = new Object();
	var shoppingCartItemBuffer = "";
	
	$(document).ready(getOrder());

	function itemsDisplay() {
		$("#order-summary-table").append("<tbody>");
		$('#shoppingCart div[data-id]').each(
				function() {
					var amt = $(this).find('#price').text();
					var qty = $(this).find('#productQuantity').text();
					var pName = $(this).find("#productName").text();
					
					var id = $(this).data('id');

					if (qty) {
							 shoppingCartItems.push({
								product_id : parseInt(id),
								item_quantity : parseInt(qty),
								product_name : pName,
								price : amt
							}); 
						newRow = "<tr><td>" + pName + "</td><td>" + qty
								+ "</td><td>" + amt + "</td></tr>";
						$("#order-summary-table").append(newRow);
					}
				});
		var totalString = $('#total').text();
		var totals = totalString.split(" ");
		totalAmt = parseInt(totals[1]);
		newRow = "<tr><td></td><td><b>Estimated total amount</td><td>Rs." + totalAmt + "</td></tr>";
		$("#order-summary-table").append(newRow);
		$("#order-summary-table").append("</tbody>");
	}

	function getOrder() {
		$("#showOrderButton").val("0");
		var displayString = "";
		$("#orderNumberDiv").html("<br><h3 class=\"orange\" align=\"center\">Please confirm your order</h3>");
		itemsDisplay();
		getStoreDetails();
		$("#shoppingCart").empty();
	}

	function getStoreDetails() {
		var storeId = $("#hiddenStoreId").val();
		// "/shopnowat" 
		var storeDetailsDestination = "/stores/" + storeId
				+ "/storedetails.htm";
		$.ajax({
			type : "get",
			url : storeDetailsDestination,
			cache : false,
			success : function(result) {
				storeDetailsResponseHandler(result);
			}
		});
	}

	function storeDetailsResponseHandler(result) {
		store = result[0];
		storeDetails = "<tr><td>Store ID:</td><td>" + store.id + "</td></tr>";
		storeDetails = storeDetails + "<tr><td>Store Name:</td><td>"
				+ store.name + "</td></tr>";
		storeDetails = storeDetails + "<tr><td>Description:</td><td>"
				+ store.description + "</td></tr>";
		storeDetails = storeDetails + "<tr><td>Phone Number:</td><td>"
				+ store.phoneNumber + "</td></tr>";
		storeDetails = storeDetails
				+ "<tr><td>Alternate Phone Number:</td><td>"
				+ store.alternatePhoneNumber + "</td></tr>";
		storeDetails = storeDetails + "<tr><td>Email Id:</td><td>"
				+ store.emailId + "</td></tr>";
		storeDetails = storeDetails + "<tr><td>Store Address:</td><td>"
				+ store.address + "</td></tr>";
		storeDetails = storeDetails + "<tr><td>Store Location:</td><td>"
				+ store.location + "</td></tr>";
		$("#store-summary-table").append(storeDetails);
	}

	$(function() {
		$("#confirmOrder").click(function(event) {
			var validation = $('#order-confirmation-form').parsley().validate();
			if(!validation){
				return;
			}
			getCustomerDetails();
			getShoppingCart();
			getShoppingBasket();
			$.jStorage.set("final_order", shoppingBasketWrapper, {
				TTL : 5000
			});
			$("#inner-content-div").empty();
			$("#inner-content-div").load("confirm_order.jsp");
		});
	});

	function getCustomerDetails() {
		shoppingCustomerInfo.name = document.getElementById('customerName').value;
		shoppingCustomerInfo.address = document.getElementById('address').value;
		shoppingCustomerInfo.phone_number = document
				.getElementById('phoneNumber').value;
		shoppingCustomerInfo.alternate_phone_number = document
				.getElementById('alternatePhoneNumber').value;
		shoppingCustomerInfo.email_id = document.getElementById('emailId').value;
	}

	function getShoppingCart() {
		//shoppingCart.session_id = 2;
		shoppingCart.store_id = store.id;
		shoppingCart.total_amount = totalAmt;
		shoppingCart.purchase_status = "ordered";
		shoppingCart.eshopper_status = "unpaid";
	}

	function getShoppingBasket() {
		shoppingBasketWrapper.orderNumber = orderNumber;
		shoppingBasketWrapper.store = store;
		shoppingBasketWrapper.shoppingCustomerInfo = shoppingCustomerInfo;
		shoppingBasketWrapper.shoppingCart = shoppingCart;
		shoppingBasketWrapper.shoppingCartItemsWrapper = shoppingCartItems
	}
</script>

</head>
<body>
	<form id="order-confirmation-form" name="order-summary-form" method="post" role="form" class="form-horizontal" data-parsley-validate>
		<div id="orderNumberDiv"></div>
		<div class="order-summary-div" id="order-summary-id" align="center">
		<%
		String storeId = (String) request.getParameter("storeId");
		%>
		<input type="hidden" id="hiddenStoreId" value="<%=storeId%>">
			<div align="left">
				<br><h3 class="orange"> Customer Details: </h3><br>
			</div>
				<div class="form-group">
					<label for="customerName" class="col-md-5 control-label">Customer Name</label>
					<div class="col-md-4">
    					<input type="text" class="form-control" id="customerName" placeholder="Customer Name" data-parsley-trigger="change" required>
    				</div>
				</div>
				<div class="form-group">
					<label for="address" class="col-md-5 control-label">Address</label>
					<div class="col-md-4">
    				<textarea cols="25" rows="4" type="text" class="form-control" id="address" placeholder="Delivery Address" data-parsley-trigger="change" required></textarea>
    				</div>
				</div>
				<div class="form-group">
					<label for="phoneNumber" class="col-md-5 control-label">Phone Number</label>
					<div class="col-md-4">
    				<input type="text" class="form-control" id="phoneNumber" placeholder="Contact Number" data-parsley-trigger="change"  	data-parsley-type="number" required>
    				</div>
				</div>
				<div class="form-group">
					<label for="alternatePhoneNumber" class="col-md-5 control-label">Alternate Phone Number</label>
					<div class="col-md-4">
    				<input type="text" class="form-control" id="alternatePhoneNumber" placeholder="Alternate Contact Number" data-parsley-trigger="change" data-parsley-type="number">
    				</div>
				</div>
				<div class="form-group">
					<label for="emailId" class="col-md-5 control-label">Email Id</label>
					<div class="col-md-4">
    				<input type="email" class="form-control" id="emailId" placeholder="Email Id" data-parsley-trigger="change" required>
    				</div>
				</div>

			<div align="left">
				<br><h3 class="orange"> Shopping cart items:</h3> <br>
			</div>
			<table id="order-summary-table" class="table table-striped table-responsive table-bordered">
				<tr>
					<th>Product</th>
					<th>Quantity</th>
					<th>Amount</th>
				</tr>
			</table>

			<div align="left">
				<br><h3 class="orange"> Store Details: </h3><br>
			</div>
			<table id="store-summary-table" class="table table-responsive table-bordered">

			</table>

			<div id="orderConfirmation" class="order-confirmation-div">
				<br>
				<button type="button" id="confirmOrder" class="btn btn-default orange">Confirm Order</button>
			</div>
			<br>
		</div>
	</form>
</body>
</html>
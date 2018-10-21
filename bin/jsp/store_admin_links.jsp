<%@ include file="include.jsp"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="Vijay Daniel" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="Grocery online shopping" />
<meta name="description" content="best online tool for grocery shopping" />
<meta name="robots" content="all" />
<script src="js/jquery-1.10.2.min.js"></script>
<script>
$(function() {
	$("#add_products").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("product.htm");
				$("#editArea").load("imagegallery.htm");
			});
	});

$(function() {
	$("#view_products").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("viewproductsinstore.htm");
				$("#editArea").empty();
			});
	});

$(function() {
	$("#modify_products_detail").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("edit_product.htm");
				$("#editArea").empty();
			});
	});

$(function() {
	$("#view_store_details").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("view_store_details.htm");
				$("#editArea").empty();
			});
	});
	
$(function() {
	$("#modify_store_details").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("admin_edit_store_details.htm");
				$("#editArea").empty();
			});
	});
	
$(function() {
	$("#view_orders").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("view_orders.htm");
				$("#editArea").empty();
			});
	});
	
$(function() {
	$("#view_delivered_orders").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("view_delivered_orders.htm");
				$("#editArea").empty();
			});
	});
	
$(function() {
	$("#view_payment").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("paymentduesforstores.htm");
				$("#editArea").empty();
			});
	});

</script>
</head>
<body>
	<form name="store-admin-links-form" method="post">
		<br>

		<table name="store-admin-links-header">
			<tr>
				<th width="50%" align="left" class="orange"><p>Products</p></th>
			</tr>
		</table>
		<table id="store-admin-products-links-table" width="95%" border="0"
			cellspacing="0" cellpadding="5">
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="add_products">Add Products</a></td></tr>
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="view_products">View Products</a></td></tr>
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="modify_products_detail">Modify Products Detail</a></td></tr>
		</table><br>
		<table name="store-admin-links-header">
			<tr>
				<th width="50%" align="left" class="orange"><p>Store</p></th>
			</tr>
		</table>
		<table id="store-admin-store-links-table" width="95%" border="0"
			cellspacing="0" cellpadding="5">
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="view_store_details">View Store Details</a></td></tr>
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="modify_store_details">Modify Store Details</a></td></tr>
		</table><br>
		<table name="store-admin-links-header">
			<tr>
				<th width="50%" align="left" class="orange"><p>Orders</p></th>
			</tr>
		</table>
		<table id="store-admin-order-links-table" width="95%" border="0"
			cellspacing="0" cellpadding="5">
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="view_orders">View Orders</a></td></tr>
		</table><br>
		<table name="store-admin-links-header">
			<tr>
				<th width="50%" align="left"><p class="orange">Delivered Orders</p></th>
			</tr>
		</table>
		<table id="store-admin-report-links-table" width="95%" border="0"
			cellspacing="0" cellpadding="5">
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="view_delivered_orders" >View Delivered Orders</a></td></tr>
		</table><br>
		<table name="store-admin-links-header">
			<tr>
				<th width="50%" align="left"><p class="orange">Payment</p></th>
			</tr>
		</table>
		<table id="store-admin-report-links-table" width="95%" border="0"
			cellspacing="0" cellpadding="5">
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="view_payment">View Payment Details</a></td></tr>
		</table>
	</form>
	
</body>
</html>
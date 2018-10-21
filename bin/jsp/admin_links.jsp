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
	$("#add_locations").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("addLocationPage.htm");
				$("#editArea").empty();
			});
	});

$(function() {
	$("#view_locations").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("viewLocations.htm");
				$("#editArea").empty();
			});
	});

$(function() {
	$("#add_store").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("add_store.htm");
				$("#editArea").empty();
			});
	});

$(function() {
	$("#modify_store").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("viewstores.htm");
				$("#editArea").empty();
			});
	});
	
$(function() {
	$("#view_dues").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("viewdues.htm");
				$("#editArea").empty();
			});
	});
	
$(function() {
	$("#view_paid").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("viewpaidservice.htm");
				$("#editArea").empty();
			});
	});
	
$(function() {
	$("#view_delivered").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("viewdeliveredservice.htm");
				$("#editArea").empty();
			});
	});

$(function() {
	$("#payment_dues").click(
			function(event) {
				event.preventDefault();
				$("#workArea").load("paymentdues.htm");
				$("#editArea").empty();
			});
	});
	
$(function() {
	$("#edit_menu").click(
			function(event) {
				event.preventDefault();
				// /shopnowat
				$("#workArea").load("/store/custom-menu-editor.htm");
				$("#editArea").empty();
			});
	});

</script>
</head>
<body>
	<form name="admin-links-form" method="post">

		<br>
		<table name="admin-location-header">
			<tr>
				<th width="50%" align="left"><p>Locations</p></th>
			</tr>
		</table>
		<table id="admin-location-links-table" width="95%" border="0"
			cellspacing="0" cellpadding="5">
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="add_locations">Add Locations</a></td></tr>
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="view_locations">View Locations</a></td></tr>
		</table>
		<table name="admin-links-header">
			<tr>
				<th width="50%" align="left"><p>Store</p></th>
			</tr>
		</table>
		<table id="admin-store-links-table" width="95%" border="0"
			cellspacing="0" cellpadding="5">
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="add_store">Add Store</a></td></tr>
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="modify_store">View Store</a></td></tr>
		</table>
		
		<table name="admin-links-header">
			<tr>
				<th width="50%" align="left"><p>Payments</p></th>
			</tr>
		</table>
		<table id="admin-report-links-table" width="95%" border="0"
			cellspacing="0" cellpadding="5">
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="payment_dues">Payment Dues</a></td></tr>
		</table>
		
		<table name="admin-links-header">
			<tr>
				<th width="50%" align="left"><p>Report</p></th>
			</tr>
		</table>
		<table id="admin-report-links-table" width="95%" border="0"
			cellspacing="0" cellpadding="5">
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="view_dues">Service Dues</a></td></tr>
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="view_paid">Service Paid </a></td></tr>
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="view_delivered">Orders Delivered by Stores</a></td></tr>
		</table>
		
		<table name="admin-links-header">
			<tr>
				<th width="50%" align="left"><p>Menu</p></th>
			</tr>
		</table>
		<table id="menu-admin-links-table" width="95%" border="0"
			cellspacing="0" cellpadding="5">
			<tr><td>&nbsp;</td><td align="left"><a href="#" id="edit_menu">Edit Menu</a></td></tr>
		</table>
		
	</form>
	
</body>
</html>
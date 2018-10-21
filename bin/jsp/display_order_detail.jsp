<%@ include file="include.jsp"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="v&v" />
<meta name="keywords" content="v&v" />
<meta name="description" content="v&v" />
<meta name="robots" content="all" />

<style type="text/css" media="all">
@import "css/reports.css";
</style>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery.printElement.min.js"></script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {

	});
</script>

</head>
<body>
	<form method="post" class="form-horizontal">

		<h4 style="margin-left:10" class="orange">Shopping Order</h4>

		<div id="viewOrderDiv" class="viewOrderDiv">
		<h5 class="orange">Customer Details</h5>
			<table id="userDetailsTable" class="table" width="60%" cellspacing="0"
				cellpadding="5">
				<!--  <th filter-type='ddl'>Status</th> -->
				<!--<thead>
					<tr>
						<th colspan="2" align="left">Customer Details</th>
					</tr>
				</thead> -->
				<tbody>
					<c:forEach items="${model.customerInfo}" var="info">
						<tr>
							<td>Name</td>
							<td><c:out value="${info.name}" /></td>
						</tr>
						<tr>
							<td>Address</td>
							<td><c:out value="${info.address}" /></td>
						</tr>
						<tr>
							<td>Phone Number</td>
							<td><c:out value="${info.phone_number}" /></td>
						</tr>
						<tr>
							<td>Alternate Phone Number</td>
							<td><c:out value="${info.alternate_phone_number}" /></td>
						</tr>
						<tr>
							<td>Email Id</td>
							<td><c:out value="${info.email_id}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br clear="all">
			<h5 class="orange">Shopping Cart Items</h5>

			<table id="shoppingCartItemsTable" width="80%" cellspacing="0"
				cellpadding="5">
				<!--  <th filter-type='ddl'>Status</th> -->
				<thead>
					<tr>
						<th align="left">Product Name</th><th align="left">Quantity</th><th align="left">Price</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model.shoppingCartInfo}" var="info">
						<tr>
							<td><c:out value="${info.name}" /></td>
							<td><c:out value="${info.item_quantity}" /></td>
							<td><c:out value="${info.price}" /></td></tr>
					</c:forEach>
					<tr><td></td><td><b>Total</td><td><c:out value="${model.shoppingCart.total_amount}"/> </td></tr>
				</tbody>
			</table>
			<br clear="all">
			
			<h5 class="orange">Store Details</h5>

			<table id="storeDetailsTable" width="80%" cellspacing="0"
				cellpadding="5" class="table">
				<!--  <th filter-type='ddl'>Status</th> -->
				<!--<thead>
					<tr>
						<th colspan="2" align="left">Customer Details</th>
					</tr>
				</thead> -->
				<tbody>
					<c:forEach items="${model.storeInfo}" var="info">
						<tr>
							<td>Name</td>
							<td><c:out value="${info.name}" /></td>
						</tr>
						<tr>
							<td>Address</td>
							<td><c:out value="${info.address}" /></td>
						</tr>
						<tr>
							<td>Phone Number</td>
							<td><c:out value="${info.phoneNumber}" /></td>
						</tr>
						<tr>
							<td>Alternate Phone Number</td>
							<td><c:out value="${info.alternatePhoneNumber}" /></td>
						</tr>
						<tr>
							<td>Email Id</td>
							<td><c:out value="${info.emailId}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table><br>
			<table width="100%" align="center"><tr><td align="center">
			<input type="button" id="print" value="Print" class="btn btn-default"></td></tr><tr>
			</table>
		</div>
		<br> <br>

	</form>
</body>
</html>
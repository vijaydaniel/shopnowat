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
<script src="js/picnet.table.filter.min.js"></script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		var options = {
			clearFiltersControls : [ $('#cleanfilters') ],
			additionalFilterTriggers : [ $('#quickfind') ]
		};
		$('#viewOrderSummaryTable').tableFilter(options);
		mouseHandle();
		displayDetailOrder();
		setDelivery();
		setReload();
	});


	function setReload() {
		setTimeout("refreshPage();", 60000);
	}
	
	function refreshPage() {
		var content = $("#workArea").text();
		var s = "Open Orders - Shopping Cart Summary";
		if(content.indexOf(s) > -1){
		$("#workArea").load("view_orders.htm");
		}
	}

	function mouseHandle() {
		var tr = $('#viewOrderSummaryTable').find('tr');
		tr.hover(function() { // mouseover
			$(this).addClass('row-highlight');
		}, function() { // mouseout
			$(this).removeClass('row-highlight');
		});
	}

	function displayDetailOrder() {
		var tr = $('#viewOrderSummaryTable').find('tr');
		tr.bind('click', function(event) {
			var tds = $(this).addClass('row-highlight').find('td');
			var cartId;
			$.each(tds, function(index, item) {
				if (index == 0)
					cartId = item.innerHTML;
			});
			$("#editArea").load("display_order_detail.htm?cartId=" + cartId);
		});
	}

	function setDelivery() {
		$(".deliveryIcon").click(
				function(event) {
					event.preventDefault();
					var selectedCartId = $(event.target).attr("id");
					// "/shopnowat" 
					var destination = "/order/" + selectedCartId
							+ "/markOrderDelivered.htm";
					$.ajax({
						type : "post",
						url : destination,
						dataType : "json",
						contentType : "application/json",
						beforeSend : function(xhr) {
							xhr.setRequestHeader("Accept", "application/json");
							xhr.setRequestHeader("Content-Type",
									"application/json");
						},
						cache : false,
						success : function(result1) {
							deliveryResponseHandler(result1);
						}
					});
				});
	}

	function deliveryResponseHandler(result) {
		alert(result[0]);
		$("#workArea").load("view_orders.htm");
		$("#editArea").empty();
	}
</script>

</head>
<body>
	<form method="post" class="form-horizontal">

		<h4 align="center" class="orange">Open Orders - Shopping Cart Summary</h4>
		<br clear="all">
		<div class="form-group">
			<label for="quickfind" class="col-md-4 control-label">Quick Search</label>
			<div class="col-md-4">
  					<input class="form-control" type="text" name="quickFilter" id="quickfind" size="30">
  			</div>
  			<div class="col-md-4">
  					<p align="left" style="margin-left:0;padding:10 0 0 0;"><a id="cleanfilters" href="#">Clear Filters</a></p>
  			</div>
		</div>
			
		<div id="viewOrderSummaryTableDiv" class="viewOrderSummaryTableDiv">
			<table id="viewOrderSummaryTable" class="table table-responsive table-bordered">
				<!--  <th filter-type='ddl'>Status</th> -->
				<thead>
					<tr>
						<th width="10%">Cart id</th>
						<th>Name</th>
						<th>Address</th>
						<th>Order Date</th>
						<th>Amount</th>
						<th align="center" width="5%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${model.orders}" var="openCart">
						<tr>
							<td><c:out value="${openCart.cart_id}" /></td>
							<td><c:out value="${openCart.name}" /></td>
							<td><c:out value="${openCart.address}" /></td>
							<td><fmt:formatDate value="${openCart.create_date}"
									pattern="dd-MM-yyyy" /></td>
							<!-- pattern="dd-MM-yyyy HH:mm:ss" -->
							<!--  <td><c:out value="${openCart.create_date}" /></td>  -->
							<td><c:out value="${openCart.total_amount}" /></td>
							<td align="center" width="5%"><input type="image" src="img/shopnowat/delivery.png" id="${openCart.cart_id}" class="deliveryIcon"></td>
							<!--  <td><c:out value="${openCart.purchase_status}" /></td>  -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br> <br>

	</form>
</body>
</html>
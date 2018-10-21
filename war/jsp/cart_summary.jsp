<%@ include file="include.jsp"%>
<html>
<head>
<script src="js/jquery-1.10.2.min.js"></script>
<script>

$(document).ready(function (){
$("#orderPane").hide();
});

$(function() {
	$("#summitOrder").click(
			function(event) {
				$("#products-column").load(
						"jsp/order.jsp");
			});
});

</script>
</head>
<body>
	<form name="cart-summary-form" method="post">
	<div class="cart-summary-div" id="cart-summary-id" align="center">
	<table id="dummy-table" width="5%" cellspacing="0"
			cellpadding="5" align="left">
			<tr>
			<td></td>
			</tr>			
		</table>
		<table id="cart-summary-table" width="95%" cellspacing="0"
			cellpadding="5" align="center">
			<tr>
			<th style="border:1px solid black">Product</th><th style="border:1px solid black">Qty</th><th style="border:1px solid black">Amount</th><th style=\"visibility:collapse;\"></th>
			</tr>			
		</table>
		<br>
		<div class="orderPanel" id="orderPane" align="center">
			<button type="button" id="summitOrder" >Order</button>
		</div>
	  </div>
	</form>
</body>
</html>
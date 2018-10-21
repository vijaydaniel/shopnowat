<%@ include file="include.jsp"%>
<html>
<head>
<script src="../js/jquery-1.10.2.min.js"></script>
<script src="../js/jstorage.js"></script>
<script>

$(document).ready(function (){
	confirmFinalOrder();
});

function confirmFinalOrder() {
	// "/shopnowat" 
	var confirmOrderDestination = "/order/confirmorder.htm";
	var shoppingBasket = $.jStorage.get("final_order");
	var stringifiedBasker = JSON.stringify(shoppingBasket);
	$.ajax({
		type : "post",
		url : confirmOrderDestination,
		dataType: "json",
		contentType: "application/json",
		data : JSON.stringify(shoppingBasket),
		beforeSend: function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
			},
		cache : false,
		success : function(result) {
			confirmOrderResponseHandler(result);
		}
	});
}

function confirmOrderResponseHandler(result) {
	var response = result[0];
	$("#confirm-order-id").html(response);
	$("#showOrderButton").val("0");
}

</script>
</head>
<body>
	<form name="confirm-order-form" method="post" class="form-horizontal">
		<div class="row-fluid">
			<div class="col-md-12" style="height:50;">&nbsp;</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-12" style="height:50;">&nbsp;</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-12">&nbsp;</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-12 confirm-order-div" id="confirm-order-id" align="center">
	
			</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-12" style="height:150;">&nbsp;</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-12" style="height:100;">&nbsp;</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-12" style="height:50;">&nbsp;</div>
		</div>
	</form>
</body>
</html>
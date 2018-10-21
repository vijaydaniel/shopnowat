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
		getData();
	});

	function getData() {
		var storeId = $("#storeId").val();
		// "/shopnowat" 
		var destination = "/payment/" + storeId
				+ "/getPaymentStatementForStore.htm";
		$.ajax({
			type : "get",
			url : destination,
			cache : false,
			success : function(result) {
				duesResponseHandlerAdapter(result);
			}
		});
	}

	function duesResponseHandlerAdapter(result) {
		$("#storeName").val(result[0].name);
		$("#charge").val(result[0].commissionPercentage);
		$("#currentDue").val(result[0].totalAmount);
		$("#previousDue").val(result[0].totalDues);
		var tAmt = parseInt(result[0].totalAmount) + parseInt(result[0].totalDues);
		$("#totalDue").val(tAmt);
	}
	
</script>

</head>
<body>
	<form method="post" class="form-horizontal">
		<div style="padding: 10px">
			<%
				String storeId = (String) session.getAttribute("storeid");
			%>
			<input type="hidden" id="storeId" value="<%=storeId%>">
			<h4 align="center" class="orange">Payment Dues</h4>
			<br clear="all">
			<div id="viewPaymentSummaryTableDiv">
			
				<div class="form-group">
					<label for="storeIden" class="col-md-6 control-label">Store Id</label>
					<div class="col-md-6">
    					<input type="text" class="form-control" id="storeIden" placeholder="" value="<%=storeId%>">
    				</div>
				</div>
				
				<div class="form-group">
					<label for="storeName" class="col-md-6 control-label">Store Name</label>
					<div class="col-md-6">
    					<input type="text" class="form-control" id="storeName" placeholder="" >
    				</div>
				</div>
			
				<div class="form-group">
					<label for="charge" class="col-md-6 control-label">Commission Percentage</label>
					<div class="col-md-6">
    					<input type="text" class="form-control" id="charge" placeholder="" >
    				</div>
				</div>
				
				<div class="form-group">
					<label for="currentDue" class="col-md-6 control-label">Current Due</label>
					<div class="col-md-6">
    					<input type="text" class="form-control" id="currentDue" placeholder="" >
    				</div>
				</div>
				
				<div class="form-group">
					<label for="previousDue" class="col-md-6 control-label">Previous Due</label>
					<div class="col-md-6">
    					<input type="text" class="form-control" id="previousDue" placeholder="" >
    				</div>
				</div>
				
				<div class="form-group">
					<label for="totalDue" class="col-md-6 control-label">Total Due</label>
					<div class="col-md-6">
    					<input type="text" class="form-control" id="totalDue" placeholder="" >
    				</div>
				</div>
			
			</div>
		</div>
	</form>
</body>
</html>
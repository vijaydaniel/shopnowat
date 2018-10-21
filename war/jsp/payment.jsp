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

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		setOnClick();
	});

	function setOnClick() {
		
		$("#updatePayment").click(function(event) {
			var dues = new Object();		        
			dues.id = "0";
			dues.storeId = $("#storeIden").val();
			dues.amountDue = $("#payAmount").val();
			dues.commissionPercentage = $("#newCommission").val();
			
			event.preventDefault();
			// "/shopnowat" 
			var destination = "/payment/pay.htm";
			$.ajax({
				type : "post",
				url : destination,
				dataType: "json",
				contentType: "application/json",
				data : JSON.stringify(dues),
				beforeSend: function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
					},
				cache : false,
				success : function(result1) {
					//updatePaymentResponseHandler(result1);
				}
			});
			
			setEshopperStatus(dues.storeId);
			
			$("#storeId").val("");
			$("#payAmount").val("");
			$("#newCommission").val("");
		});
	}

	function updatePaymentResponseHandler(result1){
		alert(result1[0]);
	}
	
	function setEshopperStatus(storeId){
		var urlParam = "storeId="+encodeURIComponent(storeId);
		// "/shopnowat" 
		var destination = "/payment/seteshopperstatus.htm?"+urlParam;
		$.ajax({
			type : "post",
			url : destination,
			dataType: "json",
			contentType: "application/json",
			beforeSend: function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				},
			cache : false,
			success : function(result1) {
				updatePaymentResponseHandler(result1);
			}
		});
	}

</script>

</head>
<body>
	<form method="post">
		<div style="padding: 10px">
			<h3>Pay Service Dues</h3>
			<div id="viewPaySummaryTableDiv">
			<%
			String storeId = (String) request.getParameter("storeId");
			String totalDueAmount = (String) request.getParameter("totalDueAmount");
			String commission = (String) request.getParameter("commission");
			%>
				<input type="hidden" id="storeIden" value="<%=storeId%>">
				<table id="viewPaySummaryTable" class="shopnowatTable"
					width="95%" cellspacing="0" cellpadding="5">
					<!--  <th filter-type='ddl'>Status</th> -->
						<tr><td>Commission Percentage</td><td><input id="newCommission" value="<%=commission%>"></td></tr>
						<tr><td>Due Amount</td><td><input id="payAmount" value="<%=totalDueAmount%>"></td></tr>
						<tr><td colspan="2" align="center"><input type="button" id="updatePayment" value="Update Payment"></td></tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>
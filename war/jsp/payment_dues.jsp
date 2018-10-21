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

	function mouseHandle() {
		var tr = $('#viewPaymentSummaryTable').find('tr');
		tr.hover(function() { // mouseover
			$(this).addClass('row-highlight');
		}, function() { // mouseout
			$(this).removeClass('row-highlight');
		});
	}

	function displayDuesSummary() {
		var tr = $('#viewPaymentSummaryTable').find('tr');
		tr.bind('click', function(event) {
			var tds = $(this).addClass('row-highlight').find('td');
			var storeId;
			var totalDueAmt;
			var chargePercentage;
			$.each(tds, function(index, item) {
				if (index == 0)
					storeId = item.innerHTML;
				if (index == 5)
					totalDueAmt = item.innerHTML;
				if (index == 6)
					chargePercentage = item.innerHTML;
			});
			var sid = encodeURIComponent(storeId);
			var tAmt = encodeURIComponent(totalDueAmt);
			var cPercentage = encodeURIComponent(chargePercentage);
			var urlParam = "storeId=" + sid + "&totalDueAmount=" + tAmt + "&commission=" + cPercentage;
			$("#editArea").load("payment.htm?" + urlParam);
		});
	}

	function getData() {
		// "/shopnowat" 
		var destination = "/reports/getpaymentdues.htm";
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
		$("#viewPaymentSummaryTable").append("<tbody>");
		for (i = 0; i < result.length; i++) {
			var totalDues = parseInt(result[i].totalAmount)
					+ parseInt(result[i].totalDues);
			newRow = "<tr><td>" + result[i].id
					+ "</td><td style=\"word-wrap: break-word\">"
					+ result[i].name + ", " + result[i].address + ", "
					+ result[i].location + "</td><td>" + result[i].phoneNumber
					+ "</td><td>" + result[i].totalAmount + "</td><td>"
					+ result[i].totalDues + "</td><td>" + totalDues
					+ "</td><td>" + result[i].commissionPercentage + "</td></tr>";
			$("#viewPaymentSummaryTable").append(newRow);
		}
		$("#viewPaymentSummaryTable").append("</tbody>");
		var options = {
			clearFiltersControls : [ $('#cleanfiltersdues') ],
			additionalFilterTriggers : [ $('#quickfinddues') ]
		};
		$('#viewPaymentSummaryTable').tableFilter(options);
		mouseHandle();
		displayDuesSummary();
	}
</script>

</head>
<body>
	<form method="post">
		<div style="padding: 10px">
			<h3>Service Dues</h3>
			&nbsp;&nbsp;Quick Search <input type="text" name="quickFilterDues"
				id="quickfinddues" size="30">&nbsp;&nbsp;&nbsp;<a
				id="cleanfiltersdues" href="#">Clear Filters</a><br>&nbsp;<br>
			<div id="viewPaymentSummaryTableDiv">
				<table id="viewPaymentSummaryTable" class="shopnowatTable"
					width="95%" cellspacing="0" cellpadding="5">
					<!--  <th filter-type='ddl'>Status</th> -->
					<thead>
						<tr>
							<th width="10%">Store Id</th>
							<th style="word-wrap: break-word">Store</th>
							<th>Phone Number</th>
							<th>Current Due</th>
							<th>Previous Due</th>
							<th>Total Due</th>
							<th width="10%">Charge</th>
						</tr>
					</thead>

				</table>
			</div>
		</div>
	</form>
</body>
</html>
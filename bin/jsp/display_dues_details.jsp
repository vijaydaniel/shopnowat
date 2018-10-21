<%@ include file="include.jsp"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="Vijay Daniel" />
<meta name="keywords" content="Grocery online shopping" />
<meta name="description" content="best online tool for grocery shopping" />
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
        var tr = $('#viewDuesDetailsSummaryTable').find('tr');
        tr.hover(
             function() {  // mouseover
                 $(this).addClass('row-highlight');
             },
             function() {  // mouseout
                 $(this).removeClass('row-highlight');
             }
        );
    }
	
	function displayDuesSummary(){
		var tr = $('#viewDuesDetailsSummaryTable').find('tr');
        tr.bind('click', function(event) {
       	var tds = $(this).addClass('row-highlight').find('td');
       	var storeId;
           $.each(tds, function(index, item) {
        	if(index==0)   
           	storeId = item.innerHTML;
           });
           //$("#editArea").load("display_dues_detail.htm?storeId="+storeId);
       });
	}
	
	function getData() {
		var storeId = $("#storeId").val();
		// "/shopnowat" 
		var destination = "/reports/"+storeId+"/getduesdetails.htm";
		$.ajax({
			type : "get",
			url : destination,
			cache : false,
			success : function(result) {
				duesDetailsResponseHandlerAdapter(result);
			}
		});
	}	
	
	function duesDetailsResponseHandlerAdapter(result) {
		$("#viewDuesDetailsSummaryTable").append("<tbody>");
		for (i = 0; i < result.length; i++) {
			newRow = "<tr><td>" + result[i].cartId + "</td><td>" + result[i].createDate
					+ "</td><td>" + result[i].totalAmount + "</td><td>"
					+ result[i].purchaseStatus + "</td></tr>";
			$("#viewDuesDetailsSummaryTable").append(newRow);
		}
		$("#viewDuesDetailsSummaryTable").append("</tbody>");
		var options = {
			clearFiltersControls : [ $('#cleanfiltersduesDetails') ],
			additionalFilterTriggers : [ $('#quickfindduesDetails') ]
		};
		$('#viewDuesDetailsSummaryTable').tableFilter(options);
		mouseHandle();
		displayDuesSummary();
	}
</script>

</head>
<body>
	<form method="post">

		<h3>Detailed Service Dues</h3>
		&nbsp;&nbsp;Quick Search <input type="text" name="quickFilterDuesDetails"
			id="quickfindduesDetails" size="30">&nbsp;&nbsp;&nbsp;<a
			id="cleanfiltersduesDetails" href="#">Clear Filters</a><br>&nbsp;<br>
		<div id="viewDuesDetailsSummaryTableDiv">
		<%
		String storeId = (String) request.getParameter("storeId");
		%>
		<input type="hidden" id="storeId" value=<%=storeId %>>
			<table id="viewDuesDetailsSummaryTable" class="shopnowatTable" width="95%" cellspacing="0"
				cellpadding="5">
				<!--  <th filter-type='ddl'>Status</th> -->
				<thead>
					<tr>
						<th width="10%">Cart ID</th>
						<th>Order Date</th>
						<th>Amount</th>
						<th>Purchase Status</th>
					</tr>
				</thead>
				
			</table>
		</div>
		<br> <br>

	</form>
</body>
</html>
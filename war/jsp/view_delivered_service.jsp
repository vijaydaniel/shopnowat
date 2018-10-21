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
        var tr = $('#viewDeliveredSummaryTable').find('tr');
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
		var tr = $('#viewDeliveredSummaryTable').find('tr');
        tr.bind('click', function(event) {
       	var tds = $(this).addClass('row-highlight').find('td');
       	var storeId;
           $.each(tds, function(index, item) {
        	if(index==0)   
           	storeId = item.innerHTML;
           });
           var sid = encodeURIComponent(storeId);
           var urlParam = "storeId="+sid;
           $("#editArea").load("display_dues_details.htm?"+urlParam);
       });
	}
	
	function getData() {
		// "/shopnowat" 
		var destination = "/reports/delivered/getservicereportbystatus.htm";
		$.ajax({
			type : "get",
			url : destination,
			cache : false,
			success : function(result) {
				duesResponseHandlerAdapter(result);
			}
		});
	}	
	
	function duesResponseHandlerAdapter(result){
		$("#viewDeliveredSummaryTable").append("<tbody>");
		for (i = 0; i < result.length; i++) {
		newRow = "<tr><td>"+result[i].id+"</td><td>"+result[i].name+"</td><td>"+result[i].address+"</td><td>"+result[i].phoneNumber+"</td><td>"+result[i].totalAmount+"</td></tr>";
		$("#viewDeliveredSummaryTable").append(newRow);
		}
		$("#viewDeliveredSummaryTable").append("</tbody>");
		var options = {
				clearFiltersControls : [ $('#cleanfiltersdues') ],
				additionalFilterTriggers : [ $('#quickfinddues') ]
			};
			$('#viewDeliveredSummaryTable').tableFilter(options);
		mouseHandle();
		//displayDuesSummary();
	}
	
</script>

</head>
<body>
	<form method="post">

		<h3>Service Dues</h3>
		&nbsp;&nbsp;Quick Search <input type="text" name="quickFilterDues"
			id="quickfinddues" size="30">&nbsp;&nbsp;&nbsp;<a
			id="cleanfiltersdues" href="#">Clear Filters</a><br>&nbsp;<br>
		<div id="viewDeliveredSummaryTableDiv">
			<table id="viewDeliveredSummaryTable" class="shopnowatTable" width="95%" cellspacing="0"
				cellpadding="5">
				<!--  <th filter-type='ddl'>Status</th> -->
				<thead>
					<tr>
						<th width="10%">Store Id</th>
						<th>Name</th>
						<th>Address</th>
						<th>Phone Number</th>
						<th>Amount</th>
					</tr>
				</thead>
				
			</table>
		</div>
		<br> <br>

	</form>
</body>
</html>
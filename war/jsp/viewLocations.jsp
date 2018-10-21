<%@ include file="/jsp/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<style>
</style>
<script src="js/jquery-1.10.2.min.js"></script>
<style type="text/css">
@import "css/reports.css";
</style>
<script type="text/javascript" charset="utf-8">
	$(document).ready(
			function() {
				$("#location-search-bar").keyup(
						function() {
							var sr = $("#location-search-bar").val();
							// "/shopnowat" 
							if (sr == "") {
								var destination = "/location/getAllLocation.htm";								
							} else {
								var destination = "/location/"
								+ sr + "/getLocation.htm";
							}
							$.ajax({
								type : "post",
								url : destination,
								cache : false,
								success : function(result) {
									//$("#location-table").html(html);
									locationResponseHandler('#location-table',
											result);
								}
							});
						});
				mouseHandle();
				editLocation();
			});

	function editLocation(){
		var tr = $('#location-table').find('tr');
        tr.bind('click', function(event) {
       	var tds = $(this).addClass('row-highlight').find('td');
       	var locationId;
       	var location;
           $.each(tds, function(index, item) {
        	if(index==0)   
        		locationId = item.innerHTML;
        	if(index==1)   
        		location = item.innerHTML;
           });
           var lid = encodeURIComponent(locationId);
           var l = encodeURIComponent(location);
           urlParam = "locationId="+lid+"&location="+l;
           $("#editArea").load("edit_location.htm?"+urlParam);
       });
	}
	
	function locationResponseHandler(component, response) {
		var c = [];
		c.push("<tr><th>ID</th><th>Location</th></tr>");
		$.each(response, function(i, item) {
			c.push("<tr><td>"+item.id +"</td><td>" + item.name
					+ "</td></tr>");
		});

		$(component).html(c.join(""));
		mouseHandle();
		editLocation();
	}
	
	function mouseHandle() {	       
        var tr = $('#location-table').find('tr');
        tr.hover(
             function() {  // mouseover
                 $(this).addClass('row-highlight');
             },
             function() {  // mouseout
                 $(this).removeClass('row-highlight');
             }
        );
    }
</script>
</head>
<body>
	<form name="location-form" method="post">
	<div id="viewlocationDiv" align="center">
		<table name="location-header" align="left">
			<tr>
				<td width="50%" align="left"><p class="orange">Location</p></td>
				<td width="50%" align="right"><input id="location-search-bar"
					class="inputCurved"></td>
		</table>
		<%@ page
			import="org.springframework.context.ApplicationContext,org.springframework.web.servlet.support.RequestContextUtils,org.sunshine.location.LocationService,org.sunshine.domain.Location,java.util.List"%>
		<%
			ApplicationContext locationContext = RequestContextUtils
					.getWebApplicationContext(request);

			LocationService locationService = (LocationService) locationContext
					.getBean("locationService");
			List<Location> locations = locationService.getLocations();
		%><br><br><br><br>
		<table class="shopnowatTable" id="location-table" width="65%" border="0" cellspacing="0"
			cellpadding="5">
			<tr>
			<th>ID</th>
			<th>Location</th>
			</tr>
			<c:forEach items="<%=locations%>" var="location">
				<tr>
					<td><c:out value="${location.id}" /> </td>
					<td align="left"><c:out value="${location.name}" /></td>
				</tr>
			</c:forEach>
		</table>
			</div>
	</form>
</body>

</html>
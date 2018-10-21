<%@ include file="/jsp/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<style>
</style>
<script src="js/jquery-1.10.2.min.js"></script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		editLocation();
		delLocation();
	});

	function delLocation(){
		$("#delLocation").click(function(event) {
			var location = new Object();
			location.id = $("#locationIdHideout").val();
			location.name = $("#location").val();
			event.preventDefault();
			// "/shopnowat" 
			var destination = "/location/deleteLocation.htm";
			$.ajax({
				type : "post",
				url : destination,
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(location),
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
				},
				cache : false,
				success : function(result1) {
					editLocationResponseHandler(result1);
				}
			});
			$("#location").val("");
		});
	}
	
	function editLocation() {
		$("#modify").click(function(event) {
			var location = new Object();
			location.id = $("#locationIdHideout").val();
			location.name = $("#location").val();
			previousName = $("#previouslocationNameHideout").val();
			event.preventDefault();
			var urlParam = "previousLocationName="+ encodeURIComponent(previousName);
			// "/shopnowat" 
			var destination = "/location/editLocation.htm?"+urlParam;
			$.ajax({
				type : "post",
				url : destination,
				dataType : "json",
				contentType : "application/json",
				data : JSON.stringify(location),
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
				},
				cache : false,
				success : function(result1) {
					editLocationResponseHandler(result1);
				}
			});
			$("#location").val("");
		});
	}

	function editLocationResponseHandler(result1) {
		alert(result1[0]);
	}
</script>
</head>
<body>

	<form id="modify_location_form">
	<br><br>&nbsp;<br>&nbsp;
	<div>
		<h4 align="center">Modify Location</h4>
		<%
		String locationId = request.getParameter("locationId");
		String location = request.getParameter("location");
		%>
		<input type="hidden" id="locationIdHideout" value="<%=locationId %>"/>
		<input type="hidden" id="previouslocationNameHideout" value="<%=location %>"/>
		<table width="95%" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="right" width="20%">Location:</td>
				<td width="20%"><input id="location" name="name" value="<%=location %>" /></td>
			</tr>
			<tr>
				<td align="right"  width="100%"><input id="modify"
					type="submit" align="center" value="Modify Location"></td>
					<td align="left"  width="100%"><input id="delLocation"
					type="submit" align="center" value="Delete Location"></td>
			</tr>
		</table>
</div>
	</form>
</body>
</html>
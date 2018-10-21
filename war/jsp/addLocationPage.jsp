<%@ include file="/jsp/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<style>
</style>
<script src="js/jquery-1.10.2.min.js"></script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		addLocation();
	});

	function addLocation() {
		$("#add").click(function(event) {
			var location = new Object();
			location.name = $("#location").val();
			event.preventDefault();
			// "/shopnowat" 
			var destination = "/location/addLocation.htm";
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
					addLocationResponseHandler(result1);
				}
			});
			$("#location").val("");
		});
	}

	function addLocationResponseHandler(result1) {
		alert(result1[0]);
	}
</script>
</head>
<body>

	<form id="add_location_form"><div>
		<h3 align="center">Add Location</h3>
		<table width="95%" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="right" width="20%">Location:</td>
				<td width="20%"><input id="location" name="name" /></td>
			</tr>
			<tr>
				<td align="center" colspan="2" width="100%"><input id="add"
					type="submit" align="center" value="Add Location"></td>
			</tr>
		</table>
</div>
	</form>
</body>
</html>
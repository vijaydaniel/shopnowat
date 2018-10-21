<%@ include file="/jsp/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<style>
</style>
<script src="js/jquery-1.10.2.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript" charset="utf-8">

	$(document).ready(function() {
		getStoreInfo();
	});

	function getStoreInfo() {
		var storeid = $("#storeid").val();
		// "/shopnowat" 
		var destination = "/stores/" + storeid +"/storedetails.htm";
		$.ajax({
			type : "get",
			url : destination,
			cache : false,
			success : function(result) {
				responseStoreHandler(result);
			}
		});
	}

	function responseStoreHandler(result) {
		var store = result[0];
		$("#name").val(store.name);
		$("#description").val(store.description);
		$("#phone_number").val(store.phoneNumber);
		$("#alternate_phone_number").val(store.alternatePhoneNumber);
		$("#email_id").val(store.emailId);
		$("#address").val(store.address);
		$("#location").val(store.location);
		updateStore();
	}
		
	function updateStore(){
		$("#updateStoreDetailsButton").click(function(event) {
			var store = new Object();			
			store.id = $("#storeid").val();
			 store.name = $("#name").val();
			store.description = $("#description").val();
			store.phoneNumber = $("#phone_number").val();
			store.alternatePhoneNumber = $("#alternate_phone_number").val();
			store.emailId = $("#email_id").val();
			store.address = $("#address").val();
			store.location = $("#location").val(); 
			alert(JSON.stringify(store));
			event.preventDefault();
			// "/shopnowat" 
			var destination = "/store/edit_store_submit.htm";
			$.ajax({
				type : "post",
				url : destination,
				dataType: "json",
				contentType: "application/json",
				data : JSON.stringify(store),
				beforeSend: function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
					},
				cache : false,
				success : function(result) {
					editStoreResponseHandler(result);
				}
			});

		});
	}
	
	function editStoreResponseHandler(result){
		alert(result[0]);
	}
	
</script>
</head>
<body>

	<form id="view_product_form">
			<%
				String store_id = (String) session.getAttribute("storeid");
				if(store_id==null){
					store_id = (String) request.getParameter("id");
				}
			%>
		<input type="hidden" id="storeid" name="storeid" value="<%=store_id%>"></input>
		<br><br>

	<table width="95%" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="right" width="20%">Store ID:</td>
				<td width="20%"><input id="id" name="id" value="<%=store_id%>" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Store Name:</td>
				<td width="20%"><input id="name" name="name" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Description:</td>
				<td width="20%"><textarea cols="25" rows="5" id="description" ></textarea></td>
			</tr>
			<tr>
				<td align="right" width="20%">Phone Number</td>
				<td width="20%"><input id="phone_number" name="phone_number" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Alternate Phone Number:</td>
				<td width="20%"><input id="alternate_phone_number" name="alternate_phone_number" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Email ID:</td>
				<td width="20%"><input id="email_id" name="email_id" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Address:</td>
				<td width="20%"><textarea cols="25" rows="5" id="address" name="address"></textarea></td>
			</tr>
			<tr>
				<td align="right" width="20%">Location:</td>
				<td width="20%"><input id="location" name="location" ></input></td>
			</tr>
			<tr>
				<td align="center" colspan="2" width="100%">
				<input id="updateStoreDetailsButton" type="button" align="center" value="Update Store Details"></td>
			</tr>

		</table>
	</form>
</body>
</html>
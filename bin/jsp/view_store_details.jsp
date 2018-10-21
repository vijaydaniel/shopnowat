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
		//"/shopnowat" 
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
	}
		
</script>
</head>
<body>

	<form id="view_product_form" class="form-horizontal">
		<%
			String store_id = (String) session.getAttribute("storeid");
		%>
		<input type="hidden" id="storeid" name="storeid" value="<%=store_id%>"></input>
		<h4 align="center" class="orange">Store Details</h4>
		<br>

		<div class="form-group">
			<label for="id" class="col-md-6 control-label">Store ID</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="id" placeholder="store id" value="<%=store_id%>" disabled>
  			</div>
		</div>
		
		<div class="form-group">
			<label for="name" class="col-md-6 control-label">Store Name</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="name" placeholder="store name" disabled>
  			</div>
		</div>
		
		<div class="form-group">
			<label for="description" class="col-md-6 control-label">Description</label>
			<div class="col-md-6">
  					<textarea cols="25" rows="5" class="form-control" id="description" placeholder="store name" disabled></textarea>
  			</div>
		</div>
		
		<div class="form-group">
			<label for="phone_number" class="col-md-6 control-label">Phone Number</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="phone_number" placeholder="Phone Number" disabled>
  			</div>
		</div>
		
		<div class="form-group">
			<label for="alternate_phone_number" class="col-md-6 control-label">Alternate Phone Number</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="alternate_phone_number" placeholder="Alternate Phone Number" disabled>
  			</div>
		</div>
		
		<div class="form-group">
			<label for="email_id" class="col-md-6 control-label">Email ID</label>
			<div class="col-md-6">
  					<input type="email" class="form-control" id="email_id" placeholder="Email ID" disabled>
  			</div>
		</div>
		
		<div class="form-group">
			<label for="address" class="col-md-6 control-label">Address</label>
			<div class="col-md-6">
  					<textarea cols="25" rows="5" class="form-control" id="address" placeholder="Address" disabled></textarea>
  			</div>
		</div>
		
		<div class="form-group">
			<label for="location" class="col-md-6 control-label">Location</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="location" placeholder="Location" disabled>
  			</div>
		</div>
		
	</form>
</body>
</html>
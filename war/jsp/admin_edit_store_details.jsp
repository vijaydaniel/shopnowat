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
		var destination =  "/stores/" + storeid +"/storedetails.htm";
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
			event.preventDefault();
			// /shopnowat
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
					deleteStoreResponseHandler(result);
				}
			});

		});
		
		$("#deleteStoreButton").click(function(event) {
			sid = $("#storeid").val();
			// /shopnowat
			var destination = "/store/" + sid + "/delete_store_submit.htm";
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
				success : function(result) {
					deleteStoreResponseHandler(result);
				}
			});
			
		});
		
	}
	
	function deleteStoreResponseHandler(result){
		alert(result[0]);
	}
	
</script>
</head>
<body>

	<form id="view_product_form" class="form-horizontal">
		<%
			String store_id = (String) session.getAttribute("storeid");
		    if(store_id.equals("0")){
				store_id = (String) request.getParameter("id");
			}
		%>
		<input type="hidden" id="storeid" name="storeid" value="<%=store_id%>"></input>
		<h4 align="center" class="orange">Modify Store Details</h4>
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
  					<input type="text" class="form-control" id="name" placeholder="store name">
  			</div>
		</div>
		
		<div class="form-group">
			<label for="description" class="col-md-6 control-label">Description</label>
			<div class="col-md-6">
  					<textarea cols="25" rows="5" class="form-control" id="description" placeholder="store name"></textarea>
  			</div>
		</div>
		
		<div class="form-group">
			<label for="phone_number" class="col-md-6 control-label">Phone Number</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="phone_number" placeholder="Phone Number">
  			</div>
		</div>
		
		<div class="form-group">
			<label for="alternate_phone_number" class="col-md-6 control-label">Alternate Phone Number</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="alternate_phone_number" placeholder="Alternate Phone Number">
  			</div>
		</div>
		
		<div class="form-group">
			<label for="email_id" class="col-md-6 control-label">Email ID</label>
			<div class="col-md-6">
  					<input type="email" class="form-control" id="email_id" placeholder="Email ID">
  			</div>
		</div>
		
		<div class="form-group">
			<label for="address" class="col-md-6 control-label">Address</label>
			<div class="col-md-6">
  					<textarea cols="25" rows="5" class="form-control" id="address" placeholder="Address"></textarea>
  			</div>
		</div>
		
		<div class="form-group">
			<label for="location" class="col-md-6 control-label">Location</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="location" placeholder="Location">
  			</div>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="col-md-6">
					<input id="updateStoreDetailsButton" type="button" value="Update Store Details" class="btn btn-warning pull-right">
				</div>
				<div class="col-md-6">
					<input id="deleteStoreButton" type="button" value="Delete Store" class="btn btn-warning">
				</div>
			</div>
		</div>

	</form>
</body>
</html>
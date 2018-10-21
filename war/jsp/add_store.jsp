<%@ include file="include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<script src="js/jquery-1.10.2.min.js"></script>
<script>
$(document).ready(function() {
	addStore();
});

var storeName = "";

function addStore(){
	$("#add").click(function(event) {
		var store = new Object();		        
		store.name = $("#name").val();
		storeName = $("#name").val();
		store.description = $("#description").val();
		store.address = $("#address").val();
		store.phoneNumber = $("#phoneNumber").val();
		store.alternatePhoneNumber = $("#alternatePhoneNumber").val();
		store.emailId = $("#emailId").val();
		store.location = $("#location").val();
	
		event.preventDefault();
		var commissionPercentage = $("#commission").val();
		var commission = encodeURIComponent(commissionPercentage);
		var urlParams = "commission="+commission;
		// "/shopnowat" 
		var destination = "/store/add_store_details.htm?"+urlParams;
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
			success : function(result1) {
				addStoreResponseHandler(result1);
			}
		});
	});
}

function addStoreResponseHandler(result1){
	
	var user = new Object();
	user.name = $("#uname").val();
	user.password = $("#password").val();
	user.phoneNumber = $("#uphoneNumber").val();
	user.alternatePhoneNumber = $("#ualternatePhoneNumber").val();
	user.emailId = $("#uemailId").val();
	user.roleId = "2";
	user.storeId = result1[1];
	user.address = $("#uaddress").val();
	alert(JSON.stringify(user));
	// "/shopnowat" 
	var destination = "/user/add_user.htm";
	$.ajax({
		type : "post",
		url : destination,
		dataType: "json",
		contentType: "application/json",
		data : JSON.stringify(user),
		beforeSend: function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
			},
		cache : false,
		success : function(result) {
			addUserResponseHandler(result);
		}
	});
	
	
}

function addUserResponseHandler(result) {
	alert("'"+storeName+"' and "+result[0]);
	
	$("#name").val("");
	$("#description").val("");
	$("#address").val("");
	$("#phoneNumber").val("");
	$("#alternatePhoneNumber").val("");
	$("#emailId").val("");
	$("#location").val("");
	$("#uname").val("");
	$("#password").val("");
	$("#uaddress").val("");
	$("#uphoneNumber").val("");
	$("#ualternatePhoneNumber").val("");
	$("#uemailId").val("");
	$("#roleId").val("");
	$("#commission").val("");
}

</script>
</head>

<body>
	<h3 align="center">
		<fmt:message key="add_store_heading" />
	</h3>
	<form method="post" ><div>
	<h4>Store Details</h4>
		<table width="95%" bgcolor="f8f8ff" border="0" cellspacing="0"
			cellpadding="5">
			<tr>
				<td align="right" width="20%">Name:</td>
				<td width="20%"><input id="name" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Address</td>
				<td width="20%"><input id="address" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Phone Number</td>
				<td width="20%"><input id="phoneNumber" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Alternate Phone Number</td>
				<td width="20%"><input id="alternatePhoneNumber" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Email ID</td>
				<td width="20%"><input id="emailId" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">location</td>
				<td width="20%"><input id="location" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Description:</td>
				<td width="20%"><textarea cols="25" rows="5" id="description" ></textarea></td>
			</tr>
			
		</table>
		<h4>Commission Details</h4>
		<table width="95%" bgcolor="f8f8ff" border="0" cellspacing="0"
			cellpadding="5">
			<tr>
				<td align="right" width="20%">Commission Percentage:</td>
				<td width="20%"><input id="commission" /></td>
			</tr>
		</table>
		<br>
		<h4>Store Administrator Details</h4>
		<table width="95%" bgcolor="f8f8ff" border="0" cellspacing="0"
			cellpadding="5">
			<tr>
				<td align="right" width="20%">Login Name:</td>
				<td width="20%"><input id="uname" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Password:</td>
				<td width="20%"><input id="password" ></input></td>
			</tr>
			<tr>
				<td align="right" width="20%">Phone Number</td>
				<td width="20%"><input id="uphoneNumber" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Alternate Phone Number</td>
				<td width="20%"><input id="ualternatePhoneNumber" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Email ID</td>
				<td width="20%"><input id="uemailId" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Role</td>
				<td width="20%"><input id="roleId" value="Store Admin" disabled/></td>
			</tr>
			<tr>
				<td align="right" width="20%">Address</td>
				<td width="20%"><input id="uaddress" /></td>
			</tr>
			
			<tr>
				<td align="center" colspan="2" width="100%"><input id="add" type="submit" align="center" value="Add Store"></td>
			</tr>
		</table>
		</div>
	</form>
</body>
</html>

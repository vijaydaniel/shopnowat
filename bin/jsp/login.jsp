<%@ include file="/jsp/include.jsp"%>
<%@ include file="/jsp/banner.jsp"%>

<html>
<head>
<script src="js/jquery-1.10.2.min.js"></script>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="Vijay Daniel" />
<meta name="keywords" content="Grocery online shopping" />
<meta name="description" content="best online tool for grocery shopping" />
<meta name="robots" content="all" />

<style type="text/css" media="all">
@import "css/banner.css";

@import "css/locations.css";

@import "css/stores.css";

@import "css/products.css";

@import "css/billing.css";

@import "css/order.css";
</style>

<script src="js/jstorage.js"></script>

<script>
	$(function() {
		$("#signInButton").click(
				function(event) {
					event.preventDefault();
					var uname = $("#name").val();
					var pword = $("#password").val();
					// /shopnowat
					var destination = "/login/" + uname + "/" + pword
							+ "/authenticateLogin.htm";
					$.ajax({
						type : "get",
						url : destination,
						cache : false,
						success : function(result) {
							authResponseHandler(result);
						}
					});
				});
	});

	function authResponseHandler(result) {
		if (result != "false") {
			var uname = $("#name").val();
			$.jStorage.set("user_name", uname);
			setCookie("eshopper_user_name", uname);
			$("#displayLoginUser").html(uname);
			getUName();
			setLogoutAction();
			if (result == 1) {
				window.location = "admin.htm";
			} else if (result == 2) {
				window.location = "store_admin_index.htm";
			} else if (result == 3) {
				window.location = "index.htm";
			}
		}
	}

	function setLogoutAction() {
		$("#Login")
				.html(
						"<input class=\"logoutButton\" type=\"image\" id=\"logout\" src=\"img/logout.png\" />");
		$(".logoutButton")
				.click(
						function(event) {
							document.cookie = "eshopper_user_name=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
							window.location = "logout.htm";
						});
	}

	function setCookie(cname, cvalue) {
		var d = new Date();
		d.setTime(d.getTime() + (60 * 60 * 1000));
		var expires = "expires=" + d.toGMTString();
		document.cookie = cname + "=" + cvalue + "; " + expires;
	}
</script>

</head>


<body>
	<div>
		<h1 align="center">
			<fmt:message key="login_heading" />
		</h1>

		<table align="center" width="25%" bgcolor="f8f8ff" border="0"
			cellspacing="0" cellpadding="5">

			<tr>
				<td align="right" width="20%">Name:</td>
				<td width="20%"><input id="name" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Password:</td>
				<td width="20%"><input id="password" /></td>
			</tr>
			<tr>
				<td align="center" colspan="2" width="100%"><button
						type="button" id="signInButton" class="signInButton">Sign
						In</button></td>
			</tr>
			<tr>
				<td align="right" width="20%" colspan="2"><a href="#"
					id="forgotPasswordLink">forgot password?</a></td>
			</tr>
		</table>
		<br>

	</div>


</body>


</html>
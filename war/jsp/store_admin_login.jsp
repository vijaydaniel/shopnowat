<%@ include file="/jsp/include.jsp"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="Vijay Daniel" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="Grocery online shopping" />
<meta name="description" content="best online tool for grocery shopping" />
<meta name="robots" content="all" />

<title>ShopNowAt</title>
<!--  "/shopnowat" + -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
<link href="/css/store_admin.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.10.2.min.js"></script>

</head>

<body>
	<div class="row-fluid" style="background-color: #585858;">
		<div class="col-md-9" id="banner">
		<!-- /shopnowat -->
			<img class="pull-left" src="/img/shopnowat/logo.png"
				style="width: 150px; height: 40px; margin-top: 15;">
			<h1 align="center" style="color: white" >ShopNowAt</h1>
		</div>
		<div class="col-md-3" id="banner-buttons">
			
			<h1>
				<button type="button" class="btn btn-default pull-right"
					style="margin: 5">Contacts</button>
			</h1>
			<h1>
				<button type="button" class="btn btn-default pull-right"
					style="margin: 5">About Us</button>
			</h1>
			<h1 id="Login">
				<input  title="login" class="loginButton pull-right" type="image" id="login" src="img/shopnowat/login.png" style="margin: 6"/>
			</h1>
		</div>
	</div>
	
	<form role="form" class="form-horizontal">

		<div class="row-fluid">
			<div class="col-md-4">
	
			</div>
			<div class="col-md-4" style="background-color:#E4F0B4;margin:80 0 0 0">
				
				<div class="form-group" style="padding:40 60 5 60;">
					<!-- <label for="loginID" class="col-md-4 control-label">Login ID</label>  -->
					<div class="col-md-12" style="text-align: center;vertical-align: center;">
    					<input type="text" class="form-control" id="name" placeholder="Login ID">
    				</div>
				</div>
				<div class="form-group" style="padding:5 60 5 60;">
					<!-- <label for="password" class="col-md-4 control-label">Password</label>  -->
					<div class="col-md-12" style="text-align: center;vertical-align: center;">
    					<input type="password" class="form-control" id="password" placeholder="Password">
    				</div>
				</div>
				<div class="form-group" style="padding:5 60 5 60;">
					<div class="col-md-12" style="text-align: center;vertical-align: center;">
						<button	type="button" id="signInButton" class="btn btn-warning btn-block signInButton" style="color:black">Sign In</button>
					</div>
				</div>
				
			</div>
			<div class="col-md-4">
				
			</div>
		</div>
		
	</form>

</body>

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
		setCookie("eshopper_user_name", uname);
		$("#displayLoginUser").html(uname);

		if (result == 1) {
			window.location = "admin.htm";
		} else if (result == 2) {
			window.location = "store_admin_index.htm";
		} else if (result == 3) {
			window.location = "index.htm";
		}
	}
}

function setCookie(cname, cvalue) {
	var d = new Date();
	d.setTime(d.getTime() + (60 * 60 * 1000));
	var expires = "expires=" + d.toGMTString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
}
</script>

</html>
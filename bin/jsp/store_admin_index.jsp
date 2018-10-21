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
<!-- 
<style type="text/css" media="all">
@import "css/banner.css";
@import "css/store_admin_view.css";
</style>
 -->
<!--   "/shopnowat" -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
<link href="/css/store_admin.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.10.2.min.js"></script>

</head>

<body>
	<div class="row-fluid" style="background-color: #585858;">
		<div class="col-md-8" id="banner">
		<!-- "/shopnowat"  -->
			<img class="pull-left" src="/img/shopnowat/logo.png"
				style="width: 150px; height: 40px; margin-top: 15;">
			<h1 align="center" style="color: white" >ShopNowAt</h1>
		</div>
		<div class="col-md-4" id="banner-buttons">
			<div class="row-fluid">
			<div class="col-md-4" style="padding:0 0 0 0;margin: 0 0 0 0;">
			<h4 id="displayLoginUser" style="padding:0 0 0 0;margin: 30 2 0 0;color: white" class="pull-right">
				
			</h4>
			</div>
			<div class="col-md-1" style="padding:6 0 0 2;margin: 0 0 0 0;">
			<h1 id="Login">
				<input  title="login" type="image" id="login" src="img/shopnowat/login.png" style="padding:0 0 0 0;margin: 0 0 0 0;"/>
			</h1>
			</div>
			<div class="col-md-3" style="padding:0 0 0 0;margin: 0 0 0 15;">
			<h1>
				<button type="button" class="btn btn-default"
					style="margin: 5">Contacts</button>
			</h1>
			</div>
			<div class="col-md-3" style="padding:0 0 0 0;margin: 0 0 0 0;">
			<h1>
				<button type="button" class="btn btn-default"
					style="margin: 5">About Us</button>
			</h1>
			</div>
			
			
			</div>
		</div>
	</div>
	
	<!-- style="border-right: 1px dashed #333;" style="border-right: 1px dashed #333;border-left: 1px dashed #333;" -->

	<div class="row-fluid">
		<div id="links-column" class="col-md-2" >
				<%@ include file="store_admin_links.jsp"%>
		</div>
		<div id="workArea" class="col-md-5" >

		</div>
		<div id="editArea" class="col-md-5" >
			
		</div>
	</div>
	<div class="row-fluid" style="margin:0;padding:30">
		<div id="footer-content" class="col-md-12" style="margin:0;padding:0">
				&nbsp;
		</div>
	</div>
	<div class="row-fluid" style="margin:0;padding:0">
		<div id="footer-content" class="col-md-12" style="margin:0;padding:0">
				<%@ include file="footer.jsp"%>
		</div>
	</div>

</body>

<script>

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i].trim();
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}

function getUName(){
	var usern = getCookie("eshopper_user_name");
	$("#displayLoginUser").text(usern.trim());
}

$(function() {
	getUName();
	var usern = getCookie("eshopper_user_name");
	
	if(usern){
		$("#Login").html("<input title=\"logout\" class=\"logoutButton\" type=\"image\" id=\"logout\" src=\"img/shopnowat/logout.png\" />");
	}else{
		window.location="store_admin_login.htm";
	}
	
	$(".loginButton").click(function(event) {
		window.location="store_admin_login.htm";
	});
	
	$(".logoutButton").click(function(event) {
		document.cookie = "eshopper_user_name=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
		window.location="logout.htm";
	});
	
});

</script>

</html>
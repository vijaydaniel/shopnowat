<%@ include file="/jsp/include.jsp"%>

<html>
<head>
<script src="js/jquery-1.10.2.min.js"></script>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="Vijay Daniel" />
<meta name="keywords" content="Grocery online shopping" />
<meta name="description" content="best online tool for grocery shopping" />
<meta name="robots" content="all" />
<script src="js/jstorage.js"></script>

<title><fmt:message key="title" /></title>

<style type="text/css" media="all">
@import "css/banner.css";

@import "css/locations.css";

@import "css/stores.css";

@import "css/products.css";

@import "css/billing.css";

@import "css/order.css";
</style>

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
	//var user_name = $.jStorage.get("user_name");
	$("#displayLoginUser").text(usern.trim());
}
 
$(function() {
	getUName();
	/* var user_name = $.jStorage.get("user_name");
	$("#displayLoginUser").text(user_name); */
	var usern = getCookie("eshopper_user_name");
	if(usern){
		$("#Login").html("<input class=\"logoutButton\" type=\"image\" id=\"logout\" src=\"img/shopnowat/logout.png\" />");
	}
	
	$(".homeButton").click(function(event) {
		event.preventDefault();
		window.location="index.htm";
	});
	
	$(".loginButton").click(function(event) {
		window.location="login.htm";
	});
	
	$(".logoutButton").click(function(event) {
		document.cookie = "eshopper_user_name=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
		window.location="logout.htm";
	});
	
	$(".userAddButton").click(function(event) {
		alert('hi3');
	});
	
});

</script>

</head>

<body>
	<!-- <form name="index-form" method="post"> -->
	<div style="width: 100%">
		<!--  The product banner -->
		<div id="banner">
			<div id="titlePane" class="titleFormat">
					<h1>
						<fmt:message key="title" />
					</h1>
			</div>
			<div id="toolbar" class="toolBarAlignment">
				<div id="displayLoginUser">
					
				</div>
				<div id="Home">
					<input class="homeButton" type="image" id="home" src="img/shopnowat/home.png" />
				</div>
				<div id="Login">
					<input class="loginButton" type="image" id="login" src="img/shopnowat/login.png" />
				</div>
				<div id="New User">
					<input class="userAddButton" type="image" id="newuser" src="img/shopnowat/user-add.png" />
				</div>
			</div>
		</div>

	</div>
	<!-- </form> -->
</body>

</html>
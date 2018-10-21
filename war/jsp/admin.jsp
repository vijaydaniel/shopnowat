<%@ include file="/jsp/include.jsp"%>
<%@ include file="/jsp/hit_rate.jsp"%>
<%@ include file="/jsp/banner.jsp"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="Vijay Daniel" />
<meta name="keywords" content="Grocery online shopping" />
<meta name="description" content="best online tool for grocery shopping" />
<meta name="robots" content="all" />

<title><fmt:message key="title" /></title>

<style type="text/css" media="all">
@import "css/banner.css";
@import "css/store_admin_view.css";
</style>
<script src="js/jquery-1.10.2.min.js"></script>

</head>

<body>
	<!-- <form name="index-form" method="post"> -->
	<div style="width: 100%">
		<!-- Stores List -->
		<div id="links-column">
			<%@ include file="admin_links.jsp"%>
		</div>

		<div id="workArea">
			<h3>Welcome to ShopNowAt</h3>
		</div>
		
		<div id="editArea">
		
		</div>
	</div>
	<!-- </form> -->
</body>

</html>
<%@ include file="include.jsp"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="v&v" />
	<meta name="keywords" content="v&v" />
	<meta name="description" content="v&v" />
	<meta name="robots" content="all" />

	<title><fmt:message key="title" /></title>

</head>
<body>
	<form method="post">
		<h1>
			<fmt:message key="heading" />
		</h1>
		<p>
			<fmt:message key="greeting" />
			<c:out value="${model.now}" />
		</p>
		<h3>All Cart Report</h3>
		<br>
		<table width="95%" bgcolor="f8f8ff" border="0" cellspacing="0"
			cellpadding="5">
			<c:forEach items="${model.all_cart_report}" var="cart">
				<tr>
					<td><c:out value="${cart.cart_id}" /></td>
					<td><c:out value="${cart.name}" /></a></td>
					<td><c:out value="${cart.total_amount}" /></td>
					<td><c:out value="${cart.address}" /></td>
				</tr>
			</c:forEach>
		</table>
		<br>

		<h3>Open Cart Report</h3>
			<table width="95%" bgcolor="ABCDEF" border="0" cellspacing="0"
				cellpadding="5">
				<c:forEach items="${model.open_cart_report}" var="openCart">
					<tr>
						<td><c:out value="${openCart.cart_id}" /></td>
						<td><c:out value="${openCart.name}" /></td>
						<td><c:out value="${openCart.total_amount}" /></td>
						<td><c:out value="${openCart.address}" /></td>
					</tr>
				</c:forEach>
			</table>
			
		<h3>Items in Cart Report</h3>
		<table width="95%" bgcolor="ABCDEF" border="0" cellspacing="0"
			cellpadding="5">
			<c:forEach items="${model.items_in_cart_report}" var="openCartItems">
				<tr>
					<td><c:out value="${openCartItems.cart_id}" /></td>
					<td><c:out value="${openCartItems.product_id}" /></td>
					<td><c:out value="${openCartItems.name}" /></td>
					<td><c:out value="${openCartItems.item_quantity}" /></td>
					<td><c:out value="${openCartItems.price}" /></td>
				</tr>
			</c:forEach>
		</table>
		
		<h3>All Cart Report Across Stores</h3>
		<table width="95%" bgcolor="f8f8ff" border="0" cellspacing="0"
			cellpadding="5">
			<c:forEach items="${model.all_cart_admin_report}" var="cart">
				<tr>
					<td><c:out value="${cart.cart_id}" /></td>
					<td><c:out value="${cart.name}" /></a></td>
					<td><c:out value="${cart.total_amount}" /></td>
					<td><c:out value="${cart.address}" /></td>
				</tr>
			</c:forEach>
		</table>
		
		<h3>All Open Cart Report Across Stores</h3>
		<table width="95%" bgcolor="ABCDEF" border="0" cellspacing="0"
			cellpadding="5">
			<c:forEach items="${model.open_cart_admin_report}" var="cart">
				<tr>
					<td><c:out value="${cart.cart_id}" /></td>
					<td><c:out value="${cart.name}" /></a></td>
					<td><c:out value="${cart.total_amount}" /></td>
					<td><c:out value="${cart.address}" /></td>
				</tr>
			</c:forEach>
		</table>
		
		<br><br>
	
	</form>
</body>
</html>
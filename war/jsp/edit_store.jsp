<%@ include file="include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title><fmt:message key="title" /></title>
<style>
.error {
	color: red;
}
</style>
</head>
<body>
	<h1 align="center">
		<fmt:message key="edit_store_heading" />
	</h1>
	<form:form modelAttribute="store" method="post" action="delete_store_submit.htm">
		<table width="95%" bgcolor="f8f8ff" border="0" cellspacing="0"
			cellpadding="5">
			<tr>
				<td align="right" width="20%">ID:</td>
				<td width="20%"><form:input path="id" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Name:</td>
				<td width="20%"><form:input path="name" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Description:</td>
				<td width="20%"><form:input path="description" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Address</td>
				<td width="20%"><form:input path="address" /></td>
			</tr>
			<tr>
				<td align="center" colspan="2" width="100%"><input type="submit" align="center" value="Edit"></td>
			</tr>

		</table>
		<c:out value="${model.products}" />
		<table width="95%" bgcolor="f8f8aa" border="0" cellspacing="0"
				cellpadding="5">
				<c:forEach items="${model.products}" var="prod">
					<tr>
						<td><c:out value="${prod.name}" /></td>
						<td><c:out value="${prod.description}" /></td>
						<td><c:out value="${prod.price}" /></td>
					</tr>
				</c:forEach>
			</table>
		
		<br>

	</form:form>
</body>
</html>
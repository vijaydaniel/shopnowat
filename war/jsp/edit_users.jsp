<%@ include file="/WEB-INF/jsp/include.jsp"%>
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
		<fmt:message key="add_user_heading" />
	</h1>
	<form:form method="post" action="edit_user_submit.htm" modelAttribute="user">
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
				<td align="right" width="20%">Password:</td>
				<td width="20%"><form:input path="password" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">Phone Number</td>
				<td width="20%"><form:input path="phone_number" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">alternate_phone_number:</td>
				<td width="20%"><form:input path="alternate_phone_number" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">email_id:</td>
				<td width="20%"><form:input path="email_id" /></td>
			</tr>
			<tr>
				<td align="right" width="20%">role_id:</td>
				<td width="20%"><form:input path="role_id" /></td>
			</tr>
			
			<tr>
				<td align="center" colspan="2" width="100%"><input type="submit" align="center" value="Add"></td>
			</tr>
		</table>
		<br>

	</form:form>
</body>
</html>
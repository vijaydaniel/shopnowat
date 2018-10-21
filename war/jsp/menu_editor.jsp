<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>ShopNowAt</title>

// /shopnowat/
<link rel="stylesheet" href="/css/menu-editor.css">

<script src="/js/jquery-1.10.2.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/js/menu-editor.js"></script>
</head>
<body>

<select id="menu-list" name="menu-list">
	<option value="create-new">Create New</option>
	<%
		List<String> stores=(List<String>)request.getAttribute("menuList");
		for(String store:stores) {
			out.print("<option value='"+store+"'>"+store+"</option>");
		}
	%>
</select>
<a href="#" id="submit">Submit</a>

<div id="menu-editor">
	<ul class="menu-ul">
		<li><span><input type="text" value=""></span> <a href="#" id="edit" class="button">Save</a> <a href="#" id="remove" class="button">Remove</a> <a href="#" id="insert-before" class="button">Insert Before</a> <a href="#" id="insert-after" class="button">Insert After</a> <a href="#" id="create-child" class="button">Create Child</a></li>
	</ul>
</div>
<form id="request-container"></form>
</body>
</html>

<%@ include file="/jsp/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<script src="js/jquery-1.10.2.min.js"></script>

<script type="text/javascript" charset="utf-8">

	$(document).ready(function() {
		$("#imageGalleryPanel").load("imagegallery.htm");
		modifyProduct()
	});

	function modifyProduct(){
		$("#update").click(function(event) {
			var product = new Object();			
			product.id = $("#productId").val();
			product.name = $("#name").val();
			product.description = $("#description").val();
			product.price = $("#price").val();
			product.storeid = $("#storeid").val();
			product.stock = $("#stock").val();
			product.img = $("#image").val();
			product.storeid = $("#storeid").val();
			
			event.preventDefault();
			// "/shopnowat" 
			var destination = "/product/edit_product_submit.htm";
			$.ajax({
				type : "post",
				url : destination,
				dataType: "json",
				contentType: "application/json",
				data : JSON.stringify(product),
				beforeSend: function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
					},
				cache : false,
				success : function(result1) {
					modifyProductResponseHandler(result1);
				}
			});
			$("#name").val("");
			$("#description").val("");
			$("#price").val("");
			$("#storeid").val("");
			$("#stock").val("");
			$("#image").val("");
		});
	}
	
	function modifyProductResponseHandler(result1){
		alert(result1[0]);
		$("#workArea").load("edit_product.htm");
	}
	
</script>
</head>
<body>

	<form id="add_product_form" class="form-horizontal">
		<h4 align="center" class="orange">Modify Product</h4>
		<%@ page import="java.net.URLDecoder"%>
		<%
		request.setCharacterEncoding("UTF-8");
		String productId = (String) request.getParameter("id");
		String name = URLDecoder.decode(request.getParameter("name"),"UTF-8");
		String description = (String) request.getParameter("description");
		String price = (String) request.getParameter("price");
		String stock = (String) request.getParameter("stock");
		String img = (String) request.getParameter("img");
		%>
		<div class="form-group">
			<label for="name" class="col-md-6 control-label">Product Name</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="name" placeholder="Product Name" value="<%=name%>">
  			</div>
		</div>
		<div class="form-group">
			<label for="description" class="col-md-6 control-label">Product Description</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="description" placeholder="Product Description" value="<%=description%>">
  			</div>
		</div>
		<div class="form-group">
			<label for="price" class="col-md-6 control-label">Price</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="price" placeholder="Price" value="<%=price%>">
  			</div>
		</div>
		<div class="form-group">
			<label for="stock" class="col-md-6 control-label">Number of Products in stock</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="stock" placeholder="stock" value="<%=stock%>">
  			</div>
		</div>
		<div class="form-group">
			<label for="image" class="col-md-6 control-label">Image</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="image" placeholder="select image from gallery" value="<%=img%>">
  			</div>
		</div>
			<%
				String store_id = (String) session.getAttribute("storeid");
			%>
		<div class="form-group">
			<div align="center" class="col-md-12">
  					<input type="hidden" id="storeid" name="storeid" value="<%=store_id%>"></input>
  					<input type="hidden" id="productId" name="productId" value="<%=productId%>"></input>
					<input id="update" type="submit" align="center" value="Update Product" class="btn btn-primary">
  			</div>
		</div>
		<br>&nbsp;<br>&nbsp;<br clear="all">
		<p align="center"><b>Please use the below image gallery to modify the product image</b><p>
		
		<div id="imageGalleryPanel">
		
		</div>
	</form>
</body>
</html>
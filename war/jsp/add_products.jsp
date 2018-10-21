<%@ include file="/jsp/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<style>
</style>
<script src="js/jquery-1.10.2.min.js"></script>

<script type="text/javascript" charset="utf-8">

	$(document).ready(function() {
		addProduct();
	});
	
	function addProduct(){
		$("#add").click(function(event) {
			var product = new Object();		        
			product.name = $("#name").val();
			product.description = $("#description").val();
			product.price = $("#price").val();
			product.storeid = $("#storeid").val();
			product.stock = $("#stock").val();
			product.img = $("#image").val();
			product.category = $("#category").val();
			
			event.preventDefault();
			// "/shopnowat" 
			var destination = "/product/add_product.htm";
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
					addProductResponseHandler(result1);
				}
			});
			$("#name").val("");
			$("#description").val("");
			$("#price").val("");
			$("#storeid").val("");
			$("#stock").val("");
			$("#image").val("");
			$("#category").val("");
		});
	}
	
	function addProductResponseHandler(result1){
		alert(result1[0]);
	}
	
</script>
</head>
<body>

	<form id="add_product_form" role="form" class="form-horizontal">
		<h4 align="center" class="orange">Add Products</h4>
		<div class="form-group">
			<label for="name" class="col-md-6 control-label">Product Name</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="name" placeholder="Product Name">
  			</div>
		</div>
		<div class="form-group">
			<label for="description" class="col-md-6 control-label">Product Description</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="description" placeholder="Product Description">
  			</div>
		</div>
		<div class="form-group">
			<label for="price" class="col-md-6 control-label">Price</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="price" placeholder="Price">
  			</div>
		</div>
		<div class="form-group">
			<label for="stock" class="col-md-6 control-label">Number of Products in stock</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="stock" placeholder="stock">
  			</div>
		</div>
		<div class="form-group">
			<label for="image" class="col-md-6 control-label">Image</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="image" placeholder="select image from gallery">
  			</div>
		</div>
		<div class="form-group">
			<label for="category" class="col-md-6 control-label">Category</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="category" placeholder="1-1">
  			</div>
		</div>
	
			<%
				String store_id = (String) session.getAttribute("storeid");
			%>
		<div class="form-group">
			<div align="center" class="col-md-12">
  					<input type="hidden" id="storeid" name="storeid" value="<%=store_id%>"></input>
					<input id="add" type="submit" align="center" value="Add Product" class="btn btn-primary">
  			</div>
		</div>
		<br>&nbsp;<br>&nbsp;<br>
		<p align="center"><b>Please select the image from the image gallery to set it as this product image</b><p>

	</form>
</body>
</html>
<%@ include file="/jsp/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<style>
</style>
<script src="js/jquery-1.10.2.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript" charset="utf-8">

	$(document).ready(function() {
		getProducts();
	});

	function getProducts() {
		var storeid = $("#storeid").val();
		// "/shopnowat" 
		var destination = "/product/" + storeid +"/productsinstore.htm";
		$.ajax({
			type : "get",
			url : destination,
			cache : false,
			success : function(result) {
				responseProductHandler(result);
			}
		});
	}

	function responseProductHandler(result) {
		
		for (i = 0; i < result.length; i++) {
			console.log(result[i].name);
			newRow = "<tr><td >"+result[i].name+"</td><td >"+result[i].description+"</td><td >"+result[i].price+"</td><td >"+result[i].stock+"</td><td> <input class=\"viewImage\" type=\"image\" id=\"viewimage\" src=\""+result[i].img+"\" /></td></tr>";
			$("#view_product_table").append(newRow);
		}

	}
	
</script>
</head>
<body>

	<form id="view_product_form" role="form" class="form-horizontal">
		<h4 align="center" class="orange">Available Products</h4>
		<table id="view_product_table" class="table table-striped table-responsive table-bordered">
			<thead>
				<tr style="background-color:#585858;color:#FFFFFF;">
					<th>
						Product Name
					</th>
					<th>
						Description
					</th>
					<th>
						Price
					</th>
					<th>
						Stock
					</th>
					<th>
						Image
					</th>
				</tr>
			</thead>
		</table>
		<%
			String store_id = (String) session.getAttribute("storeid");
		%>
		<input type="hidden" id="storeid" name="storeid" value="<%=store_id%>"></input>

	</form>
</body>
</html>
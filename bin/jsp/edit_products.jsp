<%@ include file="/jsp/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<style>
</style>
<script src="js/jquery-1.10.2.min.js"></script>
<style type="text/css">
</style>
<style type="text/css">
  .row-highlight
  {
      background-color: Orange;
  }
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
			newRow = "<tr><td>"+result[i].id+"</td><td>"+result[i].name+"</td><td>"+result[i].description+"</td><td>"+result[i].price+"</td><td>"+result[i].stock+"</td><td> <input class=\"viewImage\" type=\"image\" id=\"viewimage\" src=\""+result[i].img+"\" /></td></tr>";
			$("#view_product_table").append(newRow);
		}
		mouseHandle();
		displayProductForEdit();
	}
	
	function mouseHandle() {
       
        var tr = $('#view_product_table').find('tr');

        tr.hover(
             function() {  // mouseover
                 $(this).addClass('row-highlight');
             },
             function() {  // mouseout
                 $(this).removeClass('row-highlight');
             }
        );
    }
		
	function displayProductForEdit(){
		 var tr = $('#view_product_table').find('tr');
         tr.bind('click', function(event) {
        	var tds = $(this).addClass('row-highlight').find('td');
        	var img;
         	img = $(this).find('input');
         	var imagePath = img.attr('src');
			var productArray = new Array();
            $.each(tds, function(index, item) {
            	productArray[index] = item.innerHTML;
            });
            var productId = productArray[0];
            var productName = encodeURIComponent(productArray[1]);
            var productDescription = encodeURIComponent(productArray[2]);
            var productPrice = productArray[3];
            var productStock = productArray[4];
            var productImg = encodeURIComponent(imagePath);
            var urlParams = "id="+productId+"&name="+productName+"&description="+productDescription+"&price="+productPrice+"&stock="+productStock+"&img="+productImg;
            $("#editArea").load("edit_product_2.htm?"+urlParams);
        });
	}
	
</script>
</head>
<body>

	<form id="view_product_form" class="form-horizontal">
		<h4 align="center" class="orange">Modify Product Details</h4>
		<div id="view_table_div">
		<!-- <table id="view_product_table_header" class="table table-responsive table-bordered">
		
		</table> -->
		<div class="inner_table" width="100%">
        	<table id="view_product_table" class="table table-responsive table-bordered">
	        	<tr style="background-color:#585858;color:#FFFFFF;">
					<th>
						ID
					</th>
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
            </table>
    	</div>
		</div>
			<%
				String store_id = (String) session.getAttribute("storeid");
			%>
		<input type="hidden" id="storeid" name="storeid" value="<%=store_id%>"></input>

	</form>
</body>
</html>
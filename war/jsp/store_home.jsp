<%@ include file="/jsp/include.jsp"%>
<html style="height:100%">
<head>
<meta charset="utf-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>ShopNowAt</title>


<link href="/css/new_products.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.10.2.min.js"></script>

<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
 <link href="/css/dropdown.css" rel="stylesheet" type="text/css" />  
<script src="../bootstrap/js/bootstrap.min.js"></script>

 <style type="text/css">

</style>
</head>
 <!--
.item {
    border-bottom: 1px solid black; 
}
-->
<!-- background-color: #E4F0B4; -->
<body style="height:100%;">
	<div class="container-fluid" style="margin-top:5;margin-bottom:0;">
		<div class="row-fluid" style="margin-bottom:0">
			<div class="col-sm-8 col-md-9 col-lg-8" id="banner">
				<img class="pull-left" src="/img/shopnowat/logo.png"
					style="width: 150px; height: 50px;margin-bottom:0">
				<h1 id="storeName" align="center" style="color: black" >ShopNowAt</h1>
			</div>
			<div class="col-sm-4 col-md-3 col-lg-4" id="banner-buttons">
				<div class="pull-right" style="margin-top:40;">
					<b>
					<a href="#">Contacts</a>
					<!--  <button type="button" class="btn btn-default pull-right" style="margin: 5">Contacts</button> -->
					</b>|
					<b>
						<a href="#">About Us</a>
						<!-- <button type="button" class="btn btn-default pull-right" style="margin: 5">About Us</button> -->
					</b>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid" style="margin-top:0;padding-top:0;">
	<%
	String storeId = request.getParameter("store_id");
	%>
	<div class="navbar navbar-inverse" role="navigation" style="margin-bottom:0;margin-top:0">
		<div class="container-fluid" style="margin-bottom:0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div id="main-menu" class="navbar-collapse collapse" style="margin-bottom:0">
				<ul style="margin-bottom:0">
					<li class="nav navbar-nav navbar-right">
						<form class="navbar-form navbar-right" role="search">
							<div class="btn-group">
								<input type="search" id="products-search-bar" class="form-control" placeholder="Search">
								<span id="searchclear" class="glyphicon glyphicon-remove-circle"></span>
							</div>
							
						</form>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="hiddenStoreId" value="<%=storeId%>">

	<div id="middle-content-div" class="container-fluid" style="margin: 10 10 10 10;" >
		<div class="row-fluid">
			<div style="margin-top:5" class="col-md-9" id="inner-content-div" >
				
			</div>
			<div class="col-md-3">
				<div style="margin-top:10" id="shoppingCart" class="list-group" data-spy="affix" data-offset-top="150" data-offset-bottom="150">
				</div>
			</div>
		</div>
	</div>
	</div>
<input type="hidden" id="offsetStorage" value="0">
<input type="hidden" id="showOrderButton" value="0">
<input type="hidden" id="categorySelected" value="1">
	
	<div class="container-fluid" style="margin: 10 10 10 10;" >
		<div class="row-fluid">
			<div style="margin-top:5;height:300;" class="col-md-12">
				&nbsp;
			</div>
		</div>
	</div>
	
	<footer id="footer" style="background-color: #585858;">
		<div class="container" role="contentinfo">
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-md-12">
							<p class="pull-right" style="color: #FFFFFF;">ShopNowAt is on
								Beta version</p>
							<ul class="list-inline">
								<li><a style="color: #FFFFFF;"
									href="https://www.facebook.com/pages/Shopnowat/315665965277959"
									title="Facebook" rel="nofollow">Facebook</a></li>
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<ul class="list-inline">
								<li><a style="color: #FFFFFF;"
									href="http://shopnowat.com/tandc.htm"
									title="Terms and Conditions" rel="nofollow">Terms and
										Conditions</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--/row-->

			<div class="row">
				<div class="col-md-12">
					<p class="text-right" style="color: #FFFFFF;">Copyright &copy;
						ShopNowAt. All rights reserved.</p>
				</div>
			</div>
			<!--/row-->
		</div>
	</footer>


	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#showOrderButton").val("0");
		getProducts(0,8,1);
		setShopName();
		});
	
	function setShopName(){
		var storeIdentity = $("#hiddenStoreId").val();
		// "/shopnowat" 
		var destination = "/stores/"+storeIdentity+"/getstorename.htm";
		$.ajax({
			type : "get",
			url : destination,
			cache : false,
			success : function(result) {
				//$('#shopName').text(result[0]);
				$('#storeName').text(result[0]);
			}
		});
	}
	
	function getProducts(off,row,cat) {

		var storeIdentity = $("#hiddenStoreId").val();
		var offset = off;
		var rowCount = row;
		var category = cat;
		// "/shopnowat" 
		var destination = "/product/"+storeIdentity+"/"+category+"/"+offset+"/"+rowCount+"/productsInStoreByCategory.htm";
		$.ajax({
			type : "get",
			url : destination,
			cache : false,
			success : function(result) {
				responseHandler(result,offset,rowCount);
			}
		});

	}
	
	function responseHandler(result,offset,rowCount){
		var c = [];
		c.push("<div class=\"row\">");
		for (i = 0; i < result.length; i++) {
			product = result[i];
			
			if(i!=0 && i%4==0){
				c.push("</div>");
				c.push("<div class=\"row\">");
			}
			c.push("<div class=\"col-sm-3\">");
			c.push("<div class=\"item\">");
			//class=\"thumbnail\"
			c.push("<div class=\"thumbnail\" style=\"margin:5\">");
			c.push("<p align=\"center\"><img src=\"/"+product.img+"\" style=\"width: 100; height: 100;\"></p>");
			c.push("<div class=\"caption\" data-id=\""+product.id+"\" data-price=\""+product.price+"\" data-product-name=\""+product.name+"\">");
			c.push("<div style=\"height:40;\"><p align=\"center\"><b>"+product.name+"</b></p></div>");
			//c.push("<p>"+product.description+"</p>");
			c.push("<p align=\"center\" class=\"text-muted\" >Price: "+product.price+"</p>");
			c.push("<p align=\"center\">");
			c.push("<input type=\"button\" class=\"btn btn-warning additionButton\" role=\"button\" style=\"margin-right:5\" value=\"Add\">");
			c.push("<input type=\"button\" class=\"btn btn-default removalButton\" role=\"button\" value=\"Remove\">");
			c.push("</p>");
			c.push("<div>&nbsp;");
			c.push("</div>");
			c.push("</div>");
			c.push("</div>");
			c.push("</div>");
			c.push("</div>");
		}
		c.push("</div>");
		$("#inner-content-div").append(c.join(""));
		$("#offsetStorage").val(parseInt(offset)+parseInt(result.length));
		addProduct();
		removeProduct();
	}

	function addProduct() {
		$(".additionButton").unbind().click(function(event) {
			var quantity = 1;
			event.preventDefault();
			alreadyExists = false;
			productName = $(this).parents('.item').find('.caption').data('product-name');
			productPrice = $(this).parents('.item').find('.caption').data('price');
			productId = $(this).parents('.item').find('.caption').data('id');
			var c = [];
			c.push("<div class=\"list-group-item shoppingCartItem\" data-id=\""+productId+"\" data-quantity=\""+quantity+"\">");
				c.push("<div class=\"container-fluid\" style=\"margin:0;padding:0;\">");
					c.push("<div class=\"row-fluid \" style=\"margin:0;padding:0;\">");
						c.push("<div class=\"col-md-10\">");
							
							c.push("<div class=\"container-fluid\" style=\"margin:0;padding:0;\">");
								c.push("<div class=\"row-fluid \" style=\"margin:0;padding:0;\">");
									c.push("<div class=\"col-md-11\" style=\"margin:0;padding:0;\">");
										c.push("<b id=\"productName\" style=\"margin:0;padding:0;\" class=\"list-group-item-heading\">"+productName+"</b>");
									c.push("</div>");
									c.push("<div class=\"col-md-1\" style=\"margin:0;padding:0;\">");
										c.push("<span id=\"productQuantity\" style=\"margin:0;\" class=\"badge\">"+quantity+"</span>");
									c.push("</div>");
								c.push("</div>");
								c.push("<div class=\"row-fluid \" style=\"margin:0;padding:0;\">");
									c.push("<div class=\"col-md-12\" style=\"margin:0;padding:0;\">");
									c.push("<p id=\"price\" class=\"list-group-item-text text-muted\">Rs."+productPrice+"</p>");
									c.push("</div>");
							c.push("</div>");
							
							c.push("</div>");

						c.push("</div>");
					c.push("<div class=\"col-md-2 pull-right\">");
						c.push("<p class=\"list-group-item-text \"><input class=\"addImage\" type=\"image\" id=\""+productId+"\" src=\"/img/shopnowat/Button-Add-icon.png\" /></p>");
						c.push("<a href=\"#\" class=\"list-group-item-text\"><input class=\"removeImage\" type=\"image\" id=\""+productId+"\" src=\"/img/shopnowat/minus-red-icon.png\" /></a>");
					c.push("</div>");
				c.push("</div>");
			c.push("</div>");
			c.push("</div>");
			showOrderButton = $("#showOrderButton").val();
			if(showOrderButton==0){
				c.push("<div id=\"orderPane\" align=\"center\">");
					c.push("<br>");
						c.push("<div class=\"row-fluid\" style=\"margin:0;padding:0;\">");
							c.push("<div style=\"margin:0;padding:0;\" class=\"col-md-6 pull-left\">");
								c.push("<span id=\"total\" style=\"margin:0;padding:5 0 5 0;height:33;width:120\" class=\"label label-default pull-left full\"><h4 style=\"margin:0;padding:2 0 0 0;\">Total: "+0+"<h4></span>");
							c.push("</div>");
							c.push("<div class=\"col-md-6 pull-right\" style=\"margin:0;padding:0;\">");
								c.push("<button class=\"btn btn-warning pull-right\" type=\"button\" id=\"summitOrder\">Check Out</button>");
							c.push("</div>");
						c.push("</div>");
					c.push("</div>");
					c.push("</div>");
				c.push("</div>");
				$("#showOrderButton").val("1");
			}
			
			if($('#shoppingCart div[data-id='+productId+']').length == 0) {
				if(showOrderButton==0){
					$("#shoppingCart").append(c.join(""));
				}else{
					$(c.join("")).insertBefore('#orderPane');
				}
			}else{
				var p = $('#shoppingCart div[data-id='+productId+']').find('#price').text();
				var q = $('#shoppingCart div[data-id='+productId+']').attr("data-quantity");
				var removeRs = p.split(".");
				var unitVal = removeRs[1] / q ;
				unitVal = parseInt(unitVal);
				var incrementedQuantity = parseFloat(q) + parseFloat(1);
				var incrementedPrice = parseFloat(removeRs[1]) + parseFloat(unitVal);
				$('#shoppingCart div[data-id='+productId+']').attr("data-quantity",incrementedQuantity);
				$('#shoppingCart div[data-id='+productId+']').find('#price').html("Rs."+incrementedPrice);
				$('#shoppingCart div[data-id='+productId+']').find('#productQuantity').text(incrementedQuantity);
			}
			computeTotal(productPrice);
			removeProductByID();
			addProductByID();
			submitOrder();
		});
	}
	
	function removeProduct() {
		 $(".removalButton").unbind().click(function(event) {
			event.preventDefault();
			alreadyExists = false;
			productName = $(this).parents('.item').find('.caption').data('product-name');
			productPrice = $(this).parents('.item').find('.caption').data('price');
			productId = $(this).parents('.item').find('.caption').data('id');
			
			if($('#shoppingCart div[data-id='+productId+']').length == 0) {
				// do nothing
			}else{
				var p = $('#shoppingCart div[data-id='+productId+']').find('#price').text();
				var q = $('#shoppingCart div[data-id='+productId+']').attr("data-quantity");
				var removeRs = p.split(".");
				var unitVal = removeRs[1] / q ;
				unitVal = parseInt(unitVal);
				var decrementedQuantity = parseFloat(q) - parseFloat(1);
				if(decrementedQuantity <= 0){
					$('#shoppingCart div[data-id='+productId+']').remove();
					if($('#shoppingCart div[data-id='+productId+']').length == 0) {
						$('#orderPane').remove();
						$("#showOrderButton").val("0");
					}
				}else{
					var decrementedPrice = parseFloat(removeRs[1]) - parseFloat(unitVal);
					$('#shoppingCart div[data-id='+productId+']').attr("data-quantity",decrementedQuantity);
					$('#shoppingCart div[data-id='+productId+']').find('#price').html("Rs."+ decrementedPrice);
					$('#shoppingCart div[data-id='+productId+']').find('#productQuantity').text(decrementedQuantity);
				}
			}
			decrementTotal(productPrice);
		}); 
	}
	
	function addProductByID(){
		$(".addImage").unbind().click(function(event) {
			event.preventDefault();
			var productId = $(event.target).attr("id");
			var p = $('#shoppingCart div[data-id='+productId+']').find('#price').text();
			var q = $('#shoppingCart div[data-id='+productId+']').attr("data-quantity");
			var removeRs = p.split(".");
			var unitVal = removeRs[1] / q ;
			unitVal = parseInt(unitVal);
			var incrementedQuantity = parseFloat(q) + parseFloat(1);
			var incrementedPrice = parseFloat(removeRs[1]) + parseFloat(unitVal);
			$('#shoppingCart div[data-id='+productId+']').attr("data-quantity",incrementedQuantity);
			$('#shoppingCart div[data-id='+productId+']').find('#price').html("Rs."+incrementedPrice);
			$('#shoppingCart div[data-id='+productId+']').find('#productQuantity').text(incrementedQuantity);
			
			computeTotal(unitVal);
		}); 
	}
	
	function removeProductByID() {
		 $(".removeImage").unbind().click(function(event) {
			event.preventDefault();
			var productId = $(event.target).attr("id");
			
			if($('#shoppingCart div[data-id='+productId+']').length == 0) {
				// do nothing
			}else{
				var p = $('#shoppingCart div[data-id='+productId+']').find('#price').text();
				var q = $('#shoppingCart div[data-id='+productId+']').attr("data-quantity");
				var removeRs = p.split(".");
				var unitVal = removeRs[1] / q ;
				unitVal = parseInt(unitVal);
				var decrementedQuantity = parseFloat(q) - parseFloat(1);
				if(decrementedQuantity <= 0){
					$('#shoppingCart div[data-id='+productId+']').remove();
					if($('#shoppingCart div[data-id]').length == 0) {
						$('#orderPane').remove();
						$("#showOrderButton").val("0");
					}
				}else{
					var decrementedPrice = parseFloat(removeRs[1]) - parseFloat(unitVal);
					$('#shoppingCart div[data-id='+productId+']').attr("data-quantity",decrementedQuantity);
					$('#shoppingCart div[data-id='+productId+']').find('#price').html("Rs."+ decrementedPrice);
					$('#shoppingCart div[data-id='+productId+']').find('#productQuantity').text(decrementedQuantity);
				}
			}
			decrementTotal(productPrice);
		}); 
	}
	
	function computeTotal(price){
		var totalString = $('#total').text();
		var totals = totalString.split(" ");
		var total = parseInt(totals[1])+parseInt(price);
		$('#total').html("<h4 style=\"margin:0;padding:2 0 0 0;\">Total: "+total+"<h4>");
	}
	
	function decrementTotal(price){
		var totalString = $('#total').text();
		var totals = totalString.split(" ");
		var total = parseInt(totals[1]) - parseInt(price);
		$('#total').html("<h4 style=\"margin:0;padding:2 0 0 0;\">Total: "+total+"<h4>");
	}
	
	function submitOrder() {
		$("#summitOrder").unbind().click(
				function(event) {
					var storeId = $("#hiddenStoreId").val();
					$("#inner-content-div").empty();
					$("#inner-content-div").load("order.jsp?storeId="+storeId);
				});
	}
	
	$(window).scroll(function() {
		//console.log($(window).scrollTop());
		//console.log($(document).height());
	    if($(document).height() <= $(window).scrollTop() + $(window).height() + 50) {
	           // ajax call get data from server and append to the div
	           
	        var content = $("#inner-content-div").html();
	   		var s = "data-product-name";
	   		if(content.indexOf(s) > -1){
	   			var sr = $("#products-search-bar").val();
	   			if(sr==""){
	   			var offset = $("#offsetStorage").val();
	   			var category = $("#categorySelected").val();
		        getProducts(offset,8,category);
	   			}
	   		}
	          
	    }
	});
	
	function process(data, parent) {
		var current;
		if(data.name == 'ROOT') {
			$("#main-menu").append("<ul class='nav navbar-nav'></ul>");
			current=$("#main-menu ul.navbar-nav").first();
		} else {
			if(data.menu!=null && data.menu.length>0) {
				parent.append("<li class=\"dropdown active\"><a href='#' class=\"dropdown-toggle\" data-toggle=\"dropdown\">"+data.name+" <span class=\"caret\"></span></a><ul id=\""+data.id+"\" class=\"dropdown-menu\" role=\"menu\"></ul></li>");
				current=parent.find("li ul#"+data.id).first();
			} else {
				if(data.name == "Home"){
					parent.append("<li class=\"active\"><a href='#' class=\"menuClick\" id=\""+data.id+"\">"+data.name+"</a></li>");
					//parent.append("<li class=\"active\"><a id=\""+data.id+"\" href=\"#\"><i class=\"menuClick icon-home icon-white\"></i> Home</a></li>");
				}else{ 
					parent.append("<li><a href='#' class=\"menuClick\" id=\""+data.id+"\">"+data.name+"</a></li>");
				 } 
			}
		}
		for(var i=0;data.menu!=null && i<data.menu.length;i++) {
			process(data.menu[i], current);
		}
	}
	
	$(document).ready(function() {
		var storeIdentity = $("#hiddenStoreId").val();
		//"/shopnowat" 
		$.ajax({
			type : "get",
			url : "/store/"+storeIdentity+"/custom-menu.htm",
			cache : false,
			success : function(data) {
				process(data.menu);
				enableMenuClick();
			}
		});
	});
	
	function enableMenuClick(){
		$(".menuClick").unbind().click(
				function(event) {
					var storeId = $("#hiddenStoreId").val();
					var menuId = $(event.target).attr("id");
					$("#inner-content-div").empty();
					$("#categorySelected").val(menuId);
					getProducts(0,30,menuId);
				});
	}
	
	$(function() {
		$("#products-search-bar").keyup(
				function() {
					$('#searchclear').toggle(Boolean($(this).val()));
					var sr = $("#products-search-bar").val();
					var storeIdentity = $("#hiddenStoreId").val();
					// "/shopnowat" 
					if(sr!=""){
						var destination = "/product/"+storeIdentity+"/"+ sr + "/productsinstoresearch.htm";
						$.ajax({
							type : "get",
							url : destination,
							cache : false,
							success : function(result) {
								products = result;
								$("#inner-content-div").empty();
								responseHandler(result,0,result.length);
							}
						});
					}else{
						$("#inner-content-div").empty();
						var category = $("#categorySelected").val();
						getProducts(0,8,category);
					}
					
				});
	});
	
	$(document).ready(function() {
	      $('#searchclear').toggle(Boolean($("#products-search-bar").val()));
	      
	      $('#searchclear').click(function() {
	        $('#products-search-bar').val('').focus();
	        $(this).hide();
	        $("#inner-content-div").empty();
			var category = $("#categorySelected").val();
			getProducts(0,8,category);
	      });
	    });
	
</script>


</body>
</html>

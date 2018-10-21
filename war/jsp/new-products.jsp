<!--
This file is used to display the products in the product column.
Author: Vijay Daniel
-->

<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@ include file="include.jsp"%>
<html>
<head>
<script src="js/jquery-1.10.2.min.js"></script>
<script>

	var products;
	var productsPerPage = 10;
	$(document).ready(getProducts());

	function getProducts() {

		var storeIdentity = $("#storeId").val();
		// "/shopnowat" 
		var destination = "/product/"+storeIdentity+"/productsinstore.htm";
		$.ajax({
			type : "get",
			url : destination,
			cache : false,
			success : function(result) {
				products = result;
				responseHandler(result,0,productsPerPage);
			}
		});

	}
	
	function responseHandler(result,alpha,omega){
		var c = [];
		var disable = 0;
		omega = alpha + omega;
		if (omega >= products.length) {
			omega = products.length;
			disable = 1;
		}
		for (i = alpha; i < omega; i++) {
			product = result[i];
			c
					.push("<div class=\"item\" data-stock=\""+product.stock+"\">");
			c.push("<div class=\"itemImage\">");
			c
					.push("<a href=\"#\"><img src=\""+product.img+"\" alt=\""+product.name+"\"/></a>");
			c.push("</div>");
			c.push("<div class=\"itemName\" data-id=\""+product.id+"\" data-product-name=\""+product.name+"\">");
			c.push("<a href=\"#\"> <span class=\"productName\">" + product.name
					+ "</span>" + "</a>");
			c.push("</div>");
			c.push("<div class=\"itemPrice\" data-price=\""+product.price+"\">");
			c.push("<span class=\"price\">Price: Rs/- " + product.price + "</span>");
			c.push("</div>");
			c.push("<div class=\"addButtonPane\">");
			c.push("<input class=\"addButton\" type=\"image\" id=\"Add\" src=\"img/Button-Add-icon.png\" />");
			c.push("<input class=\"removeButton\" type=\"image\" id=\"Remove\" src=\"img/minus-red-icon.png\" />");
			c.push("</div>");
			c.push("</div>");
		}
		c.push("<div class=\"navigation\">");
		if (alpha > 0) {
			c.push("<input class=\"navigateLeft\" type=\"image\" id=\"back\" src=\"img/back.png\" />");
		}
		if (disable==0) {
			c.push("<input class=\"navigateRight\" type=\"image\" id=\"forward\" src=\"img/forward.png\" />");
		}
		c.push("</div>");
		$("#itemsPane").html(c.join(""));
		leftNavigation();
		rightNavigation();
		addProduct();
		removeProduct();
	}

	function leftNavigation() {
		$(".navigateLeft").click(function(event) {
			var index = $("#index").val();
			var newIndex = parseInt(index) - parseInt(productsPerPage);
			if (newIndex >= 0) {
				$("#index").val(newIndex);
			} else {
				return;
			}
			responseHandler(products, newIndex, productsPerPage);
		});
	}

	function rightNavigation() {
		$(".navigateRight").click(function(event) {
			var index = $("#index").val();
			var newIndex = parseInt(index) + parseInt(productsPerPage);
			if (newIndex <= products.length) {
				$("#index").val(newIndex);
			}
			responseHandler(products, newIndex, productsPerPage);
		});
	}
	
	$(function() {
		$("#products-search-bar").keyup(
				function() {
					var sr = $("#products-search-bar").val();
					var storeIdentity = $("#storeId").val();
					if(sr!=""){
						// "/shopnowat" 
						var destination = "/product/"+storeIdentity+"/"+ sr + "/productsinstoresearch.htm";
					}else{
						var destination = "/product/"+storeIdentity+"/productsinstore.htm";
					}
					$.ajax({
						type : "get",
						url : destination,
						cache : false,
						success : function(result) {
							products = result;
							responseHandler(result,0,productsPerPage);
						}
					});
				});
	});
	
	function addProduct() {
		$(".addButton").click(function(event) {
			event.preventDefault();
			alreadyExists = false;
			productName = $(this).parents('.item').find('.itemName').data('product-name');
			productPrice = $(this).parents('.item').find('.itemPrice').data('price');
			productId = $(this).parents('.item').find('.itemName').data('id');
			newRow = "<tr><td style=\"border:1px solid black\">"+productName+"</td><td style=\"border:1px solid black\">1</td><td style=\"border:1px solid black\">"+productPrice+"</td><td style=\"visibility:collapse;\">"+productId+"<td></tr>";
			
			$('#cart-summary-table tr').each(function() {
			    var pName = $(this).find("td").eq(0).html();
			    var qty = $(this).find("td").eq(1).html();
			    var amt = $(this).find("td").eq(2).html();
			    if(pName==productName){
			    	alreadyExists = true;
			    	var incrementedValue = parseFloat(qty) + parseFloat(1);
			    	var unitVal = amt / qty ;
			    	var incrementedAmt = parseFloat(amt) + parseFloat(unitVal);
			    	$(this).find("td").eq(1).text(incrementedValue);
			    	$(this).find("td").eq(2).text(incrementedAmt);
			    	return;
			    }
			});
			if(!alreadyExists){
			//$("#cart-summary-table").append(newRow);
			addTotalPane();
			$(newRow).insertBefore('#totalPaneRow');
			}
			computeTotal();
			$("#orderPane").show();
			event.preventDefault();
		});
	}
	
	function removeProduct() {
		 $(".removeButton").click(function(event) {
			event.preventDefault();
			alreadyExists = false;
			productName = $(this).parents('.item').find('.itemName').data('product-name');
			productPrice = $(this).parents('.item').find('.itemPrice').data('price');
			productId = $(this).parents('.item').find('.itemName').data('id');
			newRow = "<tr><td style=\"border:1px solid black\">"+productName+"</td><td style=\"border:1px solid black\">1</td><td style=\"border:1px solid black\">"+productPrice+"</td><td style=\"visibility:collapse;\">"+productId+"<td></tr>";
			
			$('#cart-summary-table tr').each(function() {
			    var pName = $(this).find("td").eq(0).html();
			    var qty = $(this).find("td").eq(1).html();
			    var amt = $(this).find("td").eq(2).html();
			    if(pName==productName){
			    	alreadyExists = true;
			    	if(parseFloat(qty)>1){
			    	var decrementedValue = parseFloat(qty) - parseFloat(1);
			    	var unitVal = amt / qty ;
			    	var decrementedAmt = parseFloat(amt) - parseFloat(unitVal);
			    	$(this).find("td").eq(1).text(decrementedValue);
			    	$(this).find("td").eq(2).text(decrementedAmt);
			    	}else{
			    		$(this).remove();
			    	}
			    	return;
			    }
			});
			computeTotal();
			$("#orderPane").show();
		}); 
	}
	
	function computeTotal(){
		var totalAmt = 0;
		$('#cart-summary-table tr').each(function() {
			var amt = $(this).find("td").eq(2).html();
			var totString = $(this).find("td").eq(1).html();
			if(totString && totString!="Total"){
			totalAmt = parseFloat(totalAmt) + parseFloat(amt);
			}
			if(totalAmt==0 && totString=="Total"){
				$(this).remove();
			}
		});
		if(totalAmt!=0){
		$("#totalPaneRow").find("td").eq(2).text(totalAmt);
		}
	}
	
	function addTotalPane(){
		alreadyTotalPaneExists = false;
		$('#cart-summary-table tr').each(function() {
			var totalString = $(this).find("td").eq(1).html();
			if(totalString=="Total"){
				 alreadyTotalPaneExists = true;
		    }
		});
		if(!alreadyTotalPaneExists){
		   	totalRow = "<tr id=\"totalPaneRow\"><td style=\"border:1px solid black\"></td><td style=\"border:1px solid black\">Total</td><td style=\"border:1px solid black\"></td></tr>";
		    $("#cart-summary-table").append(totalRow);
		}
	}
	
</script>
</head>
<body>
	<form name="products-form" method="post">
		<table name="products-header" width="100%">
			<tr>
				<td width="50%" align="left"><p class="orange">Products</p></td>
				<td width="50%" align="right"><input id="products-search-bar"
					name="products-search-bar" class="inputCurved"></td>
		</table>
		<%
			String storeId = (String) request.getParameter("store_id");
			session.setAttribute("storeId", storeId);
		%>
		<br> <input type="hidden" name="storeId" id="storeId"
			value=<%=storeId%>> <input type="hidden" name="index"
			id="index" value="0">
		<div id="itemsPane" class="products" data-page="1">
		</div>
	</form>
</body>
</html>
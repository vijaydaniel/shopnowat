<%@ include file="include.jsp"%>
<html>
<head>
<style type="text/css" media="all">
@import "css/new_stores.css";
</style>
<script src="js/jquery-1.10.2.min.js"></script>
<script>
	$(function() {
		$(".storelink").click(function(event) {
			event.preventDefault();
			var selectedStore = $(event.target).attr("id");
			productResponseHandler(selectedStore);
		});
	});

	function productResponseHandler(response) {
		// $("#products-column").load("jsp/store_home.jsp?" + "store_id=" + response + "&index="+ 0);
		window.location.href = "jsp/store_home.jsp?" + "store_id=" + response;
	}

	function storeResponseHandler(component, response) {
		var c = [];
		$(component).html("");
		$.each(response,function(i, item) {
			c.push("<div class=\"well\" style=\"display: inline-block;margin:5;\">");
			c.push("<div class=\"thumbnail\" style=\"margin:2;\">");
			c.push("<a class=\"storelink\" href=\"#\"> <img id="+item.id+" src="+item.image+" style=\"width:140;height:140;\"></a>");
			c.push("<h4 style=\"margin:1;\">"+item.name+"</h4>");
			c.push("<p style=\"margin:1;width:140;word-wrap:break-word;\">"+item.address+"</p>");
			c.push("</div>");
			c.push("</div>");
			});
		$(component).html(c.join(""));
		setB();
	}

	function setB() {
		$(".storelink").click(function(event) {
			event.preventDefault();
			var selectedStore = $(event.target).attr("id");
			productResponseHandler(selectedStore);
		});
	}

	
	$(function() {
		$("#store-search-bar").keyup(
				function() {
					var sr = $("#store-search-bar").val();
					var selectedLocation = $("#SelectedLocation").val();
					if (selectedLocation == "") {
						selectedLocation = "empty";
					}
					if (sr == "" && selectedLocation == "empty") {
						///shopnowat
						var destination = "/stores/getAllStores.htm";
					}else if (sr == "" && selectedLocation != "empty") {
						var destination = "/stores/"+selectedLocation +"/storesinlocation.htm";
					} 
					else {
						var destination = "/stores/" + sr + "/"
								+ selectedLocation + "/storessearch.htm";
					}
					$.ajax({
								type : "get",
								url : destination,
								cache : false,
								success : function(result) {
									storeResponseHandler('#store-display-area',
											result);
								}
							});
				});
	}); 
</script>
</head>

<body>
	<form name="store-form" method="post" style="background-color:#F5F6CE;">
		<div class="container-fluid" >
			<div class="row-fluid pull-left" style="padding: 0px 0px 0px 0px;margin:0">
				<div class="col-lg-12 col-md-12 pull-left" style="padding: 0px 0px 0px 0px;margin:0">
					<table class="pull-left" id="store-header" style="padding: 0px 0px 0px 0px;margin:0">
						<tr>
							<td align="right"><p class="orange"><h4>Stores</h4></p></td>
							<td style="padding: 10px 10px 10px 10px;" align="left"><input id="store-search-bar"
								name="store-search-bar" class="form-control"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<input type="hidden" name="SelectedLocation" id="SelectedLocation" value="">
	
		<%@ page import="org.springframework.context.ApplicationContext,org.springframework.web.servlet.support.RequestContextUtils,java.util.List,org.sunshine.store.StoreService,org.sunshine.domain.Store"%>
		<%
			ApplicationContext storeContext = RequestContextUtils.getWebApplicationContext(request);
			StoreService storeService = (StoreService) storeContext
					.getBean("storeService");
			List<Store> stores = storeService.getStores();
		%><br>
	
		<div id="store-display-area" class="container-fluid" style="display: inline-block;">
			<c:forEach items="<%=stores%>" var="store">
			 	<div class="well" style="display: inline-block;margin:5;">
					<div class="thumbnail" style="margin:2;">
						<a href="#"> <img class="storelink" id="${store.id}" src="${store.image}" style="width:140;height:140;"></a>
						<h4 style="margin:1;">${store.name}</h4>
						<p style="margin:1;width:140;word-wrap:break-word;">${store.address}</p>
					</div> 
				</div> 
			</c:forEach>
		</div>
	
	</form>
</body>
</html>
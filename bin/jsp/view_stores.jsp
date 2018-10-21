<%@ include file="include.jsp"%>
<html>
<head>
<style type="text/css" media="all">
@import "css/reports.css";
</style>
<script src="js/jquery-1.10.2.min.js"></script>
<script>
	$(function() {
		mouseHandle();
		displayStoreInfo();
	});

	function displayStoreInfo() {
		var tr = $('#view-store-table').find('tr');
		tr.bind('click', function(event) {
			var tds = $(this).addClass('row-highlight').find('td');

			var storeArray = new Array();
			$.each(tds, function(index, item) {
				storeArray[index] = item.innerHTML;
			});
			var storeId = storeArray[0];

			var urlParams = "id=" + storeId;
			$("#editArea").load("admin_edit_store_details.htm?" + urlParams);
		});
	}

	function mouseHandle() {

		var tr = $('#view-store-table').find('tr');

		tr.hover(function() { // mouseover
			$(this).addClass('row-highlight');
		}, function() { // mouseout
			$(this).removeClass('row-highlight');
		});
	}

	function storeResponseHandler(component, response) {
		var c = [];
		c.push("<tr><th>ID</th><th>Name</th></tr>");
		$.each(response, function(i, item) {
			c.push("<tr><td>" + item.id + "</td><td>" + item.name
					+ "</td></tr>");
		});
		$(component).html(c.join(""));
		mouseHandle();
		displayStoreInfo();
	}

	$(function() {
		$("#store-search-bar").keyup(
				function() {
					var sr = $("#store-search-bar").val();
					// "/shopnowat" 
					if (sr == "") {
						var destination = "/stores/getAllStores.htm";
					} else {
						var destination = "/stores/" + sr
								+ "/getAllStoresByName.htm";
					}
					$.ajax({
						type : "get",
						url : destination,
						cache : false,
						success : function(result) {
							storeResponseHandler('#view-store-table', result);
						}
					});
				});
	});
</script>
</head>
<body>
	<form name="store-form" method="post">
		<table id="store-header">
			<tr>
				<td width="50%" align="left"><p class="orange">Stores</p></td>
				<td width="50%" align="right"><input id="store-search-bar"
					name="store-search-bar" class="inputCurved"></td>
		</table>
		<input type="hidden" name="SelectedLocation" id="SelectedLocation"
			value="">
		<%@ page
			import="org.springframework.context.ApplicationContext,org.springframework.web.servlet.support.RequestContextUtils,java.util.List,org.sunshine.store.StoreService,org.sunshine.domain.Store"%>
		<%
			ApplicationContext storeContext = RequestContextUtils
					.getWebApplicationContext(request);

			StoreService storeService = (StoreService) storeContext
					.getBean("storeService");
			List<Store> stores = storeService.getStores();
		%><br>
		<table class="shopnowatTable" align="center" id="view-store-table"
			width="55%" border="0" cellspacing="0" cellpadding="5">
			<tr>
			<th>ID</th><th>Name</th>
			</tr>
			<c:forEach items="<%=stores%>" var="store">
				<tr>
					<td>${store.id}</td>
					<td>${store.name}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
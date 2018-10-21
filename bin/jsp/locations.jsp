<%@ include file="include.jsp"%>
<html>
<head>
<style type="text/css" media="all">
@import "css/new_locations.css";
</style> 
<script src="js/jquery-1.10.2.min.js"></script>
<script>
	$(function() {
		$(".locationlink").click(
				function(event) {
					var selectedLocation = $(event.target).text();
					$("#SelectedLocation").val(selectedLocation);
					//${pageContext.request.contextPath}
					// /shopnowat
					var destination = "/stores/"
							+ selectedLocation + "/storesinlocation.htm";
					$.ajax({
						url : destination,
						beforeSend : function(xhr) {
							xhr.setRequestHeader("Accept", "application/json");
							xhr.setRequestHeader("Content-Type",
									"application/json");
						},
						success : function(result) {
							strResponseHandler('#store-display-area', result);
						}
					});
				});
	});

	function locationResponseHandler(component, response) {
		var c = [];
		c.push("<tr><td> &nbsp;&nbsp;&nbsp; </td><td> &nbsp;&nbsp;&nbsp; </td></tr>");
		$.each(response, function(i, item) {
			//c.push("<tr><td><a href=\"#\" class=\"locationlink\">" + item.name + "</a></td></tr>");
			c.push("<tr><td style=\"padding: 5px 5px 5px 5px;\" align=\"left\"> &nbsp;&nbsp;&nbsp; </td>");
			c.push("<td style=\"padding: 5px 5px 5px 5px;\" align=\"left\"><a href=\"#\" id=\""+item.id+"\" class=\"storelink\">" + item.name + "</a></td></tr>");
		});

		$(component).html(c.join(""));
		setA();
	}
	
	function strResponseHandler(component, response) {
		$(component).html("");
		var c = [];
		
		$.each(response, function(i, item) {
			c.push("<div class=\"well\" style=\"display: inline-block;margin:5;\">");
			c.push("<div class=\"thumbnail\" style=\"margin:2;\">");
			c.push("<a class=\"storelink\" href=\"#\"> <img id="+item.id+" src="+item.image+" style=\"width:140;height:140;\"></a>");
			c.push("<h4 style=\"margin:1;\">"+item.name+"</h4>");
			c.push("<p style=\"margin:1;width:140;word-wrap:break-word;\">"+item.address+"</p>");
			c.push("</div>");
			c.push("</div>");
		});

		$(component).html(c.join(""));
		setA();
		setB();
	}

	function setA() {
			$(".locationlink").click(
					function(event) {
						//event.preventDefault();
						var selectedLocation = $(event.target).text();
						$("#SelectedLocation").val(selectedLocation);
						//${pageContext.request.contextPath}
						// "/shopnowat"
						var destination = "/stores/"
								+ selectedLocation + "/storesinlocation.htm";
						$.ajax({
							url : destination,
							beforeSend : function(xhr) {
								xhr.setRequestHeader("Accept", "application/json");
								xhr.setRequestHeader("Content-Type",
										"application/json");
							},
							success : function(result) {
								strResponseHandler('#store-table', result);
							}
						});	
					});
	}

	$(document).ready(
			function() {
				$("#location-search-bar").keyup(
						function() {
							var sr = $("#location-search-bar").val();
							if (sr == "") {
								// "/shopnowat"
								var destination = "/location/getAllLocation.htm";								
							} else {
								var destination = "/location/" + sr + "/getLocation.htm";
							}
							$.ajax({
								type : "post",
								url : destination,
								cache : false,
								success : function(result) {
									//$("#location-table").html(html);
									locationResponseHandler('#location-table', result);
								}
							});
						});
			});
</script>
</head>
<body>
	<form name="location-form" method="post">

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="col-lg-12 col-md-12 pull-left">
					<br>
					<table class="pull-left" name="location-header">
						<tr>
							<td style="padding: 5px 5px 5px 5px;" align="right"><p
									class="orange"><h4>Location</h4></p></td>
							<td style="padding: 5px 5px 5px 5px;" align="left" ><input class="span12 form-control" id="location-search-bar"></td>
						</tr>
					</table>
				</div>
			</div>

			<%@ page import="org.springframework.context.ApplicationContext,org.springframework.web.servlet.support.RequestContextUtils,org.sunshine.location.LocationService,org.sunshine.domain.Location,java.util.List"%>
			<%	
			ApplicationContext locationContext = RequestContextUtils.getWebApplicationContext(request);
			LocationService locationService = (LocationService) locationContext
					.getBean("locationService");
			List<Location> locations = locationService.getLocations();
			%>

			<div class="row-fluid">
				<div class="col-lg-12 col-md-12 pull-left">
					<table class="pull-left" id="location-table">
					<tr>
						<td> &nbsp;&nbsp;&nbsp; </td>
						<td> &nbsp;&nbsp;&nbsp; </td>
						</tr>
						<c:forEach items="<%=locations%>" var="location">
						
							<tr>
								<td style="padding: 5px 5px 5px 5px;" align="left"> &nbsp;&nbsp;&nbsp; </td>
								<td style="padding: 5px 5px 5px 5px;" align="left"><a href="#" class="locationlink"><c:out
											value="${location.name}" /></a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			
		</div>
	</form>
</body>
</html>
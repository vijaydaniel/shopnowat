<%@ include file="/jsp/include.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<style type="text/css">
ul {
	verflow-y: scroll;
}

li {
	float: left;
	margin: 5px;
	height: 90px;
}
</style>

<script>

var storeId = "";
var rowCount = 20;

$(document).ready(function() {
	getStoreId();
});

function getStoreId(){
	var usern = getCookie("eshopper_user_name");
	// "/shopnowat" 
	var destination = "/user/"+usern.trim()+"/getStoreId.htm";
	$.ajax({
		type : "get",
		url : destination,
		cache : false,
		success : function(result) {
			storeIdResponseHandler(result);
		}
	});
}

function storeIdResponseHandler(result){
	storeId = result[0];
	getProductImages(0,rowCount);
	searchBar();
}

function getProductImages(offset,rowcount) {
	var searchString = $("#product-image-search-bar").val();
	// "/shopnowat" 
	if(searchString == ""){
		var destination = "/product/"+storeId+"/"+offset+"/"+rowcount+"/images.htm";
	}else{
		var destination = "/product/"+storeId+"/"+offset+"/"+rowcount+"/"+searchString+"/images.htm";
	}
	$.ajax({
		type : "get",
		url : destination,
		cache : false,
		success : function(result) {
			responseHandler(result);
		}
	});
}

function responseHandler(result) {
	$("ul").empty();
	for (i = 0; i < result.length; i++) {
		fileName = result[i].img;
		liString = '<li><a id="'+fileName + '" class="imageClass thumbnail" href="' + '#' + '"><img src="' + fileName +'" width="80" height="80" alt="T "'+i+' /></a></li>';
		$("#galleryPane ul").append(liString);
	}
	setOnClick();
	if(result.length < rowCount){
		$("#next").unbind().click(function () {return false;});
	}
}

function setOnClick(){
	$(".imageClass").unbind().click(function(event) {
		event.preventDefault();
		$("#image").val($(this).attr('id'));
	});
	$("#previous").unbind().click(function(event) {
		event.preventDefault();
		var offset = $("#offsetStorage").val();
		if((offset - rowCount) >= 0){
			offset = offset - rowCount;
			$("#offsetStorage").val(offset);
			getProductImages(offset,rowCount);
		}
	});
	$("#next").unbind().click(function(event) {
		event.preventDefault();
		var offset = $("#offsetStorage").val();
		offset = offset + rowCount;
		$("#offsetStorage").val(offset);
		getProductImages(offset,rowCount);
	});
}

function searchBar(){
		$("#product-image-search-bar").keyup(function() {
			getProductImages(0,rowCount);
		});
	}
	
</script>

</head>

<body>
<form id="image_gallery_form" role="form" class="form-horizontal">
		<br>
		<div class="form-group pull-left">
			<div class="col-md-12">
  					<h1 class="orange" style="margin: 0 0 0 10;">Image Gallery </h1> 
  			</div>
		</div><br clear="all">
		<div class="form-group pull-left">
			<label for="product-image-search-bar" class="col-md-6 control-label">Search Products Image</label>
			<div class="col-md-6">
  					<input type="text" class="form-control" id="product-image-search-bar" placeholder="product name">
  			</div>
		</div>
		<br clear="all">
		<input type="hidden" id="offsetStorage" value="0">
		
		<div class="container-fluid pull-left" style="margin:0 0 0 10;padding:0">
		
			<div class="row-fluid" >
				<div id="galleryPane" align="center" class="col-md-12" style="margin:0;padding:0" >
					<ul id="gallery" style="margin:0;padding:0">
					</ul>
				</div>
			</div>
		</div>
		<br clear="all">
		<div class="container-fluid" style="margin:0 0 0 10;padding:0;width=100%;">
		<div class="row-fluid" style="width=100%;">
			<div id="navigationPanePrevious" align="center" class="col-md-6 pull-left" >
				  <a id="previous" class="pull-left" href="#">Previous</a>
			</div>
			<div id="navigationPaneNext" align="center" class="col-md-6 pull-right" >
				  <a id="next" class="pull-right" href="#" style="margin-right:25;">Next</a>
			</div>
		</div>
		</div>
</form>
</body>
</html>
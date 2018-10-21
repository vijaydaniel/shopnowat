<%@ include file="/jsp/include.jsp"%>
<%@ include file="/jsp/hit_rate.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width">
<meta name="author" content="Vijay Daniel" />
<meta name="keywords" content="Grocery online shopping" />
<meta name="description" content="best online tool for grocery shopping" />

<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet"
	type="text/css" />

<script src="js/jquery-1.10.2.min.js"></script>
<script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>

<title><fmt:message key="title" /></title>

</head>
<!--  #F5F6CE;  -->

<body>

	<div class="row-fluid" style="background-color: #585858;">
		<div class="col-md-10" id="banner">
		<!--  /shopnowat -->
			<img class="pull-left" src="/img/shopnowat/logo.png"
				style="width: 150px; height: 50px; margin: 6;">
			<h1 align="center" style="color: white">ShopNowAt</h1>
		</div>
		<div class="col-md-2" id="banner-buttons">
			<h1>
				<button type="button" class="btn btn-default pull-right"
					style="margin: 3">Contacts</button>
			</h1>
			<h1>
				<button type="button" class="btn btn-default pull-right"
					style="margin: 3">About Us</button>
			</h1>
			<!-- <a href="/shopnowat/store/custom-menu-editor.htm">Menu Editor</a>  -->
		</div>
	</div>

	<div id="products-column" class="row-fluid" style="margin: 0;">
	<!-- background-color: #9FF781; -->
	<!--  -webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;border:1px solid black; -->
		<div class="full col-md-2" id="locations-column"
			style="height:100%; margin:0;padding: 0px 0px 0px 0px;">
			<!-- <div class="col-md-12" style="height:40px;">
			&nbsp;
			</div> -->
			<%@ include file="locations.jsp"%>
		</div>

		<div class="col-md-8" id="stores-column" style="margin:0;padding: 15px 15px 15px 15px;">
			<%@ include file="stores.jsp"%>
		</div>
	</div>
	
	 <footer id="footer" style="background-color: #585858;">
	  <div class="container" role="contentinfo" >
        <div class="row">
          <div class="col-sm-12">
          	<div class="row">
              <div class="col-md-12">
                <p class="pull-right" style="color: #FFFFFF;">ShopNowAt is on Beta version</p>
                <ul class="list-inline">
              	<li><a style="color: #FFFFFF;" href="https://www.facebook.com/pages/Shopnowat/315665965277959" title="Facebook" rel="nofollow">Facebook</a></li>
              	</ul>
              </div>
           	</div>
            <div class="row">
              <div class="col-md-12">
              	<ul class="list-inline">
                  <li><a style="color: #FFFFFF;" href="http://shopnowat.com/tandc.htm" title="Terms and Conditions" rel="nofollow">Terms and Conditions</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div><!--/row-->

        <div class="row">
        	<div class="col-md-12">
              	<p class="text-right" style="color: #FFFFFF;">
              	Copyright &copy; ShopNowAt. All rights reserved.
                </p>
          	</div>
        </div><!--/row-->
      </div>
	 </footer>

</body>

</html>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@ include file="include.jsp"%>
<html>
<head>
<script src="js/jquery-1.10.2.min.js"></script>
<script>
	
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
		<%@ page
			import=" java.io.FileInputStream,org.springframework.context.ApplicationContext,org.springframework.web.servlet.support.RequestContextUtils,org.springframework.web.servlet.DispatcherServlet,java.util.List,org.sunshine.product.ProductService,org.sunshine.domain.Product"%>

		<%
			Object context = (Object) request
					.getAttribute(DispatcherServlet.WEB_APPLICATION_CONTEXT_ATTRIBUTE);
			ServletContext servletContext = (ServletContext) request
					.getSession().getServletContext();

			String storeId = (String) request.getParameter("store_id");

			ApplicationContext productContext = RequestContextUtils
					.getWebApplicationContext(request, servletContext);

			ProductService productService = (ProductService) productContext
					.getBean("productService");
			List<Product> products = productService
					.getSelectedProducts(storeId);
			int begining = Integer.parseInt((String) request
					.getParameter("index"));
		%>
		<br>

		<div class="products" data-page="1">

			<c:forEach items="<%=products%>" var="product" begin="<%=begining%>"
				end="<%=begining+20%>">
				<!-- Single Item -->
				<div class="item" data-id="${product.id}"
					data-stock="${product.stock}">
					<div class="itemImage  ">
						<a href="#"><img src="${product.img}" alt="${product.name}"/></a>
					</div>
					<div class="itemName">
						<a href="#"> <span class="productName">${product.name} </span>
						</a>
					</div>

					<div class="itemPrice">
						<span class="price">${product.price}</span>
					</div>
					<div class="addButton">
						<img src="img/Button-Add-icon.png" class="addButton" alt="Add" />
						<img src="img/badge_circle_minus.png" class="increase" alt="Minus" />
					</div>

					<!--   <div class="itemOverlay">
                    <div class="itemOverlayInner">
                        <ul>
                            <li class=" "><span class="price2">Rs 10.00</span>
                    <a href="#" class="vlink" data-id="10004825" data-link="/kelloggs-chocos-v-30-g-p.php" data-mrp="10.00" data-price="10.00" data-stock="30" data-image="http://s2.zopnow.com/images/products/140/kelloggs-kelloggs-chocos-30-g.png" data-offer="0">30&nbsp;g</a>
                    <span class="meta"></span></li><li class=" "><span class="price2">Rs 97.00</span>
                    <a href="#" class="vlink" data-id="10000591" data-link="/kelloggs-chocos-v-250-g-p.php" data-mrp="97.00" data-price="97.00" data-stock="30" data-image="http://s2.zopnow.com/images/products/140/1335258802-ZNApr23_140.png" data-offer="0">250&nbsp;g</a>
                    <span class="meta"></span></li><li class=" "><span class="price2">Rs 141.00</span>
                    <a href="#" class="vlink" data-id="10009424" data-link="/kelloggs-chocos-v-375-g-p.php" data-mrp="141.00" data-price="141.00" data-stock="30" data-image="http://s1.zopnow.com/images/products/140/kelloggs-kelloggs-chocos-375-g.png" data-offer="0">375&nbsp;g</a>
                    <span class="meta"></span></li><li class="selected"><span class="price2">Rs 240.00</span>
                    <a href="#" class="vlink" data-id="10002403" data-link="/kelloggs-chocos-v-700-g-p.php" data-mrp="240.00" data-price="240.00" data-stock="30" data-image="http://s2.zopnow.com/images/products/140/kelloggs-kelloggs-chocos-700-g.png" data-offer="0">700&nbsp;g</a>
                    <span class="meta"></span></li>                        </ul>
                    </div>
                </div> -->
                
				</div>
				<!-- Single Item Ends -->
			</c:forEach>
			<div class="navigation">
						<img src="img/back.png" class="navigateLeft" alt="Back" />
						<img src="img/forward.png" class="navigateRight" alt="Next" />
				</div>
		</div>
	</form>
</body>
</html>
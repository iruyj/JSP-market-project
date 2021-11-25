<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProducId.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="style.css"/>
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-2 list-title">상품 정보</h1>
			<!--출력문-->
		</div>
	</div>

	<%
		String id = request.getParameter("id"); // id를 products.jsp에서 상세정보를 누르면 그 제품의 아이디를 받아옴
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id); // 여기 등록되어있는 제품의 아이디랑 비교해서 가져옴
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img alt="" src="c:/upload/<%=product.getFilename()%>"
					style="width: 100%" class="product-img">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%></p>
				<p>
					<b>상품 코드 : </b><span class="badge badge-danger"><%=product.getProductId()%></span>
				<p>
					<b>제조사 : </b><%=product.getManufacturer()%>
				<p>
					<b>분류 : </b><%=product.getCategory()%>
				<p>
					<b>재고 수 : </b><%=product.getUnitsInStock()%>
				<h4><%=product.getUnitPrice()%>원</h4>
				<!-- 상세정보를 보고자하는 제품의 아이디값을 넘겨준다 -->
				<p><form name="addForm" action="./addCart.jsp?id= <%= product.getProductId() %>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>
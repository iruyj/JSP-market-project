<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css" >
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
		<div class="jumbotron">
			<div class="container">                    .
				<h1 class="display list-title">성적 향상을 위한 모든것.</h1>
				<!--출력문-->
			</div>
		</div>

		<div class="container">
			<div class="row" align="center">
				<%@include file="dbconn.jsp"%>

				<%
				PreparedStatement pstmt = null;
				// 준비된 쿼리문
				ResultSet rs = null; // 쿼리 결과를 저장
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
				%>

				<div class="col-md-4">
					<a href="./product.jsp?id=<%=rs.getString("p_id")%>" class="go-details" >
							<img alt="" src="c:/upload/<%=rs.getString("p_fileName")%>"
						style="width: 250px; height:250px; cursor:pointer;" class="product-img" ></a>
					<h3><%=rs.getString("p_name")%></h3>
					<p style="width:70%"><%=rs.getString("p_description")%></p>
					<p><%=rs.getString("p_UnitPrice")%>원
					</p>
					<!-- 상세정보를 보고자하는 제품의 아이디값을 넘겨준다 -->
					<p>
						
				</div>
				<%
				}

				if (rs != null)
				rs.close();
				if (pstmt != null)
				pstmt.close();
				if (conn != null)
				conn.close();
				%>
			</div>
		</div>
		<hr>
		<jsp:include page="footer.jsp"/></body>
</html>
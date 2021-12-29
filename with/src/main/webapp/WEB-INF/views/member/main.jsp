<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>with: 메인페이지</title>
<c:import url="../header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/star.css" />
</head>
<body>
	<c:import url="../header.jsp" />
	<section class="py-5">
		<div class="container">
			<span> <span class="fs-1">${m.nick}</span> <span class="fs-5">${sessionScope.id}</span>
			</span>
			<table>
				<tr>

					<td><a style="width: 100px; height: 75px"
						href="/product/mylist" class="btn btn-outline-dark px-3 py-2 rounded-3">
						<i class="fs-1 fas fa-gifts w-100"></i>판매 내역</a></td>
					<td><a style="width: 100px; height: 75px"
						href="/wish/wishlist" class="btn btn-outline-dark mx-3 px-3 py-2 rounded-3">
						<i class="fs-1 fas fa-shopping w-100"></i>찜 목록</a></td>
					<td><a style="width: 100px; height: 75px" href="/product/add"
						class="btn btn-outline-dark px-3 py-2 rounded-3">
						<i class="fs-1 fas fa-plus-square w-100"></i>상품 등록</a></td>

				</tr>
			</table>

			<c:import url="${pageContext.request.contextPath }/alram/mylist"></c:import>
			<div class="btn-group btn-group-sm" role="group">
				<a class="btn btn-outline-secondary" href="/member/passwordChk">내 정보 수정</a> 
				<a class="btn btn-outline-secondary" href="/member/logout">로그아웃</a>
			</div>
		</div>
	</section>
	<c:import url="../footer.jsp"></c:import>
</body>
</html>
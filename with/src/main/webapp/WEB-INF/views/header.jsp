<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function join() {
		location.href = "${pageContext.request.contextPath }/member/join";
	}
	
	function goMyPage() {
		location.href = "${pageContext.request.contextPath }/member/myPage";
	}
	
	function loginForm() {
		location.href = "${pageContext.request.contextPath }/member/login";
	}
</script>
</head>
<body>
	<div class="px-2">
		<header
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3">
			<a href="${pageContext.request.contextPath }/member/main"
				class="d-flex align-items-center col-md-2 mb-md-0 text-dark text-decoration-none">
				<h2>
					<b>With</b>
				</h2>
			</a>
			<ul class="nav col-md-7 col-md-auto justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 link-secondary">전자기기</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">의류</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">책</a></li>
				<!-- <li><a href="#" class="nav-link px-2 link-dark">카테4</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">카테5</a></li> -->
			</ul>
			<div class="col-md-3 text-end">
				<c:choose>
					<c:when test="${empty sessionScope.id }">
						<button type="button" class="btn btn-outline-dark me-2" onClick="loginForm()">Login</button>
						<button type="button" class="btn btn-dark" onClick="join()">Sign-up</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-dark" onClick="goMyPage()">myPage</button>
						<button type="button" class="btn btn-outline-dark me-2">Logout</button>
					</c:otherwise>
				</c:choose>
			</div>
		</header>
	</div>
	<hr>
</body>
</html>
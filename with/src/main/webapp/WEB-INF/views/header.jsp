<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function join() {
		location.href = "${pageContext.request.contextPath }/member/join";
	}

	function goMyPage() {
		location.href = "${pageContext.request.contextPath }/member/myPage";
	}

	function login() {
		location.href = "${pageContext.request.contextPath }/member/login";
	}

	function logout() {
		location.href = "${pageContext.request.contextPath }/member/logout";
	}
	$(document).ready(function() {

		$.ajax({
			url : '/category/getCategory',
			type : 'get',
			data : {
				category_type: 1,
				parent_category_num: 0
			},
			success : function(data) {
				var list = $.parseJSON(data);
				var html = "<ul class='nav'>";
				for(i = 0 ; i < list.length ; i++) {
					html += "<li class='nav-item' style='float: left'><a href='${pageContext.request.contextPath}/product/search?q=c1&value=" + list[i].category_num + "' class='nav-link px-2 link-secondary'>" +  list[i].category_name + "</a>";
					html += "</li>";
				}
				html += "</ul>";
				$("#cList").html(html);
			}
		});
	});
</script>
<style>
li { list-style-type: none}
</style>
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
			<div id="cList">
			</div>
			<div class="col-md-3 text-end">
				<c:choose>
					<c:when test="${empty sessionScope.id }">
						<button type="button" class="btn btn-dark" onClick="join()">Sign-up</button>
						<button type="button" class="btn btn-outline-dark me-2"
							onClick="login()">Login</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-dark" onClick="goMyPage()">myPage</button>
						<button type="button" class="btn btn-outline-dark me-2"
							onClick="logout()">Logout</button>
					</c:otherwise>
				</c:choose>
			</div>
		</header>
	</div>
	<hr style="margin: 0">
</body>
</html>
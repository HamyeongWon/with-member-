<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
html, body { height: 100% }
body { padding-bottom: 9% }
</style>
</head>
<body>
	<c:import url="header.jsp"></c:import>
	<div class="px-2">
		����
		<c:choose>
			<c:when test="${not empty list }">
				<c:set var="loopEnd" value=" false" />
				<c:forEach items="${list }" var="p" varStatus="status">
					<c:if test="${not loopEnd }">
						<div class="card-deck">
							<div class="card">
								<img class="card-img-top" src="...">
								<div class="card-body">
									<h5 class="card-title">��ǰ �̸� ${p.title }</h5>
									<p class="card-text">
									<h4>
										���� ${p.price } <span class="badge badge-secondary">�Ǹ���
											${p.type }</span>
									</h4>
									<small style="color: gray">${p.category_1}/${p.category_2}/${p.category_3}</small>
									</p>
									<p class="card-text">
										<small class="text-muted">�ۼ��� ${p.product_date }</small>
									</p>
								</div>
							</div>
						</div>
						<c:if test="${status.index == 7 }">
							<c:set var="loopEnd" value="true" />
						</c:if>
					</c:if>
					<c:if test="${status.index == 3}">
						<br>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				��ϵ� ��ǰ�� �����ϴ�.
				<a href="#">ù ��ǰ ����ϱ�</a>

			</c:otherwise>
		</c:choose>
	</div>
	<c:import url="footer.jsp"></c:import>
</body>
</html>
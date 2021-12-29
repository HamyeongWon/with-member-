<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
</head>
<body>
	<c:import url="../header.jsp"></c:import>
	<form action="${pageContext.request.contextPath }/member/update"
		method="post">
		<div class="container px-4 px-lg-5 mt-5 container1 col-md-6">
			<div class="col-md-12 mb-3" style="text-align: center">
				<h3>
					<b>�� ���� ����</b>
				</h3>
			</div>
			<table class="table border-top border-bottom">
				<tr class="table-light align-middle">
					<td>���̵�</td>
					<td>${m.id }</td>
				</tr>
				<tr class="table-light align-middle">
					<td>�̸�</td>
					<td>${m.name }</td>
				</tr>
				<tr class="table-light align-middle">
					<td>�г���</td>
					<td>${m.nick }</td>
				</tr>
				<tr class="table-light align-middle">
					<td>�޴��� ��ȣ</td>
					<td><input type="text" class="form-control" name="tel"
						value="${m.tel }"></td>
				</tr>
				<tr class="table-light align-middle">
					<td>�ּ�</td>
					<td style="vertical-align: middle">
						<div class="col-md-4">
							<select class="form-select" name="addr">
								<option value="1" <c:if test="${m.addr == 1}">selected</c:if>>����</option>
								<option value="2" <c:if test="${m.addr == 2}">selected</c:if>>���</option>
								<option value="3" <c:if test="${m.addr == 3}">selected</c:if>>��õ</option>
								<option value="4" <c:if test="${m.addr == 4}">selected</c:if>>�λ�</option>
								<option value="5" <c:if test="${m.addr == 5}">selected</c:if>>����</option>
								<option value="6" <c:if test="${m.addr == 6}">selected</c:if>>����</option>
								<option value="7" <c:if test="${m.addr == 7}">selected</c:if>>�뱸</option>
								<option value="8" <c:if test="${m.addr == 8}">selected</c:if>>���</option>
								<option value="9" <c:if test="${m.addr == 9}">selected</c:if>>����</option>
								<option value="10" <c:if test="${m.addr == 10}">selected</c:if>>���</option>
								<option value="11" <c:if test="${m.addr == 11}">selected</c:if>>�泲</option>
								<option value="12" <c:if test="${m.addr == 12}">selected</c:if>>����</option>
								<option value="13" <c:if test="${m.addr == 13}">selected</c:if>>����</option>
								<option value="14" <c:if test="${m.addr == 14}">selected</c:if>>���</option>
								<option value="15" <c:if test="${m.addr == 15}">selected</c:if>>�泲</option>
								<option value="16" <c:if test="${m.addr == 16}">selected</c:if>>����</option>
								<option value="17" <c:if test="${m.addr == 17}">selected</c:if>>����</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
			<div class="col-md-12 mb-3">
				<button type="submit" class="btn btn-dark">�� ���� ����</button>
			</div>
		</div>
	</form>
	<c:import url="../footer.jsp"></c:import>
</body>
</html>
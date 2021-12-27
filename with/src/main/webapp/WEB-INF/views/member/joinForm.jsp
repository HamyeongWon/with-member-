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
</head>
<body>
	<form action="member/join" method="post">
		<div class="container px-4 px-lg-5 mt-5 container1 col-md-6">
			<div class="col-md-12 mb-3" style="text-align: center">
				<h3>
					<b>회원 가입</b>
				</h3>
			</div>
			<div class="col-md-12 mb-3">
				<input type="text" id="id" name="id" class="form-control"
					placeholder="아이디"> <span id="idCheck"></span>
			</div>
			<div class="col-md-12 mb-3">
				<input type="text" id="pwd" name="pwd" class="form-control"
					placeholder="비밀번호"> <span id="pwd1Check"></span>
			</div>
			<div class="col-md-12 mb-3">
				<input type="text" id="pwd2" class="form-control"
					placeholder="비밀번호 확인"> <span id="pwd2Check"></span>
			</div>
			<div class="col-md-12 mb-3">
				<input type="text" id="nick" name="nick" class="form-control"
					placeholder="닉네임"> <span id="nickCheck"></span>
			</div>
			<div class="col-md-12 mb-3">
				<input type="text" id="name" name="name" class="form-control"
					placeholder="이름"> <span id="nameCheck"></span>
			</div>
			<div class="col-md-12 mb-3">
				<input type="text" id="tel" name="tel" class="form-control"
					placeholder="휴대폰 번호( - 제외)"> <span id="telCheck"></span>
			</div>
			<div class="col-md-3 mb-3">
				<select class="form-select">
					<option selected>-지역-</option>
					<option value="1">서울</option>
					<option value="2">경기</option>
					<option value="3">인천</option>
					<option value="4">부산</option>
					<option value="5">대전</option>
					<option value="6">광주</option>
					<option value="7">대구</option>
					<option value="8">울산</option>
					<option value="9">강원</option>
					<option value="10">충북</option>
					<option value="11">충남</option>
					<option value="12">전북</option>
					<option value="13">전남</option>
					<option value="14">경북</option>
					<option value="15">경남</option>
					<option value="16">제주</option>
					<option value="17">세종</option>
				</select>
			</div>
			<input type="hidden" id="type" value="1">
			<div class="col-md-12 mb-3">
				<button type="submit" class="btn btn-dark">회원 가입</button>
			</div>
		</div>
	</form>
</body>
</html>
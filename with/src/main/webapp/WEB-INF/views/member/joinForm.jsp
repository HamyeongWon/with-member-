<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script>
var cId = false;
var cPwd = false;
var cNick = false;
var	cTel = false;

function allCheck() {
	if(cId && cPwd && cNick && cTel) {
		return true;
	} else {
		alert("��Ŀ� �°� �Է����ּ���.")
		return false;
	}
}

	$(document).ready(function() {		
		$("#id").change(function() {
			var value = $(this).val();
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if(!regExp.test(value)) {
				$("#id").addClass("is-invalid");
				$("#id").removeClass("is-valid");
				cId = false;
			} else {
				$("#id").removeClass("is-invalid");
				
				$.ajax({
					url: '/member/idCheck',
					type: 'post',
					data: {id: value},
					success: function(data) {
						if(data == 1) {
							$("#id").addClass("is-valid");
							$("#id").removeClass("is-invalid");
							cId = true;
						} else {
							$("#id").addClass("is-invalid");
							$("#id").removeClass("is-valid");
							cId = false;
						}
					}
				});				
			}			
		});
		
		$("#pwd, #pwd2").change(function() {
			var p1 = $("#pwd").val();
			var p2 = $("#pwd2").val();
			
			if (p1 != p2) {
				$("#pwd1").addClass("is-invalid");
				$("#pwd2").addClass("is-invalid");
				$("#pwd2").focus();
				cPwd = false;
			} else {
				$("#pwd1").removeClass("is-invalid");
				$("#pwd2").removeClass("is-invalid");
				cPwd = true;
			}
		});
		
		$("#tel").change(function() {
			var value = $(this).val();
			var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
			
			if(!regExp.test(value)) {
				$("#tel").addClass("is-invalid");
				cTel = false;
			} else {
				$("#tel").removeClass("is-invalid");
				cTel = true;
			}
		});
		
		$("#nick").change(function() {
			var nickName = $(this).val();
			
			$.ajax({
				url: '/member/nickCheck',
				type: 'post',
				data: {nick: nickName},
				success: function(data) {
					if(data == 0) {
						$("#nick").addClass("is-valid");
						$("#nick").removeClass("is-invalid");
						cNick = true;
					} else {
						$("#nick").addClass("is-invalid");
						$("#nick").removeClass("is-valid");
						cTel = false;
					}
				}
			});	
		});
	});
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<form action="${pageContext.request.contextPath }/member/join"
		method="post" class="needs-validation" onsubmit="return allCheck()">
		<div class="container px-4 px-lg-5 mt-5 container1 col-md-6">
			<div class="col-md-12 mb-3" style="text-align: center">
				<h3>
					<b>ȸ�� ����</b>
				</h3>
			</div>
			<div class="col-md-12 mb-3">
				<input type="text" required id="id" name="id" class="form-control"
					placeholder="���̵�">
				<div class="invalid-feedback">�̸��� ������ �ƴϰų�, �ߺ��� ���̵��Դϴ�.</div>
				<div class="valid-feedback">��� ������ ���̵��Դϴ�.</div>
			</div>
			<div class="col-md-12 mb-3">
				<input type="password" id="pwd" required name="pwd"
					class="form-control" placeholder="��й�ȣ">
				<div class="invalid-feedback">��й�ȣ�� �ٸ��ϴ�.</div>
			</div>
			<div class="col-md-12 mb-3">
				<input type="password" id="pwd2" required class="form-control"
					placeholder="��й�ȣ Ȯ��">
				<div class="invalid-feedback">��й�ȣ�� �ٸ��ϴ�.</div>
			</div>
			<div class="col-md-12 mb-3">
				<input type="text" id="name" required name="name"
					class="form-control" placeholder="�̸�">
			</div>
			<div class="col-md-12 mb-3">
				<input type="text" id="nick" required name="nick"
					class="form-control" placeholder="�г���">
				<div class="invalid-feedback">����� �� ���� �г����Դϴ�.</div>
				<div class="valid-feedback">��� ������ �г����Դϴ�.</div>
			</div>
			<div class="col-md-12 mb-3">
				<input type="text" id="tel" required name="tel" class="form-control"
					placeholder="�޴��� ��ȣ( - ����)">
				<div class="invalid-feedback">�޴��� ��ȣ�� ��Ȯ�� �Է����ּ���(-����).</div>
			</div>
			<div class="col-md-3 mb-3">
				<select class="form-select" id="addr" name="addr">
					<option value="1" selected>����</option>
					<option value="2">���</option>
					<option value="3">��õ</option>
					<option value="4">�λ�</option>
					<option value="5">����</option>
					<option value="6">����</option>
					<option value="7">�뱸</option>
					<option value="8">���</option>
					<option value="9">����</option>
					<option value="10">���</option>
					<option value="11">�泲</option>
					<option value="12">����</option>
					<option value="13">����</option>
					<option value="14">���</option>
					<option value="15">�泲</option>
					<option value="16">����</option>
					<option value="17">����</option>
				</select>
			</div>
			<input type="hidden" id="type" name="type" value="1">
			<div class="col-md-12 mb-3">
				<button type="submit" id="joinBtn" class="btn btn-dark">ȸ��
					����</button>
			</div>
		</div>
	</form>
	<c:import url="../footer.jsp"></c:import>
</body>
</html>
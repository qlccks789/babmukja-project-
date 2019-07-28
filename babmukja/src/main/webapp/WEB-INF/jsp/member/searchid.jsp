<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>babmukja</title>
<link rel="stylesheet" href="<c:url value="/resources/css/member/style.css"/>" />
<link rel="stylesheet"
	  href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	  integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	  crossorigin="anonymous" />
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<main>
	<div class="search_id_container">
		<div class="search_id_title">
			아이디 찾기 <i class="fas fa-utensils"></i>
		</div>

		<form id="search-form" method="post">
			<div class="search_id_input" id="email-form">
				<div class="id_name">
					<input type="text" name="memName" id="memName" placeholder="이름" />
				</div>
				<div class="phone_email">
					<input type="text" name="memPhone" id="memPhone" placeholder="전화번호" />
				</div>
			</div>
		</form>

		<div class="search_id_button">
			<button type="button">아이디 찾기</button>
		</div>

		<div class="search_id">
			<span class="search_id_result"></span>
		</div>
		
		<div class="login_search_pass">
			<div class="login_a">
				<a href="<c:url value="/member/loginform.do"/>">로그인</a>
			</div>
			<div class="search_pass_a">
				<a href="<c:url value="/member/searchpass.do"/>">비밀번호 재설정</a>
			</div>
		</div>
	</div>
	</main>
	<script src="<c:url value="/resources/js/member/searchid.js"/>"></script>
</body>
</html>

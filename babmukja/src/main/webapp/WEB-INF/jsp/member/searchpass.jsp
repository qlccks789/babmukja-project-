<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
	<div class="search_pass_container">
		<div class="search_pass_title">
			비밀번호 재설정 인증 <i class="fas fa-utensils"></i>
		<div class="search_pass_explanation">햄버거와 피자 아이콘을 누르시면 비밀번호 찾기가 가능합니다.</div>
		</div>

		<div class="search_pass_search">
			<i class="fas fa-hamburger"></i> 이메일로 찾기
		</div>

		<form id="searchPass" method="post" action="resetpass.do">
			<div class="search_pass_input visiable" id="email-form">
				<div class="email_email">
					<input type="text" name="memEmail" id="memEmail" placeholder="이메일"/>
					<button id="email_btn" type="button">메일 전송</button>
				</div>

				<div class="email_check">
					<span class="email_result"></span>
				</div>

				<div class="email_certification">
					<input type="text" name="certification" id="certification" placeholder="인증번호" />
					<button id="certification_btn" type="button">인증번호 확인</button>
					<input type="hidden" id="hcertification" value="0" />
				</div>

				<div class="certification_check">
					<span class="certification_result"></span>
				</div>
			</div>

			<div class="search_pass_button">
				<button id="phone_reset_button_e">비밀번호 재설정</button>
			</div>
		</form>

		<form id="searchPass2" method="post" action="resetpass.do">
		<div class="search_pass_search">
			<i class="fas fa-pizza-slice"></i> 전화번호로 찾기
		</div>

			<!-- 전화번호를 넘겨주는 컨트롤러를 따로 생성해야함 -->
			<div class="search_pass_input">
				<div class="phone_name">
					<input type="text" name="name" id="memName" placeholder="이름" />
				</div>
				
				<div class="phone_email">
					<input type="text" name="memPhone" id="memPhone" placeholder="전화번호" />
					<input type="hidden" id="hPhone" value="0" />
					<button type="button" id="sms_btn">전송</button>
					
					<div class="phone_check">
					<span class="phone_result"></span>
					</div>
				</div>
				
				<div class="phone_certification">
					<input type="text" name="certification" id="pcertification" placeholder="인증번호" />
					<button id="certification_btn_one" type="button">인증번호 확인</button>
					<input type="hidden" id="hcertification" value="0" />
				</div>
				
				<div class="certification_check2">
					<span class="certification_result2"></span>
				</div>
				
				<div class="search_pass_button_one">
					<button id="phone_reset_button">비밀번호 재설정</button>
				</div>
			</div>
		</form>
	</div>
	</main>
	<script src="<c:url value="/resources/js/member/searchpass.js"/>"></script>
</body>
</html>
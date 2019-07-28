<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>babmukja</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/member/style.css"/>">
	<link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
</head>
<body>
    <main>
        <div class="email_form__container">
            <div class="email__form-text">
                <div class="email__send">밥먹자 ~ <i class="fas fa-utensils"></i> 인증 메일을 전송하였습니다.</div>
                <div class="email_confirm">
                    인증메일의 링크를 누르면 회원가입이 완료됩니다.
                </div>
            </div>
        </div>
    </main>
</body>
</html>
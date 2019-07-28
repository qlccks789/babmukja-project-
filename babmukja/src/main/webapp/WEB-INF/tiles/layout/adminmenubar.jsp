<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/adminmenubar.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <title>Document</title>
</head>
<body>
    <div id="menubar">
        <b><i class="fas fa-arrow-right"></i> Click</b>
        <span id="home">BABMUKJA-ADMINISTRATOR</span>
        <div id="menu1"><i class="fas fa-won-sign"></i> 매출 관리</div>
        <div id="menu2"><i class="fas fa-users"></i> 회원 관리</div>
        <div id="menu3"><i class="fas fa-sign-in-alt"></i> 접속 통계</div>
        <div id="menu4"><i class="fas fa-chalkboard-teacher"></i>게시판 관리</div>
        <div id="menu5"><i class="fas fa-box-open"></i> 상품 관리</div>
        <div id="menu6"><i class="far fa-question-circle"></i>고객 서비스</div>
        <div id="menu7"><i class="fab fa-slack-hash"></i>해시태그관리</div>
        <i class="fas fa-user-circle fa-3x"></i>
        <c:if test="${sessionScope.user ne null}">
        <a id="nickName" href="#">${user.memNickname}</a>
        </c:if>
        <c:if test="${sessionScope.user ne null}">
         <a id="logout" href="<c:url value="/member/logout.do"/>">로그아웃</a>
        </c:if>
        <c:if test="${sessionScope.user eq null}">
         <a id="login" href="<c:url value="/member/loginform.do"/>">로그인</a>
         </c:if>
         <c:if test="${sessionScope.user eq null}">
        <a id="signup" href="<c:url value="/member/signupform.do"/>">회원가입</a>
        </c:if>
        
        
    </div>

    <div id="move">BABMUKJA-SERVICE PAGE</div>
    <script>

        $("#menubar > b").click(function(){
            $("#move").slideDown(100).click(function(){
            	location.href="<c:url value='/recipe/main.do'/>";
            });
        });
        $("#home").click(function(){
        	location.href="<c:url value='/admin/main.do'/>";
        });
        $("#move").mouseleave(function(){
            $("#move").slideUp(100);
        });
        $("#menu2").click(function(){
        	location.href="<c:url value='/admin/member.do'/>";
        });
        
        $("#menu4").click(function(){
        	location.href="<c:url value='/admin/board.do'/>";
        });
        
        $("#menu5").click(function(){
        	location.href="<c:url value='/admin/pbstoreindex.do'/>";
        });
    </script>
</body>
</html>

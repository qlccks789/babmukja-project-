<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<a href="<c:url value='/admin/main.do' />">관리자</a>
	<a href="<c:url value='/store/mainpb.do'/>">스토어</a>
	<a href="<c:url value='/recipe/writeform.do'/>">레시피 작성폼</a> 
	<a href="<c:url value='/recipe/main.do'/>">레시피메인</a>
	<a href="<c:url value='/notice/index.do'/>">공지사항</a>
	<a href="<c:url value='/meetup/manage.do'/>">모임 관리자</a>
	<a href="<c:url value='/board/list.do'/>">자유게시판</a>	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div>
	<c:if test="${noticePageResult.prev eq true}">
		<a href="${param.link}?pageNo=${noticePageResult.beginPage - 1}">이전</a>
	</c:if>
	<c:forEach var="i" begin="${noticePageResult.beginPage}" end="${noticePageResult.endPage}">
		<a class="pageLink" href="${param.link}?noticePageNo=${i}&meetNo=${meetup.meetNo}&memNo=${sessionScope.user.memNo}&noticeClicked=1">[${i}]</a>
		</c:forEach>
	<c:if test="${noticePageResult.next eq true}">
		<a href="${param.link}?pageNo=${noticePageResult.endPage + 1}">다음</a>
	</c:if>	
</div>

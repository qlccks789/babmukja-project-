<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="paging">

 <form id="pageForm" method="post" class="page-form" action="#" >
 <input type="hidden" id="search"  name="search" value="${pageAfterSearch.search}">
 <input type="hidden"  name="category" value="${pageAfterSearch.category}">
 <input type="hidden"  name="fee" value="${pageAfterSearch.fee}">

 
	<c:if test="${pageResult.prev eq true}">
		<a href="${param.link}?pageNo=${pageResult.beginPage - 1}">이전</a>
	</c:if>
	<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
		 
		
		<a href="${param.link}?pageNo=${i}">[${i}]</a>
		 <input type="hidden" id="pageNo"  name="pageNo" value="${i}">
		
		</c:forEach>
	<c:if test="${pageResult.next eq true}">]
	
	
		<a href="${param.link}?pageNo=${pageResult.endPage + 1}">다음</a>		 		
	</c:if>
	 
	 </form>
	 	
<script> 
$('a').click(function(event){
	event.preventDefault();
	
	
	link = $(this).attr('href');
	
	
	$('#pageForm').attr('action', link);
	$('#pageForm').submit();
});

</script>

</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="<c:url value="/resources/css/admin/pbstoreselectlist.css"/>">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<title>PB Store SelectList</title>
</head>
<body>
  	<div class="admin_pb_selectList_container">
  	<div class="adming_pb_selectAll">상품 조회</div>
      <div class="admin_pb_selectList">
        <table class="admin_pb_selectList_table">
        
          <tr>
            <th>번호</th>
            <th>상품명</th>
            <th>가격</th>
            <th>등록일</th>
            <th>비고</th>
          </tr>
        <c:forEach var="adminpblist" items="${pbAdminList}">
          <tr class="list_td">
            <td>${adminpblist.pbNo}</td>
            <td><a href="<c:url value='/store/detailpb.do?pbNo=${adminpblist.pbNo}'/>">${adminpblist.name}</a></td>
            <td><fmt:formatNumber value="${adminpblist.price}" groupingUsed="true"/></td>
            <td><fmt:formatDate value="${adminpblist.regDate}" pattern="yyyy-MM-dd" /></td>
            <td>
                <button class="pb_store_update_btn">
                	<a href="<c:url value='/store/updateformpb.do?pbNo=${adminpblist.pbNo}'/>">수정</a>
                </button>
                <button class="pb_store_delete_btn">
                	<a href="<c:url value='/admin/deletepb.do?pbNo=${adminpblist.pbNo}'/>">삭제</a>
                </button>
            </td>
          </tr>
        </c:forEach>
        </table>
      </div>
    </div>
    <div class="page">
	    <c:if test="${pageResult.count != 0}">
	    	<jsp:include page="/WEB-INF/jsp/include/pagetype.jsp">
				<jsp:param name="link" value="pbstoreselectlist.do"/>        	
	    	</jsp:include>
	    </c:if>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/meetup/meetup_notice_style.css"/>" />
<link rel="stylesheet"
	href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous" />
</head>
<body>
	<main>	
	<div class="board_list_container">
		<div class="board_list_wrapper">
			<div class="board_list_title">
				모임 자유게시판
			</div>

			<div class="list_insert_button">
				게시판에 글을 작성하고 싶다면 <a href="<c:url value="/meetup/detailNoticeWriteform.do"/>">글등록 하러가기</a>
			</div>

			<div class="board_list_count_insert">
				<div class="board_list_count">
					전체 게시물<span class="board_count"> ${pageResult.count}</span>개
				</div>
			</div>


			<div class="board_list">
				<table id="board_list_heard">
					<thead>
						<tr class="board_list_tr_title">
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>

						<c:forEach var="board" items="${list}">
							<tr>
								<td>${board.boardNo}</td>
								<td><a href="<c:url value='/board/detail.do?boardNo=${board.boardNo}'/>">${board.title}</a></td>
								<td>${board.writer}</td>
								<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
								<td>${board.viewcnt}</td>
							</tr>
						</c:forEach>
					</thead>
				</table>
			</div>

			<div class="board_list_page">
				<c:if test="${pageResult.count != 0}">
					<jsp:include page="/WEB-INF/jsp/include/pagetype.jsp">
						<jsp:param name="link" value="list.do" />
					</jsp:include>
				</c:if>
			</div>
		</div>
	</div>
	</main>
</body>
</html>
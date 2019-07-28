<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>


<head>
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"> </script> <!-- include libraries(jQuery,
		bootstrap) -->

<link href="<c:url value="/resources/css/meetup/meetup-detail.css"/>"
	rel="stylesheet" type="text/css">

<!-- lightbox -->
<link rel="stylesheet"
	href="<c:url value="/resources/js/dist/css/lightbox.css"/>">
<script src="<c:url value="/resources/js/dist/js/lightbox.js"/>"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
		integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

	<title>Document</title>

</head>

<body>

	<div class="header">
		<div class="headerLeft">
			<div class=title>${meetup.title}</div>
			<div class="subInfo">
				<div class="infoTagContainer">
					<span class="infoTag">요일</span>
				</div>
				<div class="infoTagContainer">
					<span class="infoTag">지역</span>
				</div>
				<div class="infoTagContainer">
					<span class="infoTag">월회비</span>
				</div>
				<div class="infoTagContainer">
					<span class="infoTag">회원수</span>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-user-shield fa-3x"></i>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-map-marker-alt fa-3x"></i>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-won-sign fa-3x"></i>
				</div>
				<div class="subInfoPic">
					<i class="fas fa-users fa-3x"></i>
				</div>
				    
				<c:set var = "string1" value = "${meetup.day}"/>
				<c:set var="wordLength"  value="${fn:length(string1)}"/>  
				 <c:choose>  
				 <c:when test = "${wordLength == 1}"> 
				<div class="tagBottom">${meetup.day}요일</div>
				</c:when>
				<c:otherwise>
				<div class="tagBottom">${meetup.day}</div>
				</c:otherwise>
				</c:choose>
				<div class="tagBottom">${meetup.location}</div>
				<div class="tagBottom">${meetup.fee}</div>
				<div class="tagBottom">1</div>

			</div>
			<div class="tag">
			<c:forEach var ="meetupTag" items="${meetupTags}">
				${meetupTag} &nbsp;
		
			</c:forEach>
			</div>
			
		</div>
		<div class="headerRight">
			<div class="area">
				<img src="<c:url value='/meetup/download.do' />?path=${meetup.fileDir}">
		
			</div>
		</div>
	</div>

	<div class="tabContainer">
		<table class="selectTab">
			<tr>
				<td>모임소개</td>
				<td id="noticeTap">모임공지</td>
				<td id="freeTap">자유게시판</td>
				<td>사진첩</td>
				<td>회원</td>
		</table>
		
		<c:set var="intro_memNo"  value="${sessionScope.user.memNo}"/>
		<c:set var="intro_hostNo"  value="${meetup.hostNo}"/>
		<div class="tabPanel" id="tabPanel1">
		<c:choose>
		<c:when test = "${intro_memNo == intro_hostNo}"> 
			<span class="writeIntro"> <i class="fas fa-plus-circle fa-3x"></i></span>
		
     	 </c:when>
		
		<c:otherwise>
		  <div class="editDelete">
		  	<div id=temp_bar></div>
		  </div>
		    	${meetup.intro}
		 
		 
		</c:otherwise>
		</c:choose>
		
		</div>
		<div class="tabPanel" >
		<c:set var="status"  value="${memberStatus.status}"/>  
		<c:choose>
		<c:when test = "${status == 0}"> 
		<div class="requestPermissionContainer">
		<br>
		내용을 확인하시려면 모임을 먼저 가입해 주세요^^
		<span class="requestPermission">모임 가입 신청</span>
		</div>
		</c:when>
		<c:when test = "${status == 1}"> 
		<div class="requestPermissionContainer">
		<br>
			가입 승인요청을 기다리는 중입니다.		
		</div>
		</c:when>
		<c:when test = "${status == 3}"> 
		<div class="requestPermissionContainer">
		<br>
		 	당신은 방장에 의해 강퇴되어 더이상  활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		<c:when test = "${status == 4}"> 
		<div class="requestPermissionContainer">
		<br>
		 	승인이 거절되어 모임에서 활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		 <c:otherwise>
		<!-- noticeList 부분 -->
	<div class="board_list_container">
		<div class="board_list_wrapper">
			<div class="board_list_title">
				모임 공지게시판
			</div>

			<div class="list_insert_button">
				모임 공지를 작성하고 싶다면 <a href="<c:url value="/meetup/detailNoticeWriteform.do?meetNo=${meetup.meetNo}&memNo=${sessionScope.user.memNo}"/>">글등록 하러가기</a>
			</div>

			<div class="board_list_count_insert">
				<div class="board_list_count">
					전체 게시물<span class="board_count"> ${noticePageResult.count}</span>개
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

						<c:forEach var="board" items="${noticeList}">
							<tr>
								<td>${board.boardNo}</td>
								<td><a href="<c:url value='/meetup/detailNoticeDetail.do?boardNo=${board.boardNo}&memName=${sessionScope.user.memName}&meetNo=${meetup.meetNo}&memNo=${sessionScope.user.memNo}'/>">${board.title}</a></td>
								<td>${board.writer}</td>
								<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
								<td>${board.viewcnt}</td>
							</tr>
						</c:forEach>
					</thead>
				</table>
			</div>

			<div class="board_list_page">
				<c:if test="${noticePageResult.count != 0}">
					<jsp:include page="/WEB-INF/jsp/include/meetupDetailNoticePage.jsp">
						<jsp:param name="link" value="detail.do" />
					</jsp:include>
				</c:if>
			</div>
		</div>
	</div>
		
	    
	   
  		</c:otherwise>
		
		
		</c:choose>
		
	
	
			
		</div><!--tab panel 끝  -->
		<!--자유게시판시작 -->
		<div class="tabPanel">
		<c:set var="status"  value="${memberStatus.status}"/>  
		<c:choose>
		<c:when test = "${status == 0}"> 
		<div class="requestPermissionContainer">
		<br>
		내용을 확인하시려면 모임을 먼저 가입해 주세요^^
		<span class="requestPermission">모임 가입 신청</span>
		</div>
		</c:when>
		<c:when test = "${status == 1}"> 
		<div class="requestPermissionContainer">
		<br>
			가입 승인요청을 기다리는 중입니다.		
		</div>
		</c:when>
		<c:when test = "${status == 3}"> 
		<div class="requestPermissionContainer">
		<br>
		 	당신은 방장에 의해 강퇴되어 더이상  활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		<c:when test = "${status == 4}"> 
		<div class="requestPermissionContainer">
		<br>
		 	승인이 거절되어 모임에서 활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		 <c:otherwise>
		<!-- noticeList 부분 -->
	<div class="board_list_container">
		<div class="board_list_wrapper">
			<div class="board_list_title" id="free_board_list_title">
				모임 자유게시판
			</div>

			<div class="list_insert_button">
				글을 작성하고 싶으시면  <a href="<c:url value="/meetup/detailFreeWriteform.do?meetNo=${meetup.meetNo}&memNo=${sessionScope.user.memNo}"/>">글등록 하러가기</a>
			</div>

			<div class="board_list_count_insert">
				<div class="board_list_count">
					전체 게시물<span class="board_count"> ${freePageResult.count}</span>개
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

						<c:forEach var="board" items="${freeList}">
							<tr>
								<td>${board.boardNo}</td>
								<td><a href="<c:url value='/meetup/detailFreeDetail.do?boardNo=${board.boardNo}&meetNo=${meetup.meetNo}&memNo=${sessionScope.user.memNo}'/>">${board.title}</a></td>
								<td>${board.writer}</td>
								<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></td>
								<td>${board.viewcnt}</td>
							</tr>
						</c:forEach>
					</thead>
				</table>
			</div>

			<div class="board_list_page">
				<c:if test="${freePageResult.count != 0}">
					<jsp:include page="/WEB-INF/jsp/include/meetupDetailFreePage.jsp">
						<jsp:param name="link" value="detail.do" />
					</jsp:include>
				</c:if>
			</div>
		</div>
	</div>
		
	    
	   
  		</c:otherwise>
		
		</c:choose>
		
	
	
			
		</div><!--tab panel 끝  -->
		
	
		<!--자유게시판끝  -->
		<div class="tabPanel">
		
		<c:set var="status"  value="${memberStatus.status}"/>  
		<c:choose>
		<c:when test = "${status == 0}"> 
		<div class="requestPermissionContainer">
		<br>
		내용을 확인하시려면 모임을 먼저 가입해 주세요^^
		<span class="requestPermission">모임 가입 신청</span>
		</div>
		</c:when>
		<c:when test = "${status == 1}"> 
		<div class="requestPermissionContainer">
		<br>
			가입 승인요청을 기다리는 중입니다.		
		</div>
		</c:when>
		<c:when test = "${status == 3}"> 
		<div class="requestPermissionContainer">
		<br>
		 	당신은 방장에 의해 강퇴되어 더이상  활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		<c:when test = "${status == 4}"> 
		<div class="requestPermissionContainer">
		<br>
		 	승인이 거절되어 모임에서 활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		 <c:otherwise>
		
		  <div class="album_container">
		  			<c:forEach var="filePath" items="${filesPath}">
   		  	<div>
   		  		<a href="<c:url value='/meetup/download.do' />?path=${filePath}" data-lightbox="gallery">
   		  			<img src="<c:url value='/meetup/download.do' />?path=${filePath}" width="287.5px" height="285px">
				</a>
				</div>
					</c:forEach>
               
                
            </div>
            	</c:otherwise>
		
				</c:choose>	
		</div>
	
		<div class="tabPanel">
		
			<c:set var="status"  value="${memberStatus.status}"/>  
		<c:choose>
		<c:when test = "${status == 0}"> 
		<div class="requestPermissionContainer">
		<br>
		내용을 확인하시려면 모임을 먼저 가입해 주세요^^
		<span class="requestPermission">모임 가입 신청</span>
		</div>
		</c:when>
		<c:when test = "${status == 1}"> 
		<div class="requestPermissionContainer">
		<br>
			가입 승인요청을 기다리는 중입니다.		
		</div>
		</c:when>
		<c:when test = "${status == 3}"> 
		<div class="requestPermissionContainer">
		<br>
		 	당신은 방장에 의해 강퇴되어 더이상  활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		<c:when test = "${status == 4}"> 
		<div class="requestPermissionContainer">
		<br>
		 	승인이 거절되어 모임에서 활동하실 수 없습니다.
		<span class="requestPermission">재가입 신청</span>
		 			
		</div>
		</c:when>
		 <c:otherwise>
		
		 
		
			<div class="detail_member_container">
			 	<c:forEach var ="meetupMember" items="${meetupMemberList}">
                	<div class="detail_member_info">
                    <div class="profile_picture_container">
                    <c:choose>
                    <c:when test="${meetupMember.memImgSysname == null}">
                        <img id="profile_picture" src="<c:url value="/resources/images/default/userdefault.png"/>">
                     </c:when>
                     
                     <c:otherwise>
                        <img src="${pageContext.request.contextPath}/meetup/download.do?path=${meetupMember.memImgSysname}">
                     </c:otherwise>
                    
                     </c:choose>    
                    </div>
             			<div class="detail_member_name">${meetupMember.memName}</div>
                    	<div class="detail_member_regDate_container">
                        	<div>가입일</div>
                        
                        	<div><fmt:formatDate value="${meetupMember.joinDate}" pattern="yyyy년 MM월  dd일" /></div>
                    	</div>
                    <div class="detail_member_message_container" ><i class="far fa-envelope"></i>

                    </div>
                </div>
               
      			  </c:forEach>        
            </div><!--detail_member_container -->
		
		 </c:otherwise>
		</c:choose>	
		</div><!--회원테이블  -->
	</div>
	  <!--el 값 받아주기  -->	
	  <input type="hidden" id="el_meetNo" name="meetNo" value="${meetup.meetNo}" />
	  <input type="hidden" id="el_memName" name="memName" value="${sessionScope.user.memNickname}" />
	  <input type="hidden" id="el_memEmail" name="memEmail" value="${sessionScope.user.memEmail}" />
	  <input type="hidden" id="el_memNo" name="memNo" value="${sessionScope.user.memNo}" />
	  <input type="hidden" id="el_memImgSysname" name="memImgSysname" value="${sessionScope.user.memImgSysname}" />
	  	  <input type="hidden" id="el_memImgPath" name="memImgPath" value="${sessionScope.user.memImgPath}" />
	  
	  <input type="hidden" id="el_hostNo" name="memNo" value="${meetup.hostNo}" />
	  <input type="hidden" id="el_noticeClicked" name="noticeClicked" value="${noticeClicked}" />
	  <input type="hidden" id="el_freeClicked" name="freeClicked" value="${freeClicked}" />
	
	<script>
	  var downloadUrl= '<c:url value='/meetup/download.do' />'
	  var intro ='${meetup.intro}';

	</script>
	
    <script src='<c:url value="/resources/js/meetup/meetup_detail.js"/>'> </script>

   

</body>
 

</html>
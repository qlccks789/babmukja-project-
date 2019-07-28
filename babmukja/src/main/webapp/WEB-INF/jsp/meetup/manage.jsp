<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- maincss -->
     <link href="<c:url value="/resources/css/meetup/manage.css"/>" rel="stylesheet" type="text/css">
         <script src="<c:url value="/resources/js/jquery-3.2.1.js"/>"> </script>
    
    
    
    <!-- modal -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- modal 끝 -->
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

      <!-- 쿠킹 관리 컨테이너 -->
    <div class="manage_container">
        <!-- 쿠킹 관리 헤더  -->
        <div class=manage_header>
            <span class="header_cooking_manage">쿠킹관리</span>
        </div>

        <div class="host_meetup">
            <div class="host_meetup_title">내가 개설한 모임</div>
            <div class="host_meetup_list_header">
              <div class="host_meetup_no">번호</div>
              <div class="host_meetup_name">모임명</div>  
              <div class="host_meetup_manage"> </div>  
            </div><!--host_meetup_list -->
            <c:forEach var ="meetup" items="${createdMeetup}">
            <div class="host_meetup_list">
                <div class="host_meetup_no">${meetup.manageNo}</div>
                <div class="host_meetup_name">	<a class="host_meetup_atag" href="<c:url value='/meetup/detail.do?meetNo=${meetup.meetNo}&memNo=${sessionScope.user.memNo}'/>">${meetup.title}</a>
                </div>
              <input type="hidden"  name="meetNo" class="meetNo" value="${meetup.meetNo}">
                <div class="host_meetup_manage">
                    <div class="manage_member">회원관리</div>
                </div>  
              </div><!--host_meetup_list -->
              </c:forEach>
           
              
              
        </div><!-- 내가 개설한 모임 끝 -->
        
        <div class="follow_meetup">
            <div class="follow_meetup_title">내가 참여하는 모임</div>
            <div class="follow_meetup_list_header">
              <div class="follow_meetup_no">번호</div>
              <div class="follow_meetup_name">모임명</div>  
              <div class="follow_meetup_manage"> </div>  
            </div><!--host_meetup_list -->
           <c:forEach var ="meetupFollow" items="${meetupFollows}"> 
            <div class="follow_meetup_list">
                <div class="follow_meetup_no">${meetupFollow.manageNo}</div>
                <div class="follow_meetup_name">	<a class="host_meetup_atag" href="<c:url value='/meetup/detail.do?meetNo=${meetupFollow.meetNo}&memNo=${sessionScope.user.memNo}'/>">${meetupFollow.title}</a>
                </div>
                <div class="follow_meetup_manage">
                    <div class="manage_widthdrawl">모임탈퇴</div>
                   <input type="hidden"  name="meetNo" class="widthdrawMeetNo" value="${meetupFollow.meetNo}">
                    
                </div>  
              </div><!--host_meetup_list -->
              </c:forEach>
        </div><!-- 내가 참여는 모임 끝 -->
	</div><!-- manage_container -->
<!-- modal 부분 -->
 
  <!-- Modal -->
  <div class="modal fade" id="manageMemberModal" tabindex="-1" role="dialog" aria-labelledby="emyLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
      
        <div class="modal-body">
          <!-- codepen 적용 -->
            

<div class=tl_container>

    <!-- A plain set of anchor links in HTML -->
  
    <ul class="tl_list">
      <li><a href="#A" class=a>회원명단</a></li>
      <li><a href="#B" class="b ON">가입신청</a></li>
    </ul>
  
    <section id=A class="tl_section a">
     <!-- 회원 명단 -->
     <div class="member_list_title"></div>
     <div class="member_list_header">
       <div class="member_list_header_no">번호</div>
       <div class="member_list_header_name">이름</div>       
       <div class="member_list_header_email">이메일</div>  
       <div class="member_list_header_manage"></div>  
     </div><!--host_meetup_list -->
     
       <!-- 회원 명단끝-->
      
    </section>
  
    <section id=B class="tl_section b">
        <div class="member_approval_title"></div>
        <div class="member_approval_header">
			<div class="member_approval_header_no">번호</div>
			<div class="member_approval_header_name">이름</div>       
			<div class="member_approval_header_email">이메일</div>  
			<div class="member_approval_header_manage"></div>  
		 </div><!--host_meetup_list -->
        <!-- 가입 승인 명단 -->
    
     
       <!-- 회원 명단끝-->
    </section>
  
</div><!-- 탭상자 끝 -->

    
            <!-- codepen 적용끝 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>

   <!-- modal 끝 -->


   <script src='<c:url value="/resources/js/meetup/meetup_manage.js"/>'> </script>

   
</body>
</html>
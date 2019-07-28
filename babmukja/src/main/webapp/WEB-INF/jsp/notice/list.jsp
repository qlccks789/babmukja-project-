<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value="/resources/css/notice/notice list.css"/>">
       <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"> </script>
    <title>전체조회</title>
   <!--  <script type="text/javascript">
        $(document).ready(function(){
        	$(".noticelist > #tableDesign").css("background-color", "wheat");
        });  
    </script> -->
    <!-- <script type="text/javascript">
        $(document).ready(function(){
        	$(".noticelist > #tableDesign > tbody > tr:nth-child(odd)").css("background-color", "red");
        	$(".noticelist > #tableDesign > tbody > tr:nth-child(even)").css("background-color", "blue");
        });  
    </script>  -->
</head>
<body style="background: white;">
    <div class="noticelist">
        <br><h2>공지사항 전체조회</h2><br>
       <%--  <c:if test="{sessionScope.admin != null}"> --%>
        <td class="btnView"><button input type="button" style="font-size: 1.3em; font-weight: bold; float:right; background-color:#7db341;"> 
        <a href='writeForm.do?noticeNo=${notice.noticeNo}'>등록</a></button></td>
       <%--   </c:if> --%>
        <hr>
        <table id="tableDesign">
                <caption>전체조회</caption>
                <tr>
                    <th class="inquirelist"><span>번호</span></th>
                   
                    <th class="inquirelist"><span>제목</span></th>
<!--                     <th class="inquirelist"><span>분류</span></th> -->
                    <th class="inquirelist"><span>등록일</span></th>
                    <th class="inquirelist"><span>조회</span></th>
                    <th class="inquirelist"><span>비고</span></th>
<!--                     <th class="inquirelist"><span>댓글수</span></th> -->
                </tr>
      <c:forEach var="notice" items="${list}" varStatus="status">
         <tr>
            <td class="noticeNo">${notice.noticeNo}</td>
            <td class="leftstyle2"><a href='detail.do?no=${notice.noticeNo}'>${notice.title}</a></td>   
            <td class="inquirelist2"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${notice.regdate}"/></td>
            <td class="inquirelist2">${notice.viewcnt}</td>
            <td class="inquirelist2">
            <%-- <c:if test="{sessionScope.user.memNo != null}">  --%>
                <button input type="button">
				<a href='updateForm.do?noticeNo=${notice.noticeNo}'>수정</a></button>
		        <button input type="button"><a href='delete.do?noticeNo=${notice.noticeNo}'>삭제</a></button>
            <%-- </c:if> --%>
            </td>
         </tr>
      </c:forEach>
             </table><hr>
               <nav id="pageNav">
                   <ul>
                   <li>
                   <div>
				      <c:if test="${pageResult.count != 0}">
					<jsp:include page="/WEB-INF/jsp/include/pagetype.jsp">
						<jsp:param name="link" value="list.do" />
					</jsp:include>
				       </c:if>
			        </div>   
			        </li>
                <!--  <div><li><a href='index.do'>MAIN</a></li></div> -->
                   </ul>
               </nav>
        </table>   
    </div>
    <footer>
            <h2>BABMUKJA COMPANY</h2>
            <div>Lorem ipsum dolor sit.</div>
    </footer>
</body>
</html>
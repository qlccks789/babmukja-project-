<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/notice/notice detail.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"> </script>
</head>
<body style="background:white;">
    <div class="babcontainer">
        <div class="babnotices">공지사항 상세조회</div>   
     </div>
     <hr><br><br> 
     <table class="babtable">
         <tr class="bab_tr">
             <td class="babtd5">2019-03-11</td>
         </tr>
         <tr class="bab_tr">
             <td class="babtd"><p class="babinfomation"><strong>&nbsp; - 점검시간: 2019년 03월 12일(화) 11시 ~ 20시(10시간)<br>
              &nbsp; - 점검내용: 시스템 서버 점검
            </strong></p>
             </td>
             
         </tr>
         <tr class="bab_tr">
             <td class="babtd">
                <p class="babinfomation"> &nbsp; PS) 해당 점검 시간 중 모바일 앱 서비스 및 홈페이지가 일시 중지되는 점 양해 부탁드립니다.</p>
                
            </td>
        </tr>
        </table>
        <textarea class="babcomment">댓글을 작성하세요.</textarea>
        <br>
        <button class="detail_bn"><a href="enrollform.do">등록하기</a></button>
        <br><br><hr>
    </div>
</body>
</html>
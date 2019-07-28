<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="ttps://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/adminboard.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <title>게시판 관리</title>
</head>
<body>

    <div id="main">
        <div id="main-header">
            <h2>게시판 관리</h2>
            <div id="member-search">
                <div id="member-search-header">게시판 조회</div>
                <div id="member-search-input">
                    <div>     
                    <form action="<c:url value='/admin/member.do'/>" method="post" >
                        <select class="search" name="searchType">
                            <option value="memId">레시피</option>
                            <option value="memNickname">pb스토어</option>
                            <option value="memEmail">레시피스토어</option>
                            <option value="notice">공지사항</option>
                        </select>
                        <input class="search_form_input" name="input" type="text">
                        <div>
                            <input type="button" id="detail_button" value="+">
                        </div>
                
                    </div>
                </div>
                <div id="detail-search">
                    <div>상세 검색</div>
                    <hr>
                    <div id="detail-search-content">
                        <div>
                            <div>
                                <div>작성일</div>
                                <div>조회수</div>
                                <div>좋아요 수</div>
                                <div>스크랩 횟수</div>
                                <div>댓글 갯수/후기 갯수</div>
                                <div>게시판 번호</div>
                            </div>
                            <div>
                                <div>
                                    <input class="selector" name="regDate1"> ~
                                    <input class="selector" name="regDate2">
                                </div>
                                
                                <div>
                                    <input type="text" name="totalView1"> ~
                                    <input type="text" name="totalView2">
                                </div>
                                <div>
                                    <input type="text" name="totalBuy1"> ~
                                    <input type="text" name="totalBuy2">
                                </div>
                                <div>
                                    <input type="text" name="likeCnt1"> ~
                                    <input type="text" name="likeCnt2">
                                </div>
                                <div>
                                    <input type="text" name="scrapCnt1"> ~
                                    <input type="text" name="scrapCnt2">
                                </div>
                                <div>
                                    <input type="text" name="boardNumber1"> ~
                                    <input type="text" name="boardNumber2">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="member-search-button">
                    <button>검색</button>
                </div>
               </form>
            </div>
        </div>

        <div id="search-output">
        	<c:choose>
        	<c:when test="${count != 0 }">
        		<div id="search-output-header">검색 결과 명</div>
        	</c:when>
        	<c:otherwise>
        		<div id="search-output-header">검색 결과 게시물이 존재하지 않습니다.</div>
        	</c:otherwise>
    		</c:choose>
            <div>
                <div id="search-output-list">
                    <table>
                        <thead>
                            <tr>
                                <th>체크</th>
                                <th>게시판</th>
                                <th>게시글 번호</th>                                
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                                <th>좋아요 수</th>
                                <th>스크랩 횟수</th>
                                <th>댓글 갯수/후기 갯수</th>
                                <th>레시피 개수</th>
                                <th>숨김여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>                            
                                <td><input type="checkbox"></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><a href="#"></a></td> 
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- <c:if test="${pageResult.count != 0}"> 
							<c:if test="${pageResult.prev eq true}">
							<a id="prevPage" data-pageNo="${pageResult.beginPage - 1}" href="${param.link}?pageNo=${pageResult.beginPage - 1}">이전</a>
						</c:if>
						<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
							<a id="noPage" data-pageNo="${i}" href="${param.link}?pageNo=${i}">[${i}]</a>
							</c:forEach>
						<c:if test="${pageResult.next eq true}">
							<a id="nextPage" data-pageNo="${pageResult.endPage + 1}" href="#1">다음</a>
						</c:if>	 -->
					<!-- </c:if>	 -->
                </div>                
            </div>
        </div>
	</div>

    <script>    
    	
    	$("#search-output-list > a").click(function () {
    		alert($(this).data("pageNo"));
    		$("[name='searchForm'] > input[name='pageNo']").val($(this).data("pageNo"));
    		$("[name='searchForm']").submit();
    		return false;
    	});
    
 
   		 $("#detail_button").click(function () { 
       		$("#detail-search").css(
            	"display", "block"                
        	);            
    	});
        $(".selector").flatpickr({
            enableTime: true,
            dateFormat: "Y-m-d",
        });
        $(".selector2").flatpickr({
            enableTime: true,
            dateFormat: "Y-m-d H:i",
        });
    </script>

</body>
</html>
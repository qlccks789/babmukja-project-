<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/js/slider/slider-radio.css"/>">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/selectbox.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/recipe/recipeCaDetail.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/slider/slider-radio.js"/>"></script>

    <title>Document</title>

</head>
<body>               
    <div id="main-body">    
    <!-- 검색 부분 -->
   <div id="selectBoxSelector"><p>검색 조건을 선택해주세요<i id="fa-arrow" class="fas fa-caret-down"></i></p><i id="submitBtn" class="fa fa-search fa-2x"></i></div>
   <div id="selectBox-wrapper">
            <form name="searhForm" method="get" action="cadetailall.do">
       <div id="selectBox">
            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/title.png"/>">    
                <div class="selectmenuContent-detail">제목
                    <div class="hiddenMenu">
                        <input type="text" name="searchTitle"<c:if test="${param.searchTitle != '' || param.searchTitle != null}">value="${param.searchTitle }"</c:if>><span class="search-icon"></span>
                    </div>  
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>
            
            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/nickname.png"/>">  
                <div class="selectmenuContent-detail">닉네임     
                    <div class="hiddenMenu">
                        <input type="text" name="searchNickname" <c:if test="${param.searchNickname != '' || param.searchNickname != null}">value="${param.searchNickname }"</c:if>><span class="search-icon"></span>
                    </div>  
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>

            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/warning.png"/>">   
                <div class="selectmenuContent-detail">주의사항
                    <div class="hiddenMenu">
                        <input type="checkbox" id="pregnant" name="caution" value="7" <c:if test="${caution7 == 7}">checked</c:if>>
                        <label for="pregnant">임산부 주의</label>
                        <input type="checkbox" id="baby" name="caution" value="8" <c:if test="${caution8 == 8}">checked</c:if>>
                        <label for="baby">영유아 주의</label>
                        <input type="checkbox" id="high-blood-pressure" name="caution" value="9" <c:if test="${caution9 == 9}">checked</c:if>>
                        <label for="high-blood-pressure">고혈압 주의</label>
                        <input type="checkbox" id="vegan" name="caution" value="10" <c:if test="${caution10 == 10}">checked</c:if>>
                        <label for="vegan">채식주의자를 위한</label>
                        <br><input type="checkbox" id="halal" name="caution" value="11" <c:if test="${caution11 == 11}">checked</c:if>>
                        <label for="halal">돼지고기 포함</label>
                        <input type="checkbox" id="old" name="caution" value="12" <c:if test="${caution12 == 12}">checked</c:if>>
                        <label for="old">노약자 주의</label>
                        <input type="checkbox" id="allergic" name="caution" value="13" <c:if test="${caution13 == 13}">checked</c:if>>
                        <label for="allergic">알러지 유발 주의</label>
                        <input type="checkbox" id="diabetes" name="caution" value="14" <c:if test="${caution14 == 14}">checked</c:if>>
                        <label for="diabetes">당뇨 주의</label>
                        
                    </div>
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>
            
            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/giftbox.png"/>">  
                <div class="selectmenuContent-detail">상황
                    <div class="hiddenMenu">
                        <input type="radio" id="overnight" name="situation" value="15" <c:if test="${param.situation == 15}">checked</c:if>><label for="overnight">야식</label> 
                        <input type="radio" id="homeparty" name="situation" value="16" <c:if test="${param.situation == 16}">checked</c:if>><label for="homeparty">홈파티</label>
                        <input type="radio" id="birthday" name="situation" value="17" <c:if test="${param.situation == 17}">checked</c:if>><label for="birthday">생일</label> 
                        <input type="radio" id="anniversary" name="situation" value="18" <c:if test="${param.situation == 18}">checked</c:if>><label for="anniversary">기념일</label>
                        <input type="radio" id="drinkalone" name="situation" value="19" <c:if test="${param.situation == 19}">checked</c:if>><label for="drinkalone">혼술</label>
                        <input type="radio" id="eatalone" name="situation" value="20" <c:if test="${param.situation == 20}">checked</c:if>><label for="eatalone">혼밥</label> 
                        <input type="radio" id="coupledate" name="situation" value="21" <c:if test="${param.situation == 21}">checked</c:if>><label for="coupledate">데이트</label>
                        <input type="radio" id="snack" name="situation" value="22" <c:if test="${param.situation == 22}">checked</c:if>><label for="snack">간식</label> <br>
                        <input type="radio" id="wholetable" name="situation" value="23" <c:if test="${param.situation == 23}">checked</c:if>><label for="wholetable">한상차림</label>
                        <input type="radio" id="dinner" name="situation" value="24" <c:if test="${param.situation == 24}">checked</c:if>><label for="dinner">저녁</label>
                        <input type="radio" id="lunch" name="situation" value="25" <c:if test="${param.situation == 25}">checked</c:if>><label for="lunch">점심</label> 
                        <input type="radio" id="breakfast" name="situation" value="26" <c:if test="${param.situation == 26}">checked</c:if>><label for="breakfast">아침</label> 
                        <input type="radio" id="picnic" name="situation" value="27" <c:if test="${param.situation == 27}">checked</c:if>><label for="picnic">피크닉</label>
                    </div>
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>

            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/graph.png"/>">  
                <div class="selectmenuContent-detail">난이도
                    <div class="hiddenMenu">
                        <input type="radio" id="veryeasy" name="level" value="28" <c:if test="${param.level == 28}">checked</c:if>><label for="veryeasy">매우 쉬움</label>
                        <input type="radio" id="easy" name="level" value="29" <c:if test="${param.level == 29}">checked</c:if>><label for="easy">쉬움</label>
                        <input type="radio" id="normal" name="level" value="30" <c:if test="${param.level == 30}">checked</c:if>><label for="normal">보통</label>
                        <input type="radio" id="hard" name="level" value="31" <c:if test="${param.level == 31}">checked</c:if>><label for="hard">어려움</label>
                        <input type="radio" id="veryhard" name="level" value="32" <c:if test="${param.level == 32}">checked</c:if>><label for="veryhard">매우 어려움</label>
                    </div>
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>

            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/meal.png"/>">  
                <div class="selectmenuContent-detail">조리시간
                    <div class="hiddenMenu">
                        <input type="radio" id="five" name="time" value="33" <c:if test="${param.time == 33}">checked</c:if>><label for="five">5분 이내</label>
                        <input type="radio" id="fifteen" name="time" value="34" <c:if test="${param.time == 34}">checked</c:if>><label for="fifteen">15분 이내</label>
                        <input type="radio" id="thirty" name="time" value="35" <c:if test="${param.time == 35}">checked</c:if>><label for="thirty">30분 이내</label>
                        <input type="radio" id="hour" name="time" value="36" <c:if test="${param.time == 36}">checked</c:if>><label for="hour">1시간 이내</label>
                        <input type="radio" id="overhour" name="time" value="37" <c:if test="${param.time == 37}">checked</c:if>><label for="overhour">1시간 초과</label>
                    </div>
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>

            <div class="selectmenuContent">
                <img src="<c:url value="/resources/images/icons/dish.png"/>">  
                <div class="selectmenuContent-detail">종류
                    <div class="hiddenMenu">
                        <input type="radio" id="koreansoup" name="type" value="38" <c:if test="${param.type == 38}">checked</c:if>><label for="koreansoup">국/탕류</label>
                        <input type="radio" id="jjigae" name="type" value="39" <c:if test="${param.type == 39}">checked</c:if>><label for="jjigae">찌개</label>
                        <input type="radio" id="sidedish" name="type" value="40" <c:if test="${param.type == 40}">checked</c:if>><label for="sidedish">반찬</label>
                        <input type="radio" id="noodle" name="type" value="41" <c:if test="${param.type == 41}">checked</c:if>><label for="noodle">면</label>
                        <input type="radio" id="dumpling" name="type" value="42" <c:if test="${param.type == 42}">checked</c:if>><label for="dumpling">만두</label>
                        <input type="radio" id="rice" name="type" value="43" <c:if test="${param.type == 43}">checked</c:if>><label for="rice">밥</label>
                        <input type="radio" id="salad" name="type" value="44" <c:if test="${param.type == 44}">checked</c:if>><label for="salad">샐러드</label>
                        <input type="radio" id="soup" name="type" value="45" <c:if test="${param.type == 45}">checked</c:if>><label for="soup">스프</label><br>
                        <input type="radio" id="beverage" name="type" value="46" <c:if test="${param.type == 46}">checked</c:if>><label for="beverage">음료</label>
                        <input type="radio" id="bread" name="type" value="47" <c:if test="${param.type == 47}">checked</c:if>><label for="bread">빵/디저트</label>
                        <input type="radio" id="hardboiled" name="type" value="48" <c:if test="${param.type == 48}">checked</c:if>><label for="hardboiled">조림</label>
                        <input type="radio" id="easymixed" name="type" value="49" <c:if test="${param.type == 49}">checked</c:if>><label for="easymixed">무침</label>
                        <input type="radio" id="hardmixed" name="type" value="50" <c:if test="${param.type == 50}">checked</c:if>><label for="hardmixed">비빔</label>
                        <input type="radio" id="steamed" name="type" value="51" <c:if test="${param.type == 51}">checked</c:if>><label for="steamed">찜</label>
                        <input type="radio" id="pickled" name="type" value="52" <c:if test="${param.type == 52}">checked</c:if>><label for="pickled">절임</label>
                        <input type="radio" id="fried" name="type" value="53" <c:if test="${param.type == 53}">checked</c:if>><label for="fried">튀김</label><br>
                        <input type="radio" id="boiled" name="type" value="54" <c:if test="${param.type == 54}">checked</c:if>><label for="boiled">삶기</label>
                        <input type="radio" id="cooked" name="type" value="55" <c:if test="${param.type == 55}">checked</c:if>><label for="cooked">굽기</label>
                        <input type="radio" id="blanch" name="type" value="56" <c:if test="${param.type == 56}">checked</c:if>><label for="blanch">데치기</label>
                        <input type="radio" id="row" name="type" value="57" <c:if test="${param.type == 57}">checked</c:if>><label for="row">회</label>
                        <input type="radio" id="typeetc" name="type" value="58" <c:if test="${param.type == 58}">checked</c:if>><label for="typeetc">기타</label>
                    </div>
                </div>
                <div class="selectmenuContentFold"><i class="fas fa-chevron-right"></i></div>
            </div>
        </div>
             </form>
   </div> 
   
    <!-- 레시피 목록 부분 -->
	    <div class="boundary"></div>  
	    <div class="chalkheader"></div>
	    
	        <div id="sector3-mid">
	        </div>
	        <div id="sector3">
	            <div id="sector3-body">   
	            	<c:if test="${empty calist}">
	            		<p class="no-search">검색결과가 존재하지 않습니다.</p>  
	            	</c:if>      
	                <c:forEach var="ca" items="${calist }">  	                
	                <input type="hidden" name="pageNo" value="${param.pageNo }">             
	                   <div class="profile-container">
	                       <div class="profile-pic-box">
	                           <div>
	                           <c:choose>
				                	<c:when test="${ca.memImgPath == null}">
				                    	<img class="profile-picture" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
				                	</c:when>
				                	<c:otherwise>					                	
				                    	<img class="profile-picture" src="${pageContext.request.contextPath}/member/download.do?path=${ca.memImgPath}&sysname=${ca.memImgSysname}">
				                	</c:otherwise>
		                		</c:choose>
	                           </div>
	                           <div class="profile-name">
	                               <p>
			                    	  <span>평점 : <fmt:formatNumber value="${ca.rating }" pattern="#.##"/></span>
	                           <br>
	                                  ${ca.title}
	                           <br>
	                                  ${ca.memNickname}
	                               </p>
	                           </div>
	                       </div>
	                       <div class="recipe-pic-box">
	                           <a href = "detail.do?no=${ca.recipeNo }">
		                           <c:choose>
					                	<c:when test="${ca.imgPath == '' || ca.imgPath == null || ca.imgPath == 'undefined'}">
					                    	<img src="<c:url value="/resources/images/default.png"/>">				                	
					                	</c:when>
					                	<c:otherwise>					                	
				                           <img src="${ca.imgPath}" onerror='this.src="${pageContext.request.contextPath}/resources/images/default.png"'>
					                	</c:otherwise>
			                		</c:choose>
		                		</a>
	                       </div>
	                       <div class="recipe-info">
	                           <i class="fas fa-heart fa-2x">${ca.likeCnt }</i>
	                           <i class="fas fa-scroll fa-2x">${ca.scrapCnt }</i>
	                           <i class="fas fa-eye fa-2x">${ca.viewCnt }</i>
	                       </div>
	                   </div>
	               </c:forEach>	                
	            </div>
	            <div id="sector3-header"></div>
	        </div>
	    </div>
	    
 <script>	
 	let userDefault = "<c:url value='/resources/images/default/userdefault.png'/>";
	let pageContext = "${pageContext.request.contextPath}/member/download.do?path=";
	let imgDefault = "<c:url value='/resources/images/default.png'/>";
</script>
<script src="<c:url value="/resources/js/recipe/cadetailall.js"/>"></script>
</body>
</html>
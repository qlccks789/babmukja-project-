/**
 * 전체 카테고리 js
 */

let arrow = $("#fa-arrow");
let $selectBoxSelector = $("#selectBoxSelector");
let $selectBoxWrapper = $("#selectBox-wrapper");
let offLeft = $selectBoxSelector.offset().left;
		
		
        $("#submitBtn").css({
        	position: "absolute",
        	top: 15,
        	left: 220
        });
        $selectBoxWrapper.css({
        	position: "fixed",
        	top: 55,
        	left: offLeft
        });
    	let openFlag = false;
	    $selectBoxSelector.click(function(e){
	    	if(!openFlag){
	    		openFlag = true;
	    	}else{	    		
	    		openFlag = false;
	    		$(".selectmenuContent").children(".selectmenuContentFold").children().attr({class:"fas fa-chevron-right"});
	    	}
	        $selectBoxWrapper.slideToggle(150);

	        if(arrow.attr("class") == "fas fa-caret-down") arrow.attr({class : "fas fa-caret-up"});
	        else{
	            arrow.attr({class : "fas fa-caret-down"});
	            $(".selectmenuContent").css({width:"190px"});
	            $(".selectmenuContent").find(".hiddenMenu").css({display:"none"});
	        } 
	    });
	    $(".selectmenuContent").click(function(){
	        let $this = $(this);
	        let $hiddenMenu = $this.children(".selectmenuContent-detail").children();
	        let $fold = $this.children(".selectmenuContentFold");
	        
	        if($this.width() < 220){
	            $this.animate({width: "700px"},180);
	            setTimeout(function(){
	                $hiddenMenu.css({display:"inline-block"});
	            }, 200);
	            $fold.children().attr({class:"fas fa-chevron-left"});
	        }
	        $fold.click(function(){
	            if($hiddenMenu.css("display") == 'none'){
	                return;
	            }
	            $this.animate({width: "190px"},180);
	            $hiddenMenu.css({display:"none"});
	            $fold.children().attr({class:"fas fa-chevron-right"});
	        });
	    });
    
         $("#submitBtn").click(function () {
        		 $("form[name='searhForm']").submit();
         });
         
      // 무한스크롤
         let pageNo = 0;
         $(window).scroll( 
           function () {
             let sh = $(window).scrollTop() + $(window).height();
             let dh = $(document).height(); 
            
             if(sh >= dh-10) {
            	 
               pageNo = pageNo+12;
		       let cautions = [];
		       $("input[name='caution']:checked").each(function(){
		       	 cautions.push($(this).val());
		       });
		       
		       let data = {
		    		   pageNo : pageNo,
		    		   searchTitle : $("input[name='searchTitle']").val(),
		    		   searchNickname : $("input[name='searchNickname']").val(),
	                   caution : cautions,
	                   situation : $("input[name='situation']:checked").val(),
	                   level : $("input[name='level']:checked").val(),
	                   time : $("input[name='time']:checked").val(),
	                   type : $("input[name='type']:checked").val()
		       }
               
               $.ajax({               
		                data : data,
		                url : "cadetailAllScroll.do"
         
               }).done(function (result) {            	   
            	   if(result.length != 0) {
             			 let html = "";
               		 for(let i = 0 ; i < result.length ; i ++) {
               			 html += '<div class="profile-container">'
                                  + '<div class="profile-pic-box">'
                               	+ '<div>'
                               	
                   		 if(result[i].memImgPath == null || result[i].memImgPath == "") {
                   			html += '<img class="profile-picture" src=' + userDefault + '>';				                	
                   		 } else {
                   			html += '<img class="profile-picture" src=' + pageContext + result[i].memImgPath + '&sysname='+ result[i].memImgSysname+ '>';
                   		 }
                            html += `</div>
                            			<div class="profile-name">
                                   			<p>
          	                    	  			<span>평점 :` + Math.floor(result[i].rating * 100)/100 + ` </span>
                              			 <br>
                                  			 ` +  result[i].title + `
                              			 <br>
                                   			 ` +  result[i].memNickname + `
                                   			</p>
                               			</div>
                           			</div>
          	                        <div class="recipe-pic-box">
          	                           <a href = "detail.do?no=` + result[i].recipeNo + `">`;
          	                           
                           if(result[i].imgPath == null || result[i].imgPath == "") {
                   			html += '<img src=' + imgDefault + '></a>';				                	
                   		  } else {
                   			html += '<img src="'+ result[i].imgPath + '"></a>';
                   		  }
          	                html += `</div>
          	                        <div class="recipe-info">
          	                           <i class="fas fa-heart fa-2x">` + result[i].likeCnt + `</i>
          	                           <i class="fas fa-scroll fa-2x">`+ result[i].scrapCnt + ` </i>
          	                           <i class="fas fa-eye fa-2x">` + result[i].viewCnt + `</i>
          	                        </div>
          	                    </div>`;
               			 
               		 	}
                             	 $("#sector3-body").append(html);
                      	} 
            	  
              }).fail(function(xhr){	               
	               console.dir(xhr);
              })
             }
           });
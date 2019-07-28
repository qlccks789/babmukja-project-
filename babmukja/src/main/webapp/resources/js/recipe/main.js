/**
 * 레시피 메인 js
 */
 $("#bottle").click(function () {
    	location.href = url;
    });
    
	$(".writeno-button").click(function (){
		alert("로그인 후 이용가능합니다.")
	});
    function loadApp(id) {
       if (!$(id).turn("is")) {
          
          $(id).turn({
             width : 1000,
             height : 700,
             elevation : 50   
          });
       }
    }    
    // 레시피 메인  - turn.js 적용부분
    $("#recipe-book1").click(function () {   
       $("#resultImage").css({background:$(this).css("backgroundImage"),
         backgroundSize: "cover",
         backgroundRepeat : "no-repeat"});
         console.log("키 랭크 값 : " + $("input[name='countryrank']").val());
       $.ajax({
          type:"GET",
          url: "recipekeyword.do",
          data:{
             keywordNo : $("input[name='countryrank']").val()
             }
       }).done(function(response){
          let html = '<div ignore="1" class="next-button"></div><div class="hard" id="resultImage"></div>';
          let i = 1;
          for(let res of response){
             console.log("res : " + res);
              let editor = new EditorJS({
                  holderId: 'page'+i,
                  autofocus: false,
                  data: JSON.parse(res.content),
                  tools: { 
                      warning: {
                          class: Warning,
                          inlineToolbar: true,
                      },
           
                      table: {
                          class: Table,
                          inlineToolbar: true,
                      },                       
                      quote: {
                          class: Quote,
                          inlineToolbar: true,
                      },
                   image: {
                          class: ImageTool,
                      },            
   
                      header: {
                          class: Header,
                      }, 
                      checklist: {
                          class: Checklist,
                      },
                      linkTool: {
                          class: LinkTool,
                      },
                      marker: {
                          class: Marker,
                      },
                      list: {
                          class: List,
                      },
                      embed: {
                          class: Embed,
                      }
                  }
              });
              i++;
          }
       });


      $("#turnModal").modal("show");      
      
      $("#turnJsDiv").css(
      "display", "block"                
      ); 
      
       loadApp("#turnJs");       
       
    });   
    

    $(document).ready(function () {
       $("#turnModal").modal("hide");
    });


   // modal 창 이전버튼
   
   $('.previous-button').bind($.mouseEvents.over, function() {
      
      $(this).addClass('previous-button-hover');

   }).bind($.mouseEvents.out, function() {
      
      $(this).removeClass('previous-button-hover');

   }).bind($.mouseEvents.down, function() {
      
      $(this).addClass('previous-button-down');

   }).bind($.mouseEvents.up, function() {
      
      $(this).removeClass('previous-button-down');

   }).click(function() {      
      $('#turnJs').turn('previous');

   });
   
   // modal 창 다음 버튼
   $('.next-button').bind($.mouseEvents.over, function() {
         
         $(this).addClass('next-button-hover');
   
      }).bind($.mouseEvents.out, function() {
         
         $(this).removeClass('next-button-hover');
   
      }).bind($.mouseEvents.down, function() {
         
         $(this).addClass('next-button-down');
   
      }).bind($.mouseEvents.up, function() {
         
         $(this).removeClass('next-button-down');
   
      }).click(function() {
         
         $('#turnJs').turn('next');
   
      });

        var swiper = new Swiper('.swiper-container', {
            loop:true,
            autoplay: {
            delay: 4500,
            disableOnInteraction: false,
            },
            scrollbar: {
            el: '.swiper-scrollbar',
            hide: true,
            },
        });
        $(".ranking").click(function(){
    
            $(this).animate({width: 900},600);
        }).mouseleave(function(){
            $(this).animate({width: 40},600);
        });
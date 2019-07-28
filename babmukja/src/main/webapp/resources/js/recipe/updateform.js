/**
 * 레시피 수정폼
 */

let cautions = [];
cautions = $("#hiddenCaution").val().split(",");

for(let caution of cautions){
	$("input[value='"+ caution + "']").attr("checked","checked");
}
$("input[value='"+ $("#hiddenCountry").val() 	+ "']").prop("checked","checked");
$("input[value='"+ $("#hiddenSituation").val()  + "']").prop("checked","checked");
$("input[value='"+ $("#hiddenLevel").val() 		+ "']").prop("checked","checked");
$("input[value='"+ $("#hiddenTime").val() 		+ "']").prop("checked","checked");
$("input[value='"+ $("#hiddenType").val()    	+ "']").prop("checked","checked");

let keywords= [];

const value = $("#hiddenValue").text();
const no = $("#hiddenNo").text();

let fileList="";
const editor = new EditorJS({
    holderId: 'editorjs',

        autofocus: true,
        data: JSON.parse(value),
        tools: { 
            warning: {
                class: Warning,
                inlineToolbar: true                 
            },
 
            table: {
                class: Table,
                inlineToolbar: true,
                config: {
                    rows: 2,
                    cols: 3,
                },
            },                       
            quote: {
                class: Quote,
                inlineToolbar: true
                
            },

			image: {
                class: ImageTool,
                config: {
                    uploader: {
                        uploadByFile(file){

                            function imgUpload() {
                                console.dir(file);
                                let fileData = new FormData();
                                
                                    fileData.append("attach", file);  
                                
                            return new Promise(function (resolve, reject) {
                                $.ajax({
                                    url: 'upload.do',
                                    type: "post",
            	   					processData: false,
                                  	contentType: false,
                                    data: fileData,
                                    success: function (response) {
                                        
                                    	if (response) {	
                                    		console.dir(response);
                                    		var obj = JSON.parse(response);
                                        	resolve({
	                                            cnt: 1,
	                                            url: pageContext + obj.path+"&sysname=" + obj.sysname
	                                        });
                                        }
                                    },
                                    error: function () {
                                        reject(new Error("imgUpload 실패함"));
                                    }
                                });
                            });
                        }

                        return imgUpload().then((result) => {
                            return {
                                success: result.cnt,
                                file: {
                                    url: result.url,
                                }
                            };
                        });
                    }
                }
            }
        },            

        header: {
            class: Header,
            inlineToolbar: ['link']
        }, 
        checklist: {
            class: Checklist,
            inlineToolbar: true,
        },
        linkTool: {
            class: LinkTool,
            config: {
                endpoint: 'http://127.0.0.1:5500', // Your backend endpoint for url data fetching
            }
        },
        marker: {
            class: Marker,
            shortcut: 'ALT+M'
        },
        list: {
            class: List,
            "data":{
            	"style":"ordered"
            },
            inlineToolbar: ['link', 'bold']
        },
        embed: {
            class: Embed,
            inlineToolbar: false,
            config: {
                services: {
                    youtube: true,
                    coub: true
                }    
            }
        }
    }
});

let saveBtn = document.querySelector("button");
saveBtn.addEventListener("click", function () {    			

   let recipeTitle = $("#title").val();
   if(recipeTitle == "" || recipeTitle == null) {
	   alert("제목을 입력해주세요.")
	   return;
   }
    editor.save().then((outputData)=>{

       let cnt = 0;
       for(let fileUrl of outputData.blocks){
    	   
          if(fileUrl.type == 'image'){
             fileList += (cnt==0)?fileUrl.data.file.url:","+fileUrl.data.file.url;   
             cnt++;
          }
       }
       if($("input[name='caution']:checked").val() == null) {
    	   alert("주의사항 키워드를 하나 이상 선택해주세요.");
    	   return;
       }

       let keywords = []; 
       let keyword = "";
       keywords.push($("input[name='country']:checked").val());
       keywords.push($("input[name='situation']:checked").val());
       keywords.push($("input[name='level']:checked").val());
       keywords.push($("input[name='taketime']:checked").val());
       keywords.push($("input[name='foodtype']:checked").val());
         
       let cautions = [];
       $("input[name='caution']:checked").each(function(){
    	   cautions.push($(this).val());
       });
		
       let content = JSON.stringify(outputData);
       let title= $("#title").val();   
       
       let imgPath = "";
       if(fileList == "") imgPath = "";
       else if(fileList != "" && cnt == 1) imgPath = fileList;
       else imgPath = fileList.split(",")[0]; 
		
       let form = new FormData();
       form.append("imgPath",imgPath);
       form.append("content",content);
       form.append("keywords",keywords);
       form.append("cautions",cautions);
       form.append("title",title);
       form.append("recipeNo",no);
       $.ajax({
       	  type: "post",
       	  processData : false,
       	  contentType : false,
          url:"update.do",
          data: form,
          success:function(result){    
        	  alert("레시피가 수정되었습니다.");
          }
       });                
      	 location.href= url;
    }).catch((error)=>{
        console.log("Saving failed : ", error);
    });
});
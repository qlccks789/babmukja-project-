/**
 * 레시피 등록폼
 */

let fileList="";
const editor = new EditorJS({
    holderId: 'editorjs',
    autofocus: false,
    data: {"time":1557295973064,
    	"blocks":[
    		{"type":"image","data":{"name":"","message":""}}
    		]
			,"version":"2.13.0"},
    tools: { 
        warning: {
            class: Warning,
            inlineToolbar: true,
            shortcut: 'CMD+SHIFT+W',
            config: {
                titlePlaceholder: '주의사항',
                messagePlaceholder: '내용을 입력해주세요',
                },
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
                inlineToolbar: true,
                shortcut: 'CMD+SHIFT+O',
            config: {
                quotePlaceholder: '내용을 입력해주세요',
                captionPlaceholder: '출처',
            },
        },
    image: {
            class: ImageTool,
            config: {
                uploader: {
                    uploadByFile(file){

                        function imgUpload() {
                            console.dir(file);
                            if(file.size > 20 * 1024 * 1024 ) {
                            	alert("첨부파일 사이즈는 20MB 이내로 등록 가능합니다.");

                            	return;
                            }
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
                                             url: pageContext + obj.path + "&sysname=" + obj.sysname
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
    console.dir(editor);
    editor.save().then((outputData)=>{

       let cnt = 0;
       for(let fileUrl of outputData.blocks){
    	   
          if(fileUrl.type == 'image'){
             fileList += (cnt==0)?fileUrl.data.file.url:","+fileUrl.data.file.url;   
             cnt++;
          }
       }
       
       
       if($("input[name='country']:checked").val() == null) {
    	   alert("나라별 키워드를 선택해주세요.");
    	   return;
       }
       if($("input[name='caution']:checked").val() == null) {
    	   alert("주의사항 키워드를 하나 이상 선택해주세요.");
    	   return;
       }
       if($("input[name='situation']:checked").val() == null) {
    	   alert("상황 키워드를 선택해주세요.");
    	   return;
       }
       if($("input[name='level']:checked").val() == null) {
    	   alert("난이도 키워드를 선택해주세요.");
    	   return;
       }
       if($("input[name='taketime']:checked").val() == null) {
    	   alert("조리시간 키워드를 선택해주세요.");
    	   return;
       }
       if($("input[name='foodtype']:checked").val() == null) {
    	   alert("종류 키워드를 선택해주세요.");
    	   return;
       }
       let keywords = []; 
       let keyword = "";
       keywords.push($("input[name='country']:checked").val());
       keywords.push($("input[name='situation']:checked").val());
       keywords.push($("input[name='level']:checked").val());
       keywords.push($("input[name='taketime']:checked").val());
       keywords.push($("input[name='foodtype']:checked").val());
         
       console.log("fileList : " + fileList);
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
       
       $.ajax({
       	  type: "post",
          url:"write.do",
       	  processData : false,
       	  contentType : false,
          data: form,
          success:function(result){               
          }
       });                
  
         location.href= url;
    }).catch((error)=>{
        console.log("Saving failed : ", error);
    });
});
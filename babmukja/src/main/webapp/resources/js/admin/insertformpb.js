(function($) {
    let changeComma = function (val) {
        val = val.toString().replace(/,/g, ""); 
        let pattern = /(^[+-]?\d+)(\d{3})/;   
        while (pattern.test(val)) {
            val = val.replace(pattern, "$1" + "," + "$2");
        }
        return val;
    };
     
    $.fn.comma = function() { 
    let ele = this;

    this.keyup(function () {
        ele.val(changeComma(ele.val()));    
    });
  };
  
})(jQuery);

$("#price").comma();

	let fileList="";
	const editor = new EditorJS({
        holderId: 'editorjs',

        autofocus: true,
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
                },
            },
            
			image: {
                class: ImageTool,
                config: {
                	captionPlaceholder: '#키워드를 입력해주세요',
                    uploader: {
                        uploadByFile(file){

                            function imgUpload() {
                                let fileData = new FormData();
                                
                                    fileData.append("attach", file);  
                                    
                                return new Promise(function (resolve, reject) {
                                    $.ajax({
                                        url: '/babmukja/store/uploadpb.do',
                                        type: "post",
                	   					processData: false,
                                      	contentType: false,
                                        data: fileData,
                                        success: function (response) {
                                            
                                        	if (response) {	
                                        		var obj = JSON.parse(response);
                                            	resolve({
		                                            cnt: 1,
		                                            url: "/babmukja/store/downloadpb.do?path="+obj.path+"&sysname=" + obj.sysname
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
    	let storeName = $("#name").val();
    	let storePrice = $("#price").val();
        editor.save().then((outputData)=>{
        	
        	let cnt = 0;
        	for(let fileUrl of outputData.blocks){
        		if(fileUrl.type == 'image'){
	            	fileList += (cnt==0)?fileUrl.data.file.url:","+fileUrl.data.file.url;   
	            	cnt++;
        		}
        	}
        	
        	let content = JSON.stringify(outputData);
        	let name= $("#name").val();
        	let price= $("#price").val().replace(/,/g, "");
        	$.ajax({
				type: "post",
   					url:"insertpb.do",
					data: {content : content,
							 name : name,
							 price : price,
							 imgPath : fileList},
					success:function(result){
		                location.href= saveUrl;
					}
        	});
        }).catch((error)=>{
            console.log("Saving failed : ", error);
        });
    });
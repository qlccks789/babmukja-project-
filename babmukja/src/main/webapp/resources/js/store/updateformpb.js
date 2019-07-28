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
    
    	const value = $("#hiddenValue").text();
    	const no = $("#hiddenNo").text();
    	
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
                                    let fileData = new FormData();
                                        fileData.append("attach", file);  
                                    return new Promise(function (resolve, reject) {
                                        $.ajax({
                                            url: 'uploadpb.do',
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
        	let storepbName = $("#name").val();
        	let storepbPrice = $("#price").val();
            editor.save().then((outputData)=>{
            	let content = JSON.stringify(outputData);
            	let name= $("#name").val();
            	let price= $("#price").val().replace(/,/g, "");
            	$.ajax({
					type: "post",
	   					url:"updatepb.do",
						data: {content : content,
								 name : name,
								 price : price,
								  pbNo : no},
						success:function(result){
						}
            	});
                location.href= saveUrl;
            }).catch((error)=>{
                console.log("Saving failed : ", error);
            });
        });
$(function() {
    $("#product_img_file").on("change", function(){
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; 
        if (/^image/.test( files[0].type)){ 
            var reader = new FileReader(); 
            reader.readAsDataURL(files[0]); 
            reader.onloadend = function(){ 
             $('.image_container').css({
                 "background-image":
                     "url(" + this.result + ")",
                     "background-size":
                     "contain",
                     "background-repeat":
                     "no-repeat",
                   }
                );
            };
        }
    });
});

$("#pb_insert_cancle_button").click(function () {
	window.location.href= url;
});

let $sec2 = $("#updateform-sec2");
let userProfile = $("#profile-picture").attr("src");
let userNickname = $("#updateform-sec2-userinfo-id").text();
let userNo = $("input[name='memNo']").val();
let visitorNo = $("input[name='visitor']").val();
let followCnt = $("input[name='follow']").val();
let followerCnt = $("input[name='follower']").val();
let recipeCnt = $("input[name='recipeCnt']").val();
let followStatus = $("input[name='followStatus']").val();

var camera, scene, renderer;
var selectBox;
var textMesh;
var basketMesh;
var sphereMesh;
var frypanMesh;
var apronMesh;

var recipeTextMesh;
var scrapbookTextMesh;
var updateuserTextMesh;
var writtenmoveTextMesh;

let writtenmoveTextFlag = false;
let writtenmoveTextFlagKey = false;

let updateuserTextFlag = false;
let updateuserTextFlagKey = false;

let scrapbookTextFlag = false;
let scrapbookTextFlagKey = false;

let recipeTextFlag = false;
let recipeTextFlagKey = false;

let recipeAreaFlag = false;
let selectBoxFlag = false;
let textMeshFlag = false;
let basketMeshFlag = false;
let frypanMeshFlag = false;
let apronMeshFlag = false;

let dataTableFlag = false;

let rotZ = 0;
var isUserInteracting = false,
	onMouseDownMouseX = 0, onMouseDownMouseY = 0,
	lon = 0, onMouseDownLon = 0,
	lat = 0, onMouseDownLat = 0,
	phi = 0, theta = 0;
init();
animate();
let memNo;
function init() {
    
	$("#open-filter").click(function(){
		$(this).hide();
		recipeTextFlag = true;
		memNo = $("input[name='memNo']").val();
	});
	var container, mesh;
	container = document.getElementById( 'container' );
	camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1,600 );
	camera.target = new THREE.Vector3( 0, 0, 0 );
	scene = new THREE.Scene();
	var geometry = new THREE.SphereBufferGeometry( 600, 60, 40 );
	// invert the geometry on the x-axis so that all of the faces point inward
	geometry.scale( - 1, 1, 1 );
	var texture = new THREE.TextureLoader().load( '/babmukja/resources/images/kitchenenvironment.jpg' );
	var material = new THREE.MeshBasicMaterial( { map: texture } );
	mesh = new THREE.Mesh( geometry, material );
	scene.add( mesh );
	renderer = new THREE.WebGLRenderer();
	renderer.setPixelRatio( window.devicePixelRatio );
	renderer.setSize( window.innerWidth, window.innerHeight );
	container.appendChild( renderer.domElement );
	document.addEventListener( 'mousedown', onPointerStart, false );
	document.addEventListener( 'mousemove', onPointerMove, false );
	document.addEventListener( 'mouseup', onPointerUp, false );
	document.addEventListener( 'wheel', onDocumentMouseWheel, false );
	document.addEventListener( 'touchstart', onPointerStart, false );
	document.addEventListener( 'touchmove', onPointerMove, false );
	document.addEventListener( 'touchend', onPointerUp, false );
	//
	document.addEventListener( 'dragover', function ( event ) {
		event.preventDefault();
		event.dataTransfer.dropEffect = 'copy';
	}, false );
	document.addEventListener( 'dragenter', function () {
		document.body.style.opacity = 0.5;
	}, false );
	document.addEventListener( 'dragleave', function () {
		document.body.style.opacity = 1;
	}, false );
	document.addEventListener( 'drop', function ( event ) {
		event.preventDefault();
		var reader = new FileReader();
		reader.addEventListener( 'load', function ( event ) {
			material.map.image.src = event.target.result;
			material.map.needsUpdate = true;
		}, false );
		reader.readAsDataURL( event.dataTransfer.files[ 0 ] );
		document.body.style.opacity = 1;
	}, false );
	//
	window.addEventListener( 'resize', onWindowResize, false );
	sphereMesh = mesh;
}

function onWindowResize() {
	camera.aspect = window.innerWidth / window.innerHeight;
	camera.updateProjectionMatrix();
	renderer.setSize( window.innerWidth, window.innerHeight );
}
function onPointerStart( event ) {
	isUserInteracting = true;
	var clientX = event.clientX || event.touches[ 0 ].clientX;
	var clientY = event.clientY || event.touches[ 0 ].clientY;
	onMouseDownMouseX = clientX;
	onMouseDownMouseY = clientY;
	onMouseDownLon = lon;
	onMouseDownLat = lat;
}
function onPointerMove( event ) {
	if ( isUserInteracting === true ) {
		var clientX = event.clientX || event.touches[ 0 ].clientX + 1000;
		var clientY = event.clientY || event.touches[ 0 ].clientY + 1000;
		lon = ( onMouseDownMouseX - clientX ) * 0.1 + onMouseDownLon;
		lat = ( clientY - onMouseDownMouseY ) * 0.1 + onMouseDownLat;
	}
}
function onPointerUp() {
	isUserInteracting = false;
}
function onDocumentMouseWheel( event ) {
	var fov = camera.fov + event.deltaY * 0.1;
	camera.fov = THREE.Math.clamp( fov, 10, 75 );
	camera.updateProjectionMatrix();
}

function update() {
	if ( isUserInteracting === false ) {
		lon += 0.0;
	}
	lat = Math.max( - 85, Math.min( 85, lat ) );
	phi = THREE.Math.degToRad( 90 - lat );
	theta = THREE.Math.degToRad( lon );
	camera.target.x = 500 * Math.sin( phi ) * Math.cos( theta );
	camera.target.y = 500 * Math.cos( phi );
	camera.target.z = 500 * Math.sin( phi ) * Math.sin( theta );
	camera.lookAt( camera.target );
	/*
	// distortion
	// camera.position.copy( camera.target ).negate();
	*/
	renderer.render( scene, camera );
}
    //-------------------------- box loading part ----------------------------------//
	var bookGeometry1 = new THREE.BoxBufferGeometry( 4, 5, 1 );
	var bookMaterials1 = [
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-front.jpg'),side: THREE.FrontSide} ),//RIGHT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-back.jpg'),side: THREE.FrontSide} ),// LEFT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-back.jpg'),side: THREE.FrontSide} ),// TOP SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-back.jpg'),side: THREE.FrontSide} ),// BOTTOM SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/scrapbookdefault.jpg'),side: THREE.FrontSide} ),//FRONT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/scrapbookdefault.jpg'),side: THREE.FrontSide} ),//BACK SIDE
	];
	var book1 = new THREE.Mesh( bookGeometry1, bookMaterials1 );
	book1.position.x = -24;
	book1.position.y = -15;
	book1.position.z = 19;
	book1.rotation.y = -1.2;
	var bookGeometry2 = new THREE.BoxBufferGeometry( 4, 5, 1 );
	var bookMaterials2 = [
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-front.jpg'),side: THREE.FrontSide} ),//RIGHT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-back.jpg'),side: THREE.FrontSide} ),// LEFT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-back.jpg'),side: THREE.FrontSide} ),// TOP SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-back.jpg'),side: THREE.FrontSide} ),// BOTTOM SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/scrapbookdefault.jpg'),side: THREE.FrontSide} ),//FRONT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/scrapbookdefault.jpg'),side: THREE.FrontSide} ),//BACK SIDE
	];
	var book2 = new THREE.Mesh( bookGeometry2, bookMaterials2 );
	book2.position.x = -24;
	book2.position.y = -15;
	book2.position.z = 22;
	book2.rotation.y = -1.2;
	
	var bookGeometry3 = new THREE.BoxBufferGeometry( 4, 5, 1 );
	var bookMaterials3 = [
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-front.jpg'),side: THREE.FrontSide} ),//RIGHT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-back.jpg'),side: THREE.FrontSide} ),// LEFT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-back.jpg'),side: THREE.FrontSide} ),// TOP SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/recipebook-back.jpg'),side: THREE.FrontSide} ),// BOTTOM SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/scrapbookdefault.jpg'),side: THREE.FrontSide} ),//FRONT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/scrapbookdefault.jpg'),side: THREE.FrontSide} ),//BACK SIDE
	];
	var book3 = new THREE.Mesh( bookGeometry3, bookMaterials3 );
	book3.position.x = -24;
	book3.position.y = -15;
	book3.position.z = 25;
	book3.rotation.y = -1.2;
	
	var recipeAreaGeometry = new THREE.BoxBufferGeometry( 0.3,6,11);
	var recipeAreaMaterials= [
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/boardframe.jpg'),side: THREE.FrontSide} ),//RIGHT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/boardfront.jpg'),side: THREE.FrontSide} ),// LEFT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/boardframe.jpg'),side: THREE.FrontSide} ),// TOP SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/boardframe.jpg'),side: THREE.FrontSide} ),// BOTTOM SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/boardframe.jpg'),side: THREE.FrontSide} ),//FRONT SIDE
		new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('/babmukja/resources/images/boardframe.jpg'),side: THREE.FrontSide} ),//BACK SIDE
	];
	var recipeArea = new THREE.Mesh( recipeAreaGeometry,recipeAreaMaterials );
	recipeArea.position.x = 10;
	recipeArea.position.y = 3;
	recipeArea.position.z = -14;
	
	recipeArea.on("click",function(){
		recipeAreaFlag = true;
	}).on("pointerout",function(){
		recipeAreaFlag = false;
		recipeArea.rotation.x = 0;
	});

	
	
	scene.add( book1 );
	scene.add( book2 );
	scene.add( book3 );
	scene.add( recipeArea );

	
	//-------------------------- Geometry loading part------------------------------//
	
	var loader = new THREE.GLTFLoader();
	THREE.DRACOLoader.setDecoderPath( '/js/draco' );
	loader.setDRACOLoader( new THREE.DRACOLoader() );
	// Load a glTF resource
	loader.load(
		// resource URL
		'/babmukja/resources/images/frypan.gltf',
		// called when the resource is loaded
		function ( gltf ) {
			let hundredSize = 100;
			frypanMesh = gltf.scene;
			scene.add( frypanMesh );
			frypanMesh.position.x = 10;
			frypanMesh.position.y = -12;
			frypanMesh.position.z = 5;
			frypanMesh.scale.x = hundredSize;
			frypanMesh.scale.y = hundredSize;
			frypanMesh.scale.z = hundredSize;
							
			frypanMesh.rotation.x = 0;
			frypanMesh.rotation.y = 0;
			frypanMesh.rotation.z = 0;
			
			frypanMesh.on('click',function(ev){
				frypanMeshFlag = true;
			})
			sphereMesh.on('click',function(){
				frypanMeshFlag = false;
				frypanMesh.rotation.x = 0;
				frypanMesh.rotation.y = 1;
				frypanMesh.rotation.z = 0;
				frypanMesh.position.y = -12;
			});
		},
		// called while loading is progressing
		function ( xhr ) {

			console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

		},
		// called when loading has errors
		function ( error ) {

			console.log( 'An error happened' );

		}
	);
	var basketMesh;
	loader.load(
		// resource URL
		'/babmukja/resources/images/basket.gltf',
		// called when the resource is loaded
		function ( gltf ) {
			basketMesh = gltf.scene;
			let boxSize = 80;
			scene.add( basketMesh );
			console.dir(basketMesh.position);
			basketMesh.position.x = -10;
			basketMesh.position.y = -60;
			basketMesh.position.z = 30;
			basketMesh.scale.x = boxSize;
			basketMesh.scale.y =boxSize;
			basketMesh.scale.z = boxSize;
			console.dir(basketMesh.scale);
							
			basketMesh.rotation.x = 0;
			basketMesh.rotation.y = 1;
			basketMesh.rotation.z = 0;
			
			basketMesh.on('mouseover',function(ev){
				// alert("오 개신기"+ev);
			}).on('click',function(){
				if(visitorNo == userNo){
					basketMeshFlag = true;					
				}
			});
			sphereMesh.on('click',function(){
				basketMesh.scale.y = boxSize;
				basketMeshFlag = false;
				basketMesh.position.y = -60;
			});
		},
		// called while loading is progressing
		function ( xhr ) {

			console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

		},
		// called when loading has errors
		function ( error ) {

			console.log( 'An error happened' );

		}
	);
	
	loader.load(
		// resource URL
		'/babmukja/resources/images/mainmove.gltf',
		// called when the resource is loaded
		function ( gltf ) {
			textMesh = gltf.scene;
			scene.add( textMesh );
			console.dir(textMesh.position);
			let size = 20;
			textMesh.position.x = -130;
			textMesh.position.y = -3;
			textMesh.position.z = -60;
			textMesh.scale.x = size;
			textMesh.scale.y = size;
			textMesh.scale.z = size;
			console.dir(textMesh.scale);
							
			textMesh.rotation.x = 1.4;
			textMesh.rotation.y = 0.1;
			textMesh.rotation.z = -1.3;

			plane.on('mouseover',function(ev){
				// alert("오 개신기"+ev);
				textMeshFlag = true;
				textMesh.scale.x = size*1.2;
				textMesh.scale.y = size*1.2;
				textMesh.scale.z = size*1.2;
				
			}).on('pointerout',function(){
				textMeshFlag = false;
				textMesh.scale.x = size;
				textMesh.scale.y = size;
				textMesh.scale.z = size;
				textMesh.rotation.y = 0.1;
			}).on('click',function(){
				location.href="/babmukja/recipe/main.do";
			});
		},
		// called while loading is progressing
		function ( xhr ) {

			console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

		},
		// called when loading has errors
		function ( error ) {

			console.log( 'An error happened' );

		}
	);
	loader.load(
		// resource URL
		'/babmukja/resources/images/apron.gltf',
		// called when the resource is loaded
		function ( gltf ) {
			apronMesh = gltf.scene;
			scene.add( apronMesh );
			console.dir(apronMesh.position);
			let size = 20;
			apronMesh.position.x = 2;
			apronMesh.position.y = -3;
			apronMesh.position.z = -3;
			apronMesh.scale.x = size;
			apronMesh.scale.y = size;
			apronMesh.scale.z = size;
							
			apronMesh.rotation.x = 0;
			apronMesh.rotation.y = -1.5;
			apronMesh.rotation.z = 0;
			apronMesh.on("click",function(){
				apronMeshFlag = true;
			}).on("pointerout",function(){
				apronMeshFlag = false;
				apronMesh.rotation.x = 0;
			});

		},
		// called while loading is progressing
		function ( xhr ) {

			console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

		},
		// called when loading has errors
		function ( error ) {

			console.log( 'An error happened' );

		}
	);
	loader.load(
		// resource URL
		'/babmukja/resources/images/recipemovetext.gltf',
		// called when the resource is loaded
		function ( gltf ) {
			recipeTextMesh = gltf.scene;
			scene.add( recipeTextMesh );
			console.dir(recipeTextMesh.position);
			let size = 0.7;
			recipeTextMesh.position.x = 3;
			recipeTextMesh.position.y = -3;
			recipeTextMesh.position.z = 3;
			recipeTextMesh.scale.x = size;
			recipeTextMesh.scale.y = size;
			recipeTextMesh.scale.z = size;
							
			recipeTextMesh.rotation.x = 0.2;
			recipeTextMesh.rotation.y = -2.3;
			recipeTextMesh.rotation.z = 0.3;
			recipeTextFlagKey = true;

		
		},
		// called while loading is progressing
		function ( xhr ) {

			console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

		},
		// called when loading has errors
		function ( error ) {

			console.log( 'An error happened' );

		}
	);

	let scrapbookAlreadyFlag = false;

	if(visitorNo == userNo){
		var selectBoxM2 = new THREE.MeshBasicMaterial( { color: 0x00ffaa,transparent :true, opacity:0.4} );
		var selectBoxG = new THREE.BoxGeometry(4, 5, 1);
		
		selectBox = new THREE.Mesh( selectBoxG, selectBoxM2 );

		selectBox.on("mouseover",function(){
			selectBoxFlag = true;
		}).on("pointerout",function(){
			selectBoxFlag = false;
		}).on("click",function(){
			$("#modal-scrapbook").modal("show");
			if(!scrapbookAlreadyFlag){
					$.ajax({
						url : "scrapbookAjax.do",
						data : {memNo : userNo}
					}).done(function(list){
						let i = 0;
						for(let book of list){
							let html = "";
							html +='<div class="scrapbook-content">';
							html +=		'<div class="scrapbooks-title-conatiner">';
							html +=			'<p>'+book.title+'</p>';
							html +=		'</div>';
							html +=     '<div class="scrapbooks-turn" id="scrapbooks-turn'+i+'">'; 
							html +=			'<div class="scrapbooks hard" style="background:url('+ book.imgPath +')"></div>';
							html +=			'<div class="hard inner-cover-text" >'+book.title+'</div>';
							html +=          book.content;
							if(book.content){
								let count = (book.content.match(/div/g) || []).length/2;
								if(count % 2 != 0){
									html +=			'<div style="background:url(/babmukja/resources/images/scrapbookdefault-innercover.jpg);background-size:cover;"></div>';
								}								
							}
							html +=			'<div class="hard" style="background:url(/babmukja/resources/images/scrapbookdefault-innercover.jpg);background-size:cover;"></div>';
							html +=			'<div class="hard" style="background:url(/babmukja/resources/images/scrapbookdefault-outercover.jpg);background-size:cover;"></div>';
							html +=     '</div>'; 
							html +='</div>';
							$("#scrapbook-wrapper").append(html);
							
							$("#scrapbooks-turn" + i).turn({
								width : 950,
								height : 630,
								elevation : 50   
							}).css({marginBottom : "15px;"}).find(".scrapbooks").css({backgroundSize:"cover" });
							
							i++;
						}
						
					});
					scrapbookAlreadyFlag = true;
			}
		});
		selectBox.position.x = -21;
		selectBox.position.y = -15;
		selectBox.position.z = 11;
		selectBox.rotation.y = -1.2;

		scene.add( selectBox );
		loader.load(
				// resource URL
				'/babmukja/resources/images/scrapbooktext.gltf',
				// called when the resource is loaded
				function ( gltf ) {
					scrapbookTextMesh = gltf.scene;
					scene.add( scrapbookTextMesh );
					console.dir(scrapbookTextMesh.position);
					let size = 5;
					scrapbookTextMesh.position.x = -23.5;
					scrapbookTextMesh.position.y = -13;
					scrapbookTextMesh.position.z = 12.5;
					scrapbookTextMesh.scale.x = size;
					scrapbookTextMesh.scale.y = size;
					scrapbookTextMesh.scale.z = size;	
					scrapbookTextMesh.rotation.y = 2;
					scrapbookTextFlagKey = true;
					
					
				},
				// called while loading is progressing
				function ( xhr ) {
					
					console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
					
				},
				// called when loading has errors
				function ( error ) {
					
					console.log( 'An error happened' );
					
				}
		);
	}
	loader.load(
		// resource URL
		'/babmukja/resources/images/updateusertext.gltf',
		// called when the resource is loaded
		function ( gltf ) {
			updateuserTextMesh = gltf.scene;
			scene.add( updateuserTextMesh );
			console.dir(updateuserTextMesh.position);
			let size = 1.5;
			updateuserTextMesh.position.x = 0;
			updateuserTextMesh.position.y = -3.5;
			updateuserTextMesh.position.z = -10;
			updateuserTextMesh.scale.x = size;
			updateuserTextMesh.scale.y = size;
			updateuserTextMesh.scale.z = size;	
			updateuserTextFlagKey = true;

		
		},
		// called while loading is progressing
		function ( xhr ) {

			console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

		},
		// called when loading has errors
		function ( error ) {

			console.log( 'An error happened' );

		}
	);
	loader.load(
		// resource URL
		'/babmukja/resources/images/writtenmovetext.gltf',
		// called when the resource is loaded
		function ( gltf ) {
			writtenmoveTextMesh = gltf.scene;
			scene.add( writtenmoveTextMesh );
			console.dir(writtenmoveTextMesh.position);
			let size = 1.2;
			writtenmoveTextMesh.position.x = 0;
			writtenmoveTextMesh.position.y = 1;
			writtenmoveTextMesh.position.z = -8;
			writtenmoveTextMesh.scale.x = size;
			writtenmoveTextMesh.scale.y = size;
			writtenmoveTextMesh.scale.z = size;	
			writtenmoveTextFlagKey = true;

		
		},
		// called while loading is progressing
		function ( xhr ) {

			console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

		},
		// called when loading has errors
		function ( error ) {

			console.log( 'An error happened' );

		}
	);
//------------------------plane ---------------------------------------//
var planeG = new THREE.PlaneGeometry( 60, 30, 1 );
var planeM = new THREE.MeshBasicMaterial( {transparent: true, opacity: 0} );
//var planeM = new THREE.MeshBasicMaterial( {color: 0x00ff00} );
var plane = new THREE.Mesh( planeG, planeM );
scene.add( plane );
plane.position.x = -110;
plane.position.y = -8;
plane.position.z = -50;
plane.rotation.y = 1.4;
//------------------------lighting ------------------------------------//
// var pointLight = new THREE.PointLight( 0xffff95, 6, 150 );
var pointLight = new THREE.PointLight( 0xffff95, 6, 150 );
var directionalLight = new THREE.DirectionalLight( 0xffff95, 2, 110 );
directionalLight.position.set( -12, 3, -10 );
pointLight.position.set( 50, 50, 50 );
scene.add( directionalLight );
scene.add( pointLight );

//------------------------interaction---------------------------------//
var interaction = new THREE.Interaction(renderer, scene, camera);

let velo = 0.1;
function animate() {
	requestAnimationFrame( animate );
	
	if(textMeshFlag){
		textMesh.rotation.y += 0.04;
	}
	
	if(basketMeshFlag){
		basketMesh.position.y += velo;
		if(velo < 0.5){
			velo += 0.1;
		}
		if(basketMesh.position.y > -40){
			basketMesh.position.y = -40;
			location.href = "/babmukja/store/buyList.do?memNo=" + userNo;
		}
	}
	
	if(recipeAreaFlag){
		if(recipeArea.rotation.x <= 0.1) recipeArea.rotation.x+=0.01;
		if(recipeArea.rotation.x > 0.109){
			$('#modal-detail').modal("show");
			$.ajax({
				type: "POST",
				url: "/babmukja/recipe/recipebyno.do",
				data: {memNo : memNo}
			}).done(function(response){
				let htmlData = "";
				for(let recipe of response){
					htmlData += 
							"<tr>" 
						  	+"<td>" + recipe.title +"</td>"
						  	+"<td>" + dateFormat(new Date(recipe.regDate)) +"</td>";
					htmlData +='<td><img src="';
					htmlData += recipe.imgPath;
					htmlData += '"';
					htmlData += 'onerror=\'this.src="/babmukja/resources/images/default.png"\'></td>';						
					htmlData +=
						  	"<td>" + recipe.rating+"</td>"
						  	+"<td>" + recipe.likeCnt+"</td>"
						  	+"<td>" + recipe.scrapCnt+"</td>"
							+"</tr>";
				}
				$("#tbody").html(htmlData);
				
				if(!dataTableFlag){
					var table = $('#writtenrecipe').DataTable({
						"order":[[0,"asc"]]
					});
					dataTableFlag = true;
				}
			});
		}
	}
	if(frypanMeshFlag){
		if(frypanMesh.position.y < -7){
			frypanMesh.position.y += 0.2;
			frypanMesh.rotation.x += 0.48;
		}
		if(frypanMesh.position.y > -6.9) location.href= "/babmukja/recipe/writeform.do";
	}
	if(selectBoxFlag){
		selectBox.rotation.y += 0.1;
	}
	if(recipeTextFlag){
		
		recipeTextMesh.position.y += 0.001;
		if(recipeTextMesh.position.y > -2.9){
			recipeTextFlag = false;
		}
	}else if(recipeTextFlagKey && !recipeTextFlag){
		recipeTextMesh.position.y -= 0.001;
		if(recipeTextMesh.position.y < -3.2){
			recipeTextFlag = true;
		}
	
	}
	if(visitorNo == userNo){		
		if(scrapbookTextFlag){
			
			scrapbookTextMesh.position.y += 0.006;
			if(scrapbookTextMesh.position.y > -12){
				scrapbookTextFlag = false;
			}
		}else if(recipeTextFlagKey && !scrapbookTextFlag){
			scrapbookTextMesh.position.y -= 0.006;
			if(scrapbookTextMesh.position.y < -13.2){
				scrapbookTextFlag = true;
			}
			
		}
	}
	if(updateuserTextFlag){
		
		updateuserTextMesh.position.x -= 0.002;
		if(updateuserTextMesh.position.x < -0.1 ){
			updateuserTextFlag = false;
		}
	}else if(updateuserTextFlagKey && !updateuserTextFlag){
		updateuserTextMesh.position.x += 0.002;
		if(updateuserTextMesh.position.x > 0.2){
			updateuserTextFlag = true;
		}
	
	}
	if(writtenmoveTextFlag){
		
		writtenmoveTextMesh.position.x -= 0.002;
		if(writtenmoveTextMesh.position.x < -0.1 ){
			writtenmoveTextFlag = false;
		}
	}else if(writtenmoveTextFlagKey && !writtenmoveTextFlag){
		writtenmoveTextMesh.position.x += 0.002;
		if(writtenmoveTextMesh.position.x > 0.2){
			writtenmoveTextFlag = true;
		}
	
	}
	
	if(apronMeshFlag){
		$("#modal-user-detail").modal("show");
	}
	update();
}

//timestamp 날짜형식 바꾸는 함수
function dateFormat(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '.' + pad(date.getMonth()+1) + '.' + pad(date.getDate());
}


for(let i=1;i<=2;i++){
    $("#updateform-sec1-menu"+i).click(function(){
        $(this).css({background:"white"});
        $(this).siblings().css({background:"lightgray"});
        let html = "";
        switch(i){
            case 1:
            	
            	html+= '<div id="check-userinfo">';
	            html+= 	'<div id="updateform-sec2-imgSelector">';
	            html+= 	'<img id="profile-picture" src="'+userProfile+'">';
	            html+= 	'</div>';
	            html+= 	'<div id="updateform-sec2-userinfo">';
	            html+= 		'<p id="updateform-sec2-userinfo-id">'+ userNickname +'</p>';
	            html+= 		'<div id="updateform-sec2-userinfo-opt">';

	            if(followStatus == 'Y'){
	            	html+=     	'<button id="follow-button">팔로우 해제</button>';
	            	html+=     	'<p>팔로우 중</p>';	            	
	            }else if(followStatus == 'N'){
	            	html+=     	'<button id="follow-button" class="follow-needed">팔로우</button>';	            	
	            }else if(followStatus == 'M'){	            	
	            	html+=     	'<button id="profile-change-button">프로필 사진 변경</button>';	            	
	            }
	            html+= 		'</div>';
	            html+= 		'<p id="updateform-sec2-userinfo-info">';
			    html+=         	'작성한 레시피<b>'+ recipeCnt + '</b>';
			    html+=         	'팔로우<b>'+ followCnt +'</b>';
			    html+=         	'팔로워<b>'+ followerCnt +'</b>';
		        html+=     	'</p>';
	            html+= 	'</div>';
            	html+= '</div>';
            $sec2.html(html);
            break;
            case 2:
                $sec2.html(
                    `<div id="change-pass">
                        <p id="change-pass-notice1">영어, 숫자 특수문자 합쳐서 8자리 이상 입력해주세요.</p>
                        <input type="password" name="pass1">
                        <p id="change-pass-notice2"></p>
                        <input type="password" name="pass2">
                        <p id="change-pass-notice3"></p>
                        <div id="change-pass-button">비밀번호 변경</div>
                    </div>`
                );
        }
    
    });
}



$(document).on("click","#profile-change-button",function(){
	$("input[name='profile-picture']").click();
});
$(document).on("change","input[name='profile-picture']",function (e) {
   	let fileData = new FormData();
	let path = $(this).val();
   	console.dir(e.target.files[0]);

	var reader = new FileReader();
    reader.readAsDataURL(e.target.files[0]);
    fileData.append("attach",e.target.files[0]);
    fileData.append("memNickname", userNickname);
    
/*     reader.onload = function () {
         var tempImage = new Image();
         tempImage.src = reader.result;
         
         tempImage.onload = function () {
             var canvas = document.createElement('canvas');
             var canvasContext = canvas.getContext("2d");

             canvas.width = 200;
             canvas.height = 200;
             canvasContext.drawImage(this, 0, 0, 200, 200);
                 
             var dataURI = canvas.toDataURL("image/jpeg");
             var imgTag = "<img id='profile-picture' class='preview_img' src='"+dataURI+"'/>";
				 $("#updateform-sec2-imgSelector").html(imgTag);
         };
     };*/
     var result = confirm("프로필 사진을 변경하시겠습니까?");
     if(result){
    	 $.ajax({
    		 url: 'upload.do',
             type: "post",
          	 processData: false,
             contentType: false,
             data: fileData
    	 }).done(function(result){
    		 alert("프로필 사진이 성공적으로 변경되었습니다.");
    		 location.href="/babmukja/member/mypage.do?memNickname=" + result;
    	 });
     }else{
    	 alert("프로필 사진 변경이 취소되었습니다.");
//    	 $("#updateform-sec2-imgSelector").html(`<img src='<c:url value='/resources/images/default/userdefault.png'/>'>`);
    	 return;
     }
     
});

let passFlag = false;
let pass2Flag = false;
let pass = "";
$(document).on("keyup","input[name='pass1']",function(){			
    let $notice2 = $("#change-pass-notice2");
    let $this = $(this);
    if(this == ""){
        return;            				
    }
    if($this.val().length >= 13) {

        $this.val($this.val().substring(0, 13));

    }
    
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test($this.val())){ 
    	$notice2.text("8자 이상 입력해주세요.");
    	$notice2.css({color: "red"});
    }    
    var checkNumber = $this.val().search(/[0-9]/g);
    var checkEnglish = $this.val().search(/[a-z]/ig);
    
    if(checkNumber <0 || checkEnglish <0){
        $notice2.text("숫자와 영문자를 혼용하여야 합니다.");
        $notice2.css({color: "red"});
    }else if(/(\w)\1\1\1/.test($this.val())){
        $notice2.text ("같은 문자를 4번 이상 사용하실 수 없습니다.");
        $notice2.css({color: "red"});
    }else if($this.val().length < 8){
    	$notice2.text ("너무 짧습니다.");
    	$notice2.css({color: "red"});
    	
    }else{
        $notice2.text("사용가능한 비밀번호입니다.");									            				
        $notice2.css({"color" : "springgreen"});	
        passFlag = true;
    }
});

$(document).on("keyup","input[name='pass2']",function(){		
    let $notice3 = $("#change-pass-notice3");
    let $pass1 = $("input[name='pass1']");
    let $pass2 = $(this);
    if($pass1.val().length == 0 || $pass2.val().length == 0){
        return;            				
    }
    if($pass2.val().length >= 13) {

        $pass2.val($pass2.val().substring(0, 13));

    }
    if($pass1.val() != $pass2.val() || !passFlag){
                $notice3.text("비밀번호를 확인해주세요.");									
                $notice3.css({"color" : "red"});	
    }else{
                $notice3.html("확인했습니다.");									            				
                $notice3.css({"color" : "springgreen"});	
                pass2Flag = true;
                pass = $pass1.val();
    }
    
    }            		
);

$(document).on("click","#change-pass-button",function(){
    if(!passFlag || !pass2Flag){
        alert("입력한 비밀번호를 다시 확인해주세요.");
        return;
    }
    $.ajax({
        url:"repass.do",
        type:"POST",
        data:{memPass: pass,
        	  memEmail:$("input[name='memEmail']").val()}
    }).done(function(result){
    	alert("변경되었습니다.");
    	location.href = "/babmukja/member/mypage.do?memNickname=" + encodeURI(userNickname , "UTF-8");;
    });
});


// 팔로우 기능
$(document).on("click","#follow-button",function () { 
	if(visitorNo != userNo) {
	    	$.ajax({
	    		url : "/babmukja/recipe/follow.do",
	    		data : {
	    			'followMemNo': userNo,
	    			'followerMemNo': visitorNo
	    		},
	    		success : function(result) {		    		
	    			if(result == 1) {
	    				followerCnt++;
	    				$("#follower-cnt").text(followerCnt);
		    			$("#updateform-sec2-userinfo-opt").html("<button id='follow-button'>팔로우 해제</button><p>팔로우 중</p>");
	    			} else if(result == 0) {
	    				
	    				followerCnt--;
	    				$("#follower-cnt").text(followerCnt);
	    				$("#updateform-sec2-userinfo-opt").html("<button id='follow-button'>팔로우</button>");
	    			} else alert("로그인 후 이용가능합니다.");
	    		}
	    	});
		} 
	if(visitorNo == userNo) {
		
		alert("같은 회원은 팔로우 할 수 없습니다.");
	}
});

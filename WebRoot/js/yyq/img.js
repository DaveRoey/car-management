/**
 * 图片转base64
 * @param {Object} img
 */
function img_base64(img,width,height){
	var canvas = document.createElement("canvas");
	canvas.width = width;
	canvas.height = height;
	var c = canvas.getContext("2d");
	c.drawImage(img,0,0,width,height);
	var dataUrl = canvas.toDataURL(img.src,0.8);
	return dataUrl;
}

/**
 * base64转blob
 * @param {Object} base64
 */
function img_blob(base64){
	var dataURI = base64; //base64 字符串
	var mimeString =  dataURI.split(',')[0].split(':')[1].split(';')[0]; // mime类型
	var byteString = atob(dataURI.split(',')[1]); //base64 解码
	var arrayBuffer = new ArrayBuffer(byteString.length); //创建缓冲数组
	var intArray = new Uint8Array(arrayBuffer); //创建视图
	for (i = 0; i < byteString.length; i += 1) {
	     intArray[i] = byteString.charCodeAt(i);
	}
	var blob = new Blob([intArray], { type:  mimeString }); //转成blob
	return blob;
}

/**
 * 获取本地图片路径
 * @param {Object} selector
 */
function getFileUrl(selector){
	var img_url; 
	if(navigator.userAgent.indexOf("MSIE")>=1){
		img_url = selector.value; 
	}else{
		img_url = window.URL.createObjectURL(selector.files.item(0)); 
	}
	return img_url;
}

/**
 * 图片加载
 * @param {Object} img_src
 * @param {Object} callback
 */
function loadImg(img_src,callback){
	var img = new Image();
	img.src = img_src;
	img.onload = function(){
		callback(img);
	};
}
window.addEventListener("load",function(){
				var $input = document.querySelector("#fileUpload");
				var $img = document.querySelector("#showImg");
				var $canvas = document.querySelector("canvas");
				var myCrop;
				//选择图片
				$input.addEventListener("change",function(){
					;
					$img.src = getFileUrl(this);
					
				},false);
				
			},false);
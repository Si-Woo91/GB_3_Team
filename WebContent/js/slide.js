	$(window).ready(function(){
		

		cookiedata = document.cookie; 
	 
		if ( cookiedata.indexOf("ncookie=done") < 0 ){ 
			document.getElementById('slide_image').style.display = "block";    //  팝업창 아이디
		} else {
			document.getElementById('slide_image').style.display = "none";    // 팝업창 아이디
		}


		$('.banner_img').slick({
			infinite: true,		
			dots: true,
			arrows: true,
			autoplay: true,
			autoplaySpeed: 2200,
			focusOnSelect: true,
			prevArrow: '<a class="slick-prev" href="#">&#10094;</a>',
			nextArrow: '<a class="slick-next" href="#">&#10095;</a>',
			customPaging : function(slider, i) {				
			    if(i=='0'){ return '<p class="pp"></p>'; }
				else if(i=='1'){ return '<p class="pp"></p>'; }
		
			}		
		});

	});
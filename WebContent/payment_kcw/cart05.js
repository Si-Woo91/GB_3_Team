
	function reset(){
		let len = $("input[name=chk]").length;
		if( len == 0 ) {
//			alert("주문가능한 상품이 없습니다.");
			$('#zerocart').show();
			$("#chk_all").prop("checked", false);
		}
		
		$("#order_button1").val( "선택주문(" + $("input[name=chk]:checked").length + ")" );
	}


	function deleteTableRow() {
		let table = document.getElementById('order_tb');
		//let table = $('#order_tb');  //왜 안되는지 모르겠음
		checks = $('input[name="chk"]');
		let len = checks.length;
		let count = 0;
		
		for( var i = len-1; i >= 0  ; i--) {		//1부터 시작하면 중간에 테이블 길이 줄어들어서 index가 맞지 않아 에러남
			if( checks[i].checked == true){
				count++;
				table.deleteRow(i+2);
			}
		}
		if(count==0){
			alert("상품을 선택해주세요.");
		}
		
		reset();
	}	
	
	function jumpPageSome(){
		var checked = $("input[name=chk]:checked").length;
		if( checked == 0 ) {
			alert("주문가능한 상품이 없습니다.");
			return false;
		} else{
			location.href='checkout05.jsp';
		}
	}
	
	function jumpPageAll(){
		var exist = $("input[name=chk]").length;
		if( exist == 0 ) {
			alert("주문가능한 상품이 없습니다.");
			return false;
		} else{
			location.href='test.jsp';
		}
	}
	
	
	$(document).ready(function() {
		$("#chk_all").click(function() {
			if($("#chk_all").is(":checked")) $("input[name=chk]").prop("checked", true);
			else $("input[name=chk]").prop("checked", false);
			
			$("#order_button1").val( "선택주문(" + $("input[name=chk]:checked").length + ")" );
		});
		
		$("input[name=chk]").click(function() {
			var total = $("input[name=chk]").length;
			var checked = $("input[name=chk]:checked").length;
			
			if(total != checked) $("#chk_all").prop("checked", false);
			else $("#chk_all").prop("checked", true); 
			
			$("#order_button1").val( "선택주문(" + $("input[name=chk]:checked").length + ")" );
		});
	});
	
	$(document).ready(function(){
		$('#zerocart').hide();
		$("#chk_all").prop("checked", true);
		$("input[name=chk]").prop("checked", true);
		reset();
	});
	
	
	
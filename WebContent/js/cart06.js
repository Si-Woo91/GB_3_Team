
	function reset(){
		let len = $("input[name=chk]").length;
		if( len == 0 ) {
			$('#zerocart').show();
			$('#select_button').prop("disabled", true);
			$("#chk_all").prop("disabled", true);
			//$("#chk_all").prop("checked", false);
		}
		
		$("#order_button1").val( "선택주문(" + $("input[name=chk]:checked").length + ")" );
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
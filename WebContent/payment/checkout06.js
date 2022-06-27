
	
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    

	$(document).ready(function(){
		
 	    $('#nobank_tb').hide();		// 초깃값 설정
 	    $('#account_tb').hide();	
		$('#naverpay_tb').hide();
		$('#phonepay_tb').hide();
			
		$("input[name='paymethod']").change(function(){
			// 신용카드 결제 선택 시.
			if($("input[name='paymethod']:checked").val() == '신용카드'){
				$('#creditcard_tb').show();
 				$('#nobank_tb').hide();
				$('#account_tb').hide();
				$('#naverpay_tb').hide();
				$('#phonepay_tb').hide();
			}	
			// 무통장입금 결제 선택 시.
			else if($("input[name='paymethod']:checked").val() == '무통장입금'){
				$('#creditcard_tb').hide();
 				$('#nobank_tb').show();
				$('#account_tb').hide();
				$('#naverpay_tb').hide();
				$('#phonepay_tb').hide();
			}
			// 계좌이체  결제 선택 시.
			else if($("input[name='paymethod']:checked").val() == '계좌이체'){
				$('#creditcard_tb').hide();
				$('#nobank_tb').hide();
				$('#account_tb').show();
				$('#naverpay_tb').hide();
				$('#phonepay_tb').hide();
			}
			// 네이버페이  결제 선택 시.
			else if($("input[name='paymethod']:checked").val() == '네이버페이'){
				$('#creditcard_tb').hide();
				$('#nobank_tb').hide();
				$('#account_tb').hide();
				$('#naverpay_tb').show();
				$('#phonepay_tb').hide();
			}
			// 네이버페이  결제 선택 시.
			else if($("input[name='paymethod']:checked").val() == '휴대폰결제'){
				$('#creditcard_tb').hide();
				$('#nobank_tb').hide();
				$('#account_tb').hide();
				$('#naverpay_tb').hide();
				$('#phonepay_tb').show();
			}
		});
			
	});

	
	let today = new Date();
	let tomorrow = new Date(today.setDate(today.getDate()+1));
	year = tomorrow.getFullYear();
	month = tomorrow.getMonth() + 1;
	day = tomorrow.getDate();
	$("#tomorrow_date").text(year+"년 "+month+"월 "+day+"일");
	
	
	function openpayment(){
		let height = 400;
		let width = 300;
		let popupX = (window.screen.width / 2) - (width / 2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height /2) - (height / 2);
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

		window.open('notreal.html', '결제하기(페이지원래없음)', 'status=no, height='+height+', width='
				+width+', left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	}
	
	
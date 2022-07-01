<%@page import="java.util.List"%>
<%@page import="com.gushipsam.payment.dao.MemberDTO"%>
<%@page import="com.gushipsam.payment.dao.CartDTO"%>
<%@page import="java.text.DecimalFormat"%> 	<!--  숫자에 콤마 붙이기 위한 숫자포맷 라이브러리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="checkoutList" value="${requestScope.checkoutList }"/>
<c:set var="memberInfo" value="${requestScope.memberInfo }"/>
<%
	List<CartDTO> checkoutList = (List) request.getAttribute("checkoutList");
	MemberDTO memberInfo = (MemberDTO) request.getAttribute("memberInfo");
	
	int shippingCost = 2500;
	
	DecimalFormat df = new DecimalFormat("###,###"); // df.format(숫자)로 콤마 보이게 가능
	
	if(checkoutList.size() == 0) response.sendRedirect(request.getContextPath() + "/main/main.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구심삽 주문결제</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<%@ include file= "../header/header.jsp" %>
<body id="payment">
	<section id='checkout'>
		<br>
		<div id="title_big">주문/결제</div>
		<table id="order_tb">
			<colgroup>
				<col width="62.5%">
				<col width="15%">
				<col width="7.5%">
				<col width="15%">
			</colgroup>
			<thead>
				<tr>
					<td colspan="4">
						<h3 id="title">구십삼 배송상품</h3>
					</td>
				</tr>
				<tr class="table_top">
					<td>
						<div class="align_center">상품정보</div>
					</td>
					<td>
						<div class="align_center">판매가</div>
					</td>
					<td>
						<div class="align_center">수량</div>
					</td>
					<td>
						<div class="align_center">구매가</div>
					</td>
				</tr>
			</thead>
			<tbody>
				<% for (CartDTO item : checkoutList ) { %>
				<tr>
					<td>
						<table class="goods_tb">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr>
								<td rowspan="2">
									<%
										String foldername = null;
										String catg = item.getgCATG();
										String img = item.getgIMGS();
										
										switch (catg) {
										case "냉장고" : foldername= "fridge"; break;
										case "세탁기" : foldername= "washer"; break;
										case "TV" : foldername= "tv"; break;
										case "에어컨" : foldername= "ac"; break;
										case "컴퓨터" : foldername= "pc"; break;
										}
									%>
									<a href="${pageContext.request.contextPath }/goods/goodsDetail.goods?gID=<%=item.getgID() %>">
										<img src="${pageContext.request.contextPath }/img/<%=foldername %>/<%=img %>" style="width:100%">
									</a>
								</td>
								<td><%=item.getgBRAND()%></td>
							</tr>
							<tr>
								<td><%=item.getgNAME()%></td>
							</tr>
						</table>
					</td>
					<% int price = item.getgPRICE(); int qty = item.getcQTY(); %>
					<td>
						<div class="align_center"><%= df.format(price) %></div>
					</td>
					<td>
						<div class="align_center"><%= qty %></div>
					</td>
					<td>
						<div class="align_center"><%= df.format(price*qty) %></div>
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>		
		<br>
	
		<table id="pay_tb">
			<colgroup>
				<col width="600">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<td class="real_top" style="border-right: 20px solid transparent;"><h3 id="title1">배송지정보</h3></td>
					<td class="real_top"><h3 id="title2">최종 결제정보</h3></td>
				</tr>
			</thead>
			<tr>
				<td style="border-right: 20px solid transparent">
					<table id="delivery_tb" class="sub_tb">
						<colgroup>
							<col width="82">
							<col width="*">
						</colgroup>
						<tr>
						<%
							String name = memberInfo.getUsername(), phone = memberInfo.getUserphone();
						%>
							<td>	받는분	</td>
							<td>
								<span style="color:red; font-weight:bold">*</span>
								<input type="text" id="receiver" value="<%= name %>" style="width:300px">
							</td>
						</tr>
						<tr>
							<td>	연락처1	</td>
							<td>	
								<span style="color:red; font-weight:bold">*</span>
								<input type="number" id="phone1" value="<%= phone.substring(0,3) %>" style="width:80px"> - <input type="number" id="phone2" value="<%= phone.substring(3,7)  %>" style="width:80px"> - <input type="number" id="phone3" value="<%= phone.substring(7,11)  %>" style="width:80px">	
							</td>
						</tr>	
						<tr>
							<td>	연락처2	</td>
							<td>										<span style="color:transparent; font-weight:bold">*</span>
								<input type="number" style="width:80px"> - <input type="number" style="width:80px"> - <input type="number" style="width:80px">	
							</td>
						</tr>
						<tr>
							<td rowspan="3">	주소	</td>
							<td>	
								<span style="color:red; font-weight:bold">*</span> 
								<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:80px">
								<input type="button" id="address_button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:100px">
							</td>
						</tr>
						<tr>
							<td>
								<span style="color:red;; font-weight:bold">*</span>
								<input type="text" id="sample6_address" placeholder="주소" style="width:400px">
							</td>
						</tr>
						<tr>
							<td>
								<span style="color:red; font-weight:bold">*</span>
								<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width:250px">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width:150px">
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td>	
								<span style="color:red; font-weight:bold">* 필수작성란</span>
							
<!-- 								<span style="color:transparent; font-weight:bold">*</span> -->
<!-- 								<input type="text" placeholder="배송메세지를 입력해주세요" style="width:450px">	 -->
							</td>
						</tr>
					</table>	
				</td>
				<td rowspan="3" style="text-align:right">
					<% int checkoutSum = 0;	
					for (CartDTO item : checkoutList ) { 
						checkoutSum += item.getgPRICE() * item.getcQTY();
					} %>
					<h2 id="margin_fix1">최종 결제금액 : <%= df.format(checkoutSum+shippingCost)%> 원</h2>
					<h3 id="margin_fix2">상품금액 : <%= df.format(checkoutSum) %> 원 </h3>
					<h3 id="margin_fix3">배송비 : <%= df.format(shippingCost) %> 원</h3>
					<br>
					<input type="button" id="pay_button" value="결제하기" onclick="checkoutnpay();">
				</td>
			</tr>
			<tr>
				<td class="real_top"><h3 id="title3">결제수단 선택</h3></td>
			</tr>
			<tr>
				<td style="border-right: 20px solid transparent; height:150px">
					<p id="margin_fix4">
						<input type="radio" name="paymethod" value="신용카드" checked>신용카드 &nbsp;
						<input type="radio" name="paymethod" value="무통장입금">무통장입금 &nbsp;
						<input type="radio" name="paymethod" value="계좌이체">계좌이체 &nbsp;
						<input type="radio" name="paymethod" value="네이버페이">네이버페이 &nbsp;
						<input type="radio" name="paymethod" value="휴대폰결제">휴대폰결제
					</p>	
					<table id="creditcard_tb"  class="sub_tb">
						<colgroup>
							<col width="82">
							<col width="*">
						</colgroup>
						<tr>
							<td>	카드종류	</td>
							<td>
								<select name="card" style="width:110px">
								    <option value="BC카드">BC카드</option>
								    <option value="외환카드">외환카드</option>
								    <option value="하나비자">하나비자</option>
								    <option value="우리카드">우리카드</option>
								    <option value="신협카드">신협카드</option>
								    <option value="수협카드">수협카드</option>
								    <option value="전북카드">전북카드</option>
								    <option value="씨티카드">씨티카드</option>
								    <option value="삼성카드">삼성카드</option>
								    <option value="신한카드">신한카드</option>
								    <option value="현대카드">현대카드</option>
								    <option value="롯데카드">롯데카드</option>
								    <option value="KB카드">KB카드</option>
								    <option value="NH카드">NH카드</option>
								    <option value="카카오뱅크">카카오뱅크</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>	할부종류	</td>
							<td>	
								<select name="installment" style="width:110px">
								    <option value="일시불">일시불</option>
								    <option value="2개월 [무이자]">2개월 [무이자]</option>
								    <option value="3개월 [무이자]">3개월 [무이자]</option>
								    <option value="4개월 [무이자]">4개월 [무이자]</option>
								    <option value="5개월 [무이자]">5개월 [무이자]</option>
								    <option value="6개월 [무이자]">6개월 [무이자]</option>
								    <option value="7개월 [무이자]">7개월 [무이자]</option>
								    <option value="8개월">8개월</option>
								    <option value="9개월">9개월</option>
								    <option value="10개월">10개월</option>
								    <option value="11개월">11개월</option>
								    <option value="12개월">12개월</option>

								</select>	
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<ul id="explain1">
									<li>&lt;카카오뱅크 체크카드 혜택&gt;</li>
									<li>3만원 이상 결제 시 <span style="color:#F27370">2천원 캐시백</span></li>
									<li>온/오프라인에서 <span style="color:#F27370">월 1회 사용 가능</span></li>
									<li>자세한 내용은 이벤트 탭에서 확인해주세요</li>
									<li>신용/체크카드 결제금액이 30만원 이상인 경우 공인인증서가 필요합니다.</li>
								</ul>
							</td>
						</tr>					
					</table>
					<table id="nobank_tb"  class="sub_tb">
						<colgroup>
							<col width="82">
							<col width="*">
						</colgroup>
						<tr>
							<td>	은행명	</td>
							<td>
								<select name="bank" style="width:100px">
								    <option value="외환카드">기업</option>
								    <option value="하나비자">국민</option>
								    <option value="우리카드">수협</option>
								    <option value="신협카드">농협</option>
								    <option value="수협카드">우리</option>
								    <option value="전북카드">대구</option>
								    <option value="씨티카드">부산</option>
								    <option value="삼성카드">경남</option>
								    <option value="신한카드">우체국</option>
								    <option value="현대카드">하나</option>
								    <option value="롯데카드">신한</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>	입금기한	</td>
							<td>	<div id="tomorrow_date"></div></td>
						</tr>
						<tr>
							<td>	입금자명	</td>
							<td>	<input type="text" value="<%= name %>" style="width:100px"></td>
						</tr>					
					</table>
					<table id="account_tb"  class="sub_tb">
						<colgroup>
							<col width="82">
							<col width="*">
						</colgroup>
						<tr>
							<td style="vertical-align: middle;"> 결제안내	</td>
							<td>
								<ul id="explain2">
									<li>계좌이체로 결제 완료시 본인 계좌에서 즉시 이체 처리됩니다.</li>
									<li>실시간 계좌이체는 은행별 이용시간이 다를 수 있습니다.</li>
								</ul>
							</td>
						</tr>										
					</table>
					<table id="naverpay_tb"  class="sub_tb">
						<tr>
							<td>				
								<ul id="explain3">
									<li style="font-weight:bold; list-style-type:none;"> &lt;네이버페이 유의사항&gt;</li>
									<li>주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
									<li>네이버페이로 결제 시, 제휴카드 할인/적립(CJ카드, 임직원할인 포함)이 적용되지 않습니다.</li>
									<li>현금영수증 확인은 네이버페이 홈페이지에서 확인 가능합니다. (네이버페이 홈 > 결제내역)</li>
									<li>네이버페이 고객센터 : 1588-3819</li>
								</ul>
							</td>
						</tr>										
					</table>
					<table id="phonepay_tb"  class="sub_tb">
						<colgroup>
							<col width="82">
							<col width="*">
						</colgroup>
						<tr>
							<td style="vertical-align: middle;"> 결제안내	</td>
							<td>
								<ul id="explain4">
									<li>휴대폰 결제는 100만원까지 결제가 가능합니다.</li>
									<li>한도문의는 모빌리언스(1600-0523), 다날(1566-3355), 페이레터(1599-7591)로 문의주시기 바랍니다.</li>
								</ul>
							</td>
						</tr>										
					</table>
				</td>
			</tr>
		</table>
	</section>
	<div style="height:130px"></div>
	<%@ include file= "../footer/footer.jsp" %>
</body>
<script>
	function checkoutnpay(){
		
		//필수 입력란
		let checkout_inputs = [$('#phone1').val(), $('#phone2').val(), $('#phone3').val(),
									$('#sample6_address').val(), $('#sample6_detailAddress').val(), $('#receiver').val(), $('#sample6_postcode').val()];
		
		let ophone = checkout_inputs[0] + checkout_inputs[1] + checkout_inputs[2];
		let oaddress = checkout_inputs[3] +" "+ checkout_inputs[4] + $('#sample6_extraAddress').val();
		
		for(let i = 0 ; i< checkout_inputs.length;i++){
			input = checkout_inputs[i];
			if(input==null || input==""){
				alert("배송정보를 정확히 입력해주세요.");
				return false;
			}
		}
		
		let total_amount = "<%= df.format(checkoutSum+shippingCost)%>";
		let paymethod = $('input[name="paymethod"]:checked').val();
		let postposition ="를";
		if(paymethod =="무통장입금") postposition = "을";
		
		if(! confirm( paymethod + postposition + " 사용하여 " + total_amount + " 원을 결제하시겠습니까?") ) {
			return false;
		} else {
			alert('주문/결제가 완료되었습니다.');
		}
		
		let cid_arr = [];
		<% for (CartDTO item : checkoutList ) {
			pageContext.setAttribute("cID",item.getcID());
			pageContext.setAttribute("directgID",item.getgID());
			pageContext.setAttribute("directoQTY",item.getcQTY());
		%>
			cid_arr.push("${cID}");
			let directgID = "${directgID}";
			let directoQTY = "${directoQTY}";
		<%}%>
					
		location.href='${pageContext.request.contextPath }/payment/payresult.pay?cids='+cid_arr+'&ophone='+ophone+'&oaddress='+oaddress
																					+'&directgID='+directgID+'&directoQTY='+directoQTY;
	}
</script>
<script src="${pageContext.request.contextPath }/js/checkout06.js"></script>
</html>
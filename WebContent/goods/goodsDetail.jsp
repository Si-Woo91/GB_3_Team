<%@page import="java.util.List"%>
<%@page import="com.gushipsam.goods.dao.goodsDTO"%>
<%@page import="java.text.DecimalFormat"%>
<!--  숫자에 콤마 붙이기 위한 숫자포맷 라이브러리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="goodsDetail" value="${requestScope.goodsDetail }" />
<%
   DecimalFormat df = new DecimalFormat("###,###"); // df.format(숫자)로 콤마 보이게 가능
   goodsDTO goodsDetail = (goodsDTO) request.getAttribute("goodsDetail");
   
   String foldername = null;
   if (goodsDetail.getgCatg().equals("냉장고")){
      foldername= "fridge";
   } else if (goodsDetail.getgCatg().equals("세탁기")){
      foldername= "washer";
   } else if (goodsDetail.getgCatg().equals("TV")){
      foldername= "tv";
   } else if (goodsDetail.getgCatg().equals("에어컨")){
      foldername= "ac";
   } else if (goodsDetail.getgCatg().equals("컴퓨터")){
      foldername= "pc";
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼 상품상세</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="goodsDetail.css">
<link rel="shortcut icon" href="gu_icon.ico">
</head>
<%@ include file="../header/header.jsp" %>
<body>
   <div style="height: 300px;"></div>
   <section>
      <table id="skeleton">
         <tr>
            <td>
               <div class="photo">
                  <img src="${pageContext.request.contextPath }/img/<%=foldername %>/${goodsDetail.gImgs }" width="450" height="450">
               </div>

            </td>
            <td id="details_td">
               <div class="details">
                  <div class="name">
                     <a>${goodsDetail.gName }</a>
                  </div>
                  <div id="name2_table">
                  <table class="name2">
                     <tr>
                        <th>브랜드</th>
                        <td>${goodsDetail.gBrand }</td>
                     </tr>
                     <tr>
                        <th>모델명</th>
                        <td>${goodsDetail.gModel}</td>
                     </tr>
                     <tr>
                        <th>판매가</th>
                        <td><%=df.format(goodsDetail.getgPRICE())%> 원</td>
                     </tr>
                     <tr>
                        <th>크기</th>
                        <td>${goodsDetail.gSize}</td>
                     </tr>
                     <tr>
                        <th>기타정보</th>
                        <td>${goodsDetail.gEtc}</td>
                     </tr>
                  </table>
                  </div>
               </div>
               <div class="quantity">
                  <span id="qty_title">주문수량</span>
                  &nbsp; &nbsp;
                  <span class=btn>
                     <button type="button" id="mbtn">-</button>
                        <input type="text" id="qty" readonly value="1">
                     <button type="button" id="pbtn">+</button>
                  </span>
               </div>
               <div class="payment">
                  <input type="button" value="바로구매" id="checkout_btn" onclick="jumpToCheckout();"> &nbsp;
                  <input type="button" value="장바구니" id="cart_btn" onclick="insertCart();">
               </div>
               <div class="extra_detail">
                  <a onclick="window.open('explanation.jsp?gCatg=${goodsDetail.gCatg}&gImgl=${goodsDetail.gImgl}', '제품상세설명',
                                       'width=800, height=600, left=100, top=0');">제품 상세 페이지로 이동</a>
               </div>
            </td>
         </tr>
      </table>
      <div style="height:220px"></div>
   </section>
   <%@ include file= "../footer/footer.jsp" %>
</body>
<script>
   //수량 감소 버튼
   $('#mbtn').on("click",function(){
      let qty = $('#qty').val();
      if (qty >= 2) {
         $('#qty').val(Number(qty)-1);
      }
   });
   
   //수량 증가 버튼
   $('#pbtn').on("click",function(){
      let qty = $('#qty').val();
      $('#qty').val(Number(qty)+1);
   });
   
   
   
   function jumpToCheckout(){
      if(!confirm("바로 구매를 진행하시겠습니까?")) return false
      let gQTY = $('#qty').val();
      let gID = '${goodsDetail.gID}';
      userid = '${sessionId}';
      if(userid == null || userid == '') {
         location.href='${pageContext.request.contextPath }/IDPW/login.jsp';
         return false;
      }
      location.href='${pageContext.request.contextPath }/payment/checkoutdirect.pay?gid='+gID+'&gqty='+gQTY;
   }
   
   
   function insertCart(){
	  if(!confirm("해당 상품을 장바구니에 추가하시겠습니까?")) return false

      let gQTY = $('#qty').val();
      let gID = '${goodsDetail.gID}';
      userid = '${sessionId}';
      if(userid == null || userid == '') {
         location.href='${pageContext.request.contextPath }/IDPW/login.jsp';
         return false;
      }
         
      // ajax 통신
      let xhr = new XMLHttpRequest();
      xhr.open("GET", '${pageContext.request.contextPath }/payment/cartinsert.pay?gid='+gID+'&gqty='+gQTY, true);
      xhr.send();
      xhr.onreadystatechange = function(){
         if( xhr.readyState == XMLHttpRequest.DONE 
               && xhr.status == 200 ){
            console.log(xhr.responseText);
         }         
      }
      if(confirm("해당 상품이 장바구니에 추가되었습니다!\n장바구니로 이동하시겠습니까?")) location.href='${pageContext.request.contextPath }/payment/cart.pay';
   }
</script>
</html>
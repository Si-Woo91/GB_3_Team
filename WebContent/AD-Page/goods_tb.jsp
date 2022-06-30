<%@page import="java.util.List"%>
<%@page import="com.gushipsam.goods.dao.goodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
   List<goodsDTO> goodsList = (List<goodsDTO>) request.getAttribute("goodsList"); 
%>

<table id="goods_list" class="stock-list" summary="상품명, 재고 주문대기, 재고수정">
            <colgroup>
               <!-- 테이블   의 각 열의 크기 조절 가능 -->
               <col width="50">
               <col width="300">
               <col width="200">
               <col width="200">
               <col width="200">
               <col width="300">
               <col width="300">
            </colgroup>

            <thead>
               <tr class="list-title-tr">
                  <td class="editable"><input type="checkbox" name="allCheck" id="allCheck"></td>
                  <td class="editable">상품 이미지</td>
                  <td class="editable">상품명</td>
                  <td class="editable">브랜드</td>
                  <td class="editable">가격</td>
                  <td class="editable">재고</td>
                  <td class="editable" style="background-color: #ffeccd;">재고수정</td>
               </tr>
            </thead>

            <tbody>
            <c:choose>
               <c:when test="${goodsList != null and fn:length(goodsList) > 0 }">
            
               <%
               for (goodsDTO g : goodsList){ 
                  
                  String foldername = null;
                  String gCatg = g.getgCatg();
                  
                  if (gCatg.equals("냉장고")){
                     foldername= "fridge";
                  } else if (gCatg.equals("세탁기")){
                     foldername= "washer";
                  } else if (gCatg.equals("TV")){
                     foldername= "tv";
                  } else if (gCatg.equals("에어컨")){
                     foldername= "ac";
                  } else if (gCatg.equals("컴퓨터")){
                     foldername= "pc";
                  }               
               %>
                     <tr>
                        <th><input type="checkbox" name="chBox" class="chBox"></th>
                        <th><img style="height: 100px;width: 100px;"
                           src="${pageContext.request.contextPath }/img/<%=foldername %>/<%= g.getgImgs()%>"></th>
                        <th><%= g.getgName() %></th>
                        <th><%= g.getgBrand() %></th>
                        <th><%= g.getgPRICE() %></th>
                        <th><%= g.getgSTOCK() %></th>
                        <th class="edit-part"><input class="update-cell" type="text"></th>
                     </tr>
               <%} %>
                  </c:when>
                  <c:otherwise>
                     <tr>
                        <td colspan="7">
                           <div>현재 상품이 없습니다.</div>
                        </td>
                     </tr>
                  </c:otherwise>
               </c:choose>
               
            </tbody>
         </table>
<script>
//전체선택
$("#allCheck").click(function(){
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	  $(".chBox").prop("checked", true);
	 } else {
	  $(".chBox").prop("checked", false);
	 }
	});
// 개별 선택시 전체 선택 해제
 $(".chBox").click(function(){
  $("#allCheck").prop("checked", false);
 });

</script>
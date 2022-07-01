<%@page import="java.util.List"%>
<%@page import="com.gushipsam.goods.dao.goodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
   List<goodsDTO> goodsList = (List<goodsDTO>) request.getAttribute("goodsList"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상품관리</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Goodslist.css">
</head>

<body>
   <c:set var="goodsList" value="${requestScope.goodsList }"/>
   <c:set var="sarchlist" value="${requestScope.searchlist}"/>
   <c:set var="gID" value="${requestScope.Goods_seq }"/>
   <c:set var="goodCnt" value="${requestScope.goodsCnt }"/>
   
   <!-- 포장 시작 -->
   <div class="wrap">
      <div class=wrap1-1>
         <!-- 타이틀 문구 -->
         <header class="page-title">
            <h3>상품재고관리</h3>
         </header>

         <menu>
            <ul>
               <li><a href="${pageContext.request.contextPath}/AD-Page/adHome.spm">홈</a></li>
               <li>전체 상품 갯수 : ${goodCnt }</li>
            </ul>
         </menu>
         <!-- 상다 메뉴 문구 끝-->

         <br> <br>

         <!-- 검색창 -->
         <div class="search">
            <input type="text" class="textBar"> <i class="fas fa-search"></i>
         </div>
         <!-- 검색창 끝 -->
         <br>

         <!-- 표 시작 -->
         <span id="ajax_goodslist">
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
                           <div class="ad-goodslist-text">현재 상품이 없습니다.</div>
                        </td>
                     </tr>
                  </c:otherwise>
               </c:choose>
               
            </tbody>
         </table>
         </span>

         <br>

         <div>
            <form class="btn">
               <input type="button" value="일괄수정">
               <a href="${pageContext.request.contextPath}/AD-Page/ADDgoods.spm">[상품추가]</a>
               <button type="button" class="delect_btn" onclick="delgid();">상품삭제</button>
            </form>
         </div>
      </div>
   </div>
</body>
<script>
// 전체선택
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
 
 // 선택된 상품 삭제
let gid_arr = [];
 
<c:forEach var="goods" items="${goodsList }">
   gid_arr.push("${goods.gID}");
</c:forEach>
   
function delgid(){
   if(confirm("상품을 삭제하시겠습니까?") == false){
      return false;
   }
   
   chBox = $('input[name="chBox"]');
   let len = chBox.length;
    let count = 0;
    let del_gids = [];
    
   for(var i = len - 1; i >= 0; i--){
      if(chBox[i].checked == true){
      count++;
      let del_gid = gid_arr.splice(i, 1);      // 삭제할 gid 하나씩 del_gids배열에 넣기
      del_gids.push(del_gid);
       }   
   }
   
   //삭제할 gid 다 넣은 del_gids 완성됨
   
   if(count == 0){               //만약 삭제할 gid가 없으면(체크가 아예 없으면) 함수 발동 취소
      alert("제거할 상품을 선택해주세요");
      return false;
   } else {                  //하나라도 존재한다면
      // ajax 통신
        let xhr = new XMLHttpRequest();
        xhr.open("GET", '${pageContext.request.contextPath }/AD-Page/DELgoodsOk.spm?delgids='+del_gids, true);
        xhr.send();
        xhr.onreadystatechange = function(){
           if( xhr.readyState == XMLHttpRequest.DONE 
                 && xhr.status == 200 ){
              
              if(xhr.responseText.trim() == "not_ok"){
                 alert("해당 상품은 주문대기중이라 삭제 실패");
                 return false;
              } else {
              $('#ajax_goodslist').html(xhr.responseText);
              alert("선택한 상품이 성공적으로 제거되었습니다.");
            }
         }  
      }
   }
}
</script>
</html>
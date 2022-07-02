
function sendit(){
   let frm = document.frm;
   let userid = frm.userid;
   let userpw = frm.userpw;
   let userpw_two = frm.userpw_two;
   let username = frm.username;
   let userphone = frm.userphone;
   let userdata = frm.userdata;
   let useremail = frm.useremail;
   
   
   // 아이디 없을때
   if( userid.value == "" ){
      alert("아이디를 입력하세요!");
      userid.focus();
      return false;
   }
   
   var re = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,16}$/;
   
   if(!re.test(userid.value)){
      alert("아이디는 4~16자리 영문,숫자 조합으로 입력해주세요.");
      userid.focus();
      return false;
   }
   
   
   // 비밀번호 없을때
   if( userpw.value == "" ){
      alert("비밀번호를 입력하세요!");
      userpw.focus();
      return false;
   }
   
   var re1 =  /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
   
   if(!re1.test(userpw.value)){
      alert("비밀번호는 8~16자 영문,숫자,특수부호 조합으로 입력해주세요.");
      userpw.focus();
      return false;
   }
   
   
   if( userpw_two.value == "" ){
      alert("비밀번호확인을 입력하세요!");
      userpw_two.focus();
      return false;
   }
   

   if( username.value == "" ){
      alert("이름을 입력하세요!");
      username.focus();
      return false;
   }
   
   if( userphone.value == "" ){
      alert("핸드폰번호를 입력하세요!");
      userphone.focus();
      return false;
   }

   // 전화번호 숫자만 입력하는 정규식
   var reg = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;

   if(!reg.test(userphone.value)){
      alert("전화번호 형식에 맞게 입력해주세요.");
      userphone.focus();
      return false;
   }
   
   if( userdata.value == "" ){
      alert("생년월일을 입력하세요!");
      userdata.focus();
      return false;
   }
   
   // 생년월일 숫자만 입력하는 정규식
   var reg1 = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
   
   if(!reg1.test(userdata.value)){
      alert("생년월일은 8자리로 숫자로만 입력할 수 있습니다.");
      userdata.focus();
      return false;
   }

   if( useremail.value == "" ){
      alert("이메일 입력하세요!");
      useremail.focus();
      return false;
   }
   
   var reg2 =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   
   if(!reg2.test(useremail.value)){
      alert("이메일 형식에 맞게 입력해주세요.");
      useremail.focus();
      return false;
   }

   
   frm.submit();
}

function loginOn(){
   let f = document.loginform;
   let userid = f.userid;
   let userpw = f.userpw;
   
   if( userid.value == "" ){
      alert("아이디를 입력하세요!");
      userid.focus();
      return false;
   }
   
   if( userpw.value == "" ){
      alert("비밀번호를 입력하세요!");
      userpw.focus();
      return false;
   }
   
   f.submit();
}

function id_search() { 
   let f = document.IDform;
   let username = f.username;
   let userphone = f.userphone;
   let useremail = f.useremail;
   
   if (username.value == "") {
      alert("이름을 입력해주세요");
      username.focus();
      return false;
   }
   
   if (userphone.value == "") {
      alert("전화번호를 입력해주세요");
      userphone.focus();
      return false;
   }
   
   if (useremail.value == "") {
      alert("이메일을 입력해주세요");
      useremail.focus();
      return false;
   }
   
   f.submit();
}

function pw_search() { 
   let f = document.PWform;
   let userid = f.userid;
   let username = f.username;
   let userphone = f.userphone;
   let useremail = f.useremail;
   
   if (userid.value == "") {
      alert("아이디 입력해주세요");
      userid.focus();
      return false;
   }
   
   if (username.value == "") {
      alert("이름을 입력해주세요");
      username.focus();
      return false;
   }
   
   if (userphone.value == "") {
      alert("전화번호를 입력해주세요");
      userphone.focus();
      return false;
   }
   
   if (useremail.value == "") {
      alert("이메일을 입력해주세요");
      useremail.focus();
      return false;
   }
   
   f.submit();
}

   // 아이디 중복확인
   function checkId(userid) {
      if (userid == "") {
         alert("아이디를 입력해주세요!");
         return false;
      } else {
         // ajax 통신
         let xhr = new XMLHttpRequest();
         xhr.open("GET", "idcheck.jsp?userid=" + userid, true);
         xhr.send();
         xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
               // alert(xhr.responseText);

               if (xhr.responseText.trim() == "ok") {
            	   
            	  if(userid == "adminid") {
            		  //관리자 아이디이므로 사용 불가능합니다.
            		  document.getElementById("text").innerHTML =	"<p style='color:red; margin-bottom:0;'>중복된 아이디 입니다.</p>";
                      $('#join-btn').attr("disabled","disabled");
            	  } else{
	                  // 사용할수 있는 아이디 입니다.
	                  document.getElementById("text").innerHTML = "<p style='color:blue; margin-bottom:0;'>사용할수 있는 아이디 입니다.</p>";
            	  }
               } else {
                  // 중복된 아이디 입니다.
                  document.getElementById("text").innerHTML = "<p style='color:red; margin-bottom:0;'>중복된 아이디 입니다.";
                  $('#join-btn').attr("disabled","disabled");
               }
            }
         }

      }
   }
   
   $(function () {
   $('#userpw').keyup(function () {
      $('#text2').html('');
   });

   $('#userpw_two').keyup(function() {
      if ($('#userpw').val() != $('#userpw_two').val()) {
         $('#text2').html('비밀번호가 일치하지 않습니다.<br><br>');
         $('#text2').css('color', 'red');
         $('#join-btn').attr("disabled", "disabled");
      } 
      if($('#userpw').val() == $('#userpw_two').val()){
         $('#text2').html('비밀번호가 일치합니다.<br><br>');
         $('#text2').css('color', 'blue');
         $('#join-btn').removeAttr("disabled");
      }
   });
});


   //   $(function() {
//      if($("#userpw").val() != $("#userpw_two").val()){
//         alert("비밀번호가 일치하지 않습니다.");
//         return false;
//      }
//   });
//   


   
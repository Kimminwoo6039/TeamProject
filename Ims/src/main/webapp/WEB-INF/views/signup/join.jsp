<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@200&display=swap');*{padding:0;margin:0;box-sizing:border-box}.container{display:flex;justify-content:center;align-items:center;min-height:100vh;background-image: linear-gradient(to right top,#black,#black)}.container .card{height:420px;width:800px;background-color:#black;position:relative;box-shadow:0 15px 30px rgba(0,0,0,0.1);font-family: 'Roboto Slab', serif}.container .card .form{width:100%;height:100%;display:flex}.container .card .left-side{width:50%;background-color:#fff;height:100%;position:relative;overflow:hidden}
.left-side span:nth-child(1){position:absolute;transform:rotate(45deg);top:70px;left:-100px;display:flex;height:180px;width:400px;border-top-right-radius:150px;border-bottom-right-radius:150px;border:15px solid gray;background-image: linear-gradient(to right,black,white)}.left-side span:nth-child(2){position:absolute;transform:rotate(45deg);top:-20px;left:130px;display:flex;height:100px;width:200px;border-top-right-radius:150px;border-bottom-right-radius:150px;background-image: linear-gradient(to right,black,white)}.left-side span:nth-child(3){position:absolute;transform:rotate(45deg);top:280px;left:-70px;display:flex;height:100px;width:200px;border-top-right-radius:150px;border-bottom-right-radius:150px;background-image: linear-gradient(to right,black,white)}.left-side span:nth-child(4){position:absolute;transform:rotate(-135deg);top:370px;left:170px;display:flex;height:100px;width:200px;border-top-right-radius:150px;border-bottom-right-radius:150px;background-image: linear-gradient(to right,black,white)}.container .card .right-side{width:50%;background-color:#fff;height:100%;padding:20px}.d-none{display:none !important}.login{display:flex;justify-content:center;text-align:center;width:100%;margin-top:20px}.input_text{margin-top:20px;width:100%;position:relative}input[type="text"]{height:45px;width:100%;border:none;background-color:#E7DCE6;outline:0;padding:5px 10px;padding-left:25px;border-radius:10px}input[type="password"]{height:45px;width:100%;border:none;background-color:#E7DCE6;outline:0;padding:5px 10px;padding-left:25px;padding-right:28px;border-radius:10px}.fa-lock{position:absolute;top:15px;left:10px;cursor:pointer;color:#70747C}.fa-user{position:absolute;top:14px;left:9px;cursor:pointer;color:#70747C}.fa-envelope{position:absolute;top:15px;left:7px;cursor:pointer;color:#70747C;font-size:14px}.fa-eye-slash{position:absolute;top:15px;right:9px;cursor:pointer;color:#70747C}.fa-eye{position:absolute;top:15px;right:9px;cursor:pointer;color:#70747C}.login_btn{margin-top:20px;display:flex;justify-content:center;align-items:center}.login_btn button{height:45px;outline:0;border:none;width:100%;color:#fff;border-radius:30px;background-color:#B33346;font-size:13px;cursor:pointer;transition:all 0.5s}.login_btn button:hover{background-color:#631B26}.forgot{text-align:center;margin-top:20px;font-size:13px;color:#B8B0B1;font-weight:600;letter-spacing:1px}.forgot p a{text-decoration:none}.create{margin-top:40px;text-align:center;text-decoration:none;font-size:13px;font-weight:700}.margin{margin-top:67px !important}.create a{text-decoration:none;color:blue}.signin_warn{border:1px solid red !important}.signup_warn{border:1px solid red !important}.signin_eye_wrn{border:1px solid blue !important}.signup_eye_wrn{border:1px solid blue !important}@media (max-width:750px){.container .card{max-width: 350px}.container .card .right-side{width:100%}.container .card .left-side{display: none}}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Im's</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">



<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){

	
	
	$("#checkId").click(function(){
	
		let member_id = $("#member_id").val();
	 
 		
		$.ajax({
			type:'post',
			url:"/shop/checkId.do",
			data: {"member_id":member_id},
			success: function(data){
				if(data == "N"){
					alert('사용가능한 아이디입니다.');
					/* result = "사용 가능한 아이디입니다."; */
				/* 	$("#result_checkId").html(result).css("color", "green");
					$("#member_pw").trigger("focus"); */
				 
			 }else{
					alert('사용 불가능한 아이디입니다.');
				 result="이미 사용중인 아이디입니다.";
					/*  $("#result_checkId").html(result).css("color","red");
					 $("#member_id").val("").trigger("focus"); */
			 }
				 
		 },
			error : function(error){alert(error);}
		});
		
	});
	
});



$(function(){
//휴대폰 번호 인증var code2 = "";
$("#phoneChk").click(function(){
	alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
	var phone = $("#phoneNumber").val();
	$.ajax({
        type:"POST",
        url:"/shop/member/sendSMS1.do",
        data: {phoneNumber:phone},
        cache : false,
        success:function(data){
        	if(data == "error"){
        		alert("휴대폰 번호가 올바르지 않습니다.")
        	}else{	        		
        		alert("휴대폰 전송이  됨.")
        		code2 = data;
        	}
        }
        
    });
});



//휴대폰 인증번호 대조
  $("#phoneChk2").click(function(){
  	if($("#phone2").val() == code2){
           alert('인증성공')
  	}else{
  	    alert('인증실패')
  	}
  });


//이메일 인증
  $("#emailChk").click(function(){
  	
  	alert('이메일 인증 시작..');
  	
  	var email = $("#member_email").val();
  	
  	$.ajax({
          type:"POST",
          url:"/shop/email/send.do",
          data: {send:email},
          cache : false,
          success:function(data){
          	if(data == "error"){
          		alert("이메일이 올바르지 않습니다.")
          	}else{	        		
          		alert("이메일 전송이  됨.")
          		code3 = data;
          	}
          }
          
      });
  });
  
//이메일 인증번호 대조
  $("#emailChk2").click(function(){
  	if($("#email2").val() == code3){
           alert('인증 성공')
  	}else{
  	    alert('인증 실패')
  	}
  });


});


</script>


	
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
</script>
</head>

<body>
<div class="container"> 
<div class="card"  style="height:1000px"> 
<div class="form">
 <div class="left-side">
  <span></span>
   <span></span>
    <span></span> 
    <span></span>
     </div>
      <div class="right-side" >
     <div class="signin_form s_form "> 
     <div class="login">
      <h2>Im's</h2>
      
       </div>
       <form action="/shop/member/joinProcess.do" method="post">
        
      
     
         
             <div class="input_text">
          <input class="w-50 p-3 " style="background-color: #eee;" type="text" name="member_name" placeholder="이름을 입력해주세요">
           <i class="fa fa-lock"></i> 
           <i class="fa fa-eye-slash"></i> 
         
              <div class="input_text">
          <input class="w-50 p-3 " style="background-color: #eee;" type="text" name="member_id" id="member_id" placeholder="아이디 입력">
          <input  class="btn btn-outline-dark" type="button" value="중복확인" id="checkId">
           <i class="fa fa-lock"></i> 
           <i class="fa fa-eye-slash"></i> 
           
                <div class="input_text">
          <input class="w-100 p-3" style="background-color: #eee;" type="password" name="member_pw" placeholder="비밀번호를 입력해주세요" id="password">
       
           <i class="fa fa-lock"></i> 
           <i class="fa fa-eye-slash"></i> 
           
            <div class="input_text">
          <input class="w-100 p-3" style="background-color: #eee;" type="password" name="member_pw2" placeholder="비밀번호를 확인해주세요" id="passwordConfirm">
          <input  class="btn btn-outline-dark m-2" type="button" value="확인" id="passwordChk" 
          onclick="passConfirm()">
          <script type="text/javascript">
	/* 자바 스크립트 함수 선언(비밀번호 확인) */

	function passConfirm() {
	/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
	/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
	/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
		var password = document.getElementById('password');					//비밀번호 
		var passwordConfirm = document.getElementById('passwordConfirm');	//비밀번호 확인 값
		var confrimMsg = document.getElementById('confirmMsg');				//확인 메세지
		var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
		var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
		
		if(password.value == passwordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			alert('비밀번호 사용가능합니다.')
			confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
			confirmMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}else{
			alert('비밀번호가 맞지 않습니다.')
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호 불일치";
		}
	}
</script>
           <i class="fa fa-lock"></i> 
           <i class="fa fa-eye-slash"></i> 
           

         
    
<input type="text" class="w-100 p-3 m-2" style="background-color: #eee;" id="sample6_postcode"   placeholder="우편번호" name="member_addr1">

<input type="button"class="btn btn-dark m-2"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
  
        
<input type="text" class="w-50 p-3 m-2" style="background-color: #eee;" id="sample6_address" placeholder="주소" name="member_addr2"><br>
<input type="text" class="w-50 p-3 m-2" style="background-color: #eee;" id="sample6_detailAddress" placeholder="상세주소" name="member_addr3">
<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">

           
          </div> 
          
       
           
            <div class="input_text">
           <input  class="w-75 p-3 m-2" style="background-color: #eee;" id="phoneNumber" type="text" name="phoneNumber" title="전화번호 입력" placeholder="전화번호 입력해주세요">
			<input  class="btn btn-dark"  type="button" value="입력" id="phoneChk">
		
		    <input class="w-50 p-3 m-2" style="background-color: #eee;" id="phone2" type="text" name="phone" title="전화번호 입력" placeholder="인증번호 입력">
			<input  class="btn btn-outline-dark " type="button" value="인증확인" id="phoneChk2">
			
           
           
           
           
           
               <div class="input_text">
           	<input class="w-75 p-3 m-2" style="background-color: #eee;" type="text" id="member_email" name="member_email" placeholder="메일주소를 입력해주세요">
			<input class="btn btn-dark"  type="button" value="입력" id="emailChk">
			  
           
          <input class="w-50 p-3 m-2 " style="background-color: #eee;" type="text" id="email2" name="email" placeholder="인증번호 입력">
          <input  class="btn btn-outline-dark" type="button" value="인증확인" id="emailChk2">
           <i class="fa fa-lock"></i> 
           <i class="fa fa-eye-slash"></i> 
           
        </form>
           
          <div class="login_btn"> 
          <button type="submit" class="btn btn-dark" >join</button> </div> 
         <div class="create margin"> 
          
       </div>     
          
         
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<meta charset="UTF-8">

<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

$(function(){

$("#btnLogin").click(function(){
var userid=$("#userid").val();
var passwd=$("#passwd").val();
if(userid==""){

alert("아이디를 입력하세요.");

$("#userid").focus();
return;

}

if(passwd==""){

alert("비밀번호를 입력하세요.");

$("#passwd").focus();
return;

}

document.form1.action="/shop/member/login_check.do";
document.form1.submit();
});



});

</script>

</head>

<body>

<%@ include file="../include/menu.jsp" %>

<h2> 로그인</h2>

<form name="form1" method="post">

<table border="1" width="400px">

<tr>

<td>아이디</td>

<td><input id="userid" name="member_id"></td>

</tr>

<tr>

<td>비밀번호</td>

<td><input type="password" id="passwd" name="member_pw">

</td>

</tr>

<tr>

<td colspan="2" align="center">

<button type="button" id="btnLogin">로그인</button>

<c:if test="${message == 'error' }">

<div style="color:red;">

아이디 또는 비밀번호가 일치하지 않습니다.

</div>

</c:if>


<c:if test="${param.message == 'logout' }">

<div style="color:red;">
로그아웃되었습니다.

</div>

</c:if>

</td>

</tr>

</table>

 <a id="custom-login-btn" href="javascript:kakaoLogin()">
      <img
        src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
        width="222"
      />
    </a>
    <button id="logout-btn" style="display: none" onclick="kakaoLogout();">
      로그아웃
    </button>
    <script>
      Kakao.init("012a27e095a806df95d215e20a442cb6"); //발급 받은 앱키

      function kakaoLogin() {
        Kakao.Auth.login({
          scope: "profile_nickname,account_email", //동의항목에서 설정한 ID와 반드시 일치해야 함
          success: function () {
            //로그인 성공
            Kakao.API.request({
              //사용자 정보를 가져오기 위한 API
              url: "/v2/user/me",
              success: (res) => {
                //사용자 정보를 가져오는데 성공
                const kakaoAccount = res.kakao_account; //사용자 계정 정보
                console.log(kakaoAccount);
                document.getElementById("custom-login-btn").style.display =
                  "none"; //로그인 버튼 숨기기
                document.getElementById("logout-btn").style.display = ""; //로그아웃 버튼 보이기
              },
            });
          },
          fail: function (error) {
            //로그인 실패
            console.log(error);
          },
        });
      }

      function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
          //로그인을 했으면 Access Token 이 발급되어져 있음. 없으면 아직 로그인을 안한 것임.
          console.log("Not logged in.");
          return;
        }

        Kakao.Auth.logout((res) => {
          //로그아웃 함수 호출
          console.log(window.Kakao.Auth.getAccessToken());
          console.log(res);
          document.getElementById("custom-login-btn").style.display = ""; //로그인 버튼 보이기
          document.getElementById("logout-btn").style.display = "none"; //로그아웃 버튼 숨기기
        });
      }
    </script>

</form>

</body>

</html>

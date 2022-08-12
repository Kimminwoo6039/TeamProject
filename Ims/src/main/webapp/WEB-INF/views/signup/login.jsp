<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@200&display=swap');*{padding:0;margin:0;box-sizing:border-box}.container{display:flex;justify-content:center;align-items:center;min-height:100vh;background-image: linear-gradient(to right top,#black,#black)}.container .card{height:420px;width:800px;background-color:#black;position:relative;box-shadow:0 15px 30px rgba(0,0,0,0.1);font-family: 'Roboto Slab', serif}.container .card .form{width:100%;height:100%;display:flex}.container .card .left-side{width:50%;background-color:#fff;height:100%;position:relative;overflow:hidden}.left-side span:nth-child(1){position:absolute;transform:rotate(45deg);top:70px;left:-100px;display:flex;height:180px;width:400px;border-top-right-radius:150px;border-bottom-right-radius:150px;border:15px solid gray;background-image: linear-gradient(to right,black,white)}.left-side span:nth-child(2){position:absolute;transform:rotate(45deg);top:-20px;left:130px;display:flex;height:100px;width:200px;border-top-right-radius:150px;border-bottom-right-radius:150px;background-image: linear-gradient(to right,black,white)}.left-side span:nth-child(3){position:absolute;transform:rotate(45deg);top:280px;left:-70px;display:flex;height:100px;width:200px;border-top-right-radius:150px;border-bottom-right-radius:150px;background-image: linear-gradient(to right,black,white)}.left-side span:nth-child(4){position:absolute;transform:rotate(-135deg);top:370px;left:170px;display:flex;height:100px;width:200px;border-top-right-radius:150px;border-bottom-right-radius:150px;background-image: linear-gradient(to right,black,white)}.container .card .right-side{width:50%;background-color:#fff;height:100%;padding:20px}.d-none{display:none !important}.login{display:flex;justify-content:center;text-align:center;width:100%;margin-top:20px}.input_text{margin-top:20px;width:100%;position:relative}input[type="text"]{height:45px;width:100%;border:none;background-color:#E7DCE6;outline:0;padding:5px 10px;padding-left:25px;border-radius:10px}input[type="password"]{height:45px;width:100%;border:none;background-color:#E7DCE6;outline:0;padding:5px 10px;padding-left:25px;padding-right:28px;border-radius:10px}.fa-lock{position:absolute;top:15px;left:10px;cursor:pointer;color:#70747C}.fa-user{position:absolute;top:14px;left:9px;cursor:pointer;color:#70747C}.fa-envelope{position:absolute;top:15px;left:7px;cursor:pointer;color:#70747C;font-size:14px}.fa-eye-slash{position:absolute;top:15px;right:9px;cursor:pointer;color:#70747C}.fa-eye{position:absolute;top:15px;right:9px;cursor:pointer;color:#70747C}.login_btn{margin-top:20px;display:flex;justify-content:center;align-items:center}.login_btn button{height:45px;outline:0;border:none;width:100%;color:#fff;border-radius:30px;background-color:#B33346;font-size:13px;cursor:pointer;transition:all 0.5s}.login_btn button:hover{background-color:#631B26}.forgot{text-align:center;margin-top:20px;font-size:13px;color:#B8B0B1;font-weight:600;letter-spacing:1px}.forgot p a{text-decoration:none}.create{margin-top:40px;text-align:center;text-decoration:none;font-size:13px;font-weight:700}.margin{margin-top:67px !important}.create a{text-decoration:none;color:blue}.signin_warn{border:1px solid red !important}.signup_warn{border:1px solid red !important}.signin_eye_wrn{border:1px solid blue !important}.signup_eye_wrn{border:1px solid blue !important}@media (max-width:750px){.container .card{max-width: 350px}.container .card .right-side{width:100%}.container .card .left-side{display: none}}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Im's</title>
<!-- 네아로 SDK -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
<div class="container"> 
<div class="card"> 
<div class="form">
 <div class="left-side">
  <span></span>
   <span></span>
    <span></span> 
    <span></span>
     </div> 
     
     <div class="right-side"> 
     <div class="signin_form s_form "> 
     <div class="login">
     <form name="form" method="post" action="<%=request.getContextPath() %>/member/login_check.do">
     <table border="1" width="300px">
     
     </form>
      <h2>Im's</h2>
       </div> 
       
       <div class="input_text">
        <input type="text" class="w-100 p-3" style="background-color: #eee;" name="member_id" placeholder="Username">
         <i class="fa fa-user"></i> 
        
         </div> 
         
         <div class="input_text">
          <input class="w-100 p-3" style="background-color: #eee;" type="password" name="member_pw" placeholder="Password"> <i class="fa fa-lock"></i> <i class="fa fa-eye-slash"></i> 
          </div> 
           </form>
           
          <div class="login_btn" style="margin-bottom: 8px;"> 
          <button class="login_button">LOGIN</button> </div> 
          <div class="forgot" style="margin-bottom: 30px;">
            <a href="<%=request.getContextPath() %>/member/pwFindForm.do" style="margin-bottom: -4px;"> <p style="margin-bottom: 4px;">비밀번호를 잊으셨나요? </p>
             </a> 
          
           <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=b3c90d252e0ab2e93579050eaf013549&redirect_uri=http://localhost:8090/shop/kakao.do&response_type=code">
		<img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="width: 184.95;height: 40px;">
					</a>
          
          <div id="naverIdLogin" style="margin-top: 6px;"></div>
           <a href="<%=request.getContextPath() %>/member/join.do " style="margin-bottom: 130px;">Create your Account <i class="fa fa-long-arrow-right">
       </a>
       </div>
          </div> 
        
       </div>
          </div>
     
					
      
          <!-- 네이버 로그인 버튼 생성 위치 -->

          
          <script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "OJ052qiphOR5rZzvU5l6",
  			// 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
			callbackUrl: "http://192.168.0.145:8090/shop/callback",
  			// 본인의 callBack url로 수정하세요.
			isPopup: false,
			loginButton: {color: "green", type: 3, height: 40}
  			// 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
		}
	);
naverLogin.init();
</script>
          
          </div>
       
          
         
          
          </div> </div> <div class="signup_form s_form d-none"> <div class="login">
           <h2>Create Account</h2> </div> <div class="input_text">
            <input type="text" placeholder="Username"> <i class="fa fa-user"></i> </div>
             <div class="input_text">
              <input type="text" placeholder="Email">
               <i class="fa fa-envelope"></i> </div> 
               <div class="input_text"> <input type="password" class="signup_pass" placeholder="Password"> 
               <i class="fa fa-lock"></i> 
               <i class="fa fa-eye-slash signup_eye"></i>
                </div> <div class="login_btn"> <button class="signup_button">Sign Up</button> </div> <div class="create">
                 <p>Already have an account?
                 
             <a href="#" class="btn btn-dark">Login 
                 <i class="fa fa-long-arrow-right">
                 </i>
                
                 
                 
                 
                 
                 
                 </a>
                 </p> 
                 </div> </div> </div> </div> </div>
                 
                 
                 
</div>
</body>
</html>
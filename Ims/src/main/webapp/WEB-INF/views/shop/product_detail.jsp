<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
 
    <style>
    
     @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Open+Sans:ital@1&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Sans+KR&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Sans+KR:wght@400;900&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Sans+KR:wght@300;400;900&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Sans+KR:wght@500&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Sans+KR:wght@300;900&display=swap');
    
        .container {
            max-width: 560px;
        }
    </style>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

    
    
 <script>
  function check(){  
  var fm = document.form;   
  if (fm.amount.value==""){
		alert("수량을 선택해주세요");
		fm.size.focus();
		
	 
		
		return;
  }  
  
	
	//가상경로 사용
	fm.action = "/shop/shop/cart/insert.do";
	fm.method = "post";
	fm.submit();  

return;
}  
  
</script>  
 
  
    
    
</head>
<body>

    


 <%@ include file="../include/menu.jsp" %>
  
 
      
      <form name="form">
      
      <input type="hidden" name="price" value="${vo.price}">
       <input type="hidden" name="size" value="${vo.size}">
        <input type="hidden" name="product_code" value="${vo.product_code}">
      
      
      <div class="container mt-5 mb-1">
    	<div class="card">	
            <div class="row g-0">
                	<div class="col-md-6 border-end">
                        	<div class="d-flex flex-column justify-content-center">	
                                <div class="main_image"">
                                    	<img src="/shop/resources/images/${vo.filename}" id="main_product_image" width="647px;" height="740	px;">	
                                    </div>	
                             
                                                        	</div>	
                                                        </div>
                                                        	<div class="col-md-6">
                                                                	<div class="p-3 right-side">
                                                                      <p style="font-family: 'Noto Sans KR', sans-serif;font-size: 19px;"> ${vo.brand} </p>
             
                                                                	<div class="d-flex justify-content-between align-items-center" style="margin-bottom: 13px;">
                                                            
                                                                        	<h3 style="font-family:  'Noto Sans KR', sans-serif;margin-bottom: 5px;color: #595959;">${vo.product_name}</h3>
                                                                             	
                                                                        	</div>	
                                                                            <span class="badge bg-dark">${vo.gender}</span>
                                                                            <span class="badge bg-dark">${vo.purpose}</span>
                                                                            <hr>
                                                                            <div style="display: flex;align-items: center;">
                                                                                <label style="color: gray;font-family: 'Noto Sans KR', sans-serif;font-size:18px;">아임즈가격</label><Br>
                                                                            	<h3 style="margin-left: 20px;font-family: 'Noto Sans KR', sans-serif;font-size: 23px;margin-top: 6px;"><fmt:formatNumber value="${vo.price}" pattern="#,###" />원</h3>	
                                                                            </div>
                                                                            <div style="display: flex;align-items: center;margin-top: 6px;">
                                                                               <label style="color: gray;font-family: 'Noto Sans KR', sans-serif;font-size:18px;display: flex;">이벤트
                                                                            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            	<p style="margin-left: 20px;color: gray;">"아임즈몰 결제금액 30만원이상 최조구매 자에 한해 <br> 추첨으로 100만원상당 선물증정"</p>		
                                                                            </div>
                                                                            <hr>
                                                                            <div style="display: flex;align-items: center;">
                                                                                 <label style="color: gray;font-family: 'Noto Sans KR', sans-serif;font-size:18px;">카드무이자</label><Br>
                                                                            <p style="margin-left: 20px;color: gray;text-align: center;align-items: center;margin-top: 17px;">최대 36개월 (2,260원 x 36)</p>		
                                                                            </div>
                                                                             <div style="display: flex;align-items: center;">
                                                                                 <label style="color: gray;font-family: 'Noto Sans KR', sans-serif;font-size:18px;">배송정보</label><Br>
                                                                            <p style="margin-left: 20px;color: gray;text-align: center;align-items: center;margin-top: 17px;">100.000 원 이상 무료 배송 + 100% 묶음배송<br>배송비 <fmt:formatNumber value="${vo.fee}" pattern="#,###" />원</p>	
                                                                            </div>
                                                                          <div style="display: flex;align-items: center;">
                                                                                 <label style="color: gray;font-family: 'Noto Sans KR', sans-serif;font-size:18px;">카드무이자</label><Br>
                                                                            <p style="margin-left: 20px;color: gray;text-align: center;align-items: center;margin-top: 17px;">브랜드국(원산지):미국,호주 | 사계절용</p>		
                                                                            </div>
                                                                            <div style="display: flex;align-items: center;">
                                                                                 <label style="color: gray;font-family: 'Noto Sans KR', sans-serif;font-size:18px;">상품사이즈</label><Br>
                                                                            <p style="margin-left: 20px;color: gray;text-align: center;align-items: center;margin-top: 17px;">${vo.size}</p>		
                                                                            </div>
                                                                            <div style="display: flex;align-items: center;">
                                                                                <label style="color: gray;font-family: 'Noto Sans KR', sans-serif;font-size:18px;">상품수량</label><Br>
                                                                            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            	<input type="number" size="3000" min="1" max="99" style="width: 400px;border-radius: 5px;" class="form" name="amount" value="amount">
                                                                            </div> 
                                                             <div class="buttons d-flex flex-row mt-5 gap-3" style="margin-left: 80px;margin-bottom: 20px;">
                                                               	<button class="btn btn-outline-dark" type="button" onclick="check()">Buy Now</button>
                                                                     	<button class="btn btn-dark" onclick="location='/shop/shop/product/list.do'" type="button">Product list</button>
                                                      	</div>
                                                      	</div>
                                                      	</div>
                                                      	</div>
                                                      	</div>
                                                      	</div>
                                                      	
      
      
      
      
      
      </form>
      
      
      
      
      
      
      
          <br><br>
          <hr>
          <div class="row" style="text-align: center;">
              <div class="col-12">
              <img src="https://cdn-prd.ssoldot.me/media/events/9A6kDrZFvWnJupX.jpg" class="img-fluid"/>
                  <br><br><br><br>
                  <img src="https://storage.googleapis.com/cbmpress/uploads/sites/3/2017/01/cloth-05.jpg" class="img-fluid"/>
                  <br><br><br><br>
                  <img src="https://cdn.imweb.me/upload/S201912072d9f3bab5337e/8faafefd2429a.jpg" class="img-fluid"/>
                   <br><br><br><br>
                  <img src="http://m.thefindme.co.kr/web/upload/NNEditor/20190823/EAB590ED999820EBB08F20EBB098ED928820EC9588EB82B4.jpg" class="img-fluid"/>
              </div>
          </div>
      </main>

      <!--footer-->
      <footer class="py-5 bg-dark mt-5">
        <div class="row">
          <div class="col-12 col-md">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mb-2" role="img" viewBox="0 0 24 24"><title>Product</title><circle cx="12" cy="12" r="10"/><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"/></svg>
            <small class="d-block mb-3 text-muted">&copy; 2017–2021</small>
          </div>
          <div class="col-6 col-md">
            <h5>Features</h5>
            <ul class="list-unstyled text-small">
              <li><a class="link-secondary" href="#">Cool stuff</a></li>
              <li><a class="link-secondary" href="#">Random feature</a></li>
              <li><a class="link-secondary" href="#">Team feature</a></li>
              <li><a class="link-secondary" href="#">Stuff for developers</a></li>
              <li><a class="link-secondary" href="#">Another one</a></li>
              <li><a class="link-secondary" href="#">Last time</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>Resources</h5>
            <ul class="list-unstyled text-small">
              <li><a class="link-secondary" href="#">Resource name</a></li>
              <li><a class="link-secondary" href="#">Resource</a></li>
              <li><a class="link-secondary" href="#">Another resource</a></li>
              <li><a class="link-secondary" href="#">Final resource</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>Resources</h5>
            <ul class="list-unstyled text-small">
              <li><a class="link-secondary" href="#">Business</a></li>
              <li><a class="link-secondary" href="#">Education</a></li>
              <li><a class="link-secondary" href="#">Government</a></li>
              <li><a class="link-secondary" href="#">Gaming</a></li>
            </ul>
          </div>
          <div class="col-6 col-md">
            <h5>About</h5>
            <ul class="list-unstyled text-small">
              <li><a class="link-secondary" href="#">Team</a></li>
              <li><a class="link-secondary" href="#">Locations</a></li>
              <li><a class="link-secondary" href="#">Privacy</a></li>
              <li><a class="link-secondary" href="#">Terms</a></li>
            </ul>
          </div>
        </div>
      </footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
 
    <style>
        .container {
            max-width: 560px;
        }
    </style>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"></script>
    
    
 <script>
  function check(){  
  var fm = document.form;   
  if (fm.size.value==""){
		alert("사이즈를 선택해주세요");
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
<body onload="init();">

    


<script language="JavaScript">

var price;
var respeople;

function init () {
	price = document.form.price.value;
	itemQuantity = document.form.amount.value;
	document.form.sum.value = price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * price;
}  

</script>


 <%@ include file="../include/menu.jsp" %>
  
   </nav>
      <main>
          <div class="container">
              <div class="row mt-5">
                  <div class="col-md-5">
                      <!--이미지-->
                    <div id="carouselExampleIndicators" class="" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img src="/shop/resources/images/${vo.filename}" class="d-block" alt="..." height="250px" width="250px" name="filename" style="margin-left: 100px;margin-top: 120px;">
                      
                          </div>
                         
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                          <span class="carousel-control-next-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Next</span>
                        </button>
                      </div>
                  </div>
                  <!--이미지-->
                  
                  
                  
                  
                  <div class="col-md-7">
                    <form name="form",method="post" action="/spring/shop/cart/insert.do">
                              <input type="hidden" name="product_code" value="${vo.product_code}">
                              <input type="hidden" name="price" value="${vo.price}">
                 <input type="hidden" value="${vo.product_code}">
                 <input type="hidden" name="color" value="${vo.color}">
                       <input type="hidden" value="${vo.filename}" name="filename">
                        <div class="card shadow-sm" >
                          
                            <div class="card-body">
                              <h5 class="card-title">${vo.product_name}<h5>
                              <h5 class="card-title pt-3 pb-3 border-top"><fmt:formatNumber value="${vo.price}" pattern="#,###" />&nbsp;원</h5>
                              <p class="card-text border-top pt-3 ">
                                <span class="badge bg-dark">신발</span>  
                                <span class="badge bg-dark">명품</span>
                                <span class="badge bg-dark">나이키</span>
                              </p>
                              <p class="card-text pb-3">
                              <br>
                                배송비 2.500 원 | 도서산관(제주도) 배송비 추가 5.000 원 <br>
                                 <br>택배배송 | 5일이내 출고(주말,공휴일 제외)<br>
                                <strong> 30,000원 이상 구입시 배송비 무료 </strong>
                              </p>
                              <p class="card-text border-top pb-3 ">
                                <div class="row">
                                    <div class="col-auto">
                                     <label class="col-form-label">사이즈</label><Br><br>
                                        <label class="col-form-label">구매수량</label>
                                    </div>
                                    <div class="col-auto">
 <select class="form-select" aria-label="Default select example" name="size">
  <option selected></option>
  <option value="210">210</option>
  <option value="220">220</option>
  <option value="230">230</option>
  <option value="240">240</option>
  <option value="250">250</option>
  <option value="260">260</option>
  <option value="270">270</option>
  <option value="280">280</option>
  <option value="290">290</option>
</select><Br>
                                               <div class="input-group flex-nowrap">
                                               <Br>


  <input type="text" class="form-control" placeholder="수량" value="1" max="" name="amount" aria-label="Username" aria-describedby="addon-wrapping">
   <input class="btn btn-primary btn-lg" type="button" value="+" onclick="add();"> 
    <input class="btn btn-danger btn-lg" type="button" value="-" onclick="del();"> 
                                          </div>
                                          
                                    </div>
                                </div>
                              </p>
                              <div class="row pt-3 pb-3 border-top">
                                  <div class="col-6">
                                      <h3>총 상품 금액</h3>
                                  </div>
                                  <div class="col-6" style="text-align: right;">
                                   <input type="text" class="form-control"  name="sum"  readonly="readonly" >	
                                </div>
                              </div>
                              
                              
                              <div class="d-flex justify-content-between align-items-center">
                            
                              
                               
                                 
                                  <div class="col-6 d-grid p-1">
                                    <button type="button" class="btn btn-lg btn-dark" onclick="check()">장바구니 담기</button>
                                  </div>
                                   <div class="col-6 d-grid p-1">
                                    <button type="button" class="btn btn-lg btn-danger" onclick="location='/shop/shop/product/list.do'">상품목록</button>
                                  </div>
                                   </form>
                              </div>
                              
                            </div>
                          </div>                 
                  
                </div>
              
          </div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

   <script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>
       <link rel='stylesheet' href='https://sachinchoolur.github.io/lightslider/dist/css/lightslider.css'>
    
	<!-- s: dropdown css -->
	<link href="${pageContext.request.contextPath}/resources/js/smoothscroll.min.js"></link>
	<!-- e: dropdown css -->
	
    
                        <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'></script>
<script src='https://sachinchoolur.github.io/lightslider/dist/js/lightslider.js'></script>
<script> $('#lightSlider').lightSlider({ gallery: true, item: 1, loop: true, slideMargin: 0, thumbItem: 9 });
</script>


<style>

 /* 리뷰쓰기 버튼 */
  .reply_button_wrap{
  	padding : 10px;
  }
  .reply_button_wrap button{
	background-color: #365fdd;
    color: white;
    font-weight: bold;
    font-size: 15px;
    padding: 5px 12px;
    cursor: pointer;  
  }
  .reply_button_wrap button:hover{
  	background-color: #1347e7;
  }
  
  /* 리뷰 영역 */
  	.content_bottom{
  		width: 80%;
  		margin : auto;
  	}
	.reply_content_ul{
		list-style: none;
	}
	.comment_wrap{
		position: relative;
    	border-bottom: 1px dotted #d4d4d4;
    	padding: 14px 0 10px 0;	
    	font-size: 12px;
	}
		/* 리뷰 머리 부분 */
		.reply_top{
			padding-bottom: 10px;
		}
		.id_span{
			padding: 0 15px 0 3px;
		    font-weight: bold;		
		}
		.date_span{
			padding: 0 15px 0;
		}
		/* 리뷰 컨텐트 부분 */
		.reply_bottom{
			padding-bottom: 10px;
		}
		
	
	/* 리뷰 선 */
	.reply_line{
		width : 80%;
		margin : auto;
		border-top:1px solid #c6c6cf;  	
	}
	
	/* 리뷰 제목 */
	.reply_subject h2{
		padding: 15px 0 5px 5px;
	}
	
	/* pageMaker */
	.repy_pageInfo_div{
		text-align: center;
	    margin-top: 30px;
	    margin-bottom: 40px;	
	}
	.pageMaker{
	    list-style: none;
	    display: inline-block;	
	}
	.pageMaker_btn{
		float: left;
	    width: 25px;
	    height: 25px;
	    line-height: 25px;
	    margin-left: 20px;
	    font-size: 10px;
	    cursor: pointer;
	}
	.active{
		border : 2px solid black;
		font-weight:400;	
	}
	.next, .prev {
	    border: 1px solid #ccc;
	    padding: 0 10px;
	}	
  
  /* 리뷰 없는 경우 div */
  .reply_not_div{
  	text-align: center;
  }
  .reply_not_div span{
	display: block;
    margin-top: 30px;
    margin-bottom: 20px; 
  }
  
  /* 리뷰 수정 삭제 버튼 */
  .update_reply_btn{
 	font-weight: bold;
    background-color: #b7b399;
    display: inline-block;
    width: 40px;
    text-align: center;
    height: 20px;
    line-height: 20px;
    margin: 0 5px 0 30px;
    border-radius: 6px;
    color: white; 
    cursor: pointer;
  }
  .delete_reply_btn{
 	font-weight: bold;
    background-color: #e7578f;
    display: inline-block;
    width: 40px;
    text-align: center;
    height: 20px;
    line-height: 20px;
    border-radius: 6px;
    color: white; 
  	cursor: pointer;
  }



</style>



<style type="text/css">

@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800&display=swap");


   body{

    background-color: #eee;
    font-family: "Poppins", sans-serif

   }

.card {
    background-color: #fff;
    padding: 14px;
    border: none
}

.demo {
    width: 100%
}

ul {
    list-style: none outside none;
    padding-left: 0;
    margin-bottom: 0
}

li {
    display: block;
    float: left;
    margin-right: 6px;
    cursor: pointer
}

img {
    display: block;
    height: auto;
    width: 100%
}

.stars i {
    color: #f6d151
}

.stars span {
    font-size: 13px
}

hr {
    color: #d4d4d4
}

.badge {
    padding: 5px !important;
    padding-bottom: 6px !important
}

.badge i {
    font-size: 10px
}

.profile-image {
    width: 35px
}

.comment-ratings i {
    font-size: 13px
}

.username {
    font-size: 12px
}

.comment-profile {
    line-height: 17px
}

.date span {
    font-size: 12px
}

.p-ratings i {
    color: #f6d151;
    font-size: 12px
}

.btn-long {
    padding-left: 35px;
    padding-right: 35px
}

.buttons {
    margin-top: 15px
}

.buttons .btn {
    height: 46px
}

.buttons .cart {
    border-color: #ff7676;
    color: #ff7676
}

.buttons .cart:hover {
    background-color: #e86464 !important;
    color: #fff
}

.buttons .buy {
    color: #fff;
    background-color: #ff7676;
    border-color: #ff7676
}

.buttons .buy:focus,
.buy:active {
    color: #fff;
    background-color: #ff7676;
    border-color: #ff7676;
    box-shadow: none
}

.buttons .buy:hover {
    color: #fff;
    background-color: #e86464;
    border-color: #e86464
}

.buttons .wishlist {
    background-color: #fff;
    border-color: #ff7676
}

.buttons .wishlist:hover {
    background-color: #e86464;
    border-color: #e86464;
    color: #fff
}

.buttons .wishlist:hover i {
    color: #fff
}

.buttons .wishlist i {
    color: #ff7676
}

.comment-ratings i {
    color: #f6d151
}

.followers {
    font-size: 9px;
    color: #d6d4d4
}

.store-image {
    width: 42px
}

.dot {
    height: 10px;
    width: 10px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    margin-right: 5px
}

.bullet-text {
    font-size: 12px
}

.my-color {
    margin-top: 10px;
    margin-bottom: 10px
}

label.radio {
    cursor: pointer
}

label.radio input {
    position: absolute;
    top: 0;
    left: 0;
    visibility: hidden;
    pointer-events: none
}

label.radio span {
    border: 2px solid #8f37aa;
    display: inline-block;
    color: #8f37aa;
    border-radius: 50%;
    width: 25px;
    height: 25px;
    text-transform: uppercase;
    transition: 0.5s all
}

label.radio .red {
    background-color: red;
    border-color: red
}

label.radio .blue {
    background-color: blue;
    border-color: blue
}

label.radio .green {
    background-color: green;
    border-color: green
}

label.radio .orange {
    background-color: orange;
    border-color: orange
}

label.radio input:checked+span {
    color: #fff;
    position: relative
}

label.radio input:checked+span::before {
    opacity: 1;
    content: '\2713';
    position: absolute;
    font-size: 13px;
    font-weight: bold;
    left: 4px
}

.card-body {
    padding: 0.3rem 0.3rem 0.2rem
}


<!-- 찜 -->
#yeszzim::before{
	display:none;
}
#yeszzim::after{
	display:inline-block;
}
</style>

  
    
 <script>

	 
 
   function check(){  
	/*   $("#abc").click(function(){
		  let result = $("#result").text();
		  console.log('result='+result) 
		  
		  $("#amount").val(result);
		  console.log("amount ="+$("#amount").val());
		  
		  var fm = document.form;
		  
		  if($("#amount").val()==""){
			  alert("수량을 선택해주세요");
			  $("#amount").val().focus();
			  return;
		  }
		  
		  fm.action = "/shop/shop/cart/insert.do";
			fm.method = "post";
			fm.submit();  
		  
	  }); */
	  
   var fm = document.form;

  let result = $("#result").text();
  console.log('result='+result) 
  
   $("#amount").val(result);
		  console.log("amount ="+$("#amount").val());

		  let amount =  $("#amount").val();
	console.log("##### ="+amount);
  
  if (amount==0){
		alert("수량을 선택해주세요");

		
		return;
  }  
  
	
	//가상경로 사용
	fm.action = "<%=request.getContextPath() %>/shop/cart/insert.do";
	fm.method = "post";
	fm.submit();  

return; 
 } 
 

	  
   $(function(){
  
  $(".reply_button_wrap").on("click",function(e){
	
		e.preventDefault();
		
		const member_id = '${userid}';
		const product_code = '${vo.product_code}';
		
		let popUrl ="<%=request.getContextPath() %>/insert1.do?member_id="+member_id+"&product_code="+product_code;
		console.log(popUrl);
		let popOption = "width=490px, height=490px,top=300px,left=300px,scrollbars=yes";
		
		window.open(popUrl,"리뷰 쓰기",popOption);
		
	});
  
  
  
  
  
  
  
  });

  
  
  

</script>

  
<meta charset="UTF-8">
<title>Product detail</title>


</head>
<body>



     <%@ include file="../include/menu1.jsp" %>
<header>
</header>   

 <form name="form">
 
   <input type="hidden" name="price" value="${vo.price}">
       <input type="hidden" name="size" value="${vo.size}">
        <input type="hidden" name="product_code" value="${vo.product_code}">
        
<div class="container-fluid mt-2 mb-3">
 <div class="row no-gutters">
  <div class="col-md-5 pr-2">
   <div class="card" style="background: #eee;margin-bottom: 10px;">
    <div class="demo"> 
    
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner" style="margin-bottom: 2 0px;">
  
    <div class="carousel-item active" style="margin-bottom: 15px;">
      <img src="<%=request.getContextPath() %>/resources/images/${vo.filename}" style="height: 700px;">
    </div>
    <div class="carousel-item" style="margin-bottom: 15px;">
      <img src="<%=request.getContextPath() %>/resources/images/${vo.filename1}" style="height: 700px;">
    </div>
    <div class="carousel-item" style="margin-bottom: 15px;">
      <img src="<%=request.getContextPath() %>/resources/images/${vo.filename2}" style="height: 700px;">
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


 <div class="card mt-2">
<div class="reply_subject">
<h5>리뷰</h5>
<c:if test="${userid !=null}">
<div class="reply_button_wrap" id="abc" style="float: right;">
  <button >리뷰쓰기</button>
</div>
</c:if>
</div>
  
   <div class="d-flex flex-row">
    <div class="stars"> 

  <c:if test="${avg >= 1.0 and avg < 1.5}">
   <i class="fa fa-star"></i> 
    <i class="fa-regular fa-star"></i>
     <i class="fa-regular fa-star"></i>
      <i class="fa-regular fa-star"></i>
      
  </c:if>   
    <c:if test="${avg >= 1.5 and avg < 2.0}">
   <i class="fa fa-star"></i> 
   <i class="fa-solid fa-star-half-stroke"></i>
    <i class="fa-regular fa-star"></i>
     <i class="fa-regular fa-star"></i>
  </c:if>   
      <c:if test="${avg >= 2.0 and avg < 2.5}">
   <i class="fa fa-star"></i> 
   <i class="fa fa-star"></i> 
    <i class="fa-regular fa-star"></i>
     <i class="fa-regular fa-star"></i>
  </c:if>   
     <c:if test="${avg >= 2.5 and avg < 3.0}">
   <i class="fa fa-star"></i> 
   <i class="fa fa-star"></i> 
    <i class="fa-solid fa-star-half-stroke"></i>
    <i class="fa-regular fa-star"></i>
  </c:if>   
     <c:if test="${avg >= 3.0 and avg < 3.5}">
   <i class="fa fa-star"></i> 
   <i class="fa fa-star"></i> 
      <i class="fa fa-star"></i>
       <i class="fa-regular fa-star"></i>
  </c:if>  
     <c:if test="${avg >= 3.5 and avg < 4.0}">
   <i class="fa fa-star"></i> 
   <i class="fa fa-star"></i> 
      <i class="fa fa-star"></i>
        <i class="fa-solid fa-star-half-stroke"></i>
  </c:if>  
     <c:if test="${avg == 4.0}">
   <i class="fa fa-star"></i> 
   <i class="fa fa-star"></i> 
      <i class="fa fa-star"></i>
           <i class="fa fa-star"></i>
  </c:if>  
  
   </div>
    <span class="ml-1 font-weight-bold">&nbsp;&nbsp;&nbsp;${avg}점</span>
  </div>
   <hr>
    <div class="badges">
     
      </div> 
      <hr>
       <div class="comment-section"> 
        <div class="d-flex justify-content-between align-items-center"> 
        <div class="d-flex flex-row align-items-center"> 
        
         
             
            <div class="d-flex flex-column ml-1 comment-profile">
             <c:forEach var="row" items="${list}">
                 <div class="comment-ratings">
            <c:if test="${row.rating == '1.0'}">
                    <i class="fa fa-star"></i> 
            </c:if>
            
               <c:if test="${row.rating =='2.0'}">
                    <i class="fa fa-star"></i> 
                     <i class="fa fa-star"></i> 
            </c:if>
            
               <c:if test="${row.rating =='3.0'}">
                    <i class="fa fa-star"></i> 
                     <i class="fa fa-star"></i> 
                      <i class="fa fa-star"></i> 
            </c:if>
            
               <c:if test="${row.rating =='4.0'}">
                    <i class="fa fa-star"></i> 
                     <i class="fa fa-star"></i> 
                      <i class="fa fa-star"></i> 
                       <i class="fa fa-star"></i> 
            </c:if>
              
                 
                 </div> 
                <div class="date" style="display: flex;">
                <div>
                 <span class="username">${row.member_id}</span> 
                  <span class="text-muted" style="display: flex;float: right;margin-left: 500px;">${row.date}</span>
             </div>
                     
                      </div>
                        <div style="margin-top: 8px;">
                 ${row.content}
                 </div>
                 <hr>
                 </c:forEach>
                 
                 	<ul class="pagination justify-content-center" id="pageInfo">
			
			<c:if test="${pageMaker.prev}">
				<li class="page-item disabled">
					<a class="page-link" href="<%=request.getContextPath() %>/shop/product/detail/${vo.product_code}?page=${pageMaker.startPage - 1}">Previous</a>
				</li>
				</c:if>
			
			
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="page-item">
					<a class="page-link" href="<%=request.getContextPath() %>/shop/product/detail/${vo.product_code}?page=${num}">${num}</a>
				</li>
				</c:forEach>
			
				<c:if test="${pageMaker.next}">
				<li class="page-item">
					<a class="page-link" href="<%=request.getContextPath() %>/shop/product/detail/${vo.product_code}?page=${pageMaker.endPage + 1}">Next</a>
				</li>
				</c:if>
				</ul>
                 
                 
                 </div> </div>
                 </div>
               
                        
                       <div class="d-flex justify-content-between align-items-center">
                           <div class="d-flex flex-row align-items-center">
                            </div> </div>
                                
                                
                                
                                 </div> </div> </div>

    </div>

    
</div> 

  <div class="col-md-7">
   <div class="card">
   <div class="d-flex flex-row align-items-center">
    ${vo.brand}
       </div>
       
       
        <div class="about" style="margin-top: 6px;"> 
        <span class="font-weight-bold" style="font-size: 20px;">${vo.product_name}</span> 
        
       <h4 class="font-weight-bold" style="margin-top: 12px;">
       <fmt:formatNumber value="${vo.price}" pattern="#,###" />원
       	</h4> 
       	
       </div>
       
<label style="color: gray;font-family: 'Noto Sans KR', sans-serif;font-size:18px;"><strong>상품수량</strong></label>
    	<!-- //<input type="number" size="3000" min="1" max="99" style="width: 400px;border-radius: 5px;" class="form" name="amount" value="amount"> -->

<div class="row" style="display: flex;"> 
<div style="display: flex;">    
<input type='button' onclick='count("minus")' value='-' class="btn btn-outline-dark  ">
<div value="result" id='result' style="margin: 10px;">0</div>
<input name="amount" id="amount" value="" type="hidden">
<input type='button' onclick='count("plus")' value='+' class="btn btn-dark"/>
</div>
	<div class="buttons"> 
	</div>
	<div>
        
      <script>
        
        function count(type)  {
        	  // 결과를 표시할 element
        	  const resultElement = document.getElementById('result');
        	  
        	  // 현재 화면에 표시된 값
        	  let number = resultElement.innerText;
        	  
        	  // 더하기/빼기
        	  if(type === 'plus') {
        	    number = parseInt(number) + 1;
        	  }else if(type === 'minus')  {
        	    number = parseInt(number) - 1;
        	    if(number < 0){
        	    	number=0;
        	    }
        	  }
        	  
        	  // 결과 출력
        	  resultElement.innerText = number;
        	  
        	  number=amount;
        	}
        
        </script>
        
        
        
       <button class="btn btn-outline-dark" type="button" id="abc" onclick="check()">Add to Cart</button>
        <button class="btn btn-dark" onclick="location='<%=request.getContextPath() %>/shop/product/list.do'" type="button">Product list</button> 
        		
        		
        		<!-- 찜하기 -->
					<!-- 찜이 이미 되어 있으면 view단에서 표시되게 하기 -->
					<c:if test="${count >= 1}">
						<button class="btn btn-outline-dark" type="button" name="zzim" id="yeszzim"><i class="fa-solid fa-heart-circle-check"></i></button>
						</c:if>
						<c:if test="${count == 0}">
						<button class="btn btn-outline-dark" type="button" name="zzim" id="nozzim"><i class="fa fa-heart"></i></button>
					</c:if>
				<script>
			//찜하기관련
			$(function(){
			
				
				
				$("#nozzim").click(function(){
					
			//		$("member_id").val("${sessionScope.userid}");
			//		$("brand").val("${vo.brand}");
			//		$("product_code").val("${product_code}");
					
					let member_id = "${sessionScope.userid}";
					let brand = "${vo.brand}"
					let product_code = ${product_code}
					
					
			//		console.log(${sessionScope.userid});
			//		console.log(${vo.brand});
			//		console.log(${product_code});
			
						/* if(member_id = ""){
							alert("로그인을 해주세요");
							location.href="/shop"
							return;
						} */
					alert("버튼 클릭");
			 		
					$.ajax({
						type:'post',
						url:"<%=request.getContextPath() %>/shop/product/insertzzim.do",
						data: {"member_id":member_id,
							"product_code":product_code,
							"brand":brand
						},
						
						success: function(data){
							if(data == "N"){
								console.log(data);
								alert('찜삭제');
								
								
							 }else{
								console.log(data);
								if(member_id == ""){
									alert('로그인 필요');
									location.href="<%=request.getContextPath() %>/member/login.do";
									return;
								}
								alert('찜목록에 추가되었습니다.');
								/* $("#nozzim").css('display', 'none');
								$("#yeszzim").css('display', 'inlineblock'); */
						/* 		console.log(${zv.map.like_brand});
								console.log(${zv.map.member_id});
								console.log(${zv.map.like_id});
								
								console.log(${zv.like_id});
								console.log(${zv.like_brand});
								console.log(${zv.member_id}); */
								location.reload();
							 }
							 
					 },
						error : function(error){alert(error);}
					});
					
				});
				
			});
			$(function(){
				$("#yeszzim").click(function(){
					
					//		$("member_id").val("${sessionScope.userid}");
					//		$("brand").val("${vo.brand}");
					//		$("product_code").val("${product_code}");
							
							let member_id = "${sessionScope.userid}";
							let brand = "${vo.brand}"
							let product_code = ${product_code}
							
					//		console.log(${sessionScope.userid});
					//		console.log(${vo.brand});
					//		console.log(${product_code});
					
								/* if(member_id = ""){
									alert("로그인을 해주세요");
									location.href="/shop"
									return;
								} */
							alert("버튼 클릭");
					 		
							$.ajax({
								type:'post',
								url:"<%=request.getContextPath() %>/shop/product/deletezzim.do",
								data: {"member_id":member_id,
									"product_code":product_code,
									"brand":brand
								},
								
								success: function(data){
									if(data == "N"){
										console.log(data);
										alert('찜삭제 실패!');
										
										
									 }else{
										console.log(data);
										if(member_id == ""){
											alert('로그인 필요');
											location.href="<%=request.getContextPath() %>/member/login.do";
											return;
										}
										alert('찜삭제.');
										/* $("#nozzim").css('display', 'inlineblock');
										$("#yeszzim").css('display', 'none'); */
										console.log(${zv.like_brand});
										console.log(${zv.member_id});
										console.log(${zv.product_code});
										location.reload();
									 }
									 
							 },
								error : function(error){alert(error);}
							});
							
						});
				
				
				
			});
			
			
			
			</script>
					<!-- 찜하기 -->
         </div> 
         <hr>
          <div class="product-description"> 
          <div><span class="font-weight-bold">성별 :</span><span>&nbsp;${vo.gender}</span></div> 
          <div class="my-color">



 <div class="d-flex flex-row align-items-center"> 
<span>유형:</span>
 <span class="ml-1">&nbsp;${vo.purpose}</span> 
 </div>
 
 
  <div class="mt-2"> 



 <span>이벤트:</span>
 <span class="ml-1">&nbsp;아임즈몰 결제금액 30만원이상 최조구매 자에 한해 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;  추첨으로 100만원상당 선물증정</span> 

<Br>
<div style="margin-top: 4px;">
 <span >카드무이자:</span>
 <span class="ml-1">&nbsp;최대 36개월 (2,260원 x 36)</span> 
</div>

<div style="margin-top: 4px;">
 <span style="align-items: center;margin-top: 10px;">배송정보:</span>
 <span class="ml-1">&nbsp;100.000 원 이상 무료 배송 + 100% 묶음배송<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;배송비 <fmt:formatNumber value="${vo.fee}" pattern="#,###" />원.</p></span> 
</div>

<div style="margin-top: 4px;">
 <span >상품사이즈:</span>
 <span class="ml-1">&nbsp;${vo.size}</span> 
</div>


 <Div style="margin-top: 4px;">
  <span >제조국:</span>
 <span class="ml-1">&nbsp;브랜드국(원산지):미국,호주 | 사계절용</span> 
 </div>

  
   <div class="bullets"> 
   <div class="d-flex align-items-center"> 
   <span class="dot"></span> <span class="bullet-text">Best in Quality</span> 
   </div> <div class="d-flex align-items-center"> <span class="dot"></span> 
   <span class="bullet-text">Anti-creak joinery</span> </div> <div class="d-flex align-items-center">
    <span class="dot"></span> <span class="bullet-text">Sturdy laminate surfaces</span> </div>
     <div class="d-flex align-items-center">
      <span class="dot"></span> <span class="bullet-text">Relocation friendly design</span>
       </div> <div class="d-flex align-items-center"> <span class="dot"></span>
        <span class="bullet-text">High gloss, high style</span> </div> <div class="d-flex align-items-center">
         <span class="dot"></span> <span class="bullet-text">Easy-access hydraulic storage</span> </div> </div> </div>
          <div class="mt-2">
         
           <span class="font-weight-bold">Store</span> </div> <div class="d-flex flex-row align-items-center"> 
         <p style="font-size: 30px;"> <i class="fa-solid fa-basket-shopping"></i></p>
           <div class="d-flex flex-column ml-1 comment-profile"> <div class="comment-ratings">
            <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> 
            <i class="fa fa-star"></i> </div> <span class="username">&nbsp;&nbsp;Im`s mall</span>
             <small class="followers">SHOPING</small> </div> </div> </div> </div>
             
              <div class="card mt-2" style="margin-bottom: 60px;"> 
             <span style="margin-bottom: 10px;">최근 등록된 상품</span> 
             <div class="similar-products mt-2 d-flex flex-row">
                <c:forEach var="list" items="${top5}">
              <div class="card border p-1" style="width: 9rem;margin-right: 3px;">
              
            
           
           <a href="<%=request.getContextPath() %>/shop/product/detail/${list.product_code}" style="text-decoration: none;color: black;">    <img src="<%=request.getContextPath() %>/resources/images/${list.filename}" class="card-img-top" alt="..." width="60px" height="30px"></a>
                <div class="card-body"> <h6 class="card-title"><a href="/shop/shop/product/detail/${list.product_code}" style="text-decoration: none;color: black;">${list.product_name}</a></h6> 
                </div>
                 </div>
               </c:forEach>
                    </div>
                      
                      </div> </div> </div> </div> </div> 
                     
      </form>                
                     

    
    
          <br><br>
          <hr>
          <div class="row" style="justify-content: center;margin-left: 450px;">
              <div class="col-12">
        
              <img src="https://cdn-prd.ssoldot.me/media/events/9A6kDrZFvWnJupX.jpg" class="img-fluid" style="width: 1000px;">
                  <br><br><br><br>
                  <img src="https://storage.googleapis.com/cbmpress/uploads/sites/3/2017/01/cloth-05.jpg" class="img-fluid" style="width: 1000px;">
                  <br><br><br><br>
                  <img src="https://cdn.imweb.me/upload/S201912072d9f3bab5337e/8faafefd2429a.jpg" class="img-fluid"style="width: 1000px;">
                   <br><br><br><br>
                  <img src="http://m.thefindme.co.kr/web/upload/NNEditor/20190823/EAB590ED999820EBB08F20EBB098ED928820EC9588EB82B4.jpg" class="img-fluid" style="width: 1000px;">
              </div>
          </div>
          </div>
 <form name="zzim_fm" id="zzim_fm" method="get">
<input type="hidden" name="member_id" value="${sessionScope.userid}">
<input type="hidden" name="brand" value="${vo.brand}">
<input type="hidden" name="product_code" value="${vo.product_code}">
</form> 

<!-- top 버튼 -->
<div class="container">
<div class="text-lg-end">
	<button class="btn btn-outline-dark js-scroll-to-top">top</button>
</div>
<script type="text/javascript">
//scroll to top
document.querySelector('.js-scroll-to-top').addEventListener('click', function(e) {
  e.preventDefault();
  document.querySelector('header').scrollIntoView({ behavior: 'smooth' });
});
</script>
</div>
<!-- /top 버튼 -->
</body>
</html>
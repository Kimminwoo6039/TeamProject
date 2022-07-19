<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <style>
 @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Open+Sans:ital@1&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Sans+KR&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Sans+KR:wght@400;900&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Sans+KR:wght@300;400;900&display=swap');
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Sans+KR:wght@500&display=swap');
      body{
  background-color: #f6f7f9;
}


.search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
  }
.search_area input{
      height: 40px;
    width: 250px;
  }
.search_area button{
     width: 100px;
    height: 40px;
  }

.ho {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.ho:hover {
  transform: scale(1.4);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}
.img {width:280px; height:325px; overflow:hidden }   /* 부모를 벗어나지 않고 내부 이미지만 확대 */



.custom-badge{

      background-color: #343a40!important;
    color: #fff;
    font-size: 11px;
    padding: 5px;
    padding-left: 11px;
    padding-right: 11px;
    border-radius: 7px;
}


.card{

  border:none;
  padding: 15px;
  cursor: pointer;
}


.time i{

  color: #cacacaa3;
  font-size: 20px;
}


h5{

list-style: none;
text-decoration: none;
font-size: 20px;


.search_wrap {
  position: relative;
  width: 300px;
}

.input1 {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}

img {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
}



}
  </style>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>

<script type="text/javascript">

$(function(){
	
	$("#btnAdd").click(function(){
	location.href="/shop/shop/product/write.do"
});
});

</script>



<body>

<%@ include file="../include/menu.jsp" %>
<%@ include file="../include/menu1.jsp" %>



<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-3">
<form action="/shop/shop/product/list.do" method="post">
       <div class="search_wrap" style="margin-left: 550px;">
        <div class="search_area" style="display: flex;">
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }" class="input1">
            <input type="hidden" name="brand" value="${pageMaker.cri.brand }" class="input1">
            <button><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
    </div>    
</form>        
        
        <!-- 관리자 로그인시 상품등록 페이지 -->
        <c:if test="${sessionScope.admin_userid != null }">
        
        <button class="btn btn-outline-dark" type="button"  id="btnAdd"  style="float: right;" > 상품등록  </button>  
        
        </c:if>
        
        
    </div>
    
    




    <div class="row" style="width: 1500px;">
  <c:forEach var="row" items="${list}">
        <div class="card-3 col-md-3" style="margin-top: 20px;">

            <div  style="margin: 0;padding: 0px;width: 280px;">

                <div class="d-flex justify-content-between align-items-center">
	
   
                    
                </div>


              
                    
                    <a href="/shop/shop/product/detail/${row.product_code}" style="text-decoration: none;color: black;width: 270p;"> <img src="/shop/resources/images/${row.filename}" name="ProductImage" width="280px" height="325px" alt="" title="" class="ho"></a>
             

                    <c:if test="${sessionScope.admin_userid !=null }">
                    
                    <a href="/shop/shop/product/edit/${row.product_code}" style="text-align:center;">
                    
                    <button class="btn btn-outline-dark">  수정  </button>
                        
                    
                    </a>
                    
                    </c:if>


                <div class="text-center">
                <Div>
                  <span class="badge bg-dark" style="float: right;">${row.gender}</span>  
                  </Div>
                  <br>
                  <strong style="font-size: 15px;margin-top: 22px;margin-right: 16px;"> <a href="/shop/shop/product/detail/${row.product_code}" style="text-decoration: none;color: black;">
                  <h5 style="font-size: 16px;font-family: 'Noto Sans KR', sans-serif;margin-top: 12px; ">${row.product_name}</h5></a> </strong>
                  <br>
                 
                  <div style="margin-bottom: 12px;float: right;margin-right: 10px;">
                    <span style="font-size: 17px;margin-bottom: 8px;"><strong style="font-family: 'Noto Sans KR', sans-serif;"><fmt:formatNumber value="${row.price}" pattern="#,###" />&nbsp;원</strong></span>
                    </div>

                </div>
                
            </div>
            
      </div>

   
</c:forEach>
        

    </div>
 
     
</div>


	 <c:choose>
			<c:when test="${pageMaker.cri.brand} !=null"> 

<ul class="pagination justify-content-center" id="pageInfo">

				<c:if test="${pageMaker.prev}">
				<li class="page-item disabled">
					<a class="page-link" href="/shop/shop/product/list.do?page=${pageMaker.startPage - 1}&brand=${pageMaker.cri.brand}">Previous</a>
				</li>
				</c:if>
				
			
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="page-item">
					<a class="page-link" href="/shop/shop/product/list.do?page=${num}&brand=${pageMaker.cri.brand}">${num}</a>
				</li>
				</c:forEach>
				
					<c:if test="${pageMaker.next}">
				<li class="page-item">
					<a class="page-link" href="/shop/shop/product/list.do?page=${pageMaker.endPage + 1}&brand=${pageMaker.cri.brand}">Next</a>
				</li>
				</c:if>
					</ul>
			 </c:when>
			 
			<c:otherwise> 
			<ul class="pagination justify-content-center" id="pageInfo">
			
			<c:if test="${pageMaker.prev}">
				<li class="page-item disabled">
					<a class="page-link" href="/shop/shop/product/list.do?page=${pageMaker.startPage - 1}">Previous</a>
				</li>
				</c:if>
			
			
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="page-item">
					<a class="page-link" href="/shop/shop/product/list.do?page=${num}">${num}</a>
				</li>
				</c:forEach>
			
				<c:if test="${pageMaker.next}">
				<li class="page-item">
					<a class="page-link" href="/shop/shop/product/list.do?page=${pageMaker.endPage + 1}">Next</a>
				</li>
				</c:if>
				</ul>
			
			
		 	</c:otherwise>
		 	
		 	
		
			</c:choose> 
				
			
			




</body>
</html>
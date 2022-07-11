<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <style>
 @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Open+Sans:ital@1&display=swap');
      body{
  background-color: #f6f7f9;
}

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

<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-3">

        <span>Hottest Giveaways</span>
        
        
        <!-- 관리자 로그인시 상품등록 페이지 -->
        <c:if test="${sessionScope.admin_userid != null }">
        
        <button class="btn btn-outline-dark" type="button"  id="btnAdd"  style="float: right;" > 상품등록  </button>  
        
        </c:if>
        
        
    </div>
    
    




    <div class="row">
  <c:forEach var="row" items="${list}">
        <div class="col-md-3" style="margin-top: 20px;">

            <div class="card">

                <div class="d-flex justify-content-between align-items-center">

                    <div class="d-flex flex-row align-items-center time">

                      
                      <small class="ml-1" style="color: red"><i class="fa-solid fa-heart-circle-check" style="color: red"></i></small>

                        
                    </div>

             <i class="fa-thin fa-star-sharp"></i>
                    
                </div>


                <div class="text-center">
                    
                    <a href="/shop/shop/product/detail/${row.product_code}" style="text-decoration: none;color: black;"><img src="/shop/resources/images/${row.filename}" width="250"></a>
                </div>

                    <c:if test="${sessionScope.admin_userid !=null }">
                    
                    <a href="/shop/shop/product/edit/${row.product_code}" style="text-align:center;">
                    
                    <button class="btn btn-outline-dark">  수정  </button>
                        
                    
                    </a>
                    
                    </c:if>


                <div class="text-center">

                  <strong style="font-size: 15px;"> <a href="/shop/shop/product/detail/${row.product_code}" style="text-decoration: none;color: black;"><h5 style="font-size: 22px;font-family: font-family: 'Open Sans', sans-serif;">${row.product_name}</h5></a> </strong>
                  <br>
                    <span class="text-success" style="font-size: 18px;"><strong><fmt:formatNumber value="${row.price}" pattern="#,###" />&nbsp;원</strong></span>
                    

                </div>
                
            </div>
            
      </div>

   
</c:forEach>
        

    </div>
 
     
</div>







</body>
</html>
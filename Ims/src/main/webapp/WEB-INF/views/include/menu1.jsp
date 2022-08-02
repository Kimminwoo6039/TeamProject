
  <style type="text/css">
    
	
	@import url('https://fonts.googleapis.com/css2?family=Yellowtail&display=swap');
	
	.abc{
	font-family: 'Yellowtail', cursive;
	font-size: 50px;
	}
    
    
</style>
    
    
   

<h1 class="title">


<div>
<a href="/" style="text-decoration: none;"><h3 style="text-align: center; color: black;"class="abc" >Im'S something for us</h3></a>
</div>
<br>



</h1>



        <nav class="navbar navbar-expand-lg navbar-light" style="margin-top: px;margin-left: 1320px;height: 30px;" id="mainNav">
        
    
            <div>
                <a class="navbar-brand" href="#page-top"></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"></button>
                
   
            <div>
            
          	<ul style="display: flex; margin-left: 90px; list-style: none" >
          	
          	
          	
          	
          	

          	
        

     

            <c:choose>
<c:when test="${sessionScope.userid == null && sessionScope.admin_userid == null }">

          	<a class="nav-link" href="<%=request.getContextPath() %>/admin/login.do" ><li class="nav-item" style="color: black;">AdminLogin</li></a>
            <a class="nav-link" href="<%=request.getContextPath() %>/member/join.do"><li class="nav-item" style="color: black;"><i class="fa-solid fa-handshake"></i>&nbsp;Join</li></a>
          	<a class="nav-link" href="<%=request.getContextPath() %>/member/login.do" ><li class="nav-item" style="color: black;"><i class="fa-solid fa-door-open"></i>&nbsp;Login</li></a>   
          	</c:when>
          	
          	<c:otherwise>
          	<div style="margin-top: 10px;color: blue;"><strong>${sessionScope.name}<a></a></strong></div>
          	<c:if test="${sessionScope.userid !=null && sessionScope.admin_userid==null }">
            <a class="nav-link" href="<%=request.getContextPath() %>/member/logout.do" ><li class="nav-item" style="color: black;"><i class="fa-solid fa-door-closed"></i>&nbsp;Logout</li></a>  
            </c:if> 
              	<c:if test="${sessionScope.admin_userid !=null }">
            <a class="nav-link" href="<%=request.getContextPath() %>/admin/logout.do" ><li class="nav-item" style="color: black;"><i class="fa-solid fa-door-closed"></i>&nbsp;Logout</li></a>  
            </c:if> 
            </c:otherwise>
             
             
         
     </c:choose>     	
     
 
          
          	
          	
          	</ul>                                      
            </div>
            
          
          
                
               <div class="collapse navbar-collapse" id="navbarResponsive" style="float: right;">
                    <ul class="navbar-nav ms-auto my-1 my-lg-0" style="margin: 50px;">
                    
                        <li class="nav-item"><a class="nav-link" href="#Search" ><i class="fa-solid fa-magnifying-glass">&nbsp;Search</i></a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/shop/product/list.do"><i class="fa-solid fa-shirt">&nbsp;MyFit</i></a></li>
                          <c:choose>
<c:when test="${sessionScope.admin_userid == null }">
                        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/shop/cart/list.do"><i class="fa-solid fa-bag-shopping">&nbsp;Bag</i></a></li>
                         <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/mypage/main.do"><i class="fa-solid fa-person">&nbsp;&nbsp;MyPage</i></a></li>
                        </c:when>
          	
          	<c:otherwise>
          	 <li class="nav-item"><a class="nav-link" href="/<%=request.getContextPath() %>/admin/main.do"><i class="fa-solid fa-person">&nbsp;&nbsp;AdminPage</i></a></li>
          	 </c:otherwise>
             
             
         
     </c:choose>     	
                       
                        <li class="nav-item"><a class="nav-link" href="#CustomerCenter"><i class="fa-solid fa-headset">&nbsp;Center</i></a></li>
                    </ul>
                </div>
            </div>
            
            
            
            <br>
           
        </nav>
      
  <!-- 상단부 -->
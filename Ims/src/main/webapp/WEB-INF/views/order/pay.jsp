<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%-- <%
 //   String name = (String)request.getAttribute("name");
 //   String email = (String)request.getAttribute("email");
 //  String phone = (String)request.getAttribute("phone");
 //  String address = (String)request.getAttribute("address");
  //  int totalPrice = (int)request.getAttribute("totalPrice");
     String name = (String)session.getAttribute("Name");
     int sum = (int)session.getAttribute("sum");
     
    
     System.out.println("name: "+name);

     System.out.println("sum: "+sum);
 
%>
 --%>
 <%
 
 int sum = (int) request.getAttribute("sum");
 String name = (String) request.getAttribute("name");
 
 System.out.println("sum= "+sum);
 
 %>
 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakao</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
    <script>
    $(function(){
        var IMP = window.IMP; // ��������
        IMP.init('imp80348978'); // 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���
        var msg;
        
        IMP.request_pay({
            pg : 'inicis',  // īī������ �������� ����       
            pay_method : 'card', //ī�� ����
            merchant_uid : 'merchant_' + new Date().getTime(), // ���� �������̵�
            amount : '<%=sum%>',
            name :'<%=name%>��',
        
       
         /*    //m_redirect_url : 'http://www.naver.com' */
        }, function(rsp) {
            if ( rsp.success ) {  // �����ϸ�
                //[1] �����ܿ��� �������� ��ȸ�� ���� jQuery ajax�� imp_uid �����ϱ�
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error�� �߻����� �ʵ��� �������ּ���
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //��Ÿ �ʿ��� �����Ͱ� ������ �߰� ����
                    }
                }).done(function(data) {
                    //[2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
                    if ( everythings_fine ) {
                        msg = '������ �Ϸ�Ǿ����ϴ�.';
                        msg += '\n����ID : ' + rsp.imp_uid;
                        msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
                        msg += '\���� �ݾ� : ' + rsp.paid_amount;
                        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] ���� ����� ������ ���� �ʾҽ��ϴ�.
                        //[4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
                    }
                });
                //������ �̵��� ������
               <%--  location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
               location.href='<%=request.getContextPath() %>/shop/product/list.do'
            } else {
                msg = '������ �����Ͽ����ϴ�.';
                msg += '�������� : ' + rsp.error_msg;
                //���н� �̵��� ������
                  location.href='<%=request.getContextPath() %>/shop/cart/list.do'
                alert(msg);
            }
        });
        
    });
    </script> 
 
</body>
</html>
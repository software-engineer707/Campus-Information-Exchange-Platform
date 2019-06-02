<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Liuyan"%>
<%@page import="com.model.Jiaoliu"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>System homepage</title>
<%
Member member = (Member)session.getAttribute("member");
 %>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/e/css/leaveword.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/e/css/leaveword.css" type="text/css"></link>
<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
<% 
String id = request.getParameter("id");
String goodsid = request.getParameter("goodsid");
%>
	<jsp:include page="head.jsp"></jsp:include>

	


	<div class="fn-clear"></div>

	<div class="wrap" >
		<div class="leaveword-list" style="min-height: 240px;">
			<div class="title">
			       Information reply
			</div>
			
		</div>
		
		  <div class="comment-container" style="background: #62bbe9">
			   <div class="inner-container">
			   <form id="leavewordForm" method="post" action="jiaoliuHf.action?id=<%=id%>&goodsid=<%=goodsid %>">
			       <div class="comment-message">
			          
					
			           <textarea class="gray-color" id="hcontent" name="hcontent" maxlength="200"  placeholder="content"  style="background-color:rgb(255, 255, 255); "></textarea>
			         
			       </div>
			       <div class="comment-action-box">
			          
			           <button id="btnLeaveword" class="btn">send</button>
			       </div>
			   </form>
			   </div>
			
			</div>
			

	</div>

	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>

<script type="text/javascript">
      
            	  
                  $("#btnLeaveword").click(function(){
                      var temaccountname= $("#dcontent").val();
                      if(temaccountname==""){
                          alert("Please fill in the message");
                          return false;
                      }
                      if(temaccountname.length<8){
                           alert("Message content at least 8 characters");
                           return false;
                      }
                  });
        
     </script>

</body>
</html>
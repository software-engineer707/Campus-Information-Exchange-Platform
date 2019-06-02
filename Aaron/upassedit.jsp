<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.model.Member"%>
<%@page import="com.util.Info"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>change Password</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<script
	src="/productauctionssh/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>
  <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>	
  <script type="text/javascript">
   
        $(function(){
        	
        	 $.metadata.setType("attr", "validate");
             $("#formModifypw").validate();
        	
        })
  
  </script>
  
  

</head>
<body>
<%
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
Member member = (Member)session.getAttribute("member");
Member m = (Member)dao.findById(member.getId(),"Member");
 %>
	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			current position：<a href="index.jsp">Home</a> &gt;&gt; <a href="myindex.jsp">Member Centre</a>
		</div>
	</div>


	<div class="fn-clear"></div>

		<div class="wrap">
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					
					 <form name="formModifypw" action="upassEdit.action?id=<%=member.getId() %>" id="formModifypw" method="post">
						<table border="0" cellspacing="1" class="grid" cellpadding="0"
							width="100%">
							
							
							<tr>
								<td align="right">change Password :</td>
								<td align="left">
								    <input name="upass" type="password" validate="{required:true,messages:{required:'Please enter your password'}}"
									id="repassword1" class="input-txt" /></td>
								<td align="left">
									<div id="repassword1Tip"></div>
							    </td>
							</tr>
							<tr>
								<td align="right">confirm password :</td>
								<td align="left"><input name="repassword2" validate="{required:true,equalTo:'#repassword1',messages:{required:'Please enter a password',equalTo:'Two passwords are inconsistent'}}" type="password"
									id="repassword2" class="input-txt" /></td>
								<td align="left">
									<div id="repassword2Tip"></div>
							    </td>
							</tr>
							
						</table>
						
						    <div style="margin-left: 100px;">
								<input type="submit" value="change Password" class="btn btn-default">
						    </div>
						
					</form>
					</div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>
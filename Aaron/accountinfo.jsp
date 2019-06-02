<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Login</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<script
	src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>





</head>
<body>
<%
Member member = (Member)session.getAttribute("member");
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
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
					
					   <table cellpadding="0" cellspacing="1" class="grid" width="100%">
							<tr>
								<td width="15%" align="right" class="title">account number:</td>
								<td width="35%"><%=m.getUname() %></td>
								<td width="*" colspan="2" rowspan="5">
								  
								    <img  src="<%=m.getImg()!=null?m.getImg():"/productauctionssh/upload/nopic.jpg" %>" width="200" height="200"/>
								
								</td>
							</tr>
						
							<tr>
								<td align="right" class="title">Name:</td>
								<td><%=m.getRealname()!=null?m.getRealname():"" %></td>
							</tr>
							
							<tr>
								<td align="right" class="title">gender:</td>
								<td><%=m.getSex()!=null?m.getSex():"" %></td>
							</tr>
							
							<tr>
								<td align="right" class="title">Registration time:</td>
								<td><%=m.getSavetime().toString() %></td>
							</tr>
							<tr>
								
								<td align="right" class="title">Mobile phone:</td>
								<td><%=m.getTel()!=null?m.getTel():"" %></td>
							</tr>
							<tr>
							   <td align="right" class="title">address:</td>
								<td><%=m.getAddr()!=null?m.getAddr():"" %></td>
							
							</tr>
							<tr>
							
							
								<td width="15%" align="right" class="title">mail:</td>
								<td width="35%"><%=m.getEmail()!=null?m.getEmail():"" %></td>
							</tr>
							
							
						</table>
					   
					 
	  
			    </div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>
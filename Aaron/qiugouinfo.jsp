<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.Jingjia"%>
<%@page import="com.model.Liuyan"%>
<%@page import="com.model.Pingjia"%>
<%@page import="com.model.Qiugou"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%
		Member member = (Member) session.getAttribute("member");
	%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>System homepage</title>
		<link rel="stylesheet" href="/productauctionssh/e/css/index.css"
			type="text/css"></link>

		<link rel="stylesheet"
			href="/productauctionssh/admin/css/web2table.css" type="text/css"></link>

		<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css"
			type="text/css"></link>

		<link rel="stylesheet"
			href="/productauctionssh/e/css/leaveword.css" type="text/css"></link>

		<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js"
			type="text/javascript"></script>
			
			<script src="/productauctionssh/layer/layer.js" type="text/javascript"></script>
			
			<script src="/productauctionssh/layer/layer.js" type="text/javascript"></script>
<script src="/productauctionssh/layer/layui.css" type="text/javascript"></script>
		<script type="text/javascript">
	$(function() {

		$("#btnShoucang").click(
				function() {
					var goodsid = $("#goodsid").val();
					var memberid = $("#memberid").val();
						window.location.href = "favAdd.action?goodsid="+goodsid+"&memberid="+memberid;
				});

	})
</script>

	</head>
	<body>
		<%
			String qiugouid = request.getParameter("qiugouid");
			CommonDAO dao = (CommonDAO) Info.getDao(request, "CommonDAO");
			Qiugou qiugou = (Qiugou) dao.findById(qiugouid, "Qiugou");
			Member mmm = (Member) dao.findById(qiugou.getMemberid(), "Member");
			String str = "Contact:"+mmm.getRealname()+"<br/>Contact Phone:"+mmm.getTel();
		%>
		<jsp:include page="head.jsp"></jsp:include>

		<div class="wrap">
			<div class="cover-title">
				current position:
				<a href="/productauctionssh/e/index.jsp">Home</a> &gt;&gt;Problem information
			</div>
		</div>

		<div class="fn-clear"></div>

		<div class="wrap">
			<div>

				<div class="info">
					<h1>
						<%=qiugou.getTitle()%>
					</h1>

					<table cellpadding="0" cellspacing="1" border="2" class="grid" width="100%">

						<tr>
							<td width="30%" align="center" rowspan="13" >
								<img id="imgTupian" width="300px" height="300px" src="<%=qiugou.getFilename()%>" />
							</td>

						</tr>
						<tr>
							<td style="border-right: 0px;" align="right">Question name:</td>
							<td style="border-left: 0px;"><%=qiugou.getName() %></td>
						</tr>
						
						<tr>
							<td style="border-right: 0px;" align="right">release time:</td>
							<td style="border-left: 0px;"><%=qiugou.getSavetime() %></td>
						</tr>
						
						<tr>
							<td style="border-right: 0px;" align="right">Solving people:</td>
							<td style="border-left: 0px;"><a href="javascript:void(0);" onclick="cktel('<%=str %>');"><%=mmm.getUname() %></a></td>
						</tr>
						<tr>
							<td style="border-right: 0px;" width="12%" align="right">
							</td>
						</tr>
						
						
					</table>

					<!-- s -->
					<div class="main-nav" style="margin-top:20px;">   
                       <div class="wrap">       
                        <ul class="menus clearfix">
                          <li><a  id="1" class="current"  href="javascript:void(0)">Problem Description</a></li>
                        </ul>    
                       </div>
                     </div>
					<div class="news-content" style="margin-top: 20px;">
							<%=qiugou.getContent() %>
					</div>
					
					
					
					
					
				</div>

			</div>



			<div class="fn-clear"></div>


			<jsp:include page="bottom.jsp"></jsp:include>
	</body>
<script type="text/javascript">
<%
String no = (String)request.getAttribute("no");
if(no!=null){
%>
alert("No answer record, no comment");
<%}%>


function cktel(msg){
	var data  = "contact number:"+msg;
	layer.alert(data, {
		  icon: 0,
		  skin: 'layer-ext-moon' 
		})
}

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>


function cktel(msg){
	var data  = msg;
	layer.alert(data, {
		  icon: 0,
		  skin: 'layer-ext-moon' 
		})
}
</script>
<script type="text/javascript">


</script>
</html>
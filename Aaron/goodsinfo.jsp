<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.model.Producttype"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.Jingjia"%>
<%@page import="com.model.Liuyan"%>
<%@page import="com.model.Pingjia"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%
		Member member = (Member) session.getAttribute("member");
	%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>系统首页</title>
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
			String goodsid = request.getParameter("goodsid");
			CommonDAO dao = (CommonDAO) Info.getDao(request, "CommonDAO");
			Goods goods = (Goods) dao.findById(goodsid, "Goods");
			Member mmm = (Member) dao.findById(goods.getMemberid(), "Member");
			goods.setCs(goods.getCs()+1);
			dao.update(goods);
		%>
		<jsp:include page="head.jsp"></jsp:include>

		<div class="wrap">
			<div class="cover-title">
				current position：
				<a href="/productauctionssh/e/index.jsp">home</a> &gt;&gt; Product information
			</div>
		</div>

		<div class="fn-clear"></div>

		<div class="wrap">
			<div>

				<div class="info">
					<h1>
						<%=goods.getGoodsname()%>
					</h1>

					<table cellpadding="0" cellspacing="1" border="2" class="grid" width="100%">

						<tr>
							<td width="30%" align="center" rowspan="13" >
								<img id="imgTupian" width="300px" height="300px" src="<%=goods.getImg()%>" />
							</td>

						</tr>
						<tr>
							<td  style="border-right: 0px;" align="right">Problem issuer:</td>
							<td style="border-left: 0px;"><a href="javascript:void(0);" onclick="cktel('<%=mmm.getTel() %>');"><%=mmm.getRealname() %></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						

						<%
						Producttype p = (Producttype)dao.findById(goods.getType(),"Producttype");
						%>	
						<tr>
							<td style="border-right: 0px;" align="right">Type of problem:</td>
							<td style="border-left: 0px;"><font color="#666666" style="font-size:20px;"><%=p.getTypename() %></font></td>
						</tr>
						<tr>
							<td style="border-right: 0px;" align="right">Problem difficulty:</td>
							<td style="border-left: 0px;"><%=goods.getChengdu() %></td>
						</tr>
						<tr>
							<td style="border-right: 0px;" align="right">release time:</td>
							<td style="border-left: 0px;"><%=goods.getBuytime() %></td>
						</tr>
						<!-- 
						<tr>
							<td style="border-right: 0px;" align="right">Problem status:</td>
							<td style="border-left: 0px;"><%=goods.getStatus() %></td>
						</tr>
						 -->
						<tr>
							<td style="border-right: 0px;" width="12%" align="right">
							</td>
						</tr>
						
						<tr>
							<td colspan="9">
							<div style="border:0px solid red;float:left;width: 100% ">
							<%if(member!=null){ %>
							<%if(goods.getStatus().equals("正在出售")){ %>
							<!-- <a id="btnIncart" class="btn btn-default" style="display:block;float:left;border-radius:5px 5px;margin: 0px auto;margin-left: 5px;" href="<%=member.getId().toString().equals(goods.getMemberid())?"javascript:alert('不能交易自己的商品');":"carAdd.action?goodsid="+goods.getId()+"&memberid="+member.getId() %>">交易</a> -->
							<%if(member.getId().toString().equals(goods.getMemberid())){ %>
							<!--  <a id="btnIncart" class="btn btn-default" style="display:block;float:left;border-radius:5px 5px;margin: 0px auto;margin-left: 5px;" href="jiaoliuck.jsp?goodsid=<%=goods.getId() %>">查看交流信息</a>-->
							<%}else{ %>
							<!--  <a id="btnIncart" class="btn btn-default" style="display:block;float:left;border-radius:5px 5px;margin: 0px auto;margin-left: 5px;" href="jiaoliu.jsp?goodsid=<%=goods.getId() %>">联系卖家</a> -->
							<%} %>
							<%}else {%>
							<!--  <a id="btnIncart" class="btn btn-default" style="display:block;float:left;border-radius:5px 5px;margin-left: 5px;" href="javascript:void(0)">交易完成</a> -->
							<%} %>
							<a id="btnIncart" class="btn btn-default" style="display:block;float:left;border-radius:5px 5px;margin: 0px auto;margin-left: 5px;" href="favAdd.action?gid=<%=goods.getId() %>&goodsid=<%=goodsid %>">收藏</a>
							<%}else{ %>
							<a id="btnIncart" class="btn btn-default" style="display:block;float:left;border-radius:5px 5px;margin: 0px auto;margin-left: 5px;" href="login.jsp">请先登录</a>
							<%} %>
							</div>
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
							<%=goods.getContent() %>
					</div>
					
					
					<div class="news-content" style="margin-top: 100px;">
					   <h3 style="border-bottom: 3px solid #62bbe9">Evaluation information</h3>
					   <ul style="margin-top: 20px;">
					      <%
					      ArrayList<Pingjia> list = (ArrayList<Pingjia>)dao.findByHql("from Pingjia where 1=1 and goodsid='"+goodsid+"'");
					      for(Pingjia pingjia:list){
					      Member m = (Member)dao.findById(pingjia.getMemberid(),"Member");
					       %>
					        <li class="item" style="margin-top: 10px;border-bottom: 1px dotted gray;">
					          <img class="avatar" src="<%=m.getImg() %>" style="width: 40px;height:40px;border-radius:20px 20px;" />
					            <div class='body'>
					              <div class="head"></div>
					              <div class="content">
					              <span class="user-info" style="font-size:12px;"><%=m.getUname() %></span><span class="pubtime"  style="font-size:12px;"><%=pingjia.getSavetime() %></span>
					              <div class='data-info'  style="font-size:12px;"><%=pingjia.getContent() %></div>
					              <div class="footer"></div>
					             </div>
					            </div>
					         </li>
					       <%} %>
				          </ul>
					
					</div>
					
					
					
					<div class="comment-container" style="margin-top: 100px;background: #62bbe9">
			   <div class="inner-container">
			   <form id="leavewordForm" method="post" action="pingjiaAdd.action?memberid=<%=member==null?"":member.getId() %>">
			   <input type="hidden" name="goodsid" value=<%=goodsid %>>
			       <div class="comment-message">
			          
					
			           <textarea class="gray-color" id="content" name="content" maxlength="200"  placeholder="内容"  style="background-color:rgb(255, 255, 255); "></textarea>
			         
			       </div>
			       <div class="comment-action-box">
			          
			           <button id="btnLeaveword" class="btn">send</button>
			       </div>
			   </form>
			   </div>
			
			</div>
					
				</div>

			</div>



			<div class="fn-clear"></div>


			<jsp:include page="bottom.jsp"></jsp:include>
			<%ArrayList<Jingjia> jlist = (ArrayList<Jingjia>)dao.findByHql("from Jingjia where gid='"+goods.getId()+"'"); %>
	</body>
<script type="text/javascript">
<%
String no = (String)request.getAttribute("no");
if(no!=null){
%>
alert("没有购买记录，不能做出评价");
<%}%>


function cktel(msg){
	var data  = "联系电话:"+msg;
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
</script>
<script type="text/javascript">


</script>
</html>
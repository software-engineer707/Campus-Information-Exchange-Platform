<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Goods"%>
<%@page import="com.model.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Question search</title>
<link rel="stylesheet"
	href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet"
	href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<link href="/productauctionssh/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="/productauctionssh/e/css/lanmu.css" type="text/css"></link>

<script
	src="/productauctionssh/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>



<script type="text/javascript">
	$(function() {

		$(".tabcontainer dl dt").each(function(index, dom) {

			$(this).mouseenter(function() {

				$(".tabcontainer dl dt").removeClass("on");
				$(this).addClass("on");
				$(".tabcontainer dl dd").hide().eq(index).show();

			})
		})

	});
</script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>


	<div class="fn-clear"></div>
	<div class="wrap">



		<div class="tabcontainer" style="min-height:400px;padding:15px;">

			<dl >

				<div class="fn-clear"></div>
				
			<%
			CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
			Member member = (Member)session.getAttribute("member");
			String spname = request.getParameter("spname");
			if(spname!=null){
			spname=Info.getUTFStr(spname);
			}
			ArrayList<Goods> list = (ArrayList<Goods>)dao.findByHql("from Goods where goodsname like '%"+spname+"%'");
			if(list.size()!=0){
			for(Goods goods:list){
			 %>
				<!-- s -->
				
				<dd class="fn-show" style="height: auto;border:0px solid red;width: 200px;float: left">
                  <div class="picturebox" >
                    <a href="goodsinfo.jsp?goodsid=<%=goods.getId() %>"><img src="<%=goods.getImg() %>"/> </a>
                    <span><a href="goodsinfo.jsp?goodsid=<%=goods.getId() %>"><%=goods.getGoodsname() %></a></span>
                  </div>
                </dd>
			<%}}else{ %>
			<dd class="fn-show" style="height: auto;border:0px solid red;width: 200px;float: left">
                  <div style="text-align: center">
                    <a href="javascript:void(0)" class="orange-href" onclick="<%if(member!=null){ %>location.replace('qiugouadd.jsp');<%}else{ %>location.replace('login.jsp');<%} %>">发布求购信息</a>
                  </div>
                </dd>
			<%} %>
				<!-- e -->

			</dl>
		</div>



    </div>

		<div class="fn-clear"></div>


    

		<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
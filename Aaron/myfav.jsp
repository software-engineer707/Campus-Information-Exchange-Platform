<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.PageManager"%>

<%@page import="com.model.Goods"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>My footprint</title>
		<link rel="stylesheet" href="/productauctionssh/e/css/index.css"
			type="text/css"></link>
		<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css"
			type="text/css"></link>

		<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js"
			type="text/javascript"></script>
		<link href="/productauctionssh/admin/css/web2table.css"
			rel="stylesheet" type="text/css" />

		<link href="/productauctionssh/admin/css/menu.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript"
			src="/productauctionssh/webui/jquery/jquery-1.9.0.js"></script>
		<link href="/productauctionssh/webui/artDialog/skins/default.css"
			rel="stylesheet" type="text/css" />
		<script
			src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js"
			type="text/javascript"></script>
		<script
			src="/productauctionssh/webui/artDialog/iframeTools.source.js"
			type="text/javascript"></script>
		<link
			href="/productauctionssh/webui/treetable/skin/jquery.treetable.css"
			rel="stylesheet" type="text/css" />
		<link
			href="/productauctionssh/webui/treetable/skin/jquery.treetable.theme.default.css"
			rel="stylesheet" type="text/css" />



<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("Please select the item you want to delete");
			           return;
			        }
			        var idlist = new Array();
			        $(".check:checked").each(function(index,a){
			             idlist.push( $(this).attr("value"));
						});
						$.dialog.confirm("Are you sure you want to delete?", function(){
				             window.location.href=encodeURI('favDel.action?idlist='+idlist);
						  });
					});
					$("#btnCheckAll").click(function() {
						var ischeck = false;
						$(".check").each(function() {
							if ($(this).is(":checked")) {
								$(this).prop("checked", "");
								ischeck = false;
							} else {
								$(this).prop("checked", "true");
								ischeck = true;
							}
						});
						if ($(this).text() == "选择记录")
							$(this).text("取消选择");
						else
							$(this).text("选择记录");
					})
	});
</script>


	</head>
	<body>
		<%
			Member member = (Member) session.getAttribute("member");
			CommonDAO dao = (CommonDAO) Info.getDao(request, "CommonDAO");
			Member m = (Member) dao.findById(member.getId(), "Member");
		%>
		<jsp:include page="head.jsp"></jsp:include>

		<div class="wrap">
			<div class="cover-title">
				当前位置：
				<a href="index.jsp">首页</a> &gt;&gt;
				<a href="myindex.jsp">会员中心</a>
			</div>
		</div>


		<div class="fn-clear"></div>

		<div class="wrap">

			<div class="main">
				<jsp:include page="menu.jsp"></jsp:include>
				<div class="main-content" style="width: 84.3%; margin-left: 174px;">
					<div class="search-title">
						<h2>
						   我的收藏
						</h2>
					</div>
					<!--  -->
					<div class="action-details">

						<a id="btnDelete" class="action-btn" href="#"> <em
							class="icon-delete"></em> <b>删除</b> </a>

					</div>
					<table id="module" width="100%" border="0" cellspacing="0"
						cellpadding="0" class="ui-record-table">
						<thead>
							<tr>
								<th>
									check
								</th>
								<th>
									<b>questionImage</b>
								</th>
								<th>
									<b>questionName</b>
								</th>
							</tr>
						</thead>
						<tbody>
							<%
							    String hql = "select distinct gid ,memberid from Lishi where memberid='"+m.getId()+"' ";
								String url = "myfav.jsp?1=1";
								PageManager pageManager = PageManager.getPage(url, 10, request);
								pageManager.doList(hql);
								PageManager bean = (PageManager) request.getAttribute("page");
								ArrayList<Object[]> list = (ArrayList<Object[]>) bean.getCollection();
							%>
							<%
								if (list.size() == 0) {
							%>

							<tr>
								<td colspan="20">
									没有相关信息
								</td>
							</tr>
							<%
								} else {
									for (Object[] obj : list) {
									Goods goods = (Goods)dao.findById(obj[0].toString(),"Goods");
							%>
							<tr>
								<td>
									&nbsp;
									<input id="chk" class="check" name="chk" type="checkbox"
										value='<%=goods.getId()%>'>
								</td>
								<td><img src="<%=goods.getImg()  %>" width="60" height="60"/></td>
								<td style="padding-top:30px;"><%=goods.getGoodsname()%></td>
							</tr>
							<%
								}
								}
							%>
							<tr>
								<td colspan="7" align="left">
									${page.info }
								</td>
							</tr>
						</tbody>
					</table>
					<!--  -->


				</div>
			</div>

		</div>



		<div class="fn-clear"></div>


		<jsp:include page="bottom.jsp"></jsp:include>



	</body>
	<script type="text/javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
</html>
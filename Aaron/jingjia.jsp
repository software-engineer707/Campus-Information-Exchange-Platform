<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            Member m = (Member)session.getAttribute("member");
		%>
		<jsp:include page="head.jsp"></jsp:include>

		<div class="wrap">
			<div class="cover-title">
				current position：
				<a href="/productauctionssh/e/index.jsp">Home</a> &gt;&gt; Problem information &gt;&gt;Problem details
			</div>
		</div>

		<div class="fn-clear"></div>

		<div class="wrap">
				<div class="info" style="width: 1088px;height: 500px;text-align: center">
				<form action="jingjiaAdd.action?gid=<%=goodsid %>&memberid=<%=m.getId() %>" name="f1" method="post">
				<input type="hidden" id="hiddenmaxprice" value="<%=goods.getMaxprice() %>"/>
				<input type="hidden" id="hiddenjiajia" value="<%=goods.getJiajia() %>"/>
				  <table border="0" width="100%" align="center">
				    <tr>
				      <td width="50%" height="30" align="right" style="padding-right:10px;font-size: 15px;">Problem details:</td>
				      <td align="left"><%if(goods.getMaxprice().equals(goods.getPrice())){ %>Problem details<%}else{ %><font color="#D23030" style="font-size:20px;"><b>￥<%=goods.getMaxprice()%></b></font><%} %></td>
				    </tr>
				    <tr>
				      <td height="30" align="right" style="padding-right:10px;font-size: 15px;">Problem information:</td>
				      <td align="left"><font color="#666666" style="font-size:20px;"><b>￥<%=goods.getPrice() %></b></font></td>
				    </tr>
				    <tr>
				      <td height="30" align="right" style="padding-right:10px;font-size: 15px;">Problem information:</td>
				      <td align="left"><font color="#666666" style="font-size:20px;"><b>￥<%=goods.getJiajia() %></b></font></td>
				    </tr>
				    <tr>
				      <td height="50" align="center" colspan="2"><input type="number" placeholder="Problem information" name="chuprice" required id="chuprice" style="width:200px;height: 30px; display: block;border-radius:5px 5px;border:1px solid gray;margin-left: 30px;"/></td>
				    </tr>
				    <tr>
				      <td height="50" align="center" colspan="2">
				      <input type="submit" class="orange-button" id="btnReigster" value="problem" name="btnReigster"   style="display:block;border-radius:5px 5px;margin-right: 90px;background: #62bbe9">
				      </td>
				    </tr>
				  </table>
				</form>
				</div>






			<jsp:include page="bottom.jsp"></jsp:include>
	</body>
<script type="text/javascript">
$("#chuprice").blur(function(){
var maxprice = $("#hiddenmaxprice").val();
var jiajia = $("#hiddenjiajia").val();
var total = parseInt(jiajia)+parseInt(maxprice);
if(total>$(this).val()){
alert("Information is too small");
f1.chuprice.value="";
return false;
}

})
</script>
<script type="text/javascript">
var CID = "endtime";
if(window.CID != null)
{
    var iTime = document.getElementById(CID).innerText;
    var Account;
    RemainTime();
}
function RemainTime()
{
    var iDay,iHour,iMinute,iSecond;
    var sDay="",sHour="",sMinute="",sSecond="",sTime="";
    if (iTime >= 0)
    {
        iDay = parseInt(iTime/24/3600);
        if (iDay > 0)
        {
            sDay = iDay + "day";
        }
        iHour = parseInt((iTime/3600)%24);
        if (iHour > 0){
            sHour = iHour + "hour";
        }
        iMinute = parseInt((iTime/60)%60);
        if (iMinute > 0){
            sMinute = iMinute + "minute";
        }
        iSecond = parseInt(iTime%60);
        if (iSecond >= 0){
            sSecond = iSecond + "second";
        }
        if ((sDay=="")&&(sHour=="")){
            sTime="<span style='color:darkorange'>" + sMinute+sSecond + "</font>";
        }
        else
        {
            sTime=sDay+sHour+sMinute+sSecond;
        }
        if(iTime==0){
            clearTimeout(Account);
              sTime="<span style='color:green'>Time is up！</span>";

              
        }
        else
        {
            Account = setTimeout("RemainTime()",1000);
        }
        iTime=iTime-1;
    }
    else
    {
            sTime="<span style='color:red'>End of countdown！</span>";
    }
    document.getElementById(CID).innerHTML = sTime;
}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Login</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="/productauctionssh/e/css/register.css" type="text/css"></link>

<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>

  <script type="text/javascript">
       
        $(function ()
        {
           
            $.metadata.setType("attr","validate");
            $("#form1").validate();
        });  
    </script>
 


</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			current position：<a href="index.jsp">Home</a> &gt;&gt; <a href="login.jsp">Member Login</a>
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap">
		<div class="whitebox">

			<h1>User login</h1>
           <form name="form1" id="form1" method="post" action="memberLogin.action">
			<div class="reg-box">

				
				<div class="reg-content">
					
					<dl>
					  <dt>
					    <%
                            String no = (String)request.getAttribute("no");
                            if(no!=null){out.print("<img src=\"/productauctionssh/admin/images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>wrong user name or password</font>");}
                          %>
                          <%
                            String err = (String)request.getAttribute("err");
                            if(err!=null){out.print("<img src=\"/productauctionssh/admin/images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>	Verification code error</font>");}
                          %>
                             </dt>
					</dl>
					<dl>
						<dt>username:</dt>
						<dd>
							<input type="text" class="ui-input" id="txtHuiyuanname" validate="{required:true,messages:{required:'Please enter a username'}}"
								name="uname"> <i></i>

						</dd>

					</dl>

					<dl>
						<dt>password:</dt>
						<dd>
							<input type="password" class="ui-input"  validate="{required:true,messages:{required:'Please enter your password'}}" id="txtPassword"
								name="upass"> 
								<i>

								 </i>

						</dd>

					</dl>

					<dl>
						<dt>Verification code:</dt>
						<dd>
						    <input type="text" class="ui-input"  validate="{required:true,messages:{required:'please enter verification code'}}" id="txtRandoms"
								name="randoms"><br/>
						    <img src="ma.jsp" id="yzm" onclick="ma();" style="cursor: pointer;margin-top: 12px;">
							<!--  <span onClick="ma();" style="cursor: pointer;"  ><font style="margin-top: 0px;">Change one</font></span>-->

						</dd>

					</dl>
					
				     <dl>
						<dt></dt>
						<dd>
							<input type="submit" class="orange-button" id="btnReigster" value="log in" name="btnReigster" style="display:block;border-radius:5px 5px;">
						</dd>

					</dl>

                
				</div>


			</div>
          </form>

		</div>
		

	</div>

	<div class="fn-clear"></div>
</body>
<script type="text/javascript">
function ma()
{
var a = document.getElementById("yzm");
var myDate=new Date()
a.src="ma.jsp?d="+myDate;
}
</script>
</html>
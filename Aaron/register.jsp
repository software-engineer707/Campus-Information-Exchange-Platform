<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>System registration</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="/productauctionssh/e/css/register.css" type="text/css"></link>

<script  src="/productauctionssh/layer/jquery-2.0.3.min.js" type="text/javascript"></script>
<script  src="/productauctionssh/layer/layer.js" type="text/javascript"></script>
  <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>	
   <script type="text/javascript">
    
       $(function(){
    	   
    	   $.metadata.setType("attr","validate");
    	   $("#form1").validate();
       })
   
   </script>


</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			current position：<a href="index.jsp">Home</a> &gt;&gt; <a href="register.jsp">System registration</a>
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap">
		<div class="whitebox">

			<h1>User registration</h1>
           <form name="form1" id="form1" method="post" action="memberRegist.action">
			<div class="reg-box">

				<div class="reg-title" id="msgdiv">
					<%
                            String err = (String)request.getAttribute("err");
                            String no = (String)request.getAttribute("no");
                            if(err!=null){out.print("<img src=\"images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>Existing username</font>");}
                            if(no!=null){out.print("<img src=\"images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>Existing username</font>");}
                             %>
					
				</div>
				<div class="reg-content">
					<dl>
						<dt>username:</dt>
						<dd>
							<input type="text"  required  class="input width250" id="txtHuiyuanname" 
								name="uname"> 

						</dd>

					</dl>

					<dl>
						<dt>password:</dt>
						<dd>
							<input type="password" required  class="input width250" id="txtPassword"
								name="upass"> 

						</dd>

					</dl>

					<dl>
						<dt>Enter your password again:</dt>
						<dd>
						<input type="password" required  class="input width250" id="txtPassword2"
								name="supass"> 

						</dd>

					</dl>

					<dl>
						<dt>mail:</dt>
						<dd>
							<input type="text" required   class="input width250" id="txtEamil"
								name="email"> 

						</dd>

					</dl>
					
					<dl>
						<dt></dt>
						<dd>
							<input type="submit" class="btn btn-default" id="btnReigster"
								value="registered" name="btnReigster">
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
$("#txtHuiyuanname").blur(function(){
var uname = $(this).val();

$.ajax({  
	        type: "POST",      
	         url: "usernamecheck.action", //servlet  
	          data: "uname="+uname, 
	         success: function(data){       
	    if(data==1){  
	       $("#msgdiv").html("<img src=\"/productauctionssh/admin/images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>Existing username</font>");
	 }
	 }  
	});

})
</script>
<script type="text/javascript">
$("#form1").submit(function(){
if($("#txtPassword").val()!=$("#txtPassword2").val()){
$("#msgdiv").html("<img src=\"/productauctionssh/admin/images/icon_wrong.png\"/>&nbsp;&nbsp;<font style='color:#E84048'>The entered password is inconsistent</font>");
return false;
}else{
$("#form1").submit();
}
})


$("#txtEamil").blur(function(){
	var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
	var email = $(this).val();
	 if(!reg.test(email)){ //
		　　　　layer.msg("Not a valid email address");
				$("#txtEamil").val("");
		　　　　return false;
	}
	
})
</script>
</html>
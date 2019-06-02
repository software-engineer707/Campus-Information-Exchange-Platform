<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify information</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>
    <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>
    <link href="/productauctionssh/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="/productauctionssh/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="/productauctionssh/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="/productauctionssh/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="/productauctionssh/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="/productauctionssh/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="/productauctionssh/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>

    <script type="text/javascript">
     
          $(function(){
          
                 $('#btnulTouxiang').uploadify({  
			                'formData': { 'folder': '/productauctionssh/Upload' },  
			                'buttonText': 'Select Image',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '/productauctionssh/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",
			                'auto':true, 
			                'removeTimeout':0,
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                'uploader': 'uploadImg.action',
			                 'fileSizelimit':'2048KB',
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){
			                     $("#filelist").show();
			                     $("#imgTouxiang").attr("src","/productauctionssh/upfile/"+file.name);
                                 $("#hidTouxiang").val("/productauctionssh/upfile/"+file.name);
			                  }
			             }); 
				       if(imgtouxiangsrc==""){
				         var url="/productauctionssh/upload/default_tou.gif";
				         $("#imgTouxiang").attr("src",url);
				         $("#hidTouxiang").val(url);
				       }else
				       {
				          $("#imgTouxiang").attr("src",imgtouxiangsrc);
				          $("#hidTouxiang").val(imgtouxiangsrc); 
				       }
          
          });
          $(function (){
        	         
        	 $.metadata.setType("attr","validate");
        	 $("#huiyuanForm").validate();
          });  
          
    
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
			current position：<a href="/productauctionssh/e/index.jsp">Home</a> &gt;&gt;Modify account information
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap">

		<div class="main">

			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
               <div >
				<form name="huiyuanform" method="post"
					action="memberEdit.action?id=<%=member.getId() %>"
					id="huiyuanForm">
					<table class="grid" cellspacing="1" width="100%">
						<tr>
							<td align="right">username:</td>
							<td><input name="uname"
								value="<%=m.getUname() %>" class="input-txt"
								type="text" id="txtAccountname" disabled="disabled"/></td>
						    <td  rowspan="5" colspan="7">
						         <img id="imgTouxiang" width="200px" height="200px"  src="<%=m.getImg()!=null?m.getImg():"/productauctionssh/upload/default_tou.gif" %>"/>
								<div>
									<input type="file" name="upload" id="btnulTouxiang" />
								</div>
								<input type="hidden" id="hidTouxiang" name="touxiang" value="<%=m.getImg()!=null?m.getImg():"/productauctionssh/upload/nopic.jpg"  %>" />
							</td>
						</tr>
						
						
								
						<tr>
							<td align="right">mailbox:</td>
							<td><input name="email"
								value="<%=m.getEmail() %>" validate="{required:true,messages:{required:'please input your email'}}" class="input-txt"
								type="text" id="txtEmail" /></td>
						</tr>
						<tr>
							<td align="right">name:</td>
							<td><input name="realname" value="<%=m.getRealname()!=null?m.getRealname():"" %>" validate="{required:true,messages:{required:'Please type in your name'}}"
								class="input-txt" type="text" id="txtName" /></td>
						</tr>
						
						<tr>
							<td align="right">gender:</td>
							<td>
							      <input  type="radio"  name="sex" id="radSex"  value="male"  <%if(m.getSex()==null){out.println("checked");}else if(m.getSex()!=null&&m.getSex().equals("male")){out.println("checked"); }%>>male
							      <input type="radio"  name="sex" id="radSex"  value="female" <%if(m.getSex()!=null&&m.getSex().equals("female")){out.println("checked");} %> >female
							</td>
						</tr>
						<tr>
							<td align="right">address:</td>
							<td><input name="addr"
								value="<%=m.getAddr()!=null?m.getAddr():"" %>" validate="{required:true,messages:{required:'Please enter the address'}}" class="input-txt"
								type="text" id="txtAddress" /></td>
						</tr>
						<tr>
							<td align="right">mobile phone:</td>
							<td><input name="tel"
								value="<%=m.getTel()!=null?m.getTel():"" %>" validate="{required:true,messages:{required:'Please enter the phone number'}}" class="input-txt"
								type="text" id="txtMobile" /></td>
						</tr>
						
						
					
					</table>
					<div style="margin-left: 120px;">
						<input type="submit" value="submit" id="Button1"
							class="btn btn-default" />
					</div>
				</form>
              </div>
			</div>
		</div>

	</div>



	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>
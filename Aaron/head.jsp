<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Producttype"%>

 
 <script type="text/javascript">
  
    $(function(){
      
    	  $(".main-nav .menus li a").removeClass("current");
	      var headid='<%=request.getParameter("headid")%>';
	      if (headid != 'null') {
	           
	     	 $("#"+headid).addClass("current");
	 	 }
    
      $(".exit").click(function(){
          
            var pageurl_pagescope= $("#pageurl_pagescope").val();
            
            $.ajax({
		                     
		              url:encodeURI('/productauctionssh/admin/huiyuanmanager.do?actiontype=exit'),
					   method:'get',
					   success:function(){
					      window.location.reload();
					  },
					  error:function(xmhttprequest,status,excetpion){
					     $.alert("System error, error code"+status);
					  }
		     })

      })
    })

</script>
 
<%
Member member = (Member)session.getAttribute("member");
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
ArrayList<Producttype> plist = (ArrayList<Producttype>)dao.findByHql("from Producttype where delstatus='0'");
 %>

  
  
<div class="index-toolbar">
  <div class="wrap">
  
            
    
    <%if(member!=null){ %>
           Welcome<a href="/productauctionssh/e/accountinfo.jsp"><%=member.getUname() %></a>
     <a class="exit" style="cursor:pointer" href="memberExit.action">Exit</a>|
    <%}%>
      <a href="/productauctionssh/e/login.jsp">User login</a>|
    
     <a href="/productauctionssh/e/register.jsp">User registration</a>|
     <a href="/productauctionssh/admin/login.jsp" target="block">System background</a>
  </div>
  
   
</div>
   <div class="page-main-box">
        <div style="font-size: 28px; color:#62bbe9; font-weight: bold; width:400px; line-height:30px; font-family:tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 15px 10px;" class="fn-left">
                             Campus information exchange platform
            
        </div>
       <form id="searchForm"  action="/productauctionssh/e/searchsp.jsp" method="post" >
           <input   type="hidden" name="actiontype" value="search" />
            <input type="hidden" name="forwardurl" value="/e/searchsp.jsp" />
        <div class="search-box">
            <div class="search-text">
            </div>
            <div class="keyword">
                <input type="text" placeholder="Question name" id="spname" name="spname" style="display:block;border-radius:5px 5px;">
                
            </div>
            <div class="so" style="margin-left: 10px;" >
                <input type="submit" class="sobtn" id="btnSearch" value="search for" name="btnSearch" style="display:block;border-radius:5px 5px;">
            </div>
            <div class="error-container">
                
            </div>
        </div>
        
        </form>
    </div>

     
 </div>
<!-- s -->
  <div class="main-nav">   
    <div class="wrap">       
      <ul class="menus clearfix">
       <li><a  id="1" class="current"  href="/productauctionssh/e/index.jsp">Home</a></li>
       <%for(Producttype t:plist){ %>
       <li><a   id="41" class="" href="/productauctionssh/e/index.jsp?type=<%=t.getId() %>"><%=t.getTypename() %></a></li>
       <%} %>
        <!-- <li><a   id="41" class="" href="/productauctionssh/e/qiugoulist.jsp">Solving information</a></li> -->
       <li><a  id="44" class=""  href="<%if(member!=null){ %>/productauctionssh/e/liuyan.jsp<%}else{ %>/productauctionssh/e/login.jsp<%} %>">Complaint</a></li>    
       
      </ul>    
     </div>
    </div>
  
 <!-- e --> 
 <div class="fn-clear"></div>
	<div class="pageinfo">
	     
	</div>


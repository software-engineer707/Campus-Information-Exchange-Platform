<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script  type="text/javascript">
     
   $(function(){

      $("#side-menu .menu-group li").removeClass("current");
     
      var seedid='<%=request.getParameter("seedid")%>';
      
      if(seedid!="null")
         $("#"+seedid).addClass("current");
      else
        $("#m1").addClass("current");
      
   })

</script>
<div id="side-menu" style="height: auto;">

  
    <div class="menu-group" >
		<h2>
			Problem information
		</h2>
		<ul>
		
		    <li id="101" >
				<a  href="/productauctionssh/e/productlist.jsp">Problem management</a>
			</li>
			<!-- 
			<li id="101" >
				<a  href="/productauctionssh/e/myqiugoulist.jsp">Problem management</a>
			</li>
			 -->
			 
			<!-- 
			<li id="101" >
				<a  href="/productauctionssh/e/myorder.jsp">my question</a>
			</li>
			 -->
			 
			 <!-- 
			<li id="101" >
				<a  href="/productauctionssh/e/saleorder.jsp">Problem record</a>
			</li>
			 -->
			
			<li id="101" >
				<a  href="/productauctionssh/e/myfav.jsp">my collection</a>
			</li>
			
			
		
			

		</ul>
	</div>
    
	<div class="menu-group" >
		<h2>
			account information
		</h2>
		<ul>
			<li id="m201" class="current">
				<a  href="/productauctionssh/e/accountinfo.jsp" target="_self">account information</a>
			</li>
			<li id="m203">
				<a href="/productauctionssh/e/upassedit.jsp" target="_self">change Password</a>
			</li>
			<li id="m204">
				<a href="/productauctionssh/e/memberedit.jsp" target="_self">Information modification</a>
			</li>
          
		</ul>
	</div>
	




</div>
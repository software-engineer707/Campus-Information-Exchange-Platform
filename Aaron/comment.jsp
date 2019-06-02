<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Pingjia"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Member"%>
<%
	String goodsid = request.getParameter("goodsid");

	String commenttype = request.getParameter("commenttype");
%>

<script type="text/javascript">
         
              $(function(){
                
            	  $("[name=dcontent]").keydown(function(){
            		 
            		  var maxLength= $(this).attr("maxlength");
            		  
            		  var hasInputed=$(this).val().length;
            		  
            		  if(hasInputed<maxLength);{
            			  
            			  $("#hasInputedCount").html(hasInputed);
            			  $("#removeCount").html(maxLength-hasInputed);
            			  
            			  
            		  }
            		  
            		  
            	  });
                  $("#btnComment").click(function(){
                      var temaccountname= $("#hidCurrenthy").val();
                      var temreturnurl=$("#commentresurl").val();
                     
                      var temdcontent=$("[name=dcontent]").val();
                      $("#forwardurl").val(temreturnurl);
                     
                      
                      if(temaccountname==""){
                         
                         window.location.href="login.jsp?reurl="+temreturnurl;
                         return false;
                        
                      }
                    
                      if(temdcontent==""){
                          alert("Please fill in the comments");
                          return false;
                      }
                      if(temdcontent.length<8){
                       
                           alert("Comment content at least 8 characters");
                           return false;
                      }
                     
                  });

              })
        
     </script>
<div class="comment-box">
<div class="main-nav" style="margin-top:10px;">   
                       <div class="wrap">       
                        <ul class="menus clearfix">
                          <li><a  id="1" class="current"  href="javascript:void(0)">Comment information</a></li>
                        </ul>    
                       </div>
         </div>
	<div style="margin-top: 30px;">
		<!-- s -->
		<ul>
		<%
		CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
		ArrayList<Pingjia> plist = (ArrayList<Pingjia>)dao.findByHql("from Pingjia where goodsid='"+goodsid+"'");
		for(Pingjia pingjia:plist){
		Member member = (Member)dao.findById(pingjia.getMemberid(),"Member");
		 %>
			<li>
				<div class='comment-item'>
					<div class="comment-user">
						<div class='pic fn-left'>
							<img width="48" height="48" src="<%=member.getImg() %>" />
						</div>
						<div style='width: 80px;' class="fn-left">
							<div>
								<%=pingjia.getSavetime() %>
							</div>
							<div>
								<%=member.getUname() %>
							</div>
						</div>
					</div>
					<div class='item-content'>
						<%=pingjia.getContent() %>
					</div>
				</div>
			</li>
			<%} %>
		</ul>
		<!-- e -->

	</div>

	<div class="comment-container">
		<div class="inner-container">
			<form id="commentForm" method="post"
				action="pingjiaAdd.action">

				<input type="hidden" name="goodsid" value="<%=goodsid%>" />
				<div class="comment-message">


					<textarea class="gray-color" name="dcontent" maxlength="200"
						placeholder="Short comment" style="background-color: rgb(255, 255, 255);"></textarea>

				</div>
				<div class="comment-action-box">

					<span class="white-color"><span id="hasInputedCount">0</span>/<strong
						id="removeCount">210</strong>word</span>
					<button id="btnComment" class="btn">
						comment
					</button>
				</div>
			</form>
		</div>

	</div>




</div>

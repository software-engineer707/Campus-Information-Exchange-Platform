<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

      Object o=  request.getSession().getAttribute("users");
      if(o==null)
         
          response.sendRedirect("login.jsp");
          
      

%>


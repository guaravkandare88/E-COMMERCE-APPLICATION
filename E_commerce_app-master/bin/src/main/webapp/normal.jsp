<%@page import="com.learn.mycart.entities.User"%>
<%
  User user=(User)session.getAttribute("current_user");
  if(user==null)
  {
      session.setAttribute("massage","You Are Not Loged In !! Login first ");
      response.sendRedirect("Login.jsp");
      return;
  }else
  {
      if(user.getUserType().equals("admin"))
      {
      session.setAttribute("massage","You Are Not Normal User ! Do Not Acess This Page ");
      response.sendRedirect("Login.jsp");
      return;
      }
      
  }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal Page</title>
    </head>
    <body>
        <h1>this is normal user page</h1>
    </body>
</html>

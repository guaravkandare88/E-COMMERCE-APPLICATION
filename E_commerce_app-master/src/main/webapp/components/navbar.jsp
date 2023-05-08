
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current_user");
%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">MyCart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>


            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size:25px" ></i><span class="ml-1 cart-items" >(0)</span></a>
                </li>


                <%
                    if (user1 == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="Login.jsp">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="Register.jsp">Register</a>
                </li>


                <%
                } else {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%>"> <%=user1.getUserName()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
                <%
                    }

                %>

            </ul>
        </div>
    </div>
</nav>
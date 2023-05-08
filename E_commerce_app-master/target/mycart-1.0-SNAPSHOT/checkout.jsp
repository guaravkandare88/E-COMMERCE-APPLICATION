<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("massage", "You Are Not Loged In !! Login first to access checkout page");
        response.sendRedirect("Login.jsp");
        return;
    }  

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <!--card-->
                    <div class="card mt-5 ">
                        <div class="card-body">
                            <h3 class="text-center">Yours Selected items</h3>
                            <div class="cart-body mt-3">

                            </div>
                        </div>
                    </div>


                </div>

                <div class="col-md-6">
                    <!--form details-->
                    <div class="card mt-5">
                        <div class="card-body">
                            <h3 class="text-center">Fill Yours Details For Orders</h3>
                            <div class="form-group">
                                <label for="email">User Email</label>
                                <input value="<%=user.getUserEmail() %>" name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter User Email" required>
                            </div>
                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input value="<%=user.getUserName() %>" name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter User Name" required>
                            </div>
                            <div class="form-group">
                                <label for="address">User Shipping Address</label>
                                <textarea value="<%=user.getUserAddress() %>" name="user_address" style="height: 200px" class="form-control" placeholder="Enter Your Address" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="phone">User phone</label>
                                <input value="<%=user.getUserPhone() %>" name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter User Phone">
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Order Now</button>
                                <button class="btn btn-outline-primary">Continue Shipping</button>
                            </div>

                        </div>
                    </div>


                </div>

            </div>
        </div>


        <%@include file="components/comman_models.jsp" %>
    </body>
</html>

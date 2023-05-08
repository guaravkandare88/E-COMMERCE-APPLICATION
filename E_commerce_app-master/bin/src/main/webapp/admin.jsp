<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.Dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("massage", "You Are Not Loged In !! Login first ");
        response.sendRedirect("Login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("massage", "You Are Not Admin ! Do Not Acess This Page ");
            response.sendRedirect("Login.jsp");
            return;
        }

    }
%>

<%
    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cDao.getCategories();
    Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>


        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/massage.jsp" %>
            </div>


            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="body text-center mt-3">
                            <div class="container">
                                <img class="img-fluid rounded-circle" style="max-width: 100px;" src="img/User.png" alt=""/>
                            </div>
                            <h1><%=m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted" >User</h1>  
                        </div>
                    </div>
                </div>
                <!--second col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="body text-center mt-3">
                            <div class="container">
                                <img class="img-fluid rounded-circle" style="max-width: 100px;" src="img/maintenance.png" alt=""/>
                            </div>
                            <h1><%=list.size()%></h1>
                            <h1 class="text-uppercase text-muted" >Category</h1>  
                        </div>
                    </div>                    
                </div>
                <!--third col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="body text-center mt-3">
                            <div class="container">
                                <img class="img-fluid rounded-circle" style="max-width: 100px;" src="img/Product.png" alt=""/>
                            </div>
                            <h1><%=m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted" >Products</h1>  
                        </div>
                    </div>                    
                </div>
            </div>
            <!--second row-->
            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-model">
                        <div class="body text-center mt-3">
                            <div class="container">
                                <img class="img-fluid rounded-circle" style="max-width: 100px;" src="img/Add Category.png" alt=""/>
                            </div>
                            <p class="mt-3">click here to add new category</p>
                            <h1 class="text-uppercase text-muted" >Add Category</h1>  
                        </div>
                    </div>
                </div>
                <!--second col-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-model">
                        <div class="body text-center mt-3">
                            <div class="container">
                                <img class="img-fluid rounded-circle" style="max-width: 100px;" src="img/Add Product.png" alt=""/>
                            </div>
                            <p class="mt-3">click here to add new product</p>
                            <h1 class="text-uppercase text-muted" >Add Products</h1>  
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--add category model-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Id" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 200px" class="form-control" name="catDescription" placeholder="Enter Category Description" required></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end of category model-->
        <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

        <!--product model-->
        <div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--start form-->
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct"/>

                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Product Name" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 150px" class="form-control" name="pDescription" placeholder="Enter Product Description" required></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required/>
                            </div>


                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <%
                                        for (Category c : list) {
                                    %>

                                    <option value="<%= c.getCategoryid()%>"><%= c.getCategoryTitle()%></option>

                                    <%
                                        }
                                    %>

                                </select>
                            </div>

                            <div class="form-group">
                                <label for="pPic">Select picture of product</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required/>
                            </div>


                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                        <!--end form-->
                    </div>
                </div>
            </div>
        </div>

        <!--end of product model-->
        <%@include file="components/comman_models.jsp" %>
    </body>
</html>

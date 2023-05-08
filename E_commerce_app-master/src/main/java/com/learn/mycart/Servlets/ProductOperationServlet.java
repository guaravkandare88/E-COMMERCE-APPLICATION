
package com.learn.mycart.Servlets;

import com.learn.mycart.Dao.CategoryDao;
import com.learn.mycart.Dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String op = request.getParameter("operation");
            if(op.trim().equals("addcategory"))
            {
                String title = request.getParameter("catTitle");
                String descrption = request.getParameter("catDescription");
                
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(descrption);
                
                //categary database save
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
                //out.println("category saved");
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("massage","Category Added Successfully"+ catId );
                response.sendRedirect("admin.jsp");
                return;
                
            }else if(op.trim().equals("addproduct"))
            {
                
                String pName = request.getParameter("pName");
                String pDescription = request.getParameter("pDescription");
                int pPrice =Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount =Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity =Integer.parseInt(request.getParameter("pQuantity"));
                int catId =Integer.parseInt(request.getParameter("catId"));
               
                Part part=request.getPart("pPic");
                
                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDescription);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                //get category by id
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                p.setCategory(category);
                
                //save product
                
                ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                //out.println("product save sussess fully");
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("massage","Product Added Successfully");
                response.sendRedirect("admin.jsp");
                return;

            }


            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

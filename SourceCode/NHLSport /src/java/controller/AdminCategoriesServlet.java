/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Categories;
import entity.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoriesFacadeLocal;
import model.ProductsFacadeLocal;

/**
 *
 * @author longv
 */
@WebServlet(name = "AdminCategoriesServlet", urlPatterns = {"/Admin/Categories/*"})
public class AdminCategoriesServlet extends HttpServlet {

    @EJB
    private CategoriesFacadeLocal categoriesFacade;
    @EJB
    private ProductsFacadeLocal productsFacade;
    RequestDispatcher dispatcher;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getPathInfo();

        switch (action) {
            case "/Create":
                getViewCreate(request, response);
                break;
            case "/List":
                getViewCategoriesList(request, response);
                break;
            case "/Store":
                create(request, response);
                break;
            case "/Delete":
                delete(request, response);
                break;
            case "/Edit":
                getViewEdit(request, response);
                break;
            case "/Update":
                update(request, response);
                break;
            default:
                out.print("ok");
                break;
        }

    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String categoryName = request.getParameter("categoryName");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));

        Categories newCat = new Categories(id, categoryName, status);

        boolean check = categoriesFacade.update(newCat);

        if (check) {
            request.getSession().setAttribute("NotyMessage", "Edit category successfully");
            response.sendRedirect("List");
        }

    }

    private void getViewEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("id") == null || request.getParameter("id").trim().isEmpty()) {
            response.sendRedirect("List");
        } else {

            int id = Integer.parseInt(request.getParameter("id"));

            Categories category = categoriesFacade.find(id);

            request.setAttribute("cat", category);

            dispatcher = request.getRequestDispatcher("/admin/views/category/edit.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void getViewCategoriesList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Categories> listCat = categoriesFacade.findAll();
        request.setAttribute("listCat", listCat);
        dispatcher = request.getRequestDispatcher("/admin/views/category/list.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/admin/views/category/create.jsp");
        dispatcher.forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String err = null;
        String categoryName = request.getParameter("categoryName");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));

        boolean checkProductNameExist = categoriesFacade.checCategoryNameExist(categoryName);
        if (checkProductNameExist) {
            err = "Category name is exist";
        }

        if (err == null) {
            Categories newCategory = new Categories(categoryName, status);

            categoriesFacade.create(newCategory);
            request.getSession().setAttribute("NotyMessage", "Create category successfully");
            response.sendRedirect("List");
        } else {
            request.setAttribute("errors", err);
            dispatcher = request.getRequestDispatcher("/admin/views/category/create.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        Categories category = new Categories(id);
        List<Products> list = productsFacade.findByCategory(id, true);
        
        if(list.size() > 0){
            out.print("You can't delete category because category have product in there, true");
        } 
        else {
            categoriesFacade.remove(category);
            response.sendRedirect("List"); 
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

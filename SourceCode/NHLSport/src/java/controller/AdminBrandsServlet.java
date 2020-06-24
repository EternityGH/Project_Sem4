/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Brands;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BrandsFacadeLocal;

/**
 *
 * @author longv
 */
@WebServlet(name = "AdminBrandsServlet", urlPatterns = {"/Admin/Brands/*"})
public class AdminBrandsServlet extends HttpServlet {

    @EJB
    private BrandsFacadeLocal brandsFacade;
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
                getViewBrandsList(request, response);
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
        String brandName = request.getParameter("brandName");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));

        Brands newBrand = new Brands(id, brandName, status);

        boolean check = brandsFacade.update(newBrand);

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

            Brands brand = brandsFacade.find(id);

            request.setAttribute("brand", brand);

            dispatcher = request.getRequestDispatcher("/admin/views/brand/edit.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void getViewBrandsList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Brands> listBrand = brandsFacade.findAll();
        request.setAttribute("listBrand", listBrand);
        dispatcher = request.getRequestDispatcher("/admin/views/brand/list.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/admin/views/brand/create.jsp");
        dispatcher.forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String err = null;
        String brandName = request.getParameter("brandName");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));

        boolean checkBrandNameExist = brandsFacade.checkBrandNameExist(brandName);
        if (checkBrandNameExist) {
            err = "Brand name is exist";
        }

        if (err == null) {
            Brands newBrand = new Brands(brandName, status);

            brandsFacade.create(newBrand);
            request.getSession().setAttribute("NotyMessage", "Create category successfully");
            response.sendRedirect("List");
        } else {
            request.setAttribute("errors", err);
            dispatcher = request.getRequestDispatcher("/admin/views/brand/create.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Brands brand = new Brands(id);

        brandsFacade.remove(brand);
        response.sendRedirect("List");
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

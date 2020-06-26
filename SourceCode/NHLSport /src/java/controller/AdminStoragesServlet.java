/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Brands;
import entity.Categories;
import entity.Storages;
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
import javax.servlet.http.HttpSession;
import model.BrandsFacadeLocal;
import model.CategoriesFacadeLocal;
import model.StoragesFacadeLocal;

/**
 *
 * @author Lark
 */
@WebServlet(name = "AdminStoragesServlet", urlPatterns = {"/Admin/Storage/*"})
public class AdminStoragesServlet extends HttpServlet {

    @EJB
    private BrandsFacadeLocal brandsFacade;
    @EJB
    private CategoriesFacadeLocal categoriesFacade;

    @EJB
    private StoragesFacadeLocal storagesFacade;

    RequestDispatcher dispatcher;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action = request.getPathInfo();

        switch (action) {
            case "/List":
                getViewStoragesList(request, response);
                break;
            case "/GetViewAdd":
                getViewAdd(request, response);
                break;
            case "/AddStorage":
                addQuantity(request, response);
                break;
            case "/Update":
                getViewUpdate(request, response);
                break;
            case "/UpdateStorage":
                updateStorages(request, response);
                break;
            default:
                out.print("ok");
                break;
        }

    }

    private void getViewStoragesList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Storages> list = storagesFacade.findAll();
        request.setAttribute("list", list);
        dispatcher = request.getRequestDispatcher("/admin/views/storage/list.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("id") == null) {
            response.sendRedirect("List");
        } else {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            Storages storages = storagesFacade.find(id);
            session.setAttribute("sessionStorage", storages);
            request.setAttribute("list", storages);
            List<Brands> listBrand = brandsFacade.findAll();
            request.setAttribute("listBrand", listBrand);
            List<Categories> listCat = categoriesFacade.findAll();
            request.setAttribute("listCat", listCat);
            dispatcher = request.getRequestDispatcher("/admin/views/storage/add.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void addQuantity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        int quanAdd = Integer.parseInt(request.getParameter("quanAdd"));
        Storages storages = (Storages) session.getAttribute("sessionStorage");
        int quantity = storages.getQuantity() + quanAdd;
        storages.setQuantity(quantity);
        storagesFacade.edit(storages);
        session.removeAttribute("sessionStorage");
        response.sendRedirect("List");

    }

    private void getViewUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("id") == null) {
            response.sendRedirect("List");
        } else {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            Storages storages = storagesFacade.find(id);
            session.setAttribute("sessionStorage", storages);
            request.setAttribute("list", storages);
            List<Brands> listBrand = brandsFacade.findAll();
            request.setAttribute("listBrand", listBrand);
            List<Categories> listCat = categoriesFacade.findAll();
            request.setAttribute("listCat", listCat);
            dispatcher = request.getRequestDispatcher("/admin/views/storage/edit.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void updateStorages(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        int quanEdit = Integer.parseInt(request.getParameter("quanEdit"));
        Storages storages = (Storages) session.getAttribute("sessionStorage");
        storages.setQuantity(quanEdit);
        storagesFacade.edit(storages);
        session.removeAttribute("sessionStorage");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Admins;
import helper.SaltedMD5;
import helper.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AdminsFacadeLocal;

/**
 *
 * @author longv
 */
@WebServlet(name = "AdminEmployeesServlet", urlPatterns = {"/Admin/Employees/*"})
public class AdminEmployeesServlet extends HttpServlet {

    @EJB
    private AdminsFacadeLocal adminsFacade;
    RequestDispatcher dispatcher;
    Validation valid;

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
                getViewEmployeesList(request, response);
                break;
            case "/Delete":
                delete(request, response);
                break;
            case "/Store":
                create(request, response);
                break;
            default:
                out.print("ok");
                break;
        }
    }

    private void getViewEmployeesList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Admins> listAdmin = adminsFacade.findAll();
        request.setAttribute("listAdmin", listAdmin);
        dispatcher = request.getRequestDispatcher("/admin/views/employee/list.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/admin/views/employee/create.jsp");
        dispatcher.forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        byte[] salt = null;
        valid = new Validation();
        String code = request.getParameter("code");
        String name = new String(request.getParameter("fullName").getBytes("iso-8859-1"), "utf-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePass = request.getParameter("confirmPassword");

        String errs = null;

        if (valid.customeEmpty(code)) {
            errs = "Please enter employee code";
        }
        if (valid.customeEmpty(name)) {
            errs = "Please enter employee name";
        }

        if (valid.customeEmpty(email)) {
            errs = "Please enter employee email";
        } else if (!valid.validEmail(email)) {
            errs = "Your email wrong! Example email: example@example.com";
        }

        if (valid.customeEmpty(password)) {
            errs = "Please enter password";
        }

        if (!password.equals(rePass)) {
            errs = "Confirm password doesn't match password";
        }

        if (errs != null) {
            request.setAttribute("errors", errs);
            dispatcher = request.getRequestDispatcher("/admin/views/employee/create.jsp");
            dispatcher.forward(request, response);
        } else {

            boolean checkEmailExist = adminsFacade.checkEmailExist(email);
            if (checkEmailExist) {
                errs = "Email already exist";
                request.setAttribute("errors", errs);
                dispatcher = request.getRequestDispatcher("/admin/views/employee/create.jsp");
                dispatcher.forward(request, response);

            } else {
                boolean status = true;
                Date utilDate = new java.util.Date();
                java.sql.Date createdAt = new java.sql.Date(utilDate.getTime());

                try {
                    salt = SaltedMD5.getSalt();
                } catch (Exception ex) {
                }

                String saltEncode = Base64.getEncoder().encodeToString(salt);
                String hashPassword = SaltedMD5.getSecurePassword(password, salt);

                Admins newAdmins = new Admins(code, email, name, hashPassword, saltEncode, status, createdAt);

                adminsFacade.create(newAdmins);
                request.getSession().setAttribute("NotyMessage", "Create employee successfully");
                response.sendRedirect("List");
            }

        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Admins admin = new Admins(id);
        adminsFacade.remove(admin);
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

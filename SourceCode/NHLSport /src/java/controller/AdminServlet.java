/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Admins;
import entity.Customers;
import entity.Orders;
import entity.OrdersDetail;
import helper.SaltedMD5;
import helper.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import model.ContactsFacadeLocal;
import model.OrdersDetailFacadeLocal;
import model.OrdersFacadeLocal;

/**
 *
 * @author longv
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/Admin/*"})
public class AdminServlet extends HttpServlet {

    @EJB
    private AdminsFacadeLocal adminsFacade;
    @EJB
    private OrdersDetailFacadeLocal ordersDetailFacadeLocal;
    @EJB
    private OrdersFacadeLocal ordersFacadeLocal;
    @EJB
    private ContactsFacadeLocal contactsFacadeLocal;

    RequestDispatcher dispatcher;
    Validation valid;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getPathInfo();

        switch (action) {
            case "/":
                getViewHome(request, response);
                break;
            case "/Home":
                getViewHome(request, response);
                break;
            case "/Login":
                getViewLogin(request, response);
                break;
            case "/Login-Post":
                if (request.getSession().getAttribute("admin") == null) {
                    login(request, response);
                } else {
                    logout(request, response);
                }
                break;
            case "/Logout":
                logout(request, response);
                break;
            case "/Profile":
                getViewProfile(request, response);
                break;
            case "/updateAccount":
                updateAccount(request, response);
                break;
            case "/updatePassword":
                updatePassword(request, response);
                break;
            case "/Security":
                getViewSecurity(request, response);
                break;
            case "/SalesReport":
                SalesReport(request, response);
                break;
            default:
                out.print("not found");
                break;
        }
    }

    private void getViewHome(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/admin/index.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/admin/views/profile/login.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        if (request.getSession().getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/Admin/Login");
        } else {
            Admins admin = (Admins) request.getSession().getAttribute("admin");
            Admins presentCus = adminsFacade.find(admin.getId());
            dispatcher = request.getRequestDispatcher("/admin/views/profile/profile.jsp");
            request.setAttribute("admin", presentCus);
            dispatcher.forward(request, response);
        }
    }

    private void getViewSecurity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        if (request.getSession().getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/Admin/Login");
        } else {
            Admins admin = (Admins) request.getSession().getAttribute("admin");
            Admins presentCus = adminsFacade.find(admin.getId());
            dispatcher = request.getRequestDispatcher("/admin/views/profile/security.jsp");
            request.setAttribute("admin", presentCus);
            dispatcher.forward(request, response);
        }
    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        int id = Integer.parseInt(request.getParameter("id"));
        String fullname = new String(request.getParameter("fullname").getBytes("iso-8859-1"), "utf-8");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String Day = request.getParameter("Day");
        String Month = request.getParameter("Month");
        String Year = request.getParameter("Year");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String dayOfBirth = Day + "/" + Month + "/" + Year;
        Date date = null;

        String err = null;

        valid = new Validation();

        if (!valid.validPhone(phone)) {
            err = "Invalid phone";
        } else if ("0000000000".equals(phone) || "00000000000".equals(phone) || "0000000000000".equals(phone)) {
            err = "Invalid phone";
        }

        out.print(err);

        if (err != null) {
            request.setAttribute("errors", err);
            Admins presentAdmin = adminsFacade.find(id);
            request.setAttribute("admin", presentAdmin);
            dispatcher = request.getRequestDispatcher("/admin/views/profile/profile.jsp");
            dispatcher.forward(request, response);

        } else {
            try {
                date = new SimpleDateFormat("dd/MM/yyyy").parse(dayOfBirth);
            } catch (Exception e) {
            }

            java.sql.Date DOB = new java.sql.Date(date.getTime());

            out.print(gender);

            Admins editAdmin = new Admins(id, email, fullname, DOB, gender, address, phone);

            boolean check = adminsFacade.updateAccount(editAdmin);

            if (check) {
                Admins admin = adminsFacade.find(id);
                request.getSession(true).setAttribute("admin", admin);
                response.sendRedirect("Profile");
            }
        }

    }

    private void updatePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        int id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");
        String err = null;
        valid = new Validation();

        byte[] salt = null;

        try {
            salt = SaltedMD5.getSalt();
        } catch (Exception ex) {
        }

        String saltEncode = Base64.getEncoder().encodeToString(salt);
        String hashPassword = SaltedMD5.getSecurePassword(newPassword, salt);

        if (valid.customeEmpty(currentPassword)) {
            err = "Please enter current password";
        }

        if (valid.customeEmpty(newPassword)) {
            err = "Please enter new password";
        }

        if (!newPassword.equals(confirmNewPassword)) {
            err = "Confirm password doesn't match password";
        }

        if (err != null) {
            request.setAttribute("errors", err);
            dispatcher = request.getRequestDispatcher("/admin/views/profile/security.jsp");
            dispatcher.forward(request, response);
        } else {

            //CheckPass by CheckLogin
            String salt2 = adminsFacade.getSalt(email);
            byte[] saltEncode2 = Base64.getDecoder().decode(salt2);
            String hashCurrentPassword = SaltedMD5.getSecurePassword(currentPassword, saltEncode2);

            boolean checkPass = adminsFacade.checkLogin(email, hashCurrentPassword);

            if (checkPass) {

                Admins editAdmin = new Admins(id, email, hashPassword, saltEncode);

                boolean check = adminsFacade.updatePassword(editAdmin);

                if (check) {
                    Admins admin = adminsFacade.find(id);
                    request.getSession(true).setAttribute("admin", admin);
                    response.sendRedirect("Profile");
                }
            } else {
                err = "Incorrect current password";
                request.setAttribute("errors", err);
                dispatcher = request.getRequestDispatcher("/admin/views/profile/security.jsp");
                dispatcher.forward(request, response);
            }

        }

    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String err = null;

        valid = new Validation();

        if (valid.customeEmpty(email)) {
            err = "Email or password may not be blank ";
        } else if (!valid.validEmail(email)) {
            err = "Invalid email! Example email: example@example.com";
        }

        if (valid.customeEmpty(password)) {
            err = "Email or password may not be blank ";
        }

        if (err != null) {
            request.setAttribute("errors", err);
            dispatcher = request.getRequestDispatcher("/admin/views/profile/login.jsp");
            dispatcher.forward(request, response);
        } else {
            boolean checkEmailExist = adminsFacade.checkEmailExist(email);
            if (checkEmailExist) {
                String salt = adminsFacade.getSalt(email);
                byte[] saltEncode = Base64.getDecoder().decode(salt);
                String hashPassword = SaltedMD5.getSecurePassword(password, saltEncode);

                boolean check = adminsFacade.checkLogin(email, hashPassword);

                if (check) {
                    Admins admin = adminsFacade.find(email);

                    switch (admin.getRole()) {
                        case 1:
                            request.getSession().setAttribute("admin", admin);
                            response.sendRedirect(request.getContextPath() + "/Admin/");
                            break;
                        default:
                            response.sendRedirect(request.getContextPath() + "/Admin/Login");
                            break;
                    }
                } else {
                    request.setAttribute("errors", "Email or password is incorrect.");
                    dispatcher = request.getRequestDispatcher("/admin/views/profile/login.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                request.setAttribute("errors", "Email or password is incorrect.");
                dispatcher = request.getRequestDispatcher("/admin/views/profile/login.jsp");
                dispatcher.forward(request, response);
            }

        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.getSession().removeAttribute("admin");
        response.sendRedirect(request.getContextPath() + "/Admin/Login");
    }

    private void SalesReport(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Vouchers;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.VouchersFacadeLocal;

/**
 *
 * @author longv
 */
@WebServlet(name = "AdminVouchersServlet", urlPatterns = {"/Admin/Vouchers/*"})
public class AdminVouchersServlet extends HttpServlet {

    @EJB
    private VouchersFacadeLocal vounchersFacade;
    RequestDispatcher dispatcher;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getPathInfo();

        switch (action) {
            case "/List":
                getViewVouchersList(request, response);
                break;
            case "/Create":
                getViewCreate(request, response);
                break;
            case "/Store":
                create(request, response);
                break;
            case "/Edit":
                getViewUpdate(request, response);
                break;
            case "/Update":
                update(request, response);
                break;
            case "/Delete":
                delete(request, response);
                break;
            case "/Report":
                getViewReport(request, response);
                break;
            default:
                out.print("ok");
                break;
        }
    }
    private void getViewReport(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        List<Vouchers> list = vounchersFacade.findByDateReport(from, to);
        request.setAttribute("listVouchers", list);
        dispatcher = request.getRequestDispatcher("/admin/views/voucher/report.jsp");
        dispatcher.forward(request, response);
    }
    private void getViewCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/admin/views/voucher/create.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Vouchers vouchers = vounchersFacade.find(id);
        DateFormat dateFM = new SimpleDateFormat("dd");
        DateFormat monthFM = new SimpleDateFormat("MM");
        DateFormat yearFM = new SimpleDateFormat("yyyy");
        Date dateExpiration = vouchers.getExpirationDate();
        String date = dateFM.format(dateExpiration);
        String month = monthFM.format(dateExpiration);
        String year = yearFM.format(dateExpiration);
        List<String> listDate = new ArrayList<>();
        listDate.add(date);
        listDate.add(month);
        listDate.add(year);
        request.setAttribute("listDate", listDate);
        request.setAttribute("list", vouchers);
        dispatcher = request.getRequestDispatcher("/admin/views/voucher/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            //get value
            String code = request.getParameter("code");
            int disc = Integer.parseInt(request.getParameter("disc"));
            String day = request.getParameter("Day");
            String month = request.getParameter("Month");
            String year = request.getParameter("Year");

            String expDate = day + "/" + month + "/" + year;
            Date getDate = java.util.Calendar.getInstance(java.util.TimeZone.getTimeZone("Vietnam/Hanoi")).getTime();
            Date expDate2 = new SimpleDateFormat("dd/MM/yyyy").parse(expDate);
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            String error = "";
            boolean check = false;
            DateFormat dateFM = new SimpleDateFormat("dd");
            DateFormat monthFM = new SimpleDateFormat("MM");
            DateFormat yearFM = new SimpleDateFormat("yyyy");
            int checkDate = Integer.parseInt(dateFM.format(getDate));
            int checkMonth = Integer.parseInt(monthFM.format(getDate));;
            int checkYear = Integer.parseInt(yearFM.format(getDate));
            if (code.trim().isEmpty() || code == "" || code.length() < 3) {
                error += "Code is invalid ";
                check = true;
            } else if (expDate.trim().isEmpty() || expDate == "") {
                error += "Expiration date is invalid ";
                check = true;
            } else if (disc <= 0 || String.valueOf(disc).isEmpty()) {
                error += "Discount is invalid ";
                check = true;
            } else if (vounchersFacade.checkCodeUpdate(code, id) == true) {
                error += "Code is existed ";
                check = true;
            } else if (checkDate >= Integer.parseInt(day) && checkMonth >= Integer.parseInt(month) && checkYear >= Integer.parseInt(year)) {
                error += "Expiration date is invalid";
                check = true;
            }
            if (check == true) {
                HttpSession session = request.getSession();
                session.setAttribute("errorUpdateVou", error);
                response.sendRedirect("Edit?id=" + id);
            } else {
//                Vouchers voucher = new Vouchers(code, disc, getDate, expDate2, status);
                Vouchers voucher = vounchersFacade.find(id);
                voucher.setCode(code);
                voucher.setDiscount(disc);
                voucher.setExpirationDate(expDate2);
                voucher.setStatus(status);
                vounchersFacade.edit(voucher);
                request.getSession().setAttribute("NotyMessage", "Update Voucher successfully");
                response.sendRedirect("List");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Edit?id=" + id);
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        try {
            //get value
            String code = request.getParameter("code");
            int disc = Integer.parseInt(request.getParameter("disc"));
            Date getDate = java.util.Calendar.getInstance(java.util.TimeZone.getTimeZone("Vietnam/Hanoi")).getTime();
            String day = request.getParameter("Day");
            String month = request.getParameter("Month");
            String year = request.getParameter("Year");
            String expDate = day + "/" + month + "/" + year;
            Date expDate2 = new SimpleDateFormat("dd/MM/yyyy").parse(expDate);
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            String error = "";
            boolean check = false;
            DateFormat dateFM = new SimpleDateFormat("dd");
            DateFormat monthFM = new SimpleDateFormat("MM");
            DateFormat yearFM = new SimpleDateFormat("yyyy");
            int checkDate = Integer.parseInt(dateFM.format(getDate));
            int checkMonth = Integer.parseInt(monthFM.format(getDate));;
            int checkYear = Integer.parseInt(yearFM.format(getDate));
            if (code.trim().isEmpty() || code == "" || code.length() < 3) {
                error += "Code is invalid ";
                check = true;
            } else if (expDate.trim().isEmpty() || expDate == "") {
                error += "Expiration date is invalid ";
                check = true;
            } else if (disc <= 0 || String.valueOf(disc).isEmpty()) {
                error += "Discount is invalid ";
                check = true;
            } else if (vounchersFacade.checkCode(code) == true) {
                error += "Code is existed ";
                check = true;
            } else if (checkDate >= Integer.parseInt(day) && checkMonth >= Integer.parseInt(month) && checkYear >= Integer.parseInt(year)) {
                error += "Expiration date is invalid";
                check = true;
            }
            if (check == true) {
                HttpSession session = request.getSession();
                session.setAttribute("errorCreateVou", error);
                request.getRequestDispatcher("/admin/views/voucher/create.jsp").forward(request, response);
            } else {
                Vouchers voucher = new Vouchers(code, disc, getDate, expDate2, status);
                vounchersFacade.create(voucher);
                request.getSession().setAttribute("NotyMessage", "Create Voucher successfully");
                response.sendRedirect("List");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/admin/views/voucher/create.jsp").forward(request, response);
        }
    }

    private void getViewVouchersList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Vouchers> listVouchers = vounchersFacade.findAll();
        request.setAttribute("listVouchers", listVouchers);
        dispatcher = request.getRequestDispatcher("/admin/views/voucher/list.jsp");
        dispatcher.forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Vouchers voucher = new Vouchers(id);

        vounchersFacade.remove(voucher);
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

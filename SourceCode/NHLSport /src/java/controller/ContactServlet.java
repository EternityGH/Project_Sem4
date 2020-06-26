/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Contacts;
import entity.Customers;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import javax.ejb.EJB;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ContactsFacadeLocal;

/**
 *
 * @author longv
 */
@WebServlet(name = "ContactServlet", urlPatterns = {"/Contact/*"})
public class ContactServlet extends HttpServlet {
    @EJB
    private ContactsFacadeLocal contactFacade;
    
    RequestDispatcher dispatcher;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String action = request.getPathInfo();
        
        switch(action){
            case "/":
                getView(request, response);
                break;
            case "/Send":
                Store(request, response);
                break;
            case "/Success":
                getViewSuccess(request, response);
                break;
            default:
                getView404(request, response);
                break;
        }
    }
    
    private void getViewSuccess(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        dispatcher = request.getRequestDispatcher("/views/page/success.jsp");
        dispatcher.forward(request, response);
    }
    
    private void getView404(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        dispatcher = request.getRequestDispatcher("/views/error/404.jsp");
        dispatcher.forward(request, response);
    }
    
    private void getView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/views/page/contact.jsp");
        dispatcher.forward(request, response);
    }
    
    private void Store(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        //Get value
        HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("customer");
        final String to = request.getParameter("email");
        final String name = request.getParameter("name");
        Date createAt = java.util.Calendar.getInstance(java.util.TimeZone.getTimeZone("Vietnam/Hanoi")).getTime();
        final String subject = "Contact to ThunderShop";
        final String description = request.getParameter("description");
        String description2 = "Thank " + name + " for contacting the Thunder Shop, the Thunder Shop will contact you as soon as possible.";

        final String from = "thundershopproject4@gmail.com";
        final String pass = "Nghi2901";

        //Validate
        String error = "";
        if (name.isEmpty() || name.equals("") || name.trim().length() < 3) {
            error += "Please enter your name";
        } else if (to.isEmpty() || to.trim().equals("")) {
            error += "Please enter your email";
        } else if (description.isEmpty() || description.trim().equals("")) {
            error += "Please enter your question";
        }
        if (error != "") {
            request.setAttribute("msCont", error);
            response.sendRedirect("/NHLSport/Contact/");
        } else {
            String host = "smtp.gmail.com";

            Properties properties = new Properties();

            properties.put("mail.smtp.host", host);
            properties.put("mail.transport.protocol", "smtp");
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", true);
            properties.put("mail.user", from);
            properties.put("mail.password", pass);
            properties.put("mail.port", "465");

            Session mailSession = Session.getInstance(properties, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from, pass); //To change body of generated methods, choose Tools | Templates.
                }
            });
            try {
                //send mail
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(from));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject(subject);
                message.setText(description2);
                Transport.send(message);

                //Add to Database
                Contacts contact = new Contacts();
                contact.setCustomerId(customer);
                contact.setName(name);
                contact.setDescription(description);
                contact.setEmail(to);
                contact.setCreateAt(createAt);
                contactFacade.create(contact);
                
                response.sendRedirect(request.getContextPath() + "/Contact/Success");
            } catch (Exception e) {
                e.printStackTrace();
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
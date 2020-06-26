/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Contacts;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import model.ContactsFacadeLocal;

/**
 *
 * @author longv
 */
@WebServlet(name = "AdminContactsServlet", urlPatterns = {"/Admin/Contacts/*"})
public class AdminContactsServlet extends HttpServlet {

    @EJB
    private ContactsFacadeLocal contactsFacade;
    RequestDispatcher dispatcher;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String action = request.getPathInfo();
        
        switch(action) {
            case "/List":
                getViewList(request, response);
                break;
            case "/Delete":
                delete(request, response);
                break;
            case "/Reply":
                getViewReply(request, response);
                break;
            case "/SendReply":
                sendReply(request, response);
                break;
            default:
                out.print("ok");
                break;
        }
        
    }
    
    private void sendReply(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{ 
        PrintWriter out = response.getWriter();
        
        int id = Integer.parseInt(request.getParameter("id"));
        String reply = request.getParameter("reply");
        final String to = request.getParameter("cusEmail");
        final String name = request.getParameter("cusName");
        final String subject = "Contact to ThunderShop";
        String messages = "Thank " + name + " for contacting the Thunder Shop, <br>"+
                            "We replied:" + reply;

        final String from = "thundershopproject4@gmail.com";
        final String pass = "Nghi2901";
        
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
            message.setText(messages);
            Transport.send(message);

            //Add to Database
            Contacts newContacts = new Contacts();
            newContacts.setId(id);
            newContacts.setReply(reply);

            boolean check = contactsFacade.update(newContacts);

            if(check){
                request.getSession().setAttribute("NotyMessage", "Reply contact successfully");
                response.sendRedirect("List");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private void getViewReply(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        
        if(request.getParameter("id") == null || request.getParameter("id").trim().isEmpty() ) {
            response.sendRedirect("List");
        }
        else {
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            Contacts contact = contactsFacade.find(id);
            
            request.setAttribute("contact", contact);
            
            dispatcher = request.getRequestDispatcher("/admin/views/contact/reply.jsp");
            dispatcher.forward(request, response);
        }
    }
    
    private void getViewList(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        
        List<Contacts> list =  contactsFacade.findAll();
        request.setAttribute("list", list);
        dispatcher = request.getRequestDispatcher("/admin/views/contact/list.jsp");
        dispatcher.forward(request, response);
    }
    
     private void delete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
     
         int id = Integer.parseInt(request.getParameter("id"));
         Contacts contact = new Contacts(id);
         
         contactsFacade.remove(contact);
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

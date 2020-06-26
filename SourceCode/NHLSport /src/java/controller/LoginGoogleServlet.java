/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

/**
 *
 * @author Jiawei
 */
import common.GooglePojo;
import common.GoogleUtils;
import entity.Customers;
import helper.SaltedMD5;
import java.io.IOException;
import static java.lang.System.out;
import java.util.Base64;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CustomersFacadeLocal;

@WebServlet("/login-google")
public class LoginGoogleServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
    @EJB
    private CustomersFacadeLocal customersFacade;

    RequestDispatcher dispatcher;
  public LoginGoogleServlet() {
    super();
  }
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      
    String code = request.getParameter("code");
    if (code == null || code.isEmpty()) {
      RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
      dis.forward(request, response);
    } else {
      String accessToken = GoogleUtils.getToken(code);
      GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
      request.setAttribute("id", googlePojo.getId());
      request.setAttribute("email", googlePojo.getEmail());

        byte[] salt     = null;
        
        String email     = googlePojo.getEmail();
        int index = email.indexOf('@');
        String name = email.substring(0,index);
        String password = "12345";

            
        boolean status  = true;
        Date utilDate   = new java.util.Date();
            java.sql.Date createdAt  = new java.sql.Date(utilDate.getTime());
            
        boolean checkEmailExist = customersFacade.checkEmailExist(email);
        if(checkEmailExist){
              String salt2 = customersFacade.getSalt(email);

              byte[] saltEncode2   = Base64.getDecoder().decode(salt2);
              String hashPassword2 = SaltedMD5.getSecurePassword(password, saltEncode2);

              boolean check = customersFacade.checkLogin(email, hashPassword2);

              if(check){
                  Customers cus = customersFacade.find(email);
                  request.getSession(true).setAttribute("customer", cus);
                  response.sendRedirect(request.getContextPath());

              } else {

                  request.setAttribute("errors", "An error has occurred");
                  dispatcher = request.getRequestDispatcher("/views/customer/login.jsp");
                  dispatcher.forward(request, response);

              } 

         } else {
              try {
                salt = SaltedMD5.getSalt();
              } catch (Exception ex) { }

                  String saltEncode   = Base64.getEncoder().encodeToString(salt);
                  String hashPassword = SaltedMD5.getSecurePassword(password, salt);

                  Customers newCustomer = new Customers(name, email, hashPassword, saltEncode, status, createdAt);

                  customersFacade.create(newCustomer);

                  Customers cus = customersFacade.find(email);
                  request.getSession(true).setAttribute("customer", cus);
                  response.sendRedirect(request.getContextPath());

          }
    }
  }
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Contacts;
import entity.Customers;
import entity.Feedbacks;
import entity.Orders;
import entity.OrdersDetail;
import entity.Wishlist;
import helper.SaltedMD5;
import helper.Validation;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
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
import javax.servlet.http.HttpSession;
import model.ContactsFacadeLocal;
import model.CustomersFacadeLocal;
import model.FeedbacksFacadeLocal;
import model.OrdersDetailFacadeLocal;
import model.OrdersFacadeLocal;
import model.ProductsFacadeLocal;
import model.WishlistFacadeLocal;

/**
 *
 * @author jiawei
 */
@WebServlet(name = "CustomerServlet", urlPatterns = {"/Customer/*"})
public class CustomerServlet extends HttpServlet {

    @EJB
    private ProductsFacadeLocal productsFacade;
    @EJB
    private WishlistFacadeLocal wishlistFacade;

    @EJB
    private CustomersFacadeLocal customersFacade;
    @EJB
    private OrdersDetailFacadeLocal ordersDetailFacadeLocal;
    @EJB
    private OrdersFacadeLocal ordersFacadeLocal;
    @EJB
    private ContactsFacadeLocal contactsFacadeLocal;
    @EJB
    private FeedbacksFacadeLocal feedbacksFacade;
    
    RequestDispatcher dispatcher;
    Validation valid;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String action = request.getPathInfo();
        String method = request.getMethod();

        switch (action) {
            case "/Login":
                if (method.equals("POST")) {
                    if (request.getSession().getAttribute("customer") == null) {
                        login(request, response);
                    }
                } else {
                    getViewLogin(request, response);
                }
                break;
            case "/Logout":
                logout(request, response);
                break;
            case "/Sign-Up":
                if (method.equals("POST")) {
                    insertCustomer(request, response);
                } else {
                    getViewSignUp(request, response);
                }
                break;
            case "/Account":
                getViewAccount(request, response);
                break;
            case "/ForgotPassword":
                if (method.equals("POST")) {
                    if (request.getSession().getAttribute("customer") == null) {
                        forgotPassword(request, response);
                    }
                } else {
                    getViewForgotPassword(request, response);
                }
                break;
            case "/Cofirmcode":
                Cofirmcode(request, response);
                break;
            case "/ChangeNewPassword":
                ChangeNewPassword(request, response);
                break;
            case "/UpdateAccount":
                updateAccount(request, response);
                break;
            case "/OrderManagement":
                getViewOrderManagement(request, response);
                break;
            case "/OrdersDetail":
                getViewOrdersDetail(request, response);
                break;
            case "/OrdersBill":
                getViewOrdersBill(request, response);
                break;
            case "/ContactHistory":
                getViewContactHistory(request, response);
                break;
            case "/ContactDetail":
                getViewContactDetail(request, response);
                break;
            case "/AddToWishlist":
                addToWishlist(request, response);
                break;
            case "/Remove":
                removeWishlist(request, response);
                break;
            case "/Wishlist":
                getViewWishlist(request, response);
                break;
            case "/Success":
                getViewSuccess(request, response);
                break;
            case "/Review":
                getViewReview(request, response);
                break;
            default:
                getView404(request, response);
                break;
        }
    }
    
    private void getViewReview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("customer") == null) {
            response.sendRedirect(request.getContextPath() + "/Customer/Login");
        } else {
            Customers cus = (Customers) request.getSession().getAttribute("customer");
            Customers presentCus = customersFacade.find(cus.getCustomerId());
            List<Feedbacks> list = feedbacksFacade.findByCusId(cus);

            request.setAttribute("cus", presentCus);
            request.setAttribute("list", list);
            dispatcher = request.getRequestDispatcher("/views/customer/review.jsp");
            dispatcher.forward(request, response);
        }
    
    }

    private void getViewSuccess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        dispatcher = request.getRequestDispatcher("/views/page/registerSuccess.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewContactDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customers cus = (Customers) request.getSession().getAttribute("customer");
        Customers presentCus = customersFacade.find(cus.getCustomerId());
        Contacts contact = contactsFacadeLocal.find(id);

        request.setAttribute("cus", presentCus);
        request.setAttribute("contact", contact);
        dispatcher = request.getRequestDispatcher("/views/customer/contactDetail.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewContactHistory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Customers cus = (Customers) request.getSession().getAttribute("customer");
        Customers presentCus = customersFacade.find(cus.getCustomerId());
        List<Contacts> listContacts = contactsFacadeLocal.findByCusId(presentCus);
        request.setAttribute("cus", presentCus);
        request.setAttribute("list", listContacts);
        dispatcher = request.getRequestDispatcher("/views/customer/contactHistory.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewOrderManagement(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Customers cus = (Customers) request.getSession().getAttribute("customer");
        Customers presentCus = customersFacade.find(cus.getCustomerId());
        List<OrdersDetail> listOrdersDetail = ordersDetailFacadeLocal.findAll();
        List<Orders> listOrders = ordersFacadeLocal.findByCusId(presentCus);
        for (Orders item : listOrders) {
            List<OrdersDetail> list = new ArrayList<>();
            for (OrdersDetail orderDetail : listOrdersDetail) {
                if (item.getOrderId() == orderDetail.getOrderId().getOrderId()) {
                    list.add(orderDetail);
                    item.setOrdersDetailCollection(list);
                }
            }
        }
        request.setAttribute("cus", presentCus);
        request.setAttribute("listOrders", listOrders);
        dispatcher = request.getRequestDispatcher("/views/customer/orderManagement.jsp");
        dispatcher.forward(request, response);

    }

    private void getViewOrdersDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        int code = Integer.parseInt(request.getParameter("code"));
        Customers cus = (Customers) request.getSession().getAttribute("customer");
        Customers presentCus = customersFacade.find(cus.getCustomerId());
        List<OrdersDetail> listOrdersDetail = ordersDetailFacadeLocal.findAll();
        Orders order = ordersFacadeLocal.find(code);
        List<OrdersDetail> list = new ArrayList<>();

        for (OrdersDetail orderDetail : listOrdersDetail) {
            if (order.getOrderId() == orderDetail.getOrderId().getOrderId()) {
                list.add(orderDetail);
            }
        }

        order.setOrdersDetailCollection(list);
        request.setAttribute("cus", presentCus);
        request.setAttribute("order", order);
        dispatcher = request.getRequestDispatcher("/views/customer/ordersDetail.jsp");
        dispatcher.forward(request, response);

    }

    private void getViewOrdersBill(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        int code = Integer.parseInt(request.getParameter("code"));
        Customers cus = (Customers) request.getSession().getAttribute("customer");
        List<OrdersDetail> listOrdersDetail = ordersDetailFacadeLocal.findAll();
        Orders order = ordersFacadeLocal.find(code);
        List<OrdersDetail> list = new ArrayList<>();

        for (OrdersDetail orderDetail : listOrdersDetail) {
            if (order.getOrderId() == orderDetail.getOrderId().getOrderId()) {
                list.add(orderDetail);
            }
        }

        order.setOrdersDetailCollection(list);

        request.setAttribute("cus", cus);
        request.setAttribute("order", order);
        dispatcher = request.getRequestDispatcher("/views/customer/ordersBill.jsp");
        dispatcher.forward(request, response);

    }

    private void getView404(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/views/error/404.jsp");
        dispatcher.forward(request, response);
    }

    private void getViewAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        if (request.getSession().getAttribute("customer") == null) {
            response.sendRedirect(request.getContextPath() + "/Customer/Login");
        } else {
            Customers cus = (Customers) request.getSession().getAttribute("customer");
            Customers presentCus = customersFacade.find(cus.getCustomerId());
            dispatcher = request.getRequestDispatcher("/views/customer/profile.jsp");
            request.setAttribute("cus", presentCus);
            dispatcher.forward(request, response);
        }
    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        int customerId = Integer.parseInt(request.getParameter("id"));
        String fullName = new String(request.getParameter("fullName").getBytes("iso-8859-1"), "utf-8");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String changePass = request.getParameter("change-pass");
        String currentPass = request.getParameter("currentPass");
        String newPass = request.getParameter("newPass");
        String reNewPass = request.getParameter("reNewPass");
        valid = new Validation();

        ArrayList<String> errs = new ArrayList<>();

        byte[] salt = null;
        Date date = null;

        try {
            date = new SimpleDateFormat("dd/MM/yyyy").parse(dob);
        } catch (Exception e) {
        }

        java.sql.Date DOB = new java.sql.Date(date.getTime());

        if (changePass == null) {
            if (!valid.validPhone(phone)) {
                errs.add("Invalid phone");
            } else if ("0000000000".equals(phone) || "00000000000".equals(phone) || "0000000000000".equals(phone)) {
                errs.add("Invalid phone");
            }

            if (errs.size() > 0) {
                request.setAttribute("errors", errs);
                Customers presentCus = customersFacade.find(customerId);
                request.setAttribute("cus", presentCus);
                dispatcher = request.getRequestDispatcher("/views/customer/profile.jsp");
                dispatcher.forward(request, response);
            } else {
                Customers editCus = new Customers(customerId, fullName, gender, phone, DOB);

                boolean check = customersFacade.updateAccount(editCus);

                if (check) {
                    Customers cus = customersFacade.find(customerId);
                    request.getSession(true).setAttribute("customer", cus);
                    request.getSession(true).setAttribute("messages", "Update Information Success");
                    response.sendRedirect("Account");
                }
            }
        } else {
            try {
                salt = SaltedMD5.getSalt();
            } catch (Exception ex) {
            }
            String saltEncode = Base64.getEncoder().encodeToString(salt);
            String hashPassword = SaltedMD5.getSecurePassword(newPass, salt);

            if (!valid.validPhone(phone)) {
                errs.add("Invalid phone");
            } else if ("0000000000".equals(phone) || "00000000000".equals(phone) || "0000000000000".equals(phone)) {
                errs.add("Invalid phone");
            }

            if (valid.customeEmpty(currentPass)) {
                errs.add("Please enter current password");
            }

            if (valid.customeEmpty(newPass)) {
                errs.add("Please enter new password");
            }

            if (!newPass.equals(reNewPass)) {
                errs.add("Confirm password doesn't match password");
            }

            if (errs.size() > 0) {
                request.setAttribute("errors", errs);
                Customers presentCus = customersFacade.find(customerId);
                request.setAttribute("cus", presentCus);
                dispatcher = request.getRequestDispatcher("/views/customer/profile.jsp");
                dispatcher.forward(request, response);
            } else {

                //CheckPass by CheckLogin
                String salt2 = customersFacade.getSalt(email);
                byte[] saltEncode2 = Base64.getDecoder().decode(salt2);
                String hashCurrentPassword = SaltedMD5.getSecurePassword(currentPass, saltEncode2);

                boolean checkPass = customersFacade.checkLogin(email, hashCurrentPassword);

                if (checkPass) {

                    //CheckPass by CheckLogin
                    String hashNewPass = SaltedMD5.getSecurePassword(newPass, saltEncode2);

                    boolean checkNewPass = customersFacade.checkLogin(email, hashNewPass);

                    if (checkNewPass) {
                        errs.add("New password must be not the same old password");
                        request.setAttribute("errors", errs);
                        Customers presentCus = customersFacade.find(customerId);
                        request.setAttribute("cus", presentCus);
                        dispatcher = request.getRequestDispatcher("/views/customer/profile.jsp");
                        dispatcher.forward(request, response);

                    } else {
                        Customers editCus = new Customers(customerId, fullName, email, hashPassword, gender, phone, DOB, saltEncode);

                        boolean check = customersFacade.updateAccountWithPassword(editCus);

                        if (check) {
                            Customers cus = customersFacade.find(customerId);
                            request.getSession(true).setAttribute("customer", cus);
                            request.getSession(true).setAttribute("messages", "Update Information Success");
                            response.sendRedirect("Account");
                        }
                    }
                } else {
                    errs.add("Incorrect curent password");
                    request.setAttribute("errors", errs);
                    Customers presentCus = customersFacade.find(customerId);
                    request.setAttribute("cus", presentCus);
                    dispatcher = request.getRequestDispatcher("/views/customer/profile.jsp");
                    dispatcher.forward(request, response);
                }

            }

        }

    }

    private void getViewForgotPassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/views/customer/forgotPassword.jsp");
        dispatcher.forward(request, response);
    }

    private void forgotPassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        final String to = request.getParameter("email");

        Date createAt = java.util.Calendar.getInstance(java.util.TimeZone.getTimeZone("Vietnam/Hanoi")).getTime();
        final String subject = "Reset Password";
        final String random = generateRandomString(5);

        String description2 = "Your confirm code to reset password is " + random;

        final String from = "thundershopproject4@gmail.com";
        final String pass = "Nghi2901";

        String err = null;

        valid = new Validation();

        if (valid.customeEmpty(to)) {
            err = "Please enter your email";
        } else if (!valid.validEmail(to)) {
            err = "Invalid email! Example email: example@example.com";
        }

        if (err != null) {
            request.setAttribute("errors", err);
            dispatcher = request.getRequestDispatcher("/views/customer/forgotPassword.jsp");
            dispatcher.forward(request, response);
        } else {
            boolean checkEmailExist = customersFacade.checkEmailExist(to);
            if (checkEmailExist) {
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
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to, "ThunderShop"));
                    message.setSubject(subject);
                    message.setText(description2);
                    Transport.send(message);

                    request.setAttribute("confirm", random);
                    request.setAttribute("yourmail", to);
                    dispatcher = request.getRequestDispatcher("/views/customer/enterCodeForgotPassword.jsp");
                    dispatcher.forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else {
                request.setAttribute("errors", "Email does not exist");
                dispatcher = request.getRequestDispatcher("/views/customer/forgotPassword.jsp");
                dispatcher.forward(request, response);
            }
        }

    }

    private void Cofirmcode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String confirmCode = request.getParameter("confirmCode");
        String confirmCodeFromMail = request.getParameter("confirmCodeFromMail");
        String yourmail = request.getParameter("yourmail");

        if (confirmCode.equals(confirmCodeFromMail)) {
            request.setAttribute("yourmail", yourmail);
            dispatcher = request.getRequestDispatcher("/views/customer/resetNewPassword.jsp");
            dispatcher.forward(request, response);
            response.sendRedirect(request.getContextPath() + "/Contact/Success");
        } else {
            request.setAttribute("confirm", confirmCodeFromMail);
            request.setAttribute("yourmail", yourmail);
            request.setAttribute("errors", "Confirm code is incorrect");
            dispatcher = request.getRequestDispatcher("/views/customer/enterCodeForgotPassword.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void ChangeNewPassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String yourmail = request.getParameter("yourmail");

        String err = null;
        valid = new Validation();
        byte[] salt = null;
        try {
            salt = SaltedMD5.getSalt();
        } catch (Exception ex) {
        }
        String saltEncode = Base64.getEncoder().encodeToString(salt);
        String hashPassword = SaltedMD5.getSecurePassword(pass, salt);
        if (valid.customeEmpty(pass)) {
            err = "Please enter new password";
        }
        if (valid.customeEmpty(pass)) {
            err = "Please confirm new password";
        }

        if (!pass.equals(repass)) {
            err = "Confirm password doesn't match password";
        }

        if (err != null) {
            request.setAttribute("errors", err);
            request.setAttribute("yourmail", yourmail);
            dispatcher = request.getRequestDispatcher("/views/customer/resetNewPassword.jsp");
            dispatcher.forward(request, response);
        } else {

            Customers editCus = new Customers(yourmail, hashPassword, saltEncode);

            boolean check = customersFacade.changeForgotPassword(editCus);

            if (check) {
                Customers cus = customersFacade.find(yourmail);
                request.getSession(true).setAttribute("customer", cus);
                response.sendRedirect("Account");
            } else {
                request.setAttribute("yourmail", yourmail);
                request.setAttribute("errors", "An error has occurred");
                dispatcher = request.getRequestDispatcher("/views/customer/resetNewPassword.jsp");
                dispatcher.forward(request, response);

            }
        }

    }

    private void getViewLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/views/customer/login.jsp");
        dispatcher.forward(request, response);
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
            dispatcher = request.getRequestDispatcher("/views/customer/login.jsp");
            dispatcher.forward(request, response);
        } else {
            boolean checkEmailExist = customersFacade.checkEmailExist(email);
            if (checkEmailExist) {
                String salt = customersFacade.getSalt(email);

                byte[] saltEncode = Base64.getDecoder().decode(salt);
                String hashPassword = SaltedMD5.getSecurePassword(password, saltEncode);

                boolean check = customersFacade.checkLogin(email, hashPassword);

                if (check) {
                    Customers cus = customersFacade.find(email);
                    request.getSession(true).setAttribute("customer", cus);
                    response.sendRedirect(request.getContextPath());

                } else {

                    request.setAttribute("errors", "Email or password is incorrect.");
                    dispatcher = request.getRequestDispatcher("/views/customer/login.jsp");
                    dispatcher.forward(request, response);

                }

            } else {
                request.setAttribute("errors", "Email or password is incorrect.");
                dispatcher = request.getRequestDispatcher("/views/customer/login.jsp");
                dispatcher.forward(request, response);
            }

        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.getSession().removeAttribute("customer");
        response.sendRedirect(request.getContextPath());
    }

    private void getViewSignUp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/views/customer/sign-up.jsp");
        dispatcher.forward(request, response);
    }

    private void addToWishlist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String error = "";
        if (session.getAttribute("customer") == null) {
            response.sendRedirect("Login");
        } else {
            Customers cus = (Customers) session.getAttribute("customer");
            int idCus = cus.getCustomerId();
            String testId = request.getParameter("idProduct");
            int idProduct = Integer.parseInt(testId);
            if (wishlistFacade.checkProductByIdCus(idCus, idProduct) == true) {
                Wishlist wishlist = new Wishlist();
                wishlist.setCusID(customersFacade.find(idCus));
                wishlist.setProductID(productsFacade.find(idProduct));
                wishlistFacade.create(wishlist);
                out.print("Product has been added to the wish list");
            } else {
                out.print("This product already exists in the wishlist ");
            }
        }

    }

    private void getViewWishlist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("customer") == null) {
            response.sendRedirect("Login");
        } else {
            Customers cus = (Customers) session.getAttribute("customer");
            int idCus = cus.getCustomerId();
            List<Wishlist> list = wishlistFacade.findWLByIdCus(idCus);
            request.setAttribute("listWL", list);
            dispatcher = request.getRequestDispatcher("/views/customer/wishlist.jsp");
            dispatcher.forward(request, response);
        }

    }

    private void removeWishlist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("customer") == null) {
            response.sendRedirect("Login");
        } else {
            int idPro = Integer.parseInt(request.getParameter("idPro"));
            Customers cus = (Customers) session.getAttribute("customer");
            int idCus = cus.getCustomerId();
            wishlistFacade.RemoveProdWL(idCus, idPro);
            response.sendRedirect("Wishlist");
        }
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        byte[] salt = null;
        valid = new Validation();

        String name = new String(request.getParameter("fullName").getBytes("iso-8859-1"), "utf-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePass = request.getParameter("confirmPassword");

        ArrayList<String> errs = new ArrayList<>();

        if (valid.customeEmpty(name)) {
            errs.add("Please enter your name");
        }

        if (valid.customeEmpty(email)) {
            errs.add("Please enter your email");
        } else if (!valid.validEmail(email)) {
            errs.add("Invalid email! Example email: example@example.com");
        }

        if (valid.customeEmpty(password)) {
            errs.add("Please enter password");
        }

        if (!password.equals(rePass)) {
            errs.add("Confirm password doesn't match password");
        }

        if (errs.size() > 0) {
            request.setAttribute("errors", errs);
            dispatcher = request.getRequestDispatcher("/views/customer/sign-up.jsp");
            dispatcher.forward(request, response);
        } else {
            boolean check = customersFacade.checkEmailExist(email);

            if (check) {
                errs.add("Your email already exist!");

                request.setAttribute("errors", errs);
                dispatcher = request.getRequestDispatcher("/views/customer/sign-up.jsp");
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

                Customers newCustomer = new Customers(name, email, hashPassword, saltEncode, status, createdAt);

                customersFacade.create(newCustomer);

                response.sendRedirect("Success");
            }
        }
    }

    public static String generateRandomString(int length) {
        // You can customize the characters that you want to add into
        // the random strings
        String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
        String CHAR_UPPER = CHAR_LOWER.toUpperCase();
        String NUMBER = "0123456789";

        String DATA_FOR_RANDOM_STRING = CHAR_LOWER + CHAR_UPPER + NUMBER;
        SecureRandom random = new SecureRandom();

        if (length < 1) {
            throw new IllegalArgumentException();
        }

        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            // 0-62 (exclusive), random returns 0-61
            int rndCharAt = random.nextInt(DATA_FOR_RANDOM_STRING.length());
            char rndChar = DATA_FOR_RANDOM_STRING.charAt(rndCharAt);

            sb.append(rndChar);
        }

        return sb.toString();
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

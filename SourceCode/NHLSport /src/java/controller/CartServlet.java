/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Customers;
import entity.Orders;
import entity.OrdersDetail;
import entity.Products;
import entity.Storages;
import entity.Vouchers;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CustomersFacadeLocal;
import model.OrdersDetailFacadeLocal;
import model.OrdersFacadeLocal;
import model.ProductsFacadeLocal;
import model.StoragesFacade;
import model.StoragesFacadeLocal;
import model.VouchersFacadeLocal;

/**
 *
 * @author longv
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/Cart/*"})
public class CartServlet extends HttpServlet {
    
    @EJB
    private OrdersFacadeLocal orderFacade;
    @EJB
    private OrdersDetailFacadeLocal orderDetailFacade;
    @EJB
    private ProductsFacadeLocal productFacade;
    @EJB
    private CustomersFacadeLocal customerFacade;
    @EJB
    private VouchersFacadeLocal voucherFacade;
    @EJB
    private StoragesFacadeLocal storageFacade;
    RequestDispatcher dispatcher;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        String action = request.getPathInfo();
        
        switch(action){
            case "/":
                getViewCart(request, response);
                break;
            case "/Checkout":
                getViewCheckout(request, response);
                break;
            case "/StoreItemInCart":
                storeItemInCart(request, response);
                break;
            case "/Save":
                storeOrder(request, response);
                break;
            case "/Delete":
                delete(request, response);
                break;
            case "/OrderComplete":
                getViewComplete(request, response);
                break;
            case "/UpdateQuantity":
                updateQuantity(request, response);
                break;
            case "/CheckVoucher":
                checkVoucher(request, response);
                break;
            default:
                getView404(request, response);
                break;
        }
    }
    
    private void checkVoucher(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String code = request.getParameter("coupon-code");
        HttpSession session = request.getSession();
        Orders orders = (Orders) session.getAttribute("order");
        if (code.trim().isEmpty() || code.isEmpty()) {
            String error = "Code is invalid";
            session.setAttribute("error", error);
            response.sendRedirect(request.getContextPath() + "/Cart/");
        } else {
            boolean check = voucherFacade.checkCodeAndStatus(code);
            if (check == true) {
                Vouchers vouc = voucherFacade.findByCode(code);
                orders.setVoucherId(vouc);
                orders.setTotal(orders.getTotal() - vouc.getDiscount());
                session.setAttribute("order", orders);
                response.sendRedirect(request.getContextPath() + "/Cart/");
            } else {
                String error = "Voucher is invalid";
                session.setAttribute("error", error);
                response.sendRedirect(request.getContextPath() + "/Cart/");
            }
        }
    }
    
    private void updateQuantity(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        HttpSession session = request.getSession();
        Orders orders = (Orders) session.getAttribute("order");
        List<OrdersDetail> itemList = (List<OrdersDetail>) orders.getOrdersDetailCollection();
        String[] quantity = request.getParameterValues("quantity");
        int i = 0;
        for (OrdersDetail items : itemList) {
            items.setQuantity(Integer.parseInt(quantity[i]));
            i++;
        }

        float total = 0;

        for (OrdersDetail items : itemList) {
            total += items.getProductId().getPrice() * items.getQuantity();
        }
        orders.setTotal(total);
        session.setAttribute("order", orders);
        response.sendRedirect(request.getContextPath() + "/Cart/");
    }
    
    private void getViewComplete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        List<Orders> list = orderFacade.findAll();
        Orders orderNew = list.get(list.size() - 1);
        request.setAttribute("order", orderNew);
        dispatcher = request.getRequestDispatcher("/views/page/orderComplete.jsp");
        dispatcher.forward(request, response);
    }
    
    private void storeOrder(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String cusId = null;
        if(request.getParameter("cusId") != null && !request.getParameter("cusId").trim().isEmpty()){
            cusId = request.getParameter("cusId");  
        }
        String cusName = request.getParameter("username");
        String phone = request.getParameter("telephone");
        String address = request.getParameter("address");
        String payment = request.getParameter("payment");
        String note = request.getParameter("note");
        String status = "Waiting";
        Date createAt = java.util.Calendar.getInstance(java.util.TimeZone.getTimeZone("Vietnam/Hanoi")).getTime();
        float total = 0;
        
        if (session.getAttribute("order") != null) {
            
            Orders orders = (Orders) session.getAttribute("order");
            Orders order = new Orders();
            
            if(cusId != null){
                Customers cus = customerFacade.find(Integer.parseInt(cusId));
                order.setCustomerId(cus);
            }
            else {
                order.setCustomerId(null);
            }
            order.setVoucherId(orders.getVoucherId());
            order.setCusName(cusName);
            order.setCusPhone(phone);
            order.setAddress(address);
            order.setNote(note);
            order.setPaymentMethod(payment);
            order.setCreateAt(createAt);
            order.setTotal(orders.getTotal());
            order.setStatus(status);
            orderFacade.create(order);
            
            List<Orders> list = orderFacade.findAll();
            Orders orderNew = list.get(list.size() - 1);
            
            List<OrdersDetail> itemList = (List<OrdersDetail>) orders.getOrdersDetailCollection();
            Iterator<OrdersDetail> i = itemList.iterator();
            while (i.hasNext()) {
                OrdersDetail o = i.next();
                //some condition
                out.print(o.getProductId().getProductId());
                Storages sto = storageFacade.findIdByProdId(o.getProductId().getProductId());
                sto.setQuantity(sto.getQuantity() - o.getQuantity());
                storageFacade.edit(sto);
                o.setOrderId(orderNew);
                orderDetailFacade.create(o);
            }
            session.removeAttribute("order");
            response.sendRedirect(request.getContextPath() + "/Cart/OrderComplete");
        }
        else {
            response.sendRedirect(request.getContextPath() + "/Cart/");
        }
        
    }
    
    private void getViewCheckout(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        dispatcher = request.getRequestDispatcher("/views/page/checkout.jsp");
        dispatcher.forward(request, response);
    }
    
    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        if (request.getParameter("id") == null || request.getParameter("id").trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/Cart/");
        } else {
            HttpSession session = request.getSession();
            float total = 0;
            if (session.getAttribute("order") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                Orders orders = (Orders) session.getAttribute("order");
                List<OrdersDetail> itemList = (List<OrdersDetail>) orders.getOrdersDetailCollection();
                Iterator<OrdersDetail> i = itemList.iterator();
                while (i.hasNext()) {
                    OrdersDetail o = i.next();
                    //some condition
                    if(o.getProductId().getProductId() == id){
                     i.remove();
                    }
                }
                
                orders.setOrdersDetailCollection(itemList);
                for (OrdersDetail item : itemList) {
                    total += item.getProductId().getPrice() * item.getQuantity();
                }
                orders.setTotal(total);
                if (itemList.isEmpty()) {
                    session.removeAttribute("order");
                    response.sendRedirect(request.getContextPath() + "/Cart/");
                } else {
                    session.setAttribute("order", orders);
                    response.sendRedirect(request.getContextPath() + "/Cart/");
                }
            }
        }
    }
    
    private void getViewCart(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        dispatcher = request.getRequestDispatcher("/views/page/cart.jsp");
        dispatcher.forward(request, response);
    }
    
    private void storeItemInCart(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        
        if (request.getParameter("id") != null && !request.getParameter("id").trim().isEmpty()) {
            int id = Integer.parseInt(request.getParameter("id"));
            
            Products product = productFacade.find(id);
            
            //neu chua co gio hang
            if (session.getAttribute("order") == null) {
                Orders orders = new Orders();
                List<OrdersDetail> cart = new ArrayList<>();
                //items
                OrdersDetail items = new OrdersDetail(1, orders, product);
                //add to list
                cart.add(items);
                //add to order
                orders.setOrdersDetailCollection(cart);
                float total = items.getProductId().getPrice() * items.getQuantity();
                orders.setTotal(total);
                session.setAttribute("order", orders);
                response.sendRedirect(request.getContextPath() + "/Cart/");
            } 
            else {
                Orders orders = (Orders) session.getAttribute("order");
                List<OrdersDetail> itemList = (List<OrdersDetail>) orders.getOrdersDetailCollection();
                boolean check = false;
                
                for (OrdersDetail items : itemList) {
                    if (items.getProductId().getProductId() == id) {
                        items.setQuantity(items.getQuantity() + 1);
                        check = true;
                    }
                }
                
                if (check == false) {
                    OrdersDetail items = new OrdersDetail(1, orders, product);
                    itemList.add(items);
                    orders.setOrdersDetailCollection(itemList);
                }
                
                float total = 0;
                
                for (OrdersDetail items : itemList) {
                    total += items.getProductId().getPrice() * items.getQuantity();
                }
                orders.setTotal(total);
                session.setAttribute("order", orders);
                response.sendRedirect(request.getContextPath() + "/Cart/");
            }
            
        }
    }
    
    private void getView404(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        dispatcher = request.getRequestDispatcher("/views/error/404.jsp");
        dispatcher.forward(request, response);
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

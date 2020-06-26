/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import entity.Brands;
import entity.Categories;
import entity.Customers;
import entity.Feedbacks;
import entity.Products;
import entity.Storages;
import java.io.IOException;
import java.io.PrintWriter;
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
import model.BrandsFacadeLocal;
import model.CategoriesFacadeLocal;
import model.CustomersFacadeLocal;
import model.FeedbacksFacadeLocal;
import model.ProductsFacadeLocal;
import model.StoragesFacadeLocal;

/**
 *
 * @author longv
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/Products/*"})
public class ProductServlet extends HttpServlet {
    @EJB
    private StoragesFacadeLocal storagesFacade;
    
    @EJB
    private BrandsFacadeLocal brandsFacade;
    @EJB
    private CategoriesFacadeLocal categoriesFacade;
    @EJB
    private ProductsFacadeLocal productFacade;
    @EJB
    private FeedbacksFacadeLocal feedbackFacade;
    @EJB
    private CustomersFacadeLocal customerFacade;
    RequestDispatcher dispatcher;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String action = request.getPathInfo();
        
        switch(action){
            case "/":
                getViewProducts(request, response);
                break;
            case "/Detail":
                getViewProductDetail(request, response);
                break;
            case "/Sort-By-Item":
                sortByItem(request, response);
                break;  
            case "/Compare":
                getViewCompare(request, response);
                break;
            case "/Rating":
                rating(request, response);
                break;
             case "/ResetList":
                ResetList(request, response);
                break;
            case "/AddToListCompare":
                addListCompare(request, response);
                break;
            default:
                out.print("ok");
                break;
        }
    }
    
    private void rating(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String cusId = null;
        if(request.getParameter("cusId") != null && !request.getParameter("cusId").trim().isEmpty()){
            cusId = request.getParameter("cusId");  
        }
        int productId   = Integer.parseInt(request.getParameter("productId"));
        String name     = request.getParameter("name");
        String email    = request.getParameter("email");
        int star        = Integer.parseInt(request.getParameter("star"));
        String title    = request.getParameter("title");
        String content  = request.getParameter("content");
        Date createAt   = java.util.Calendar.getInstance(java.util.TimeZone.getTimeZone("Vietnam/Hanoi")).getTime();
        
        Feedbacks feedback = new Feedbacks();
        if(cusId != null){
            Customers cus = customerFacade.find(Integer.parseInt(cusId));
            feedback.setCustomerId(cus);
        }
        else {
            feedback.setCustomerId(null);
        }
        feedback.setCusName(name);
        feedback.setCusEmail(email);
        feedback.setRating(star);
        feedback.setProductId(productFacade.find(productId));
        feedback.setTitle(title);
        feedback.setReview(content);
        feedback.setCreateAt(createAt);
        
        feedbackFacade.create(feedback);
        
        response.sendRedirect(request.getContextPath() + "/Products/Detail?id="+productId);
        
    }
    
    private void ResetList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("listCompare");
        response.sendRedirect(request.getContextPath() + "/Products/Compare");
    }
    
    private void addListCompare(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Products product = productFacade.find(id);
        boolean add = false;
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String error = "";
        if (session.getAttribute("listCompare") == null) {
            List<Products> list = new ArrayList<>();
            list.add(product);
            session.setAttribute("listCompare", list);
            out.print("Add product success");
        } else {
            List<Products> list = (List<Products>)session.getAttribute("listCompare");
            if (list.size() < 2) {
                for (Products p : list) {
                    if (p.getProductId() == id) {
                        error = "This product is existed";
                        request.setAttribute("errorCompare", error);
                        out.print(error);
                    }
                    else {
                        if (p.getCategoryId().getCategoryId().compareTo(product.getCategoryId().getCategoryId()) == 0) {
                            add = true;
                        }
                        else {
                            error = "Cannot add product";
                            request.setAttribute("errorCompare", error);
                            out.print(error);
                        }
                    }
                }
                if(add){
                    list.add(product);
                    session.setAttribute("listCompare", list);
                    out.print("Add product success");
                }
            }
            else {
                error = "Can't add more product to compare";
                request.setAttribute("errorCompare", error);
                out.print(error);
            }
        }
    }
    
    private void getViewCompare(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatcher = request.getRequestDispatcher("/views/page/compare.jsp");
        dispatcher.forward(request, response);
    }
    
    private void getViewProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        List<Products> list = productFacade.findAll();
        request.setAttribute("listProd", list);
        List<Brands> listBrand = brandsFacade.findByStatus(true);
        request.setAttribute("listBrand", listBrand);
        List<Categories> listCat = categoriesFacade.findByStatus(true);
        request.setAttribute("listCat", listCat);
        dispatcher = request.getRequestDispatcher("/views/page/product.jsp");
        dispatcher.forward(request, response);
    }
     
     private void getViewProductDetail(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        if (request.getParameter("id") == null || request.getParameter("id").trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/Products/");
        } 
        else {
            int id = Integer.parseInt(request.getParameter("id"));
            Products product = productFacade.find(id);
            List<Feedbacks> listFeedbacks = feedbackFacade.findAll();
            List<Feedbacks> listReview = new ArrayList<>();
            for(Feedbacks feed : listFeedbacks){
                if(feed.getProductId().getProductId() == id){
                    listReview.add(feed);
                }
            }
            
            HttpSession session = request.getSession();
            
            if (session.getAttribute("listViewed") == null) {
                List<Products> listViewed = new ArrayList<>();
                listViewed.add(product);
                session.setAttribute("listViewed", listViewed);
            }
            else {
                boolean check = false;
                List<Products> listViewed = (List<Products>)session.getAttribute("listViewed");
                for(Products item : listViewed){
                    if(item.getProductId() != product.getProductId()) {
                        check = true;
                    }
                }
                if(check = true){
                    listViewed.add(product);
                }
                session.setAttribute("listViewed", listViewed);
            }
            request.setAttribute("product", product);
            List<Products> listProd =  productFacade.findAll();
            request.setAttribute("listProd", listProd);
            request.setAttribute("listReview", listReview);
            dispatcher = request.getRequestDispatcher("/views/page/productDetail.jsp");
            dispatcher.forward(request, response);
        }
     }
           
  private void sortByItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int CatId = 0;
        int BrandId = 0;
        int gender = 0;
        if (request.getQueryString().contains("catId=")) {
            if (request.getParameter("catId").equals("null")) {
                CatId = 0;
            } else {
                CatId = Integer.parseInt(request.getParameter("catId"));
            }
        }
        if (request.getQueryString().contains("brandId=")) {
            if (request.getParameter("brandId").equals("null")) {
                BrandId = 0;
            } else {
                BrandId = Integer.parseInt(request.getParameter("brandId"));
            }
        }
        if (request.getQueryString().contains("gender=")) {
            if (request.getParameter("gender").equals("null")) {
                gender = 0;
            } else {
                gender = Integer.parseInt(request.getParameter("gender"));
            }
        }

        if (CatId != 0 && BrandId == 0 && gender == 0) {
            List<Products> listProd = productFacade.findByCategory(CatId, true);
            List<Storages> listStorage = storagesFacade.findAll();
            List<Products> list = new ArrayList<>();
            for(Products prod : listProd){
                for(Storages sto : listStorage){
                    if(prod.getProductId() == sto.getProductId().getProductId()){
                        list.add(prod);
                    }
                }
            }
            request.setAttribute("listProd", list);
        } else if (CatId == 0 && BrandId != 0 && gender == 0) {
            List<Products> listProd = productFacade.findByBrand(BrandId, true);
            request.setAttribute("listProd", listProd);
        } else if (CatId == 0 && BrandId == 0 && gender != 0) {
            List<Products> listProd = productFacade.findByGender(gender, true);
            request.setAttribute("listProd", listProd);
        } else if (CatId != 0 && BrandId != 0 && gender == 0) {
            List<Products> listProd = productFacade.findByCategoryandBrand(CatId, BrandId, true);
            request.setAttribute("listProd", listProd);
        } else if (CatId != 0 && BrandId == 0 && gender != 0) {
            List<Products> listProd = productFacade.findByCategoryandGender(CatId, gender, true);
            request.setAttribute("listProd", listProd);
        } else if (CatId == 0 && BrandId != 0 && gender != 0) {
            List<Products> listProd = productFacade.findByBrandandGender(BrandId, gender, true);
            request.setAttribute("listProd", listProd);
        } else if (CatId != 0 && BrandId != 0 && gender != 0) {
            List<Products> listProd = productFacade.findByCategoryandBrandandGender(CatId, BrandId, gender, true);
            request.setAttribute("listProd", listProd);
        }
        List<Brands> listBrand = brandsFacade.findByStatus(true);
        request.setAttribute("listBrand", listBrand);
        List<Categories> listCat = categoriesFacade.findByStatus(true);
        request.setAttribute("listCat", listCat);
        dispatcher = request.getRequestDispatcher("/views/page/product.jsp");
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

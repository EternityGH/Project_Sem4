/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Brands;
import entity.Categories;
import entity.Products;
import entity.Storages;
import helper.Validation;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
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
import model.ProductsFacadeLocal;
import model.StoragesFacadeLocal;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author longv
 */
@WebServlet(name = "AdminProductsServlet", urlPatterns = {"/Admin/Products/*"})
public class AdminProductsServlet extends HttpServlet {
    @EJB
    private StoragesFacadeLocal storagesFacade;

    @EJB
    private BrandsFacadeLocal brandsFacade;
    @EJB
    private CategoriesFacadeLocal categoriesFacade;
    @EJB
    private ProductsFacadeLocal productFacade;
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
            case "/Store":
                create(request, response);
                break;
            case "/List":
                getViewList(request, response);
                break;
            case "/Edit":
                getViewUpdate(request, response);
                break;
            case "/Status":
                setstatus(request, response);
                break;
            case "/Update":
                update(request, response);
                break;
            default:
                out.print("ok");
                break;
        }
    }

    private void getViewList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Products> listProd = productFacade.findAll();
        request.setAttribute("listProd", listProd);
        dispatcher = request.getRequestDispatcher("/admin/views/product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        //Ánh xạ dữ liệu
        String productName = null;
        float price = 0;
        String description = null;
        int catId = 0;
        int brandId = 0;
        int gender = 0;
        boolean status = true;
        String err = null;

        List<Brands> listBrand = brandsFacade.findAll();
        request.setAttribute("listBrand", listBrand);
        List<Categories> listCat = categoriesFacade.findAll();
        request.setAttribute("listCat", listCat);
        // Xử lý hình ảnh
        String UPLOAD_DIRECTORY = getServletContext().getRealPath("assets/images/products"); //root folder
        String imgName = null; //lưu db

        // Lưu Ảnh vào Folder       
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    if (!item.isFormField() && item.getFieldName().equals("imageProduct")) {
                        //Taọ ngày giờ để set name
                        SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyyHHmmss");
                        sdf.setTimeZone(TimeZone.getTimeZone("Vietnam/Hanoi"));
                        Date date = new Date();
                        String dateUp = sdf.format(date);
                        //Lấy tên ảnh
                        String name = new File(item.getName()).getName();
                        //Đặt tên url lưu db
                        if (imgName == null) {
                            imgName = dateUp + name;
                        } else {
                            imgName = imgName + ";" + dateUp + name;
                        }
                        // Save ảnh vào folder
                        String fileName = dateUp + name;
                        String url = UPLOAD_DIRECTORY + File.separator + fileName;
                        File storeFile = new File(url);
                        item.write(storeFile);
                    } else if (item.isFormField()) {
                        switch (item.getFieldName()) {
                            case "productName":
                                productName = item.getString();
                                break;
                            case "price":
                                price = Float.parseFloat(item.getString());
                                break;
                            case "imageDes":
                                description = item.getString();
                                break;
                            case "catId":
                                catId = Integer.parseInt(item.getString());
                                break;
                            case "brandId":
                                brandId = Integer.parseInt(item.getString());
                                break;
                            case "gender":
                                gender = Integer.parseInt(item.getString());
                                break;
                            default:
                                break;
                        }
                        boolean checkProductNameExist = productFacade.checkProductNameExist(productName);
                        if (checkProductNameExist) {
                            err = "Product name is exist";
                        }

                    }
                }
                request.setAttribute("message", "File uploaded successfully.");
            } catch (Exception ex) {
                request.setAttribute("message", "File upload failed due to : " + ex);
            }
        } else {
            request.setAttribute("message", "Sorry this servlet only handles file upload request.");
        }
        if (err == null) {
            Products newProd = new Products(productName, description, imgName, gender, price, status, brandsFacade.find(brandId), categoriesFacade.find(catId));
        productFacade.create(newProd);
        Storages storages = new Storages();
        Products pro = productFacade.find(newProd.getProductId());
        storages.setProductId(pro);
        storages.setQuantity(0);
        storagesFacade.create(storages);

            //Send Redirect
            response.sendRedirect("List");
        } else {
            request.setAttribute("errors", err);
            dispatcher = request.getRequestDispatcher("/admin/views/product/create.jsp");
            dispatcher.forward(request, response);
        }

        //Tạo Products và lưu vào database
    }

    private void getViewCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Brands> listBrand = brandsFacade.findAll();
        request.setAttribute("listBrand", listBrand);
        List<Categories> listCat = categoriesFacade.findAll();
        request.setAttribute("listCat", listCat);
        dispatcher = request.getRequestDispatcher("/admin/views/product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void setstatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        boolean stt = !status;
        Products product = new Products(id, stt);

        productFacade.disable(product);
        response.sendRedirect("List");
    }

    private void getViewUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        Products product = productFacade.find(id);
        request.setAttribute("prod", product);
        List<Brands> listBrand = brandsFacade.findAll();
        request.setAttribute("listBrand", listBrand);
        List<Categories> listCat = categoriesFacade.findAll();
        request.setAttribute("listCat", listCat);
        dispatcher = request.getRequestDispatcher("/admin/views/product/update.jsp");
        dispatcher.forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("productIdSession");
        Products product = productFacade.find(id);
        //Ánh xạ dữ liệu cũ
        String productName = product.getProductName();
        float price = product.getPrice();
        String description = product.getDescription();
        Categories cate = product.getCategoryId();
        int catId = cate.getCategoryId();
        Brands brand = product.getBrandId();
        int brandId = brand.getBrandId();
        int gender = product.getGender();
        boolean status = product.getStatus();
        String imgOld = product.getImageUrl();
    //        
        //        String productName = request.getParameter("productName");
        //        float price = Float.parseFloat(request.getParameter("price"));
        //        String description = request.getParameter("imageDes");
        //        int catId = Integer.parseInt(request.getParameter("catId"));
        //        int brandId = Integer.parseInt(request.getParameter("brandId"));
        //        int gender = Integer.parseInt(request.getParameter("gender"));
        //        boolean status = product.getStatus();

        // Xử lý hình ảnh
        String UPLOAD_DIRECTORY = getServletContext().getRealPath("assets/images/products"); //root folder
        String imgName = null; //lưu db

        // Lưu Ảnh vào Folder       
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    if (item.getFieldName().equals("imageProduct")) {

                        //Taọ ngày giờ để set name
                        SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyyHHmmss");
                        sdf.setTimeZone(TimeZone.getTimeZone("Vietnam/Hanoi"));
                        Date date = new Date();
                        String dateUp = sdf.format(date);
                        //Lấy tên ảnh
                        String name = new File(item.getName()).getName();
                        //Đặt tên url lưu db
                        if (imgName == null) {
                            imgName = dateUp + name;
                        } else {
                            imgName = imgName + ";" + dateUp + name;
                        }
                        // Save ảnh vào folder
                        String fileName = dateUp + name;
                        String url = UPLOAD_DIRECTORY + File.separator + fileName;
                        File storeFile = new File(url);
                        item.write(storeFile);

                        //xóa ảnh cũ
                        String[] findImg = imgOld.split(";");
                        for (String deleteIMG : findImg) {
                            File oldImg = new File(UPLOAD_DIRECTORY + File.separator + deleteIMG);
                            oldImg.delete();
                        }

                    } else if (item.isFormField()) {
                        switch (item.getFieldName()) {

                            case "productName":
                                productName = item.getString();
                                break;
                            case "price":
                                price = Float.parseFloat(item.getString());
                                break;
                            case "imageDes":
                                description = item.getString();
                                break;
                            case "catId":
                                catId = Integer.parseInt(item.getString());
                                break;
                            case "brandId":
                                brandId = Integer.parseInt(item.getString());
                                break;
                            case "gender":
                                gender = Integer.parseInt(item.getString());
                                break;
                            default:
                                break;
                        }

                    }
                }
                request.setAttribute("message", "File uploaded successfully.");

            } catch (Exception ex) {
                request.setAttribute("message", "File upload failed due to : " + ex);
            }
        } else {
            request.setAttribute("message", "Sorry this servlet only handles file upload request.");
        }

        //Edit Products và lưu vào database
        product.setProductName(productName);
        product.setBrandId(brandsFacade.find(brandId));
        product.setCategoryId(categoriesFacade.find(catId));
        product.setStatus(status);
        product.setDescription(description);
        product.setGender(gender);
        product.setPrice(price);

        productFacade.edit(product);

        session.removeAttribute("productIdSession");
        //Send Redirect
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

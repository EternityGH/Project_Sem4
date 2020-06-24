/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Products;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author longv
 */
@Local
public interface ProductsFacadeLocal {

    void create(Products products);

    void edit(Products products);

    void remove(Products products);

    Products find(Object id);

    boolean disable(Products products);

    List<Products> findByCategory(int CategoryId, boolean status);

    List<Products> findByBrand(int BrandId, boolean status);

    List<Products> findByStatus(boolean Status);

    List<Products> findByGender(int GenderId, boolean status);

    List<Products> findByCategoryandBrand(int Category, int BrandId, boolean status);

    List<Products> findByCategoryandGender(int Category, int GenderId, boolean status);

    List<Products> findByBrandandGender(int Brand, int GenderId, boolean status);

    List<Products> findByCategoryandBrandandGender(int Category, int BrandId, int GenderId, boolean status);

    List<Products> findAll();

    List<Products> findRange(int[] range);

    int count();

    boolean checkProductNameExist(String productName);

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Categories;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author longv
 */
@Local
public interface CategoriesFacadeLocal {

    void create(Categories categories);

    void edit(Categories categories);

    void remove(Categories categories);

    Categories find(Object id);

    List<Categories> findAll();

    List<Categories> findByStatus(boolean Status);

    List<Categories> findRange(int[] range);

    int count();

    boolean update(Categories cat);

    boolean checCategoryNameExist(String categoryName);

}

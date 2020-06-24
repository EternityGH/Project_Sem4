/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Brands;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author longv
 */
@Local
public interface BrandsFacadeLocal {

    void create(Brands brands);

    void edit(Brands brands);

    void remove(Brands brands);

    Brands find(Object id);

    List<Brands> findByStatus(boolean Status);

    List<Brands> findAll();

    List<Brands> findRange(int[] range);

    int count();

    boolean update(Brands brand);

    boolean checkBrandNameExist(String BrandName);
}

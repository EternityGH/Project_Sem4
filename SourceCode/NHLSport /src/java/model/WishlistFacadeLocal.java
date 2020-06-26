/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.Wishlist;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Lark
 */
@Local
public interface WishlistFacadeLocal {

    void create(Wishlist wishlist);

    void edit(Wishlist wishlist);

    void remove(Wishlist wishlist);

    Wishlist find(Object id);

    List<Wishlist> findAll();

    List<Wishlist> findRange(int[] range);

    int count();
    
    boolean checkProductByIdCus(int idCus, int idProd);

    List<Wishlist> findWLByIdCus(int idCus);

    void RemoveProdWL(int idCus, int idPro);
    public List<Wishlist> getListTop10();
}

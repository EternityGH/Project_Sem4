/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.Wishlist;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Lark
 */
@Stateless
public class WishlistFacade extends AbstractFacade<Wishlist> implements WishlistFacadeLocal {
    @PersistenceContext(unitName = "NHLSportPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public WishlistFacade() {
        super(Wishlist.class);
    }
    @Override
    public boolean checkProductByIdCus(int idCus, int idProd) {
        boolean check = false;
        Query q = em.createQuery("SELECT wl FROM Wishlist wl WHERE wl.cusID.customerId =:idCus ");
        q.setParameter("idCus", idCus);
        List<Wishlist> list = q.getResultList();

        if (q.getResultList().size() == 0) {
            return true;
        } else {

            for (Wishlist wl : list) {

                if (wl.getProductID().getProductId() == idProd) {
                    check = true;
                }
            }
        }
        if (check == true) {
            return false;
        } else {
            return true;
        }

    }

    @Override
    public List<Wishlist> findWLByIdCus(int idCus) {
        Query q = em.createQuery("SELECT wl FROM Wishlist wl WHERE wl.cusID.customerId =:idCus AND wl.productID.status = true");
        q.setParameter("idCus", idCus);
        return q.getResultList();
    }

    @Override
    public void RemoveProdWL(int idCus,int idPro) {
        Query q = em.createQuery("DELETE FROM Wishlist wl WHERE wl.cusID.customerId =:idCus AND wl.productID.productId =:idPro ");
        q.setParameter("idCus", idCus);
        q.setParameter("idPro", idPro);
        q.executeUpdate();
    }
}

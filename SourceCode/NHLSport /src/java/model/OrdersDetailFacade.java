/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.OrdersDetail;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author longv
 */
@Stateless
public class OrdersDetailFacade extends AbstractFacade<OrdersDetail> implements OrdersDetailFacadeLocal {
    @PersistenceContext(unitName = "NHLSportPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrdersDetailFacade() {
        super(OrdersDetail.class);
    }
    
    @Override
    public List<OrdersDetail> getListTop10SellProduct() {
        Query q = em.createQuery("SELECT od.productId.productName, COUNT(od.productId.productId) AS Quantity, od.productId.price FROM OrdersDetail od WHERE od.productId.status = true GROUP BY od.productId ORDER BY Quantity DESC");
                return q.setMaxResults(10).getResultList();
    }
    
}

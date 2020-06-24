/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.OrdersDetail;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
    
}

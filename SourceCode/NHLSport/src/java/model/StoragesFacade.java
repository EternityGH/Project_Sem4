/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.Storages;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Lark
 */
@Stateless
public class StoragesFacade extends AbstractFacade<Storages> implements StoragesFacadeLocal {
    @PersistenceContext(unitName = "NHLSportPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StoragesFacade() {
        super(Storages.class);
    }
    @Override
    public Storages findIdByProdId(int idProd) {
        Query q = em.createQuery("SELECT v FROM Storages v WHERE v.productId=:idProd");
        q.setParameter("idProd", idProd);
        if(q.getSingleResult()!=null){
            Storages storages = (Storages)q.getSingleResult();
        }
        return null;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.Storages;
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
        Query q = em.createQuery("SELECT v FROM Storages v WHERE v.productId.productId = :idProd");
        q.setParameter("idProd", idProd);
        if(q.getSingleResult() != null){
            Storages storages = (Storages)q.getSingleResult();
            return storages;
        }
        return null;
    }

    @Override
    public List<Storages> getListStorageStatusQuantity() {
        Query q = em.createQuery("SELECT store FROM Storages store WHERE store.productId.status = true AND store.quantity > 0 ORDER BY store.productId.productId DESC");
        return q.getResultList();
    }

    @Override
    public List<Storages> getListStorageStatus(boolean status) {
        Query q = em.createQuery("SELECT store FROM Storages store WHERE store.productId.status =:status");
        q.setParameter("status", status);
        return q.getResultList();
    }
    
    
}

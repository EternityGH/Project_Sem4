/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Brands;
import entity.Categories;
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
public class BrandsFacade extends AbstractFacade<Brands> implements BrandsFacadeLocal {

    @PersistenceContext(unitName = "NHLSportPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BrandsFacade() {
        super(Brands.class);
    }

    @Override
    public boolean update(Brands brand) {
        Query q = em.createQuery("UPDATE Brands c SET c.name =:name, c.status =:status WHERE c.brandId =:id");
        q.setParameter("name", brand.getName());
        q.setParameter("status", brand.getStatus());
        q.setParameter("id", brand.getBrandId());
        return q.executeUpdate() > 0;
    }

    @Override
    public List<Brands> findByStatus(boolean status) {
        Query q = em.createQuery("SELECT p FROM Brands p WHERE p.status = :status");

        q.setParameter("status", status);
        return q.getResultList();
    }

    @Override
    public boolean checkBrandNameExist(String BrandName) {
        Query q = em.createQuery("SELECT c FROM Brands c WHERE c.name = :BrandName");
        q.setParameter("BrandName", BrandName);
        return !q.getResultList().isEmpty();
    }

}

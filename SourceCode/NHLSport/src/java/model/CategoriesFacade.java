/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Categories;
import entity.Customers;
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
public class CategoriesFacade extends AbstractFacade<Categories> implements CategoriesFacadeLocal {

    @PersistenceContext(unitName = "NHLSportPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategoriesFacade() {
        super(Categories.class);
    }

    @Override
    public boolean update(Categories cat) {
        Query q = em.createQuery("UPDATE Categories c SET c.name =:name, c.status =:status WHERE c.categoryId =:id");
        q.setParameter("name", cat.getName());
        q.setParameter("status", cat.getStatus());
        q.setParameter("id", cat.getCategoryId());
        return q.executeUpdate() > 0;
    }

    @Override
    public List<Categories> findByStatus(boolean status) {
        Query q = em.createQuery("SELECT p FROM Categories p WHERE p.status = :status");

        q.setParameter("status", status);
        return q.getResultList();
    }

    @Override
    public boolean checCategoryNameExist(String categoryName) {
        Query q = em.createQuery("SELECT c FROM Categories c WHERE c.name = :categoryName");
        q.setParameter("categoryName", categoryName);
        return !q.getResultList().isEmpty();
    }

}

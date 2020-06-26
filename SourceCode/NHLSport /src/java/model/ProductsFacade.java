/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Products;
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
public class ProductsFacade extends AbstractFacade<Products> implements ProductsFacadeLocal {

    @PersistenceContext(unitName = "NHLSportPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductsFacade() {
        super(Products.class);
    }

    @Override
    public List<Products> findByCategory(int categoryId, boolean status) {
        Query q = em.createQuery("SELECT p FROM Products p LEFT JOIN  p.categoryId t WHERE t.categoryId = :categoryId AND t.status = :status");
        q.setParameter("categoryId", categoryId);
        q.setParameter("status", status);
        return q.getResultList();
    }

    @Override
    public List<Products> findByBrand(int brandId, boolean status) {
        Query q = em.createQuery("SELECT p FROM Products p LEFT JOIN  p.brandId t WHERE t.brandId = :brandId AND p.status = :status");
        q.setParameter("brandId", brandId);
        q.setParameter("status", status);
        return q.getResultList();
    }

    @Override
    public List<Products> findByCategoryandBrand(int categoryId, int brandId, boolean status) {
        Query q = em.createQuery("SELECT p FROM Products p  LEFT JOIN  p.categoryId t LEFT JOIN  p.brandId u WHERE t.categoryId =:categoryId  AND u.brandId = :brandId AND p.status = :status");
        q.setParameter("categoryId", categoryId);
        q.setParameter("brandId", brandId);
        q.setParameter("status", status);
        return q.getResultList();
    }

    @Override
    public boolean checkProductNameExist(String productName) {
        Query q = em.createQuery("SELECT c FROM Products c WHERE c.productName = :productName");
        q.setParameter("productName", productName);
        return !q.getResultList().isEmpty();
    }

    @Override
    public boolean disable(Products products) {
        Query q = em.createQuery("UPDATE Products c SET c.status =:status WHERE c.productId =:productId");
        q.setParameter("productId", products.getProductId());
        q.setParameter("status", products.getStatus());
        return q.executeUpdate() > 0;
    }

    @Override
    public List<Products> findByStatus(boolean status) {
        Query q = em.createQuery("SELECT p FROM Products p WHERE p.status = :status");

        q.setParameter("status", status);
        return q.getResultList();
    }

    @Override
    public List<Products> findByGender(int gender, boolean status) {
        Query q = em.createQuery("SELECT p FROM Products p WHERE p.gender = :gender AND p.status = :status");

        q.setParameter("gender", gender);
        q.setParameter("status", status);
        return q.getResultList();
    }

    @Override
    public List<Products> findByCategoryandBrandandGender(int categoryId, int brandId, int gender, boolean status) {
        Query q = em.createQuery("SELECT p FROM Products p  LEFT JOIN  p.categoryId t LEFT JOIN  p.brandId u WHERE t.categoryId =:categoryId  AND u.brandId = :brandId AND p.gender = :gender AND p.status = :status");
        q.setParameter("categoryId", categoryId);
        q.setParameter("brandId", brandId);
        q.setParameter("gender", gender);
        q.setParameter("status", status);
        return q.getResultList();
    }

    @Override
    public List<Products> findByCategoryandGender(int categoryId, int gender, boolean status) {
        Query q = em.createQuery("SELECT p FROM Products p LEFT JOIN  p.categoryId u WHERE u.categoryId =:categoryId  AND p.gender = :gender AND p.status = :status");
        q.setParameter("categoryId", categoryId);
        q.setParameter("gender", gender);
        q.setParameter("status", status);
        return q.getResultList();
    }

    @Override
    public List<Products> findByBrandandGender(int brandId, int gender, boolean status) {
        Query q = em.createQuery("SELECT p FROM Products p LEFT JOIN  p.brandId u WHERE u.brandId =:categoryId  AND p.gender = :gender AND p.status = :status");
        q.setParameter("categoryId", brandId);
        q.setParameter("gender", gender);
        q.setParameter("status", status);
        return q.getResultList();
    }

    @Override
    public List<Products> findTop20Desc() {
        Query q = em.createQuery("SELECT a FROM Products a ORDER BY a.productId DESC");
        return q.setMaxResults(20).getResultList();
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Customers;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author longv
 */
@Stateless
public class CustomersFacade extends AbstractFacade<Customers> implements CustomersFacadeLocal {

    @PersistenceContext(unitName = "NHLSportPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomersFacade() {
        super(Customers.class);
    }

    @Override
    public boolean checkLogin(String email, String password) {
        Query q = em.createQuery("SELECT c FROM Customers c WHERE c.email = :email AND c.password = :password");
        q.setParameter("email", email);
        q.setParameter("password", password);
        return !q.getResultList().isEmpty();
    }

    @Override
    public String getSalt(String email) {
        Query q = em.createQuery("SELECT c.salt FROM Customers c WHERE c.email = :email");
        q.setParameter("email", email);
        return q.getSingleResult().toString();
    }

    @Override
    public boolean updateAccount(Customers cus) {
        Query q = em.createQuery("UPDATE Customers c SET c.fullName =:name, c.phone =:phone, c.dob =:dob, c.gender=:gender WHERE c.customerId =:id");
        q.setParameter("name", cus.getFullName());
        q.setParameter("phone", cus.getPhone());
        q.setParameter("dob", cus.getDob());
        q.setParameter("gender", cus.getGender());
        q.setParameter("id", cus.getCustomerId());
        return q.executeUpdate() > 0;
    }

    @Override
    public boolean updateAccountWithPassword(Customers cus) {
        Query q = em.createQuery("UPDATE Customers c SET c.fullName =:name, c.email =:email, c.password =:password, c.gender=:gender, c.phone =:phone, c.dob =:dob, c.salt=:salt WHERE c.customerId =:id");
        q.setParameter("name", cus.getFullName());
        q.setParameter("phone", cus.getPhone());
        q.setParameter("dob", cus.getDob());
        q.setParameter("gender", cus.getGender());
        q.setParameter("email", cus.getEmail());
        q.setParameter("password", cus.getPassword());
        q.setParameter("salt", cus.getSalt());
        q.setParameter("id", cus.getCustomerId());
        return q.executeUpdate() > 0;
    }

    @Override
    public Customers find(String email) {
        Query q = em.createQuery("SELECT c FROM Customers c WHERE c.email = :email");
        q.setParameter("email", email);
        return (Customers) q.getSingleResult();
    }

    @Override
    public boolean checkEmailExist(String email) {
        Query q = em.createQuery("SELECT c FROM Customers c WHERE c.email = :email");
        q.setParameter("email", email);
        return !q.getResultList().isEmpty();
    }

    @Override
    public boolean changeForgotPassword(Customers cus) {
        Query q = em.createQuery("UPDATE Customers c SET c.password =:password, c.salt=:salt WHERE c.email =:email");
        q.setParameter("email", cus.getEmail());
        q.setParameter("password", cus.getPassword());
        q.setParameter("salt", cus.getSalt());

        return q.executeUpdate() > 0;
    }

}

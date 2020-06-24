/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.Admins;
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
public class AdminsFacade extends AbstractFacade<Admins> implements AdminsFacadeLocal {
    @PersistenceContext(unitName = "NHLSportPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdminsFacade() {
        super(Admins.class);
    }
    
    @Override
    public boolean checkLogin(String email, String password) {
        Query q = em.createQuery("SELECT c FROM Admins c WHERE c.email = :email AND c.password = :password");
        q.setParameter("email", email);
        q.setParameter("password", password);
        return !q.getResultList().isEmpty();
    }
    
    @Override
    public String getSalt(String email) {
        Query q = em.createQuery("SELECT a.salt FROM Admins a WHERE a.email = :email");
        q.setParameter("email", email);
        return q.getSingleResult().toString();
    }
    
        

    
    @Override
    public Admins find(String email){
        Query q = em.createQuery("SELECT c FROM Admins c WHERE c.email = :email");
        q.setParameter("email", email);
        return (Admins)q.getSingleResult();
    }


    @Override
    public boolean updateAccount(Admins admin) {
        Query q = em.createQuery("UPDATE Admins c SET c.email =:email, c.fullName =:fullname, c.dob =:dob, c.gender=:gender, c.address =:address, c.phone =:phone WHERE c.id =:id");
        q.setParameter("id", admin.getId());
        q.setParameter("email", admin.getEmail());
        q.setParameter("fullname", admin.getFullName());
        q.setParameter("dob", admin.getDob());
        q.setParameter("gender", admin.getGender());
        q.setParameter("address", admin.getAddress());
        q.setParameter("phone", admin.getPhone());

       
        return q.executeUpdate() > 0;
    }
    
    @Override
    public boolean updatePassword(Admins admin) {
        Query q = em.createQuery("UPDATE Admins c SET c.email =:email, c.password =:password, c.salt =:salt WHERE c.id =:id");
        q.setParameter("id", admin.getId());
        q.setParameter("email", admin.getEmail());
        q.setParameter("password", admin.getPassword());
        q.setParameter("salt", admin.getSalt());

       
        return q.executeUpdate() > 0;
    }
    
    @Override
    public boolean checkEmailExist(String email) {
        Query q = em.createQuery("SELECT c FROM Admins c WHERE c.email = :email");
        q.setParameter("email", email);
        return !q.getResultList().isEmpty();
    }
    
}

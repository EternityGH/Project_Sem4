/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.Contacts;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Tran Thien
 */
@Stateless
public class ContactsFacade extends AbstractFacade<Contacts> implements ContactsFacadeLocal {
    @PersistenceContext(unitName = "NHLSportPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContactsFacade() {
        super(Contacts.class);
    }
    
    @Override
    public boolean update(Contacts contact) {
        Query q = em.createQuery("UPDATE Contacts c SET c.reply =:reply WHERE c.id =:id");
        q.setParameter("reply", contact.getReply());
        q.setParameter("id", contact.getId());
        return q.executeUpdate() > 0;
    }
    
    @Override
    public List<Contacts> findByCusId(Object cusId) {
        Query q = em.createQuery("SELECT a FROM Contacts a WHERE a.customerId = :cusId");
        q.setParameter("cusId", cusId);

        return q.getResultList();
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.Vouchers;
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
public class VouchersFacade extends AbstractFacade<Vouchers> implements VouchersFacadeLocal {
    @PersistenceContext(unitName = "NHLSportPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VouchersFacade() {
        super(Vouchers.class);
    }
    
    @Override
    public boolean checkCode(String code) {
        Query q = em.createQuery("SELECT v FROM Vouchers v WHERE v.code=:code");
        q.setParameter("code", code);
        if (q.getResultList().size() > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean checkCodeUpdate(String code, int id) {
        Query q = em.createQuery("SELECT v FROM Vouchers v WHERE v.code=:code AND v.voucherId!=:id");
        q.setParameter("code", code);
        q.setParameter("id", id);
        if (q.getResultList().size() > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Vouchers findByCode(String code) {
        Query q = em.createQuery("SELECT v FROM Vouchers v WHERE v.code=:code");
        q.setParameter("code", code);
        List<Vouchers> list = q.getResultList();
        if (list == null || list.isEmpty()) {
            return null;
        } else {
            Vouchers vou = list.get(0);
            return vou;
        }
    }

    @Override
    public boolean checkCodeAndStatus(String code) {
        Query q = em.createQuery("SELECT v FROM Vouchers v WHERE v.code=:code AND v.status = true");
        q.setParameter("code", code);
        if (q.getResultList().size() > 0) {
            return true;
        } else {
            return false;
        }
    }
    @Override
    public List<Vouchers> findByDateReport(String from, String to) {
        Query q = em.createQuery("SELECT v FROM Vouchers v WHERE v.expirationDate BETWEEN :from AND :to");
        q.setParameter("from", from);
        q.setParameter("to", to);
        return q.getResultList();
    }
}

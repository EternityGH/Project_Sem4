/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Vouchers;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author longv
 */
@Local
public interface VouchersFacadeLocal {

    void create(Vouchers vouchers);

    void edit(Vouchers vouchers);

    void remove(Vouchers vouchers);

    Vouchers find(Object id);

    List<Vouchers> findAll();

    List<Vouchers> findRange(int[] range);

    int count();

    boolean checkCode(String code);

    Vouchers findByCode(String code);

    boolean checkCodeUpdate(String code, int id);

    boolean checkCodeAndStatus(String code);

    public List<Vouchers> findByDateReport(String from, String to);
}

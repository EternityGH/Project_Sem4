/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Admins;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author longv
 */
@Local
public interface AdminsFacadeLocal {

    void create(Admins admins);

    void edit(Admins admins);

    void remove(Admins admins);

    Admins find(Object id);

    List<Admins> findAll();

    List<Admins> findTop20Desc();

    List<Admins> findRange(int[] range);

    int count();

    boolean checkLogin(String email, String password);

    boolean checkEmailExist(String email);

    boolean updateAccount(Admins admin);

    boolean updatePassword(Admins admin);

    String getSalt(String email);

    Admins find(String email);
}

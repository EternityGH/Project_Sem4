/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import entity.Customers;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author longv
 */
@Local
public interface CustomersFacadeLocal {

    void create(Customers customers);

    void edit(Customers customers);

    void remove(Customers customers);

    Customers find(Object id);

    List<Customers> findAll();

    List<Customers> findRange(int[] range);

    int count();
    
    boolean checkLogin(String email, String password);
    
    String getSalt(String email);
    
    boolean updateAccount(Customers cus);
    
    boolean updateAccountWithPassword(Customers cus);
    
    Customers find(String email);
    
    boolean checkEmailExist(String email);
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package helper;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author jiawei
 */
public class Validation {
    
    public Validation() {
    }
    
    public boolean validEmail(String email){
        String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
        
        Pattern pattern = Pattern.compile(regex);
        
        Matcher matcher = pattern.matcher(email);
        
        return matcher.matches();
    } 
    
     public boolean validPhone(String phone){
        String regex = "^[0-9]{10}$|^[0-9]{11}$";
        
        Pattern pattern = Pattern.compile(regex);
        
        Matcher matcher = pattern.matcher(phone);
        
        return matcher.matches();
    } 
    
    public boolean customeEmpty(String str){
        return str.trim().isEmpty();
    }
}

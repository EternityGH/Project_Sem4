package entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-24T11:28:34")
@StaticMetamodel(Admins.class)
public class Admins_ { 

    public static volatile SingularAttribute<Admins, String> code;
    public static volatile SingularAttribute<Admins, Integer> role;
    public static volatile SingularAttribute<Admins, String> salt;
    public static volatile SingularAttribute<Admins, String> address;
    public static volatile SingularAttribute<Admins, Boolean> gender;
    public static volatile SingularAttribute<Admins, String> fullName;
    public static volatile SingularAttribute<Admins, String> avatar;
    public static volatile SingularAttribute<Admins, Date> createAt;
    public static volatile SingularAttribute<Admins, String> password;
    public static volatile SingularAttribute<Admins, String> phone;
    public static volatile SingularAttribute<Admins, Date> dob;
    public static volatile SingularAttribute<Admins, Integer> id;
    public static volatile SingularAttribute<Admins, String> email;
    public static volatile SingularAttribute<Admins, Boolean> status;

}
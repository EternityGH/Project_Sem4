package entity;

import entity.Customers;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-24T11:28:34")
@StaticMetamodel(Contacts.class)
public class Contacts_ { 

    public static volatile SingularAttribute<Contacts, Customers> customerId;
    public static volatile SingularAttribute<Contacts, String> name;
    public static volatile SingularAttribute<Contacts, String> description;
    public static volatile SingularAttribute<Contacts, Integer> id;
    public static volatile SingularAttribute<Contacts, String> reply;
    public static volatile SingularAttribute<Contacts, Date> createAt;
    public static volatile SingularAttribute<Contacts, String> email;

}
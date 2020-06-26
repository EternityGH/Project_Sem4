package entity;

import entity.Contacts;
import entity.Orders;
import entity.Wishlist;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-26T11:45:36")
@StaticMetamodel(Customers.class)
public class Customers_ { 

    public static volatile SingularAttribute<Customers, String> salt;
    public static volatile SingularAttribute<Customers, Boolean> gender;
    public static volatile CollectionAttribute<Customers, Wishlist> wishlistCollection;
    public static volatile SingularAttribute<Customers, String> fullName;
    public static volatile CollectionAttribute<Customers, Orders> ordersCollection;
    public static volatile SingularAttribute<Customers, Date> createdAt;
    public static volatile SingularAttribute<Customers, String> password;
    public static volatile CollectionAttribute<Customers, Contacts> contactsCollection;
    public static volatile SingularAttribute<Customers, String> phone;
    public static volatile SingularAttribute<Customers, Date> dob;
    public static volatile SingularAttribute<Customers, Integer> customerId;
    public static volatile SingularAttribute<Customers, String> email;
    public static volatile SingularAttribute<Customers, Boolean> status;

}
package entity;

import entity.Customers;
import entity.Products;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-24T11:28:34")
@StaticMetamodel(Feedbacks.class)
public class Feedbacks_ { 

    public static volatile SingularAttribute<Feedbacks, String> cusEmail;
    public static volatile SingularAttribute<Feedbacks, Products> productId;
    public static volatile SingularAttribute<Feedbacks, String> cusName;
    public static volatile SingularAttribute<Feedbacks, String> review;
    public static volatile SingularAttribute<Feedbacks, Integer> rating;
    public static volatile SingularAttribute<Feedbacks, Customers> customerId;
    public static volatile SingularAttribute<Feedbacks, Integer> id;
    public static volatile SingularAttribute<Feedbacks, String> title;
    public static volatile SingularAttribute<Feedbacks, Date> createAt;

}
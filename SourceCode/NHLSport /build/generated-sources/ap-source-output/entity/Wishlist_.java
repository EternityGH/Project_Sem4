package entity;

import entity.Customers;
import entity.Products;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-26T11:45:36")
@StaticMetamodel(Wishlist.class)
public class Wishlist_ { 

    public static volatile SingularAttribute<Wishlist, Products> productID;
    public static volatile SingularAttribute<Wishlist, Customers> cusID;
    public static volatile SingularAttribute<Wishlist, Integer> wishlistID;

}
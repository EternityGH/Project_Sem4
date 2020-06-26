package entity;

import entity.Brands;
import entity.Categories;
import entity.OrdersDetail;
import entity.Storages;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-26T11:45:36")
@StaticMetamodel(Products.class)
public class Products_ { 

    public static volatile SingularAttribute<Products, Storages> storages;
    public static volatile SingularAttribute<Products, Integer> productId;
    public static volatile SingularAttribute<Products, Integer> gender;
    public static volatile SingularAttribute<Products, Float> price;
    public static volatile CollectionAttribute<Products, OrdersDetail> ordersDetailCollection;
    public static volatile SingularAttribute<Products, String> imageUrl;
    public static volatile SingularAttribute<Products, Brands> brandId;
    public static volatile SingularAttribute<Products, String> description;
    public static volatile SingularAttribute<Products, String> productName;
    public static volatile SingularAttribute<Products, Categories> categoryId;
    public static volatile SingularAttribute<Products, Boolean> status;

}
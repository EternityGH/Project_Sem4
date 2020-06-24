package entity;

import entity.Orders;
import entity.Products;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-24T11:28:34")
@StaticMetamodel(OrdersDetail.class)
public class OrdersDetail_ { 

    public static volatile SingularAttribute<OrdersDetail, Integer> quantity;
    public static volatile SingularAttribute<OrdersDetail, Products> productId;
    public static volatile SingularAttribute<OrdersDetail, Orders> orderId;
    public static volatile SingularAttribute<OrdersDetail, Integer> id;

}
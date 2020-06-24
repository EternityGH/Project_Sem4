package entity;

import entity.Customers;
import entity.OrdersDetail;
import entity.Vouchers;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-24T11:28:34")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, String> note;
    public static volatile SingularAttribute<Orders, Float> total;
    public static volatile SingularAttribute<Orders, String> address;
    public static volatile SingularAttribute<Orders, Integer> orderId;
    public static volatile SingularAttribute<Orders, String> cusName;
    public static volatile SingularAttribute<Orders, Vouchers> voucherId;
    public static volatile CollectionAttribute<Orders, OrdersDetail> ordersDetailCollection;
    public static volatile SingularAttribute<Orders, Customers> customerId;
    public static volatile SingularAttribute<Orders, String> paymentMethod;
    public static volatile SingularAttribute<Orders, String> cusPhone;
    public static volatile SingularAttribute<Orders, Date> createAt;
    public static volatile SingularAttribute<Orders, String> status;

}
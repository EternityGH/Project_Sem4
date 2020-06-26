package entity;

import entity.Orders;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-26T11:45:36")
@StaticMetamodel(Vouchers.class)
public class Vouchers_ { 

    public static volatile SingularAttribute<Vouchers, String> code;
    public static volatile SingularAttribute<Vouchers, Integer> voucherId;
    public static volatile SingularAttribute<Vouchers, Integer> discount;
    public static volatile CollectionAttribute<Vouchers, Orders> ordersCollection;
    public static volatile SingularAttribute<Vouchers, Date> createAt;
    public static volatile SingularAttribute<Vouchers, Date> expirationDate;
    public static volatile SingularAttribute<Vouchers, Boolean> status;

}
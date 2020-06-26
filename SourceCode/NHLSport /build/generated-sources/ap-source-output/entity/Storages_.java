package entity;

import entity.Products;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-26T11:45:36")
@StaticMetamodel(Storages.class)
public class Storages_ { 

    public static volatile SingularAttribute<Storages, Integer> quantity;
    public static volatile SingularAttribute<Storages, Products> productId;
    public static volatile SingularAttribute<Storages, Integer> storageId;

}
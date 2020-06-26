package entity;

import entity.Products;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2020-06-26T11:45:36")
@StaticMetamodel(Brands.class)
public class Brands_ { 

    public static volatile CollectionAttribute<Brands, Products> productsCollection;
    public static volatile SingularAttribute<Brands, Integer> brandId;
    public static volatile SingularAttribute<Brands, String> name;
    public static volatile SingularAttribute<Brands, Boolean> status;

}
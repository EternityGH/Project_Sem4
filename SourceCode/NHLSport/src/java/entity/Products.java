/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author longv
 */
@Entity
@Table(name = "Products", catalog = "ThunderShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Products.findAll", query = "SELECT p FROM Products p"),
    @NamedQuery(name = "Products.findByProductId", query = "SELECT p FROM Products p WHERE p.productId = :productId"),
    @NamedQuery(name = "Products.findByProductName", query = "SELECT p FROM Products p WHERE p.productName = :productName"),
    @NamedQuery(name = "Products.findByDescription", query = "SELECT p FROM Products p WHERE p.description = :description"),
    @NamedQuery(name = "Products.findByImageUrl", query = "SELECT p FROM Products p WHERE p.imageUrl = :imageUrl"),
    @NamedQuery(name = "Products.findByGender", query = "SELECT p FROM Products p WHERE p.gender = :gender"),
    @NamedQuery(name = "Products.findByPrice", query = "SELECT p FROM Products p WHERE p.price = :price"),
    @NamedQuery(name = "Products.findByStatus", query = "SELECT p FROM Products p WHERE p.status = :status")})
public class Products implements Serializable {

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Price", precision = 53)
    private float price;
    @OneToOne(mappedBy = "productId")
    private Storages storages;
    @OneToMany(mappedBy = "productId")
    private Collection<OrdersDetail> ordersDetailCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductId", nullable = false)
    private Integer productId;
    @Size(max = 2147483647)
    @Column(name = "ProductName", length = 2147483647)
    private String productName;
    @Size(max = 2147483647)
    @Column(name = "Description", length = 2147483647)
    private String description;
    @Size(max = 2147483647)
    @Column(name = "ImageUrl", length = 2147483647)
    private String imageUrl;
    @Column(name = "Gender")
    private Integer gender;
    @Column(name = "Status")
    private Boolean status;

    @JoinColumn(name = "BrandId", referencedColumnName = "BrandId")
    @ManyToOne
    private Brands brandId;
    @JoinColumn(name = "CategoryId", referencedColumnName = "CategoryId")
    @ManyToOne
    private Categories categoryId;

    public Products() {
    }

    public Products(String productName, String description, String imageUrl, Integer gender, Float price, Boolean status, Brands brandId, Categories categoryId) {
        this.productName = productName;
        this.description = description;
        this.imageUrl = imageUrl;
        this.gender = gender;
        this.price = price;
        this.status = status;
        this.brandId = brandId;
        this.categoryId = categoryId;
    }

    public Products(Integer productId, Boolean status) {
        this.productId = productId;
        this.status = status;
    }

    public Products(Integer productId) {
        this.productId = productId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Brands getBrandId() {
        return brandId;
    }

    public void setBrandId(Brands brandId) {
        this.brandId = brandId;
    }

    public Categories getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Categories categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Products[ productId=" + productId + " ]";
    }

    @XmlTransient
    public Collection<OrdersDetail> getOrdersDetailCollection() {
        return ordersDetailCollection;
    }

    public void setOrdersDetailCollection(Collection<OrdersDetail> ordersDetailCollection) {
        this.ordersDetailCollection = ordersDetailCollection;
    }

    

    public Storages getStorages() {
        return storages;
    }

    public void setStorages(Storages storages) {
        this.storages = storages;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

}

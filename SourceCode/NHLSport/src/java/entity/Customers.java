/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author longv
 */
@Entity
@Table(name = "Customers", catalog = "ThunderShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customers.findAll", query = "SELECT c FROM Customers c"),
    @NamedQuery(name = "Customers.findByCustomerId", query = "SELECT c FROM Customers c WHERE c.customerId = :customerId"),
    @NamedQuery(name = "Customers.findByFullName", query = "SELECT c FROM Customers c WHERE c.fullName = :fullName"),
    @NamedQuery(name = "Customers.findByEmail", query = "SELECT c FROM Customers c WHERE c.email = :email"),
    @NamedQuery(name = "Customers.findByPassword", query = "SELECT c FROM Customers c WHERE c.password = :password"),
    @NamedQuery(name = "Customers.findByGender", query = "SELECT c FROM Customers c WHERE c.gender = :gender"),
    @NamedQuery(name = "Customers.findByPhone", query = "SELECT c FROM Customers c WHERE c.phone = :phone"),
    @NamedQuery(name = "Customers.findByDob", query = "SELECT c FROM Customers c WHERE c.dob = :dob"),
    @NamedQuery(name = "Customers.findBySalt", query = "SELECT c FROM Customers c WHERE c.salt = :salt"),
    @NamedQuery(name = "Customers.findByStatus", query = "SELECT c FROM Customers c WHERE c.status = :status"),
    @NamedQuery(name = "Customers.findByCreatedAt", query = "SELECT c FROM Customers c WHERE c.createdAt = :createdAt")})
public class Customers implements Serializable {
    @OneToMany(mappedBy = "cusID")
    private Collection<Wishlist> wishlistCollection;
    @OneToMany(mappedBy = "customerId")
    private Collection<Contacts> contactsCollection;
    @OneToMany(mappedBy = "customerId")
    private Collection<Orders> ordersCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CustomerId", nullable = false)
    private Integer customerId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "FullName", nullable = false, length = 255)
    private String fullName;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "Email", nullable = false, length = 255)
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "Password", nullable = false, length = 50)
    private String password;
    @Column(name = "Gender")
    private Boolean gender;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 50)
    @Column(name = "Phone", length = 50)
    private String phone;
    @Column(name = "Dob")
    @Temporal(TemporalType.DATE)
    private Date dob;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "Salt", nullable = false, length = 50)
    private String salt;
    @Column(name = "Status")
    private Boolean status;
    @Column(name = "CreatedAt")
    @Temporal(TemporalType.DATE)
    private Date createdAt;

    public Customers() {
    }

    public Customers(Integer customerId) {
        this.customerId = customerId;
    }

    public Customers(Integer customerId, String fullName, String email, String password, String salt) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.salt = salt;
    }
    
    public Customers(String fullName, String email, String password, String salt, Boolean status, Date createdAt) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.salt = salt;
        this.status = status;
        this.createdAt = createdAt;
    }



    public Customers(Integer customerId, String fullName, String email, String password, Boolean gender, String phone, Date dob, String salt) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.phone = phone;
        this.dob = dob;
        this.salt = salt;
    }
    
    
    public Customers(Integer customerId, String fullName, Boolean gender, String phone, Date dob) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.gender = gender;
        this.phone = phone;
        this.dob = dob;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (customerId != null ? customerId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customers)) {
            return false;
        }
        Customers other = (Customers) object;
        if ((this.customerId == null && other.customerId != null) || (this.customerId != null && !this.customerId.equals(other.customerId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Customers[ customerId=" + customerId + " ]";
    }

    @XmlTransient
    public Collection<Orders> getOrdersCollection() {
        return ordersCollection;
    }

    public void setOrdersCollection(Collection<Orders> ordersCollection) {
        this.ordersCollection = ordersCollection;
    }

    @XmlTransient
    public Collection<Contacts> getContactsCollection() {
        return contactsCollection;
    }

    public void setContactsCollection(Collection<Contacts> contactsCollection) {
        this.contactsCollection = contactsCollection;
    }

    @XmlTransient
    public Collection<Wishlist> getWishlistCollection() {
        return wishlistCollection;
    }

    public void setWishlistCollection(Collection<Wishlist> wishlistCollection) {
        this.wishlistCollection = wishlistCollection;
    }

    
    
}

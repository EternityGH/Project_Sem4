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
@Table(name = "Vouchers", catalog = "ThunderShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Vouchers.findAll", query = "SELECT v FROM Vouchers v"),
    @NamedQuery(name = "Vouchers.findByVoucherId", query = "SELECT v FROM Vouchers v WHERE v.voucherId = :voucherId"),
    @NamedQuery(name = "Vouchers.findByCode", query = "SELECT v FROM Vouchers v WHERE v.code = :code"),
    @NamedQuery(name = "Vouchers.findByDiscount", query = "SELECT v FROM Vouchers v WHERE v.discount = :discount"),
    @NamedQuery(name = "Vouchers.findByCreateAt", query = "SELECT v FROM Vouchers v WHERE v.createAt = :createAt"),
    @NamedQuery(name = "Vouchers.findByExpirationDate", query = "SELECT v FROM Vouchers v WHERE v.expirationDate = :expirationDate"),
    @NamedQuery(name = "Vouchers.findByStatus", query = "SELECT v FROM Vouchers v WHERE v.status = :status")})
public class Vouchers implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "VoucherId", nullable = false)
    private Integer voucherId;
    @Size(max = 2147483647)
    @Column(name = "Code", length = 2147483647)
    private String code;
    @Column(name = "Discount")
    private Integer discount;
    @Column(name = "CreateAt")
    @Temporal(TemporalType.DATE)
    private Date createAt;
    @Column(name = "ExpirationDate")
    @Temporal(TemporalType.DATE)
    private Date expirationDate;
    @Column(name = "Status")
    private Boolean status;
    @OneToMany(mappedBy = "voucherId")
    private Collection<Orders> ordersCollection;

    public Vouchers() {
    }

    public Vouchers(String code, Integer discount, Date createAt, Date expirationDate, Boolean status) {
        this.code = code;
        this.discount = discount;
        this.createAt = createAt;
        this.expirationDate = expirationDate;
        this.status = status;
    }
    
    
    
    public Vouchers(Integer voucherId) {
        this.voucherId = voucherId;
    }

    public Integer getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(Integer voucherId) {
        this.voucherId = voucherId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<Orders> getOrdersCollection() {
        return ordersCollection;
    }

    public void setOrdersCollection(Collection<Orders> ordersCollection) {
        this.ordersCollection = ordersCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (voucherId != null ? voucherId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Vouchers)) {
            return false;
        }
        Vouchers other = (Vouchers) object;
        if ((this.voucherId == null && other.voucherId != null) || (this.voucherId != null && !this.voucherId.equals(other.voucherId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Vouchers[ voucherId=" + voucherId + " ]";
    }
    
}

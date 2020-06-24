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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "Orders", catalog = "ThunderShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByOrderId", query = "SELECT o FROM Orders o WHERE o.orderId = :orderId"),
    @NamedQuery(name = "Orders.findByCusName", query = "SELECT o FROM Orders o WHERE o.cusName = :cusName"),
    @NamedQuery(name = "Orders.findByCusPhone", query = "SELECT o FROM Orders o WHERE o.cusPhone = :cusPhone"),
    @NamedQuery(name = "Orders.findByAddress", query = "SELECT o FROM Orders o WHERE o.address = :address"),
    @NamedQuery(name = "Orders.findByNote", query = "SELECT o FROM Orders o WHERE o.note = :note"),
    @NamedQuery(name = "Orders.findByCreateAt", query = "SELECT o FROM Orders o WHERE o.createAt = :createAt"),
    @NamedQuery(name = "Orders.findByPaymentMethod", query = "SELECT o FROM Orders o WHERE o.paymentMethod = :paymentMethod"),
    @NamedQuery(name = "Orders.findByStatus", query = "SELECT o FROM Orders o WHERE o.status = :status"),
    @NamedQuery(name = "Orders.findByTotal", query = "SELECT o FROM Orders o WHERE o.total = :total")})
public class Orders implements Serializable {
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Total", precision = 53)
    private Float total;
    @JoinColumn(name = "VoucherId", referencedColumnName = "VoucherId")
    @ManyToOne
    private Vouchers voucherId;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "OrderId", nullable = false)
    private Integer orderId;
    @Size(max = 2147483647)
    @Column(name = "CusName", length = 2147483647)
    private String cusName;
    @Size(max = 50)
    @Column(name = "CusPhone", length = 50)
    private String cusPhone;
    @Size(max = 2147483647)
    @Column(name = "Address", length = 2147483647)
    private String address;
    @Size(max = 2147483647)
    @Column(name = "Note", length = 2147483647)
    private String note;
    @Column(name = "CreateAt")
    @Temporal(TemporalType.DATE)
    private Date createAt;
    @Size(max = 255)
    @Column(name = "PaymentMethod", length = 255)
    private String paymentMethod;
    @Size(max = 2147483647)
    @Column(name = "Status", length = 2147483647)
    private String status;
    @JoinColumn(name = "CustomerId", referencedColumnName = "CustomerId")
    @ManyToOne
    private Customers customerId;
    @OneToMany(mappedBy = "orderId")
    private Collection<OrdersDetail> ordersDetailCollection;

    public Orders() {
    }

    public Orders(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Customers getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customers customerId) {
        this.customerId = customerId;
    }

    @XmlTransient
    public Collection<OrdersDetail> getOrdersDetailCollection() {
        return ordersDetailCollection;
    }

    public void setOrdersDetailCollection(Collection<OrdersDetail> ordersDetailCollection) {
        this.ordersDetailCollection = ordersDetailCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderId != null ? orderId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderId == null && other.orderId != null) || (this.orderId != null && !this.orderId.equals(other.orderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Orders[ orderId=" + orderId + " ]";
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public Vouchers getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(Vouchers voucherId) {
        this.voucherId = voucherId;
    }
    
}

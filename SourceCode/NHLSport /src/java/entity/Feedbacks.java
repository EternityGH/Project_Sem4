/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author longv
 */
@Entity
@Table(name = "Feedbacks", catalog = "ThunderShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Feedbacks.findAll", query = "SELECT f FROM Feedbacks f"),
    @NamedQuery(name = "Feedbacks.findById", query = "SELECT f FROM Feedbacks f WHERE f.id = :id"),
    @NamedQuery(name = "Feedbacks.findByCusName", query = "SELECT f FROM Feedbacks f WHERE f.cusName = :cusName"),
    @NamedQuery(name = "Feedbacks.findByCusEmail", query = "SELECT f FROM Feedbacks f WHERE f.cusEmail = :cusEmail"),
    @NamedQuery(name = "Feedbacks.findByRating", query = "SELECT f FROM Feedbacks f WHERE f.rating = :rating"),
    @NamedQuery(name = "Feedbacks.findByTitle", query = "SELECT f FROM Feedbacks f WHERE f.title = :title"),
    @NamedQuery(name = "Feedbacks.findByReview", query = "SELECT f FROM Feedbacks f WHERE f.review = :review"),
    @NamedQuery(name = "Feedbacks.findByCreateAt", query = "SELECT f FROM Feedbacks f WHERE f.createAt = :createAt")})
public class Feedbacks implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id", nullable = false)
    private Integer id;
    @Size(max = 2147483647)
    @Column(name = "cusName", length = 2147483647)
    private String cusName;
    @Size(max = 2147483647)
    @Column(name = "cusEmail", length = 2147483647)
    private String cusEmail;
    @Column(name = "rating")
    private Integer rating;
    @Size(max = 2147483647)
    @Column(name = "title", length = 2147483647)
    private String title;
    @Size(max = 2147483647)
    @Column(name = "review", length = 2147483647)
    private String review;
    @Column(name = "createAt")
    @Temporal(TemporalType.DATE)
    private Date createAt;
    @JoinColumn(name = "customerId", referencedColumnName = "CustomerId")
    @ManyToOne
    private Customers customerId;
    @JoinColumn(name = "productId", referencedColumnName = "ProductId")
    @ManyToOne
    private Products productId;

    public Feedbacks() {
    }

    public Feedbacks(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCusEmail() {
        return cusEmail;
    }

    public void setCusEmail(String cusEmail) {
        this.cusEmail = cusEmail;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Customers getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customers customerId) {
        this.customerId = customerId;
    }

    public Products getProductId() {
        return productId;
    }

    public void setProductId(Products productId) {
        this.productId = productId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Feedbacks)) {
            return false;
        }
        Feedbacks other = (Feedbacks) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Feedbacks[ id=" + id + " ]";
    }
    
}

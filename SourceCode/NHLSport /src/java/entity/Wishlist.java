/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import java.io.Serializable;
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
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Lark
 */
@Entity
@Table(name = "Wishlist", catalog = "ThunderShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Wishlist.findAll", query = "SELECT w FROM Wishlist w"),
    @NamedQuery(name = "Wishlist.findByWishlistID", query = "SELECT w FROM Wishlist w WHERE w.wishlistID = :wishlistID")})
public class Wishlist implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "WishlistID", nullable = false)
    private Integer wishlistID;
    @JoinColumn(name = "CusID", referencedColumnName = "CustomerId")
    @ManyToOne
    private Customers cusID;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductId")
    @ManyToOne
    private Products productID;

    public Wishlist() {
    }

    public Wishlist(Integer wishlistID) {
        this.wishlistID = wishlistID;
    }

    public Integer getWishlistID() {
        return wishlistID;
    }

    public void setWishlistID(Integer wishlistID) {
        this.wishlistID = wishlistID;
    }

    public Customers getCusID() {
        return cusID;
    }

    public void setCusID(Customers cusID) {
        this.cusID = cusID;
    }

    public Products getProductID() {
        return productID;
    }

    public void setProductID(Products productID) {
        this.productID = productID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (wishlistID != null ? wishlistID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Wishlist)) {
            return false;
        }
        Wishlist other = (Wishlist) object;
        if ((this.wishlistID == null && other.wishlistID != null) || (this.wishlistID != null && !this.wishlistID.equals(other.wishlistID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Wishlist[ wishlistID=" + wishlistID + " ]";
    }
    
}

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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Lark
 */
@Entity
@Table(name = "Storages", catalog = "ThunderShop", schema = "dbo", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"ProductId"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Storages.findAll", query = "SELECT s FROM Storages s"),
    @NamedQuery(name = "Storages.findByStorageId", query = "SELECT s FROM Storages s WHERE s.storageId = :storageId"),
    @NamedQuery(name = "Storages.findByQuantity", query = "SELECT s FROM Storages s WHERE s.quantity = :quantity")})
public class Storages implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "StorageId", nullable = false)
    private Integer storageId;
    @Column(name = "Quantity")
    private Integer quantity;
    @JoinColumn(name = "ProductId", referencedColumnName = "ProductId")
    @OneToOne
    private Products productId;

    public Storages() {
    }

    public Storages(Integer storageId) {
        this.storageId = storageId;
    }

    public Integer getStorageId() {
        return storageId;
    }

    public void setStorageId(Integer storageId) {
        this.storageId = storageId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
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
        hash += (storageId != null ? storageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Storages)) {
            return false;
        }
        Storages other = (Storages) object;
        if ((this.storageId == null && other.storageId != null) || (this.storageId != null && !this.storageId.equals(other.storageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Storages[ storageId=" + storageId + " ]";
    }
    
}

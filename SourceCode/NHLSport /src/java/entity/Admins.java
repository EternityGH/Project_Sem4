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
@Table(name = "Admins", catalog = "ThunderShop", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Admins.findAll", query = "SELECT a FROM Admins a"),
    @NamedQuery(name = "Admins.findById", query = "SELECT a FROM Admins a WHERE a.id = :id"),
    @NamedQuery(name = "Admins.findByEmail", query = "SELECT a FROM Admins a WHERE a.email = :email"),
    @NamedQuery(name = "Admins.findByFullName", query = "SELECT a FROM Admins a WHERE a.fullName = :fullName"),
    @NamedQuery(name = "Admins.findByPassword", query = "SELECT a FROM Admins a WHERE a.password = :password"),
    @NamedQuery(name = "Admins.findByRole", query = "SELECT a FROM Admins a WHERE a.role = :role"),
    @NamedQuery(name = "Admins.findByAvatar", query = "SELECT a FROM Admins a WHERE a.avatar = :avatar"),
    @NamedQuery(name = "Admins.findBySalt", query = "SELECT a FROM Admins a WHERE a.salt = :salt"),
    @NamedQuery(name = "Admins.findByStatus", query = "SELECT a FROM Admins a WHERE a.status = :status"),
    @NamedQuery(name = "Admins.findByDob", query = "SELECT a FROM Admins a WHERE a.dob = :dob"),
    @NamedQuery(name = "Admins.findByGender", query = "SELECT a FROM Admins a WHERE a.gender = :gender"),
    @NamedQuery(name = "Admins.findByAddress", query = "SELECT a FROM Admins a WHERE a.address = :address"),
    @NamedQuery(name = "Admins.findByPhone", query = "SELECT a FROM Admins a WHERE a.phone = :phone"),
    @NamedQuery(name = "Admins.findByCreateAt", query = "SELECT a FROM Admins a WHERE a.createAt = :createAt")})
public class Admins implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id", nullable = false)
    private Integer id;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 50)
    @Column(name = "Code", length = 50)
    private String code;
    @Size(max = 255)
    @Column(name = "Email", length = 255)
    private String email;
    @Size(max = 255)
    @Column(name = "FullName", length = 255)
    private String fullName;
    @Size(max = 50)
    @Column(name = "Password", length = 50)
    private String password;
    @Column(name = "Role")
    private Integer role;
    @Size(max = 255)
    @Column(name = "Avatar", length = 255)
    private String avatar;
    @Size(max = 50)
    @Column(name = "Salt", length = 50)
    private String salt;
    @Column(name = "Status")
    private Boolean status;
    @Column(name = "Dob")
    @Temporal(TemporalType.DATE)
    private Date dob;
    @Column(name = "Gender")
    private Boolean gender;
    @Size(max = 2147483647)
    @Column(name = "Address", length = 2147483647)
    private String address;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 50)
    @Column(name = "Phone", length = 50)
    private String phone;

    @Column(name = "CreateAt")
    @Temporal(TemporalType.DATE)
    private Date createAt;

    public Admins() {
    }

    public Admins(String email, String fullName, String password, String salt, Boolean status, Date createAt) {
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.salt = salt;
        this.status = status;
        this.createAt = createAt;
    }

    public Admins(Integer id, String email, String fullName, Date dob, Boolean gender, String address, String phone) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.phone = phone;
    }

    public Admins(Integer id, String email, String password, String salt) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.salt = salt;
    }

    public Admins(String code, String email, String fullName, String password, String salt, Boolean status, Date createAt) {
        this.code = code;
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.salt = salt;
        this.status = status;
        this.createAt = createAt;
    }

    
    public Admins(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
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
        if (!(object instanceof Admins)) {
            return false;
        }
        Admins other = (Admins) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Admins[ id=" + id + " ]";
    }

}

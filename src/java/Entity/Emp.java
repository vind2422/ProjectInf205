/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author np
 */
@Entity
@Table(name = "Emps")
public class Emp {

    @Id @GeneratedValue
    private int id;
    @NotBlank(message = "Please enter name!")
    private String name;
    private Boolean gender;
    @NotNull(message = "Please choose birthday!")
    @Past(message = "Please choose birthday in the past")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    private String photo;
    private String email;
    @NotBlank(message = "Please enter phone!")
    @Length(min = 9, max = 11)
    @Pattern(regexp = "[0-9]{9,11}")
    private String phone;
    @NotNull(message = "Please enter salary!")
    private Double salary;
    private String notes;
    
    @OneToMany(mappedBy = "emp",fetch = FetchType.EAGER)
    private Collection<Record> records;
    
    @ManyToOne
    @JoinColumn(name = "departId")
    private Depart depart;

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Collection<Record> getRecords() {
        return records;
    }

    public void setRecords(Collection<Record> records) {
        this.records = records;
    }

    public Depart getDepart() {
        return depart;
    }

    public void setDepart(Depart depart) {
        this.depart = depart;
    }
    
    

}

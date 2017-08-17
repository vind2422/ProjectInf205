/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;

/**
 *
 * @author np
 */
@Entity
@Table(name="Departs")
public class Depart {
    @Id 
    private Integer id;
    @NotBlank(message = "Please enter name!")
    private String name;
    
    @OneToMany(mappedBy = "depart",fetch = FetchType.EAGER)
    private Collection<Emp> emp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Collection<Emp> getEmp() {
        return emp;
    }

    public void setEmp(Collection<Emp> emp) {
        this.emp = emp;
    }
    
    
}

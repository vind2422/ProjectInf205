/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Depart;
import Entity.Emp;
import Entity.Record;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author np
 */
@Transactional
@Controller
@RequestMapping("/Department")
public class DepartmentController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("dataDepart")
    public String index(ModelMap model) {
        model.addAttribute("depart", new Depart());
        model.addAttribute("listDepart", getDeparts());
        return "Department/dataDepart";
    }

    @RequestMapping("edit/{id}")
    public String edit(ModelMap model, @PathVariable("id") Integer id) {
        Session session = factory.getCurrentSession();
        Depart depart = (Depart) session.get(Depart.class, id);
        model.addAttribute("depart", depart);
        model.addAttribute("listDepart", getDeparts());
        return "Department/editDepart";
    }

    @RequestMapping("delete/{id}")
    public String delete(ModelMap model, @PathVariable("id") Integer id) {
        Session session = factory.getCurrentSession();
        Depart depart = (Depart) session.get(Depart.class, id);
        if(depart.getEmp().size() ==0 ){
            session.delete(depart);
        }else{
           model.addAttribute("errors", "Can't delete the department!");
           
        }
        
        model.addAttribute("listDepart", getDeparts());
        return "Department/dataDepart";
    }

    @SuppressWarnings("unchecked")
    public List<Depart> getDeparts() {
        Session session = factory.getCurrentSession();
        String hql = "Select d.id, d.name,(Select count(distinct e.id) From Emp e Where e.depart.id=d.id)"
                + "  From Depart d";
        Query query = session.createQuery(hql);
        List<Depart> list = query.list();
        return list;
    }

    @RequestMapping(params = "btnUpdate")
    public String updateEmp(ModelMap model, @ModelAttribute("depart") Depart depart) {
        Session session = factory.openSession();
        Transaction tran = session.beginTransaction();
        try {
            System.out.println("Ok");
            session.update(depart);
            tran.commit();
            model.addAttribute("message", "Update thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            tran.rollback();
            model.addAttribute("message", "Update thất bại");
        } finally {
            session.close();
        }
        model.addAttribute("listDepart", getDeparts());
        return "Department/dataDepart";
    }

    @RequestMapping(params = "btnInsert1")
    public String insertEmp(ModelMap model, @Validated @ModelAttribute("depart") Depart depart,BindingResult errors) {
        Session session = factory.openSession();
        Transaction tran = session.beginTransaction();
        try {
            if(errors.hasErrors()){
                model.addAttribute("message", "Loix");
                return "Department/newDepart";
            }
            session.save(depart);
            tran.commit();
            model.addAttribute("message", "Update thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            tran.rollback();
            model.addAttribute("message", "Update thất bại");
        } finally {
            session.close();
        }
        model.addAttribute("listEmps", getDeparts());
        return "Department/dataDepart";
    }
    
    @RequestMapping("details/{id}")
    public String detailsDepart(ModelMap model, @PathVariable("id") Integer id){
        Session session = factory.getCurrentSession();
        Depart dep = (Depart) session.get(Depart.class, id);
        List<Emp> list = (List<Emp>) dep.getEmp();
        model.addAttribute("listDep", list);
        return "Department/dataDetailsDepart";
    }
    
    @RequestMapping("report/{id}")
    public String reportEmp(ModelMap model, @PathVariable("id") Integer id){
        Session session = factory.getCurrentSession();
        Emp emp = (Emp) session.get(Emp.class, id);
        List<Record> list = (List<Record>) emp.getRecords();
        model.addAttribute("listEmp", list);
        model.addAttribute("emp", emp);
        return "Department/reportEmp";
    }
    
    @ModelAttribute("emp")
    public List<Emp>getEmps(){
        Session session = factory.getCurrentSession();
        String hql = "FROM Emp";
        Query query = session.createQuery(hql);
        List<Emp> list = query.list();
        return list;
    }

    @RequestMapping("new")
    public String newEmp(@ModelAttribute("depart") Depart depart) {
        return "Department/newDepart";
    }
}

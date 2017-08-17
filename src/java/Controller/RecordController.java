/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Depart;
import Entity.Emp;
import Entity.Record;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author np
 */
@Transactional
@Controller
@RequestMapping("/Record")
public class RecordController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("dataRecord")
    public String showDataEmp(ModelMap model) {
        model.addAttribute("record", new Record());
        model.addAttribute("listRecord", getRecord());
        return "Record/dataRecord";
    }

    @RequestMapping("dataRecordDepart")
    public String showDateDepart(ModelMap model) {
        model.addAttribute("record", new Record());
        model.addAttribute("listRecordDepart", getRecordDepart());
        return "Record/dataRecordDepart";
    }

    @RequestMapping("details/{id}")
    public String detailsRecord(ModelMap model, @PathVariable("id") Integer id) {
        Session session = factory.getCurrentSession();
        Emp emp = (Emp) session.get(Emp.class, id);
        List<Record> list = (List<Record>) emp.getRecords();
        model.addAttribute("listRE", list);
        return "Record/detailsRecord";
    }

    @RequestMapping("detailsDep/{id}")
    public String detailsRecordDep(ModelMap model, @PathVariable("id") Integer id) {
        Session session = factory.getCurrentSession();
        Depart dep = (Depart) session.get(Depart.class, id);
        List<Emp> list = (List<Emp>) dep.getEmp();
//        Emp emp1 = (Emp) session.get(Emp.class, id);
//        Collection<Record> record = emp1.getRecords();
//        model.addAttribute("listEmp", record);
        model.addAttribute("listDep", list);
//        model.addAllAttributes(record);
        
        return "Record/detailsRecordDepart";
    }

    
    @SuppressWarnings("unchecked")
    public List<Record> getRecord() {
        Session session = factory.getCurrentSession();
        String hql = "Select r.emp.id,(Select name FROM Emp WHERE id = r.emp.id),(Select photo FROM Emp WHERE id = r.emp.id),"
                + "SUM(case when r.type=1 then 1 else 0 end),"
                + "SUM(case when r.type=0 then 1 else 0 end)"
                + "FROM Record r "
                + "GROUP BY r.emp.id";
        Query query = session.createQuery(hql);
        List<Record> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<Record> getRecordDepart() {
        Session session = factory.getCurrentSession();
        String hql = "Select r.emp.depart.id,(Select name FROM Depart WHERE id = r.emp.depart.id),"
                + "SUM(case when r.type=1 then 1 else 0 end),"
                + "SUM(case when r.type=0 then 1 else 0 end)"
                + "FROM Record r "
                + "GROUP BY r.emp.depart.id";
        Query query = session.createQuery(hql);
        List<Record> list = query.list();
        return list;
    }
}

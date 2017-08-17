/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Administrator
 */
@Transactional
@Controller
@RequestMapping("/Home")
public class HomeController {
    @Autowired
    SessionFactory factory;
    
    @RequestMapping("Dashboard")
    public String getListTop(ModelMap model){
        model.addAttribute("listTop", getListTopEmp());
        return "Home/Dashboard";
    }
    
    @SuppressWarnings("unchecked")
    public List<Object[]> getListTopEmp(){
        Session session = factory.getCurrentSession();
        String hql = "Select r.emp.id,(Select name FROM Emp WHERE id = r.emp.id),(Select photo FROM Emp WHERE id = r.emp.id) "
                + "FROM Record r "
                + "GROUP BY r.emp.id "
                + "HAVING SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end) >=0 "
                + "ORDER BY SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end) DESC ";
        Query query = session.createQuery(hql);
        query.setMaxResults(10);
        List<Object[]> list = query.list();
        return list;
    }
}

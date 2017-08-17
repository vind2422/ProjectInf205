/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Depart;
import Entity.Emp;
import Copy.*;
import Entity.Record;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import static org.apache.commons.io.FileUtils.copyFile;
import org.hibernate.Query;
import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author np
 */
@Transactional
@Controller
@RequestMapping("/Employee")
public class EmployeeController {

    @Autowired
    SessionFactory factory;

    @Autowired
    ServletContext context;

    String name;
    String name1;
    String path1 = "";
    String path2 = "";
    UUID id;

    @RequestMapping("dataEmp")
    public String index(ModelMap model) {
        name = "";
        path1 = "";
        path2 = "";
        model.addAttribute("src", name);
        model.addAttribute("emp", new Emp());
        model.addAttribute("listEmps", getEmps());
        return "Employee/dataEmp";
    }

    @RequestMapping("new")
    public String newEmp(ModelMap model, @ModelAttribute("emp") Emp emp) {
        name = "";
        path1 = "";
        path2 = "";
        model.addAttribute("emp", new Emp());
        return "Employee/newEmp";
    }

    @RequestMapping("edit/{id}")
    public String edit(ModelMap model, @PathVariable("id") Integer id) {
        name = "";
        path1 = "";
        path2 = "";
        model.addAttribute("src", name);

        Session session = factory.getCurrentSession();
        Emp emp = (Emp) session.get(Emp.class, id);
        model.addAttribute("emp", emp);
        model.addAttribute("listEmps", getEmps());
        return "Employee/editEmp";
    }

    @RequestMapping("details/{id}")
    public String details(ModelMap model, @PathVariable("id") Integer id) {
        name = "";
        path1 = "";
        path2 = "";
        model.addAttribute("src", name);
        Session session = factory.getCurrentSession();
        Emp emp = (Emp) session.get(Emp.class, id);

        model.addAttribute("record", new Record());
        model.addAttribute("emp", emp);
        return "Employee/detailsEmp";
    }

    @RequestMapping("delete/{id}")
    public String delete(ModelMap model, @PathVariable("id") Integer id) {
        Session session = factory.getCurrentSession();
        Emp emp = (Emp) session.get(Emp.class, id);
        File file = new File(context.getRealPath("/images/" + emp.getPhoto()));
        file.delete();
        session.delete(emp);
//        model.addAttribute("emp", new Emp());
        model.addAttribute("listEmps", getEmps());
        return "Employee/dataEmp";
    }

    @RequestMapping(params = "btnUpHinh")
    public String apply(ModelMap model, @ModelAttribute("emp") Emp emp,
            @RequestParam("photo2") MultipartFile photo2) {

        if (photo2.isEmpty()) {
            model.addAttribute("message", "Vui lòng chọn file!");
        } else {
            try {
//                String photoPath;
//                if (name.equals("") && emp.getPhoto().equals("") == false) {
//                    name = emp.getPhoto();
//                    photoPath = context.getRealPath("/upload/" + name);
//                } else if (name.equals("") && emp.getPhoto().equals("")) {
//                    name = UUID.randomUUID().toString();
//                    photoPath = context.getRealPath("/upload/" + name);
//                } else {
////                    name = UUID.randomUUID().toString();
//                    photoPath = context.getRealPath("/upload/" + name);
//                }
//                photo2.transferTo(new File(photoPath));
//                path1 = photoPath;
//                path2 = context.getRealPath("/images/" + name);
//                Thread.sleep(5000);
//                System.out.println("uphinhOk1");
//                emp.setPhoto(name);
//                System.out.println("uphinhOk2");
                id = UUID.randomUUID();
                path1 = context.getRealPath("/upload/" + id);
                path2 = context.getRealPath("/images/" + id);
                photo2.transferTo(new File(path1));
                emp.setPhoto(id + "");
                Thread.sleep(5000);
                model.addAttribute("src", id);
                return "Employee/editEmp";

            } catch (Exception e) {
                model.addAttribute("message", "Lỗi lưu file!");
            }
        }
        return "Employee/dataEmp";
    }

    @RequestMapping(params = "btnUpHinh2")
    public String apply2(ModelMap model, @ModelAttribute("emp") Emp emp,
            @RequestParam("photo3") MultipartFile photo2) {
        System.out.println("uphinh123123123");
        if (photo2.isEmpty()) {
            model.addAttribute("message", "Vui lòng chọn file!");
        } else {
            try {
                String photoPath;
                if (name.equals("") && emp.getPhoto().equals("") == false) {
                    name = emp.getPhoto();
                    photoPath = context.getRealPath("/upload/" + name);
                } else if (name.equals("") && emp.getPhoto().equals("")) {
                    name = UUID.randomUUID() + "";
                    photoPath = context.getRealPath("/upload/" + name);
                } else {
                    photoPath = context.getRealPath("/upload/" + name);
                }
                photo2.transferTo(new File(photoPath));
                path1 = photoPath;
                path2 = context.getRealPath("/images/" + name);
                Thread.sleep(5000);
                emp.setPhoto(name);
                model.addAttribute("src", name);
                return "Employee/newEmp";
            } catch (Exception e) {
                model.addAttribute("message", "Lỗi lưu file!");
            }
        }

        return "Employee/dataEmp";
    }

    @RequestMapping(params = "btnUpdate")
    public String updateEmp(ModelMap model, @ModelAttribute("emp") Emp emp, HttpServletRequest request) {
        Session session = factory.openSession();
        Transaction tran = session.beginTransaction();
//        File file = new File(context.getRealPath("/images/" + emp.getPhoto()));
//        file.delete();
//        name = "";
//        path1 = "";
//        path2 = "";
//
//        model.addAttribute("src", name);
        try {
            String ngaysinh = request.getParameter("birthday");
            if (ngaysinh.equals("") == false) {
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(ngaysinh);
                emp.setBirthday(date);
            }
            session.update(emp);
//            emp.setEmail(convetNFD.removeAccent(emp.getName().trim().replaceAll("\\s+", "").toLowerCase()) + emp.getId() + "@gmail.com");
//            session.update(emp);
            System.out.println(path1);
            System.out.println(path2);

            if (path1.equals("") == false && path2.equals("") == false) {
                copyFile.copy(path1, path2);
            }

            System.out.println("Update OK");

            tran.commit();

            model.addAttribute("message", "Update thành công!");
            
        } catch (Exception e) {
            e.printStackTrace();
            tran.rollback();
            model.addAttribute("message", "Update thất bại");
        } finally {
            session.close();
        }

//        Thread.sleep(6000);

        name = "";
        path1 = "";
        path2 = "";
        model.addAttribute("src", name);

//        model.addAttribute("emp", new Emp());
        model.addAttribute("listEmps", getEmps());
        return "Employee/dataEmp";
    }

    @RequestMapping(params = "btnInsert")
    public String insertEmp(ModelMap model, @Validated @ModelAttribute("emp") Emp emp,BindingResult errors, HttpServletRequest request) {
        Session session = factory.openSession();
        Transaction tran = session.beginTransaction();
//        name="";
//        path1="";
//        path2="";
        model.addAttribute("src", name);
        try {
            System.out.println("Ok Add Successfuládasđs");
            String ngaysinh = request.getParameter("birthday");
            if (ngaysinh.equals("") == false) {
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(ngaysinh);
                emp.setBirthday(date);
            }
            if(errors.hasErrors()){
                model.addAttribute("message", "Loix");
                return "Employee/newEmp";
            }
            session.save(emp);
            emp.setEmail(convetNFD.removeAccent(emp.getName().trim().replaceAll("\\s+", "").toLowerCase()) + emp.getId() + "@gmail.com");
            session.save(emp);
            if (path1.equals("") == false && path2.equals("") == false) {
                copyFile.copy(path1, path2);
            }
            tran.commit();
            model.addAttribute("message", "Update thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            tran.rollback();
            model.addAttribute("message", "Update thất bại");
        } finally {
            session.close();
        }
        model.addAttribute("listEmps", getEmps());
        return "Employee/dataEmp";
    }

    @ModelAttribute("departs")
    @SuppressWarnings("unchecked")
    public List<Depart> getDeparts() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Depart";
        Query query = session.createQuery(hql);
        List<Depart> list = query.list();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<Emp> getEmps() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Emp";
        Query query = session.createQuery(hql);
        List<Emp> list = query.list();
        return list;
    }

    @RequestMapping(params = "btnAdd")
    public String insertEmp(ModelMap model, @Validated @ModelAttribute("record") Record record, BindingResult errors, HttpServletRequest request) {
        Session session = factory.openSession();
        Transaction tran = session.beginTransaction();
        try {
            System.out.println("Ok Add Successfuládasđs");
            String date1 = request.getParameter("birthday");
            if (date1.equals("") == false) {
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
                record.setDate(date);
            }
            if(errors.hasErrors()){
                model.addAttribute("message", "Loix");
                
            }
            session.save(record);
            tran.commit();
            model.addAttribute("message", "Update thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            tran.rollback();
            model.addAttribute("message", "Update thất bại");
        } finally {
            session.close();
        }
        model.addAttribute("listEmps", getEmps());
        return "Employee/dataEmp";
    }

//    @ModelAttribute("record")
//    public List<Record> getRecord(@PathVariable("id") Integer id ){
//        Session session = factory.getCurrentSession();
//        Emp emp = (Emp) session.get(Emp.class, id);
//        List<Record> list = (List<Record>) emp.getRecords();
//        return list;
//    }
}

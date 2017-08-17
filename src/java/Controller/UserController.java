/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Emp;
import Entity.User;
import java.util.List;
import java.util.UUID;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author np
 */
@Transactional
@Controller
public class UserController {

    @Autowired
    SessionFactory factory;

     @Autowired
    JavaMailSender mailer;
     
    @RequestMapping("index")
    public String login() {
        return "index";
    }

    @RequestMapping(value = "index", method = RequestMethod.POST)
    public String login(ModelMap model,
            @RequestParam("id") String id,
            @RequestParam("password") String password,
            HttpSession httpSession, HttpServletRequest request) {
        System.out.println("nono");
        Session session = factory.getCurrentSession();
        httpSession = request.getSession(true);
        try {
            User user = (User) session.get(User.class, id);
            if (!user.getPassword().equals(password)) {
                model.addAttribute("message", "Sai tên mật khẩu !");
            } else {
                httpSession.setAttribute("USER", user);
                model.addAttribute("listTop", getListTopEmp());
                return "Home/Dashboard";
            }
        } catch (Exception e) {
            model.addAttribute("message", "Sai tên đăng nhập !");
        }
        model.addAttribute("message", "Sai tên đăng nhập !");
        return "index";
    }

    @RequestMapping("logout")
    public String logout() {
        return "index";
    }

    @SuppressWarnings("unchecked")
    public List<Object[]> getListTopEmp() {
        Session session = factory.getCurrentSession();
        String hql = "Select r.emp.id,(Select name FROM Emp WHERE id = r.emp.id),(Select photo FROM Emp WHERE id = r.emp.id),"
                + "SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end) "
                + "FROM Record r "
                + "GROUP BY r.emp.id "
                + "HAVING SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end) >=0 "
                + "ORDER BY SUM(case when r.type=1 then 1 else 0 end) - SUM(case when r.type=0 then 1 else 0 end) DESC ";
        Query query = session.createQuery(hql);
        query.setMaxResults(10);
        List<Object[]> list = query.list();
        return list;
    }

//    @RequestMapping("forgotpassword")
//    public String forgot() {
//        return "forgotpassword";
//    }
//    
   

    @RequestMapping(value = "forgotpassword", method = RequestMethod.POST)
    public String forgot(ModelMap model,
            @RequestParam("username1") String username,
            @RequestParam("email") String email) {
        Session session = factory.getCurrentSession();
        try {
            User user = (User) session.get(User.class, username);
            if (!user.getEmail().equals(email)) {
                model.addAttribute("emailer", "Email is wrong !");
                
            } else {
                String newpass2 = UUID.randomUUID().toString();
                user.setPassword(newpass2);
                MimeMessage mail = mailer.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(mail);
                helper.setFrom("Administrator");
                helper.setTo(email);
//                helper.setReplyTo("kuvi2422@gmail.com");
                helper.setSubject("G - Reset password");
                helper.setText("Password has been reseted: " + newpass2);
                mailer.send(mail);
                model.addAttribute("ok", "Please check email!");
            }
        } catch (Exception e) {
            model.addAttribute("usernameer", "Username is wrong !");
            e.printStackTrace();
        }
        return "index";
    }
}

package com.example.onlinefood;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    @Autowired
    JdbcTemplate jdbc;

    @PostMapping("/manageusers")
    public String manageusers(@RequestParam("user_id") String email,
            @RequestParam("btn") String btn, Model m) {

        if (btn.equalsIgnoreCase("delete")) {
            String sql = "delete from users Where user_id=?";
            jdbc.update(sql, email);

            return allUsers(m); // allUsers (file name where to open)
        }

        String sql = "select * from users where user_id='" + email + "'";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        m.addAttribute("usermaster", usermaster);

        return "editUser";
    }

    @PostMapping("/updateusers")
    public String updateUsers(@RequestParam("user_id") String email, @RequestParam("username") String username,

            @RequestParam("role") String role, @RequestParam("status") String status, Model m) {
        String sql = "update users set username=?  , role=? , status=? where user_id=?";
        jdbc.update(sql, username, role, status, email);

        return allUsers(m);

    }

    @GetMapping("/allUsers")
    public String allUsers(Model m) {
        System.out.println("call..");
        String sql = "select * from users where role != 'admin' ";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        m.addAttribute("usermaster", usermaster);

        return "allUsers";
    }


    




    @GetMapping("/editUser")
    public static String editUser() {
        return "editUser";
    }






}

   

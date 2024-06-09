package com.example.onlinefood;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/")
    public String home(HttpSession session) {
        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String doLogin(@RequestParam String username, @RequestParam String password, HttpSession session,
            RedirectAttributes redirectAttributes) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        List<Map<String, Object>> users = jdbcTemplate.queryForList(sql, username, password);
        if (!users.isEmpty()) {
            Map<String, Object> user = users.get(0);
            session.setAttribute("user", user);
            session.setAttribute("username", user.get("username")); // Set username explicitly
            String role = (String) user.get("role");
            if ("admin".equals(role)) {
                return "redirect:/";
            } else if ("customer".equals(role)) {
                return "redirect:/";
            } else if ("serviceprovider".equals(role)) {
                return "redirect:/";
            }
        }
        redirectAttributes.addFlashAttribute("error", "Invalid credentials");
        return "redirect:/login";
    }

    @GetMapping("/signup")
    public String signup() {
        return "signup";
    }

    // @PostMapping("/signup")
    // public String doSignup(@RequestParam String username, @RequestParam String password, @RequestParam String role) {
    //     String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
    //     jdbcTemplate.update(sql, username, password, role);
    //     return "redirect:/login";
    // }

    // @PostMapping("/signup")
    // public String doSignup(@RequestParam String username, @RequestParam String password, @RequestParam String role, 
    //                        @RequestParam String email, @RequestParam String phone) {
    //     String sql = "INSERT INTO users (username, password, role, email, phone) VALUES (?, ?, ?, ?, ?)";
    //     jdbcTemplate.update(sql, username, password, role, email, phone);
    //     return "redirect:/login";
    // }
    
    @PostMapping("/signup")
public String doSignup(@RequestParam String username, @RequestParam String password, 
                       @RequestParam String role, @RequestParam String email, 
                       @RequestParam String phone, RedirectAttributes redirectAttributes) {

    // Validate input data
    if (!username.matches("\\w{3,30}")) {
        redirectAttributes.addFlashAttribute("error", "Invalid username");
        return "redirect:/signup";
    }

    if (password.length() < 6) {
        redirectAttributes.addFlashAttribute("error", "Password must be at least 6 characters long");
        return "redirect:/signup";
    }

    if (!email.contains("@")) {
        redirectAttributes.addFlashAttribute("error", "Invalid email format");
        return "redirect:/signup";
    }

    if (!phone.matches("\\d{10}")) {
        redirectAttributes.addFlashAttribute("error", "Invalid phone number format");
        return "redirect:/signup";
    }

    // Assuming the database code is safe and uses prepared statements to avoid SQL Injection
    String sql = "INSERT INTO users (username, password, role, email, phone) VALUES (?, ?, ?, ?, ?)";
    jdbcTemplate.update(sql, username, password, role, email, phone);

    return "redirect:/login";
}


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/orderSuccess")
    public String orderSuccessString() {
        return "orderSuccess";
    }

    @GetMapping("/orderFailure")
    public String orderFailure() {
        return "orderFailure";
    }

    @GetMapping("/servicedashboard")
    public static String servicedashboard() {
        return "servicedashboard";
    }

    @GetMapping("/admindashboard")
    public static String admindashboard() {
        return "admindashboard";
    }

    @GetMapping("/customerdashboard")
    public static String customerdashboard() {
        return "customerdashboard";
    }
}

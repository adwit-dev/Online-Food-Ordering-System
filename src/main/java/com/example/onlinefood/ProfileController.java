package com.example.onlinefood;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/profile")
public String userProfile(HttpSession session, Model model) {
    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
    if (user == null) {
        return "redirect:/login";
    }
    model.addAttribute("profile", user);

    if ("serviceprovider".equals(user.get("role"))) {
        List<Map<String, Object>> products = jdbcTemplate.queryForList("SELECT * FROM products WHERE provider_id = ?", user.get("user_id"));
        model.addAttribute("products", products);
    } else if ("customer".equals(user.get("role"))) {
        List<Map<String, Object>> purchases = jdbcTemplate.queryForList(
            "SELECT p.*, pr.name as product_name FROM purchases p JOIN products pr ON p.product_id = pr.product_id WHERE p.user_id = ?",
            user.get("user_id"));
        model.addAttribute("purchases", purchases);
    }

    return "profile";
}


    @PostMapping("/updateProfile")
    public String updateProfile(@RequestParam Map<String, String> params, HttpSession session) {
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        jdbcTemplate.update("UPDATE users SET username = ?, password = ?, image_url = ?, status = ? WHERE user_id = ?",
                            params.get("username"), params.get("password"), params.get("image_url"), params.get("status"), user.get("user_id"));
        // Update session data
        user.put("username", params.get("username"));
        user.put("password", params.get("password")); // Note: Storing password as plain text is not safe.
        user.put("image_url", params.get("image_url"));
        user.put("status", params.get("status"));
        session.setAttribute("user", user);
        return "redirect:/profile";
    }

    @GetMapping("/viewProfile")
    public String viewProfile(HttpSession session, Model model) {
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        

        if (user == null) {
            return "redirect:/login";
        }
        
        model.addAttribute("profile", user);
        
        if ("serviceprovider".equals(user.get("role"))) {
            List<Map<String, Object>> products = jdbcTemplate.queryForList(
                "SELECT * FROM products WHERE provider_id = ?", user.get("user_id"));
            model.addAttribute("products", products);
        } else if ("customer".equals(user.get("role"))) {
            List<Map<String, Object>> purchases = jdbcTemplate.queryForList(
                "SELECT p.*, pr.name as product_name FROM purchases p JOIN products pr ON p.product_id = pr.product_id WHERE p.user_id = ?", 
                user.get("user_id"));
            model.addAttribute("purchases", purchases);
        }

        return "viewProfile";
    }


//     @GetMapping("/viewProfile")
// public String viewProfile(HttpSession session, Model model) {
//     // Fetching the user details from the session.
//     Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");

//     // Redirecting to login page if the user details are not found in the session.
//     if (user == null) {
//         return "redirect:/login";
//     }

//     // Adding the user details to the model to be accessible in the JSP.
//     model.addAttribute("profile", user);

//     // If the user is a service provider, fetch products they are associated with.
//     if ("serviceprovider".equals(user.get("role"))) {
//         List<Map<String, Object>> products = jdbcTemplate.queryForList(
//             "SELECT * FROM products WHERE provider_id = ?", user.get("user_id"));
//         model.addAttribute("products", products);
//     } 
//     // If the user is a customer, fetch their purchase details.
//     else if ("customer".equals(user.get("role"))) {
//         List<Map<String, Object>> purchases = jdbcTemplate.queryForList(
//             "SELECT p.*, pr.name as product_name FROM purchases p JOIN products pr ON p.product_id = pr.product_id WHERE p.user_id = ?", 
//             user.get("user_id"));
//         model.addAttribute("purchases", purchases);
//     }

//     // Returning the name of the JSP file to display the view.
//     return "viewProfile";
// }

}


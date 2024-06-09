package com.example.onlinefood;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductServiceController {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/serviceProduct")
    public String serviceProductPage(Model model) {
        String sql = "SELECT * FROM products";
        List<Map<String, Object>> products = jdbcTemplate.queryForList(sql);
        model.addAttribute("products", products);
        return "serviceProduct";
    }

    @PostMapping("/addProduct")
    public String addProduct(@RequestParam("name") String name,
                             @RequestParam("description") String description,
                             @RequestParam("price") Double price,
                             @RequestParam("image_url") String imageUrl,
                             HttpSession session) {
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        if (user != null && "serviceprovider".equals(user.get("role"))) {
            String sql = "INSERT INTO products (provider_id, name, description, price, image_url) VALUES (?, ?, ?, ?, ?)";
            jdbcTemplate.update(sql, user.get("user_id"), name, description, price, imageUrl);
        }
        return "redirect:/serviceProduct";
    }

    @PostMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("productId") Integer productId) {
        String sql = "DELETE FROM products WHERE product_id = ?";
        jdbcTemplate.update(sql, productId);
        return "redirect:/serviceProduct";
    }
 

   

}

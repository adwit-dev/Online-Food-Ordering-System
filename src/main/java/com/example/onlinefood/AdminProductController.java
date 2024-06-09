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

@Controller
public class AdminProductController {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/adminProduct")
    public String adminProductsPage(Model model) {
        model.addAttribute("products", jdbcTemplate.queryForList("SELECT * FROM products"));
        return "adminProduct";
    }

    @PostMapping("/deleteAdminProduct")
    public String deleteProduct(@RequestParam("productId") Integer productId) {
        jdbcTemplate.update("DELETE FROM products WHERE product_id = ?", productId);
        return "redirect:/adminProduct";
    }
}

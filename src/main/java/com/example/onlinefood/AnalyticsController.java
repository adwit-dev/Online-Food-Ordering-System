package com.example.onlinefood;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AnalyticsController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/analytics")
    public String getAnalyticsData(Model model) {
        // Get the number of queries answered and deleted
        String sqlQueries = "SELECT status, COUNT(*) as count FROM faq GROUP BY status";
        List<Map<String, Object>> queryStats = jdbcTemplate.queryForList(sqlQueries);
        model.addAttribute("queryStats", queryStats);

        // Get the number of products by each provider
        String sqlProducts = "SELECT provider_id, COUNT(*) as count FROM products GROUP BY provider_id";
        List<Map<String, Object>> productStats = jdbcTemplate.queryForList(sqlProducts);
        model.addAttribute("productStats", productStats);

        // Get total money spent by each user and total quantity
        String sqlPurchases = "SELECT p.user_id, SUM(pr.price * p.quantity) as totalSpent, SUM(p.quantity) as totalQuantity " +
                              "FROM purchases p INNER JOIN products pr ON p.product_id = pr.product_id " +
                              "GROUP BY p.user_id";
        List<Map<String, Object>> purchaseStats = jdbcTemplate.queryForList(sqlPurchases);
        model.addAttribute("purchaseStats", purchaseStats);

        // Get the growth trend of customers (here, we consider new users added by month as an example)
        // Get the total number of customers
        String sqlUsers = "SELECT COUNT(*) as totalCustomers FROM users";
        int totalCustomers = jdbcTemplate.queryForObject(sqlUsers, Integer.class);
        model.addAttribute("totalCustomers", totalCustomers);

        return "analytics";
    }
}
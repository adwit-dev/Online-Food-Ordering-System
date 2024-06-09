package com.example.onlinefood;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderProcessingController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // @GetMapping("/orders")
    // public ModelAndView showOrders() {
    // List<Map<String, Object>> orders = jdbcTemplate.queryForList("SELECT * FROM
    // purchases");
    // ModelAndView mav = new ModelAndView("orderprocessing");
    // mav.addObject("orders", orders);
    // return mav;
    // }

    @GetMapping("/orders")
    public ModelAndView showOrders() {
        ModelAndView mav = new ModelAndView("orderprocessing");
        try {
            List<Map<String, Object>> orders = jdbcTemplate.queryForList("SELECT * FROM purchases");
            if (orders.isEmpty()) {
                System.out.println("No orders found in the database.");
            } else {
                System.out.println("Orders fetched: " + orders.size());
            }
            mav.addObject("orders", orders);
        } catch (Exception e) {
            System.out.println("Error fetching orders: " + e.getMessage());
            // Add more error details if needed
        }
        return mav;
    }

    @PostMapping("/orders/accept")
    public ModelAndView acceptOrder(@RequestParam("purchase_id") int purchaseId) {
        jdbcTemplate.update("UPDATE purchases SET status='ACCEPTED' WHERE purchase_id=?", purchaseId);
        return new ModelAndView("redirect:/orders");
    }

    @PostMapping("/orders/decline")
    public ModelAndView declineOrder(@RequestParam("purchase_id") int purchaseId) {
        jdbcTemplate.update("UPDATE purchases SET status='DECLINED' WHERE purchase_id=?", purchaseId);
        return new ModelAndView("redirect:/orders");
    }

    // @GetMapping("/customer/orders")
    // public ModelAndView customerOrders(@RequestParam("user_id") int userId) {
    // List<Map<String, Object>> orders = jdbcTemplate.queryForList(
    // "SELECT * FROM purchases WHERE user_id=?", userId);
    // ModelAndView mav = new ModelAndView("customerorders");
    // mav.addObject("orders", orders);
    // return mav;
    // }
    // @GetMapping("/customerorders")
    // public ModelAndView customerOrders(@RequestParam("user_id") int userId) {
    // List<Map<String, Object>> orders = jdbcTemplate.queryForList(
    // "SELECT * FROM purchases WHERE user_id=?", userId);
    // ModelAndView mav = new ModelAndView("customerorders");
    // mav.addObject("orders", orders);
    // return mav;
    // }

    // @GetMapping("/customerorders")
    // public ModelAndView customerOrders(HttpSession session) {
    //     Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
    //     if (user == null) {
    //         return new ModelAndView("redirect:/login");
    //     }
    
    //     // Extract user_id from the user object stored in the session.
    //     Object userIdObject = user.get("user_id");
    //     if (userIdObject == null) {
    //         // Handle case where user_id is not set in the user object.
    //         return new ModelAndView("redirect:/login");
    //     }
    
    //     int userId = Integer.parseInt(userIdObject.toString());
    //     List<Map<String, Object>> purchases = jdbcTemplate.queryForList(
    //             "SELECT * FROM purchases WHERE user_id = ?", userId);
    
    //     ModelAndView mav = new ModelAndView("customerorders");
    //     mav.addObject("purchases", purchases);
    //     return mav;
    // }
    @GetMapping("/customerorders")
    public ModelAndView customerOrders(HttpSession session) {
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("redirect:/login");
        }
    
        // Extract user_id from the user object stored in the session.
        Object userIdObject = user.get("user_id");
        if (userIdObject == null) {
            // Handle case where user_id is not set in the user object.
            return new ModelAndView("redirect:/login");
        }
    
        int userId = Integer.parseInt(userIdObject.toString());
        List<Map<String, Object>> purchases = jdbcTemplate.queryForList(
                "SELECT * FROM purchases WHERE user_id = ?", userId);
    
        ModelAndView mav = new ModelAndView("customerorders");
        mav.addObject("purchases", purchases);
        return mav;
    }

}

package com.example.onlinefood;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
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

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // @GetMapping("/cart")
    // public String viewCart(HttpSession session, Model model) {
    // List<Integer> cart = (List<Integer>) session.getAttribute("cart");
    // if (cart == null || cart.isEmpty()) {
    // return "redirect:/userProduct";
    // }
    // String inSql = String.join(",", Collections.nCopies(cart.size(), "?"));
    // List<Map<String, Object>> products = jdbcTemplate.queryForList(
    // "SELECT * FROM products WHERE product_id IN (" + inSql + ")",
    // cart.toArray());
    // model.addAttribute("cartProducts", products);
    // return "addToCart";
    // }

    // @PostMapping("/removeFromCart")
    // public String removeFromCart(@RequestParam("productId") Integer productId,
    // HttpSession session) {
    // List<Integer> cart = (List<Integer>) session.getAttribute("cart");
    // cart.remove(productId);
    // session.setAttribute("cart", cart);
    // return "redirect:/cart";
    // }
    @GetMapping("/cart")
    public String viewCart(HttpSession session, Model model) {
        Map<Integer, Integer> cart = initializeOrRetrieveCart(session);
        if (cart.isEmpty()) {
            return "redirect:/userProduct";
        }
        List<Integer> productIds = new ArrayList<>(cart.keySet());
        String inSql = String.join(",", Collections.nCopies(productIds.size(), "?"));
        List<Map<String, Object>> products = jdbcTemplate.queryForList(
            "SELECT * FROM products WHERE product_id IN (" + inSql + ")", productIds.toArray());
        model.addAttribute("cartProducts", products.stream()
            .peek(product -> product.put("quantity", cart.get(product.get("product_id"))))
            .collect(Collectors.toList()));
        return "addToCart";
    }

    @PostMapping("/addtocart")
    public String addToCart(@RequestParam("productId") Integer productId, HttpSession session) {
        Map<Integer, Integer> cart = initializeOrRetrieveCart(session);
        cart.put(productId, cart.getOrDefault(productId, 0) + 1);
        return "redirect:/cart";
    }

    @PostMapping("/removeFromCart")
    public String removeFromCart(@RequestParam("productId") Integer productId, @RequestParam("all") boolean removeAll, HttpSession session) {
        Map<Integer, Integer> cart = initializeOrRetrieveCart(session);
        if (removeAll || cart.get(productId) == 1) {
            cart.remove(productId);
        } else {
            cart.put(productId, cart.get(productId) - 1);
        }
        return "redirect:/cart";
    }

    private Map<Integer, Integer> initializeOrRetrieveCart(HttpSession session) {
        Object cartObject = session.getAttribute("cart");
        if (cartObject instanceof Map) {
            // Safe to cast because we've checked the instance
            return (Map<Integer, Integer>) cartObject;
        } else {
            // Either the cart is null or it's an incompatible type, initialize a new one
            Map<Integer, Integer> newCart = new HashMap<>();
            session.setAttribute("cart", newCart);
            return newCart;
        }
    }
    
}

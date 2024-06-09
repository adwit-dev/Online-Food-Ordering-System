package com.example.onlinefood;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class CheckoutController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

   
//     @GetMapping("/proceedToCheckout")
//     public String proceedToCheckout(HttpSession session, Model model) {
//         Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
//         if (cart == null || cart.isEmpty()) {
//             model.addAttribute("error", "Your cart is empty.");
//             return "redirect:/userProduct";  // Redirect to product page if cart is empty
//         }

//         List<Integer> productIds = new ArrayList<>(cart.keySet());
//         String inSql = String.join(",", Collections.nCopies(productIds.size(), "?"));
//         List<Map<String, Object>> products = jdbcTemplate.queryForList(
//             "SELECT * FROM products WHERE product_id IN (" + inSql + ")", productIds.toArray());

//         BigDecimal total = products.stream()
//             .map(product -> ((BigDecimal) product.get("price")).multiply(new BigDecimal(cart.get((Integer) product.get("product_id")))))
//             .reduce(BigDecimal.ZERO, BigDecimal::add);

//         model.addAttribute("cartProducts", products.stream()
//             .peek(product -> product.put("quantity", cart.get(product.get("product_id"))))
//             .collect(Collectors.toList()));
//         model.addAttribute("total", total);
//         return "proceedToCheckout";
//     }


   


    


     
    
   


//     private boolean isRewardCodeValid(String code) {
//         if (code == null || code.trim().isEmpty()) {
//             return false;
//         }
//         try {
//             String sql = "SELECT COUNT(*) FROM responses WHERE reward_code = ?";
//             int count = jdbcTemplate.queryForObject(sql, new Object[]{code}, Integer.class);
//             return count > 0;
//         } catch (EmptyResultDataAccessException e) {
//             return false;
//         }
//     }




//     @PostMapping("/applyRewardCode")
//     @ResponseBody
//     public ResponseEntity<?> applyRewardCode(HttpSession session, @RequestParam("rewardCode") String rewardCode) {
//         Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
//         BigDecimal total = (BigDecimal) session.getAttribute("total");

//         if (cart == null || cart.isEmpty()) {
//             return ResponseEntity.badRequest().body("Your cart is empty.");
//         }

//         if (!isRewardCodeValid(rewardCode)) {
//             return ResponseEntity.badRequest().body("Invalid reward code.");
//         }

//         BigDecimal discount = total.multiply(BigDecimal.valueOf(0.1)); // 10% discount
//         BigDecimal discountedTotal = total.subtract(discount);

//         session.setAttribute("total", discountedTotal); // Save the discounted total in the session

//         return ResponseEntity.ok(discountedTotal.toPlainString()); // Send the discounted total as a response
//     }





    
    

//     // ... [Remaining methods and logic for the CheckoutController] ...
// @PostMapping("/checkout")
//     public String checkout(HttpSession session, RedirectAttributes redirectAttributes,
//                            @RequestParam("address") String address) {
//         Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
//         Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
    
//         if (cart == null || cart.isEmpty()) {
//             redirectAttributes.addFlashAttribute("error", "Your cart is empty.");
//             return "redirect:/userProduct";
//         }
    
//         try {
//             for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
//                 Integer productId = entry.getKey();
//                 Integer quantity = entry.getValue();
//                 String sql = "INSERT INTO purchases (user_id, product_id, quantity, purchase_date, address) VALUES (?, ?, ?, ?, ?)";
//                 jdbcTemplate.update(sql, user.get("user_id"), productId, quantity, new Timestamp(System.currentTimeMillis()), address);
//             }
//             session.removeAttribute("cart");  // Clear the cart after checkout
//             redirectAttributes.addFlashAttribute("success", "Purchase successful! Delivery address: " + address);
//         } catch (Exception e) {
//             redirectAttributes.addFlashAttribute("error", "Error processing your purchase.");
//             return "redirect:/cart";
//         }
    
//         return "redirect:/orderSuccess";
//     }





@GetMapping("/proceedToCheckout")
    public String proceedToCheckout(HttpSession session, Model model) {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            model.addAttribute("error", "Your cart is empty.");
            return "redirect:/userProduct";
        }

        List<Integer> productIds = new ArrayList<>(cart.keySet());
        String inSql = String.join(",", Collections.nCopies(productIds.size(), "?"));
        List<Map<String, Object>> products = jdbcTemplate.queryForList(
            "SELECT * FROM products WHERE product_id IN (" + inSql + ")", productIds.toArray());

        BigDecimal total = products.stream()
            .map(product -> ((BigDecimal) product.get("price")).multiply(new BigDecimal(cart.get((Integer) product.get("product_id")))))
            .reduce(BigDecimal.ZERO, BigDecimal::add);

        model.addAttribute("cartProducts", products.stream()
            .peek(product -> product.put("quantity", cart.get(product.get("product_id"))))
            .collect(Collectors.toList()));
        model.addAttribute("total", total);
        return "proceedToCheckout";
    }

    private boolean isRewardCodeValid(String code) {
        if (code == null || code.trim().isEmpty()) {
            return false;
        }
        try {
            String sql = "SELECT COUNT(*) FROM responses WHERE reward_code = ?";
            int count = jdbcTemplate.queryForObject(sql, new Object[]{code}, Integer.class);
            return count > 0;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

    @PostMapping("/applyRewardCode")
    @ResponseBody
    public ResponseEntity<?> applyRewardCode(HttpSession session, @RequestParam("rewardCode") String rewardCode) {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        BigDecimal total = (BigDecimal) session.getAttribute("total");

        if (cart == null || cart.isEmpty()) {
            return ResponseEntity.badRequest().body("Your cart is empty.");
        }

        if (!isRewardCodeValid(rewardCode)) {
            return ResponseEntity.badRequest().body("Invalid reward code.");
        }

        BigDecimal discount = total.multiply(BigDecimal.valueOf(0.1)); // 10% discount
        BigDecimal discountedTotal = total.subtract(discount);

        session.setAttribute("total", discountedTotal); // Save the discounted total in the session

        return ResponseEntity.ok(discountedTotal.toPlainString()); // Send the discounted total as a response
    }

    @PostMapping("/checkout")
    public String checkout(HttpSession session, RedirectAttributes redirectAttributes,
                           @RequestParam("address") String address) {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");

        if (cart == null || cart.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Your cart is empty.");
            return "redirect:/userProduct";
        }

        try {
            for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                Integer productId = entry.getKey();
                Integer quantity = entry.getValue();
                String sql = "INSERT INTO purchases (user_id, product_id, quantity, purchase_date, address) VALUES (?, ?, ?, ?, ?)";
                jdbcTemplate.update(sql, user.get("user_id"), productId, quantity, new Timestamp(System.currentTimeMillis()), address);
            }
            session.removeAttribute("cart");  // Clear the cart after checkout
            redirectAttributes.addFlashAttribute("success", "Purchase successful! Delivery address: " + address);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error processing your purchase.");
            return "redirect:/cart";
        }

        return "redirect:/orderSuccess";
    }



}











   

 //1 @GetMapping("/proceedToCheckout")
    // public String proceedToCheckout(HttpSession session, Model model) {
    //     List<Integer> cart = (List<Integer>) session.getAttribute("cart");
    //     if (cart == null || cart.isEmpty()) {
    //         model.addAttribute("error", "Your cart is empty.");
    //         return "redirect:/userProduct";  // Redirect to product page if cart is empty
    //     }
    //     String inSql = String.join(",", Collections.nCopies(cart.size(), "?"));
    //     List<Map<String, Object>> products = jdbcTemplate.queryForList(
    //         "SELECT * FROM products WHERE product_id IN (" + inSql + ")", cart.toArray());

    //     // Correct handling of BigDecimal for summing up prices
    //     BigDecimal total = products.stream()
    //                                .map(product -> (BigDecimal) product.get("price"))
    //                                .reduce(BigDecimal.ZERO, BigDecimal::add);

    //     model.addAttribute("cartProducts", products);
    //     model.addAttribute("total", total);
    //     return "proceedToCheckout";
    // }

    

    //2 @PostMapping("/checkout")
    // public String checkout(HttpSession session, RedirectAttributes redirectAttributes) {
    //     List<Integer> cart = (List<Integer>) session.getAttribute("cart");
    //     Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");

    //     if (cart == null || cart.isEmpty()) {
    //         redirectAttributes.addFlashAttribute("error", "Your cart is empty.");
    //         return "redirect:/userProduct";
    //     }

    //     try {
    //         for (Integer productId : cart) {
    //             String sql = "INSERT INTO purchases (user_id, product_id, quantity, purchase_date) VALUES (?, ?, ?, ?)";
    //             jdbcTemplate.update(sql, user.get("user_id"), productId, 1, new Timestamp(System.currentTimeMillis()));
    //         }
    //         session.removeAttribute("cart");  // Clear the cart after checkout
    //         redirectAttributes.addFlashAttribute("success", "Purchase successful!");
    //     } catch (Exception e) {
    //         redirectAttributes.addFlashAttribute("error", "Error processing your purchase.");
    //         return "redirect:/cart";
    //     }

    //     return "redirect:/orderSuccess";
    // }



    
// @PostMapping("/checkout")
    // public String checkout(HttpSession session, RedirectAttributes redirectAttributes) {
    //     Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
    //     Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");

    //     if (cart == null || cart.isEmpty()) {
    //         redirectAttributes.addFlashAttribute("error", "Your cart is empty.");
    //         return "redirect:/userProduct";
    //     }

    //     try {
    //         for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
    //             Integer productId = entry.getKey();
    //             Integer quantity = entry.getValue();
    //             String sql = "INSERT INTO purchases (user_id, product_id, quantity, purchase_date) VALUES (?, ?, ?, ?)";
    //             jdbcTemplate.update(sql, user.get("user_id"), productId, quantity, new Timestamp(System.currentTimeMillis()));
    //         }
    //         session.removeAttribute("cart");  // Clear the cart after checkout
    //         redirectAttributes.addFlashAttribute("success", "Purchase successful!");
    //     } catch (Exception e) {
    //         redirectAttributes.addFlashAttribute("error", "Error processing your purchase.");
    //         return "redirect:/cart";
    //     }

    //     return "redirect:/orderSuccess";
    //  }
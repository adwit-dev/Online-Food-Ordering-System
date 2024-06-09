package com.example.onlinefood;

import java.util.ArrayList;
import java.util.HashMap;
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
public class UserProductController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // @GetMapping("/userProduct")
    // public String userProductsPage(Model model) {
    //     List<Map<String, Object>> products = jdbcTemplate.queryForList("SELECT * FROM products");
    //     model.addAttribute("products", products);
    //     return "userProduct";
    // }



    // @GetMapping("/userProduct")
    // public String userProductsPage(Model model) {
    //     List<Map<String, Object>> products = jdbcTemplate.queryForList(
    //         "SELECT p.*, " +
    //         "(SELECT AVG(rating) FROM product_reviews WHERE product_id = p.product_id) as average_rating " +
    //         "FROM products p"
    //     );
    //     model.addAttribute("products", products);
    //     return "userProduct";
    // }

//     @GetMapping("/userProduct")
// public String userProductsPage(Model model) {
//     List<Map<String, Object>> products = jdbcTemplate.queryForList(
//         "SELECT p.*, " +
//         "(SELECT AVG(rating) FROM product_reviews WHERE product_id = p.product_id) as average_rating, " +
//         "(SELECT GROUP_CONCAT(CONCAT(user_id, ' - ', review_text)) FROM product_reviews WHERE product_id = p.product_id) as reviews " +
//         "FROM products p"
//     );
//     model.addAttribute("products", products);
//     return "userProduct";
// }


@GetMapping("/userProduct")
public String userProductsPage(Model model, HttpSession session) {
    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
    if (user == null) {
        return "redirect:/login";
    }

    List<Map<String, Object>> products = jdbcTemplate.queryForList(
        "SELECT p.*, " +
        "AVG(r.rating) as average_rating, " +
        "GROUP_CONCAT(CONCAT(r.user_id, ': ', r.review_text) ORDER BY r.review_date DESC SEPARATOR '; ') as reviews " +
        "FROM products p " +
        "LEFT JOIN product_reviews r ON p.product_id = r.product_id " +
        "GROUP BY p.product_id"
    );
    model.addAttribute("products", products);
    return "userProduct";
}

@PostMapping("/submitReview")
public String submitReview(@RequestParam("productId") Integer productId, 
                           @RequestParam("reviewText") String reviewText, 
                           @RequestParam("rating") Integer rating, 
                           HttpSession session) {
    // Retrieve the user details from the session
    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
    
    // Check if the user is not logged in, then redirect to login page
    if (user == null) {
        return "redirect:/login";
    }
    
    // Assuming the user ID is stored under the key "user_id" in the user session map
    Integer userId = (Integer) user.get("user_id");

    jdbcTemplate.update(
        "INSERT INTO product_reviews (product_id, user_id, rating, review_text, review_date) VALUES (?, ?, ?, ?, CURRENT_DATE)",
        productId, userId, rating, reviewText
    );

    return "redirect:/userProduct";
}





//     @PostMapping("/submitReview")
// public String submitReview(@RequestParam("productId") Integer productId, 
//                            @RequestParam("reviewText") String reviewText, 
//                            @RequestParam("rating") Integer rating, 
//                            HttpSession session) {
//     // Retrieve the user ID from the session or however you track the logged-in user
//     Integer userId = (Integer) session.getAttribute("userId");
//     jdbcTemplate.update(
//         "INSERT INTO product_reviews (product_id, user_id, rating, review_text, review_date) VALUES (?, ?, ?, ?, CURRENT_DATE)",
//         productId, userId, rating, reviewText
//     );
//     return "redirect:/userProduct";
// }


// // In UserProductController.java

// @GetMapping("/userProduct")
// public String userProductsPage(Model model, HttpSession session) {
//     // Fetch the user_id from session
//     Integer userId = (Integer) session.getAttribute("user_id");
    
//     List<Map<String, Object>> products = jdbcTemplate.queryForList(
//         "SELECT p.*, " +
//         "(SELECT AVG(rating) FROM product_reviews WHERE product_id = p.product_id) as average_rating, " +
//         "(SELECT GROUP_CONCAT(CONCAT(rating, ' Stars: ', review_text)) FROM product_reviews WHERE product_id = p.product_id) as reviews " +
//         "FROM products p"
//     );
//     model.addAttribute("products", products);
    
//     // Check if the user is logged in to add user-specific attributes
//     if (userId != null) {
//         model.addAttribute("userId", userId);
        
//         // Optionally, add user-specific reviews if needed
//         // Your custom query logic here
//     }
    
//     return "userProduct";
// }


// // In UserProductController.java

// @PostMapping("/submitReview")
// public String submitReview(@RequestParam("productId") Integer productId,
//                            @RequestParam("reviewText") String reviewText,
//                            @RequestParam("rating") Integer rating,
//                            HttpSession session) {
//     // Fetch the user_id from session
//     Integer userId = (Integer) session.getAttribute("user_id");

//     // Check if the user is logged in
//     if (userId == null) {
//         // Redirect to login page or handle accordingly
//         return "redirect:/login";
//     }

//     // Insert the review into the database
//     jdbcTemplate.update(
//         "INSERT INTO product_reviews (product_id, user_id, rating, review_text, review_date) VALUES (?, ?, ?, ?, CURRENT_DATE)",
//         productId, userId, rating, reviewText
//     );
//     return "redirect:/userProduct";
// }

    
    @PostMapping("/addToCart")
    public String addToCart(@RequestParam("productId") Integer productId, HttpSession session) {
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }
        cart.put(productId, cart.getOrDefault(productId, 0) + 1);
        return "redirect:/userProduct";
    }


    
    
}
//1 @PostMapping("/addToCart")
    // public String addToCart(@RequestParam("productId") Integer productId, HttpSession session) {
    //     List<Integer> cart = (List<Integer>) session.getAttribute("cart");
    //     if (cart == null) {
    //         cart = new ArrayList<>();
    //         session.setAttribute("cart", cart);
    //     }
    //     cart.add(productId);
    //     return "redirect:/userProduct";
    // }
   

    //1 @PostMapping("/addToCart")
    // public String addToCart(@RequestParam("productId") Integer productId, HttpSession session) {
    //     initializeCart(session);
    //     List<Integer> cart = (List<Integer>) session.getAttribute("cart");
    //     cart.add(productId);
    //     return "redirect:/userProduct";
    // }

    // private void initializeCart(HttpSession session) {
    //     if (session.getAttribute("cart") == null) {
    //         session.setAttribute("cart", new ArrayList<Integer>());
    //     }
    // }
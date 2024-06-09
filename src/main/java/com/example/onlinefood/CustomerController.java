package com.example.onlinefood;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomerController {
    @Autowired
    JdbcTemplate jdbc;

    @GetMapping("/customerfaq")
    public String customerFaq() {
        return "customerfaq"; // Name of the JSP file
    }

    @PostMapping("/submitQuestion")
    public ModelAndView submitQuestion(HttpServletRequest request) {
        String query = request.getParameter("query");
        if (query != null && !query.isEmpty()) {
            String sql = "INSERT INTO faq (query, status, date_posted) VALUES (?, 'pending', ?)";
            jdbc.update(sql, query, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        }
        return new ModelAndView("redirect:/customerfaq");
    }
}

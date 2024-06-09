package com.example.onlinefood;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminFaqController {
    @Autowired
    JdbcTemplate jdbc;

    @GetMapping("/adminfaq")
    public String adminFaq() {
        return "adminfaq"; // Name of the JSP file
    }

    @PostMapping("/submitResponse")
    public ModelAndView submitResponse(@RequestParam("id") int id, @RequestParam("response") String response) {
        if (response != null && !response.isEmpty()) {
            String sql = "UPDATE faq SET response=?, status='answered', date_answered=NOW() WHERE id=?";
            jdbc.update(sql, response, id);
        }
        return new ModelAndView("redirect:/adminfaq");
    }

    @GetMapping("/deleteQuery")
    public ModelAndView deleteQuery(@RequestParam("id") int id) {
        String sql = "UPDATE faq SET status='deleted' WHERE id=?";
        jdbc.update(sql, id);
        return new ModelAndView("redirect:/adminfaq");
    }
}

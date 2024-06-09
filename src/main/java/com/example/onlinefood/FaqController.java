package com.example.onlinefood;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FaqController {
    @GetMapping("/faq")
    public String faq() {
        return "faq"; // Name of the JSP file
    }
}

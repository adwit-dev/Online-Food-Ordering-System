package com.example.onlinefood;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExamController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/questions")
    public ModelAndView showQuestions() {
        List<Map<String, Object>> questions = jdbcTemplate.queryForList("SELECT * FROM questions");
        return new ModelAndView("questions", "questions", questions);
    }

    // @PostMapping("/submitAnswers")
    // public ModelAndView submitAnswers(@RequestParam Map<String, String> allResponses) {
    //     int score = 0;
    //     for (String key : allResponses.keySet()) {
    //         int questionId = Integer.parseInt(key);
    //         int selectedOption = Integer.parseInt(allResponses.get(key));
    //         Integer correctAnswer = jdbcTemplate.queryForObject(
    //             "SELECT answer FROM questions WHERE id = ?", new Object[]{questionId}, Integer.class);
    //         if (correctAnswer != null && correctAnswer == selectedOption) {
    //             score++;
    //         }
    //     }
    //     return new ModelAndView("results", "score", score);
    // }

    @PostMapping("/submitAnswers")
    public ModelAndView submitAnswers(@RequestParam Map<String, String> allResponses) {
        int score = 0;
        String rewardCode = null; // Variable to store the reward code
        Random random = new Random();
        for (String key : allResponses.keySet()) {
            int questionId = Integer.parseInt(key);
            int selectedOption = Integer.parseInt(allResponses.get(key));
            Integer correctAnswer = jdbcTemplate.queryForObject(
                "SELECT answer FROM questions WHERE id = ?", new Object[]{questionId}, Integer.class);
            if (correctAnswer != null && correctAnswer == selectedOption) {
                score++;
            }
            // Store each response in the responses table
            jdbcTemplate.update("INSERT INTO responses (question_id, user_response) VALUES (?, ?)",
                                questionId, selectedOption);
        }
        if (score > 1) {
            // Generate a random 5-digit code
            rewardCode = String.format("%05d", random.nextInt(100000));
            // Update the responses with the reward code
            jdbcTemplate.update("UPDATE responses SET reward_code = ? WHERE question_id IN (SELECT id FROM questions)",
                                rewardCode);
        }
        ModelAndView modelAndView = new ModelAndView("results");
        modelAndView.addObject("score", score);
        modelAndView.addObject("rewardCode", rewardCode);
        return modelAndView;
    }


    @GetMapping("/admin")
    public String addQuestionForm() {
        return "addQuestion";
    }

    @PostMapping("/addQuestion")
    public String addQuestion(@RequestParam String question, @RequestParam String option1,
                              @RequestParam String option2, @RequestParam String option3,
                              @RequestParam String option4, @RequestParam int answer) {
        jdbcTemplate.update("INSERT INTO questions (question, option1, option2, option3, option4, answer) VALUES (?, ?, ?, ?, ?, ?)",
                question, option1, option2, option3, option4, answer);
        return "redirect:/admin";
    }
}

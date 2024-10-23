package com.example.ruleengine.controller;

import com.example.ruleengine.model.Node;
import com.example.ruleengine.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/rules")
public class RuleController {
    @Autowired
    private RuleService ruleService;

    @PostMapping("/create")
    public Node createRule(@RequestBody String ruleString) {
        return ruleService.createRule(ruleString);
    }

    @PostMapping("/combine")
    public Node combineRules(@RequestBody List<String> rules) {
        return ruleService.combineRules(rules);
    }

    @PostMapping("/evaluate")
    public boolean evaluateRule(@RequestBody RuleEvaluationRequest request) {
        return ruleService.evaluateRule(request.getAst(), request.getData());
    }

    static class RuleEvaluationRequest {
        private Node ast;
        private RuleData data;

        // Getters and Setters
        public Node getAst() {
            return ast;
        }

        public void setAst(Node ast) {
            this.ast = ast;
        }

        public RuleData getData() {
            return data;
        }

        public void setData(RuleData data) {
            this.data = data;
        }
    }

    static class RuleData {
        private int age;
        private String department;
        private double salary;
        private int experience;

        // Getters and Setters
        public int getAge() {
            return age;
        }

        public void setAge(int age) {
            this.age = age;
        }

        public String getDepartment() {
            return department;
        }

        public void setDepartment(String department) {
            this.department = department;
        }

        public double getSalary() {
            return salary;
        }

        public void setSalary(double salary) {
            this.salary = salary;
        }

        public int getExperience() {
            return experience;
        }

        public void setExperience(int experience) {
            this.experience = experience;
        }
    }
}
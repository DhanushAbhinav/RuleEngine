package com.example.ruleengine.service;

import com.example.ruleengine.model.Node;
import com.example.ruleengine.model.Rule;
import com.example.ruleengine.repository.RuleRepository;
import com.example.ruleengine.util.ASTBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RuleService {
    @Autowired
    private RuleRepository ruleRepository;

    public Node createRule(String ruleString) {
        Node ast = ASTBuilder.buildAST(ruleString);
        Rule rule = new Rule();
        rule.setRuleString(ruleString);
        rule.setAstNode(ast);
        ruleRepository.save(rule);
        return ast;
    }

    public Node combineRules(List<String> rules) {
        return ASTBuilder.combineAST(rules);
    }

    public boolean evaluateRule(Node ast, RuleData data) {
        return ASTBuilder.evaluateAST(ast, data);
    }
}
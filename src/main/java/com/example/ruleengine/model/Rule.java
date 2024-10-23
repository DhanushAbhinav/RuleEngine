package com.example.ruleengine.model;

import javax.persistence.*;

@Entity
public class Rule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String ruleString;

    @OneToOne
    @JoinColumn(name = "ast_node_id")
    private Node astNode;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRuleString() {
        return ruleString;
    }

    public void setRuleString(String ruleString) {
        this.ruleString = ruleString;
    }

    public Node getAstNode() {
        return astNode;
    }

    public void setAstNode(Node astNode) {
        this.astNode = astNode;
    }
}
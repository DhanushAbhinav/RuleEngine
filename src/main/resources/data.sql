INSERT INTO node (type, value, left_node_id, right_node_id) VALUES
    ('operator', 'AND', NULL, NULL),  -- 1: root operator for rule 1
    ('operator', 'OR', NULL, NULL),   -- 2: first OR in rule 1
    ('operator', 'AND', NULL, NULL),  -- 3: second AND in rule 1
    ('operand', '> 30', NULL, NULL),  -- 4: condition age > 30
    ('operand', '= Sales', NULL, NULL), -- 5: condition department = 'Sales'
    ('operand', '< 25', NULL, NULL),  -- 6: condition age < 25
    ('operand', '= Marketing', NULL, NULL), -- 7: condition department = 'Marketing'
    ('operator', 'OR', NULL, NULL),   -- 8: OR for salary and experience
    ('operand', '> 50000', NULL, NULL), -- 9: condition salary > 50000
    ('operand', '> 5', NULL, NULL);    -- 10: condition experience > 5

-- Linking nodes for rule 1
UPDATE node SET left_node_id = 4, right_node_id = 5 WHERE id = 1;  -- AND linking to age and department
UPDATE node SET left_node_id = 6, right_node_id = 7 WHERE id = 2;  -- OR linking to age and department
UPDATE node SET left_node_id = 2, right_node_id = 3 WHERE id = 1;  -- First AND linking to OR
UPDATE node SET left_node_id = 1, right_node_id = 8 WHERE id = 3;  -- Second AND linking to the first AND
UPDATE node SET left_node_id = 9, right_node_id = 10 WHERE id = 8;  -- OR linking to salary and experience

-- Insert sample rule using AST
INSERT INTO rule (rule_string, ast_node_id) VALUES
    ('((age > 30 AND department = ''Sales'') OR (age < 25 AND department = ''Marketing'')) AND (salary > 50000 OR experience > 5)', 3);

-- Second rule nodes for rule 2
INSERT INTO node (type, value, left_node_id, right_node_id) VALUES
    ('operator', 'AND', NULL, NULL),   -- 11: root operator for rule 2
    ('operand', '> 30', NULL, NULL),   -- 12: condition age > 30
    ('operand', '= Marketing', NULL, NULL), -- 13: condition department = 'Marketing'
    ('operator', 'OR', NULL, NULL),     -- 14: OR for salary and experience
    ('operand', '> 20000', NULL, NULL), -- 15: condition salary > 20000
    ('operand', '> 5', NULL, NULL);     -- 16: condition experience > 5

-- Linking nodes for rule 2
UPDATE node SET left_node_id = 12, right_node_id = 13 WHERE id = 11; -- AND linking to age and department
UPDATE node SET left_node_id = 15, right_node_id = 16 WHERE id = 14; -- OR linking to salary and experience
UPDATE node SET left_node_id = 11, right_node_id = 14 WHERE id = 11; -- AND linking to the OR for the second rule

-- Insert sample rule using AST for rule 2
INSERT INTO rule (rule_string, ast_node_id) VALUES
    ('((age > 30 AND department = ''Marketing'')) AND (salary > 20000 OR experience > 5)', 11);
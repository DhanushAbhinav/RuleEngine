CREATE TABLE rule (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    rule_string VARCHAR(255) NOT NULL,
    ast_node_id BIGINT,
    FOREIGN KEY (ast_node_id) REFERENCES node(id)
);

CREATE TABLE node (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL,  -- 'operator' or 'operand'
    value VARCHAR(255),          -- Optional value for operand nodes
    left_node_id BIGINT,        -- Foreign key for left child
    right_node_id BIGINT,       -- Foreign key for right child
    FOREIGN KEY (left_node_id) REFERENCES node(id),
    FOREIGN KEY (right_node_id) REFERENCES node(id)
);

-- Create Rule table
CREATE TABLE rule (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    rule_string VARCHAR(255) NOT NULL,
    ast_node_id BIGINT,
    FOREIGN KEY (ast_node_id) REFERENCES node(id)
);
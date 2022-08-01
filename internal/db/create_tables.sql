CREATE DATABASE cosmoscout;
\c cosmoscout;

-- chains --
CREATE TABLE IF NOT EXISTS chains (
    id SERIAL NOT NULL,
    chain_id VARCHAR(128) UNIQUE NOT NULL,
    chain_name VARCHAR(128) NOT NULL,
    inserted_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);

-- blocks --
CREATE TABLE IF NOT EXISTS blocks (
    id SERIAL NOT NULL,
    chain_id INT NOT NULL,
    height BIGINT NOT NULL,
    block_hash VARCHAR(256) NOT NULL,
    prev_hash VARCHAR(256) NOT NULL,
    chain_id VARCHAR(32) NOT NULL,
    proposer_address VARCHAR(256) NOT NULL,
    last_commit_hash VARCHAR(256) NOT NULL,
    data_hash VARCHAR(256) NOT NULL,
    validators_hash VARCHAR(256) NOT NULL,
    next_validators_hash VARCHAR(256) NOT NULL,
    consensus_hash VARCHAR(256) NOT NULL,
    app_hash VARCHAR(256) NOT NULL,
    last_result_hash VARCHAR(256) NOT NULL,
    evidence_hash VARCHAR(256) NOT NULL,
    block_time TIMESTAMP NOT NULL,
    inserted_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);
CREATE INDEX idx_blocks_height ON blocks(height);
CREATE INDEX idx_blocks_block_hash ON blocks(block_hash);

-- transactions --
CREATE TABLE IF NOT EXISTS transactions (
    id serial PRIMARY KEY,
    chain_id INT NOT NULL,
    transaction_hash VARCHAR(256) UNIQUE NOT NULL,
    height BIGINT NOT NULL,
    code int,
    code_space VARCHAR(256),
    tx_data TEXT,
    raw_log TEXT,
    info TEXT,
    memo VARCHAR(1024),
    gas_wanted BIGINT NOT NULL,
    gas_used BIGINT NOT NULL,
    tx_date VARCHAR(256),
    inserted_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);
CREATE INDEX idx_transactions_tx_hash ON transactions(transaction_hash);

-- events --
CREATE TABLE IF NOT EXISTS events (
    id serial PRIMARY KEY,
    chain_id INT NOT NULL,
    tx_hash VARCHAR(256) NOT NULL,
    event_type VARCHAR(256) NOT NULL,
    event_key VARCHAR(256) NOT NULL,
    event_value VARCHAR(256) NOT NULL,
    indexed BOOLEAN NOT NULL,
    inserted_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP
);

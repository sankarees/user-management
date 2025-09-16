-- Create the database
CREATE DATABASE userdb;

-- Connect to the database
\c userdb

-- Enable Citus extension
CREATE EXTENSION IF NOT EXISTS citus;

 -- Create user table
CREATE TABLE IF NOT EXISTS users (
     id SERIAL NOT NULL,
     username TEXT NOT NULL,
     email TEXT NOT NULL,
     password TEXT NOT NULL
 );

 -- Shard the table across workers
SELECT create_distributed_table('users', 'id');

-- Insert sample data (optional)

INSERT INTO users (username, email, password) VALUES
('sankar', 'sa@ad.com', 'Welcome@12345'),
('david', 'da@ad.com', 'Welcome@12345');

ALTER SYSTEM SET wal_level = logical;
ALTER SYSTEM SET max_replication_slots = 3;
-- set this value to the number of tables you want to load into elastic
-- for now we only have one table called product

CREATE TABLE IF NOT EXISTS product (
    pk_id SERIAL NOT NULL,
    name varchar(100) NOT NULL,
    PRIMARY KEY ("pk_id")
);

INSERT INTO product (name) VALUES ('test product1');
INSERT INTO product (name) VALUES ('test product2');
INSERT INTO product (name) VALUES ('test product3');
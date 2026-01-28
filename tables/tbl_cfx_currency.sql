DROP TABLE IF EXISTS cfx_currency CASCADE;

CREATE TABLE cfx_currency (
    id UUID PRIMARY KEY,
    code CHAR(3) NOT NULL UNIQUE CHECK (code ~ '^[A-Z]{3}$'),
    name TEXT NOT NULL
);
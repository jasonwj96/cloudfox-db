DROP TABLE IF EXISTS cfx_pricing_plans CASCADE;

CREATE TABLE cfx_pricing_plans (
    id UUID PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    price_micros BIGINT NOT NULL CHECK (price_micros >= 0),
    currency UUID NOT NULL REFERENCES cfx_currency(id)
);
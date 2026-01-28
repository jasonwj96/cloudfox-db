DROP TABLE IF EXISTS cfx_pricing_plans CASCADE;

CREATE TABLE cfx_pricing_plans (
    id UUID PRIMARY KEY default gen_random_uuid(),
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    price_micros BIGINT NOT NULL CHECK (price_micros >= 0), -- 1 USD = 1,000,000 micros
    currency UUID NOT NULL REFERENCES cfx_currency(id)
);

INSERT INTO cfx_pricing_plans (code, name, price_micros, currency)
VALUES
('CFX_FREE', 'Free plan', 1000,     (SELECT id FROM cfx_currency WHERE code = 'USD')),
('CFX_PRO', 'Pro plan', 10000,     (SELECT id FROM cfx_currency WHERE code = 'USD')),
('CFX_ENTERPRISE', 'Enterprise plan', 50000,     (SELECT id FROM cfx_currency WHERE code = 'USD'));

SELECT * from cfx_pricing_plans;
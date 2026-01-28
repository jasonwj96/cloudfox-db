DROP TABLE IF EXISTS cfx_currency CASCADE;

CREATE TABLE cfx_currency (
    id UUID PRIMARY KEY default gen_random_uuid(),
    code VARCHAR(3) NOT NULL UNIQUE CHECK (code ~ '^[A-Z]{3}$'),
    name TEXT NOT NULL
);

INSERT INTO cfx_currency (code, name) VALUES
('USD', 'US Dollar'),
('EUR', 'Euro'),
('GBP', 'British Pound Sterling'),
('JPY', 'Japanese Yen'),
('AUD', 'Australian Dollar'),
('CAD', 'Canadian Dollar'),
('CHF', 'Swiss Franc'),
('CNY', 'Chinese Yuan'),
('HKD', 'Hong Kong Dollar'),
('SGD', 'Singapore Dollar'),
('INR', 'Indian Rupee'),
('BRL', 'Brazilian Real'),
('MXN', 'Mexican Peso'),
('SEK', 'Swedish Krona'),
('NOK', 'Norwegian Krone'),
('DKK', 'Danish Krone'),
('NZD', 'New Zealand Dollar'),
('KRW', 'South Korean Won'),
('ZAR', 'South African Rand');

SELECT * FROM cfx_currency;
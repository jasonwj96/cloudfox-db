DROP TABLE IF EXISTS cfx_accounts CASCADE;

CREATE TABLE cfx_accounts
(
    id                 uuid primary key default gen_random_uuid(),
    username           varchar(32) unique not null
        check (char_length(btrim(username)) >= 3),
    fullname           varchar(255)        not null
        check (char_length(btrim(fullname)) >= 1),
    password_hash      text unique        not null,
    password_salt      bytea unique,
    password_hash_algo text               not null,
    email              varchar(255) unique null
        check (char_length(btrim(email)) >= 3),
    mfa_enabled        bool             default false,
    mfa_type           varchar(30)        null,
    creation_date      timestamptz      default now(),
    phone_number       varchar(20)        null,
    active             bool             default false,
    pricing_plan       uuid references cfx_pricing_plans(id),
    token_balance      bigint default  0
);

CREATE UNIQUE INDEX ux_cfx_accounts_username
    ON cfx_accounts (username);

select * from cfx_accounts;
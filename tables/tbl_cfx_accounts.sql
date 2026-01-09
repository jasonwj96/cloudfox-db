DROP TABLE IF EXISTS cfx_accounts CASCADE;

CREATE TABLE cfx_accounts
(
    id                 uuid primary key default gen_random_uuid(),
    username           varchar(32) unique not null,
    fullname           varchar(50)        not null,
    password_hash      text unique        not null,
    password_salt      bytea unique,
    password_hash_algo text               not null,
    email              varchar(50) unique null,
    mfa_enabled        bool             default false,
    mfa_type           varchar(30)        null,
    creation_date      timestamptz      default now(),
    phone_number       varchar(20)        null,
    active             bool             default false
);


Select *
from cfx_accounts;
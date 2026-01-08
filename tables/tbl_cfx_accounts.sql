DROP TABLE IF EXISTS cfx_accounts CASCADE;

CREATE TABLE cfx_accounts
(
    id                 uuid primary key default gen_random_uuid(),
    username           varchar(32) unique             not null,
    fullname           varchar(50)                    not null,
    password_hash      text unique                    not null,
    password_salt      bytea unique,
    password_hash_algo text                           not null,
    email              varchar(50) unique unique      null,
    mfa_enabled        bool             default false,
    mfa_type           varchar(30)                    null,
    creation_date      timestamptz      default now(),
    phone_number       varchar(20)                    null,
    active             bool             default false
);

INSERT INTO cfx_accounts
(id,
 username,
 fullname,
 password_hash,
 password_salt,
 password_hash_algo,
 email,
 mfa_enabled,
 mfa_type,
 creation_date,
 phone_number,
 active)
VALUES ('85f13ac1-9417-4b05-a577-fc5737bf330d',
        'credfield',
        'Chris Redfield',
        '$argon2id$v=19$m=65536,t=3,p=1$<salt>$<hash>',
        null,
        'argon2',
        'credield@gmail.com',
        false,
        'webauthn',
        '2025-12-08 21:31:55.121884 +00:00',
        '+14155550123',
        true);

Select *
from cfx_accounts;
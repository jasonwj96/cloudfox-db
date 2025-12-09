DROP TABLE IF EXISTS cfx_models;

CREATE TABLE cfx_models
(
    id              uuid primary key default gen_random_uuid() not null,
    userId          uuid references cfx_accounts (id)          not null,
    name            varchar(50)                                not null,
    generatedTokens int              default 0                 not null,
    creationDate    timestamptz      default NOW()             not null,
    fileName        varchar(50)                                not null,
    active          bool             default false             not null,
    lastModified    timestamptz      default NOW()             not null
);
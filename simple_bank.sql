CREATE TABLE accounts (
  id BIGSERIAL PRIMARY KEY,
  owner VARCHAR NOT NULL,
  balance BIGINT NOT NULL,
  currency VARCHAR NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE entries (
  id BIGSERIAL PRIMARY KEY,
  account_id BIGINT REFERENCES accounts(id),
  amount BIGINT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transfers (
  id SERIAL PRIMARY KEY,
  from_account_id BIGINT REFERENCES accounts(id),
  to_account_id BIGINT REFERENCES accounts(id),
  amount BIGINT NOT NULL CHECK (amount > 0), -- Added CHECK constraint for positive amount
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON COLUMN transfers.amount IS 'must be positive';

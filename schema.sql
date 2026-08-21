CREATE TABLE IF NOT EXISTS users (
  telegram_id TEXT PRIMARY KEY,
  telegram_username TEXT,
  balance REAL NOT NULL DEFAULT 0,
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS coin_transactions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  telegram_id TEXT NOT NULL,
  amount REAL NOT NULL,
  type TEXT NOT NULL,
  meta TEXT,
  created_at INTEGER NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_coin_tx_telegram_created
  ON coin_transactions (telegram_id, created_at);

CREATE TABLE IF NOT EXISTS withdrawals (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  telegram_id TEXT NOT NULL,
  telegram_username TEXT,
  amount REAL NOT NULL,
  faucetpay_email TEXT NOT NULL,
  currency TEXT NOT NULL DEFAULT 'USDT',
  status TEXT NOT NULL,
  faucetpay_payout_id TEXT,
  faucetpay_response TEXT,
  created_at INTEGER NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_withdrawals_telegram_created
  ON withdrawals (telegram_id, created_at);

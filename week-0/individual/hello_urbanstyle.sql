-- Minu esimene UrbanStyle päring
-- Nimi: Virko Kuusk
-- Kuupäev: 2026-11-10

CREATE TABLE IF NOT EXISTS team_members (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  role VARCHAR(100),
  week INT DEFAULT 0,
  joined_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO team_members (name, role, week)
VALUES ('Virko Kuusk', 'Andmeanalüütik', 0);

SELECT * FROM team_members ORDER BY joined_at;

WITH ft AS (
  SELECT *
  FROM {{ source('VTC_Paris', 'faits_trajets') }}
),
d AS (
  SELECT
    id_date,
    DATE(`année` , mois, jour) AS date_trajet
  FROM {{ source('VTC_Paris', 'dates') }}
)
SELECT
  ft.*,
  d.date_trajet
FROM ft
LEFT JOIN d ON ft.id_date = d.id_date
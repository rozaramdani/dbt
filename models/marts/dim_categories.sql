{{ config(materialized='table') }}

WITH categories_produits AS (

    SELECT DISTINCT
        categorie_produit
    FROM `lacapsule-496317.TechStore.produits` p

)

SELECT
    ROW_NUMBER() OVER() AS id_categorie,
    categorie_produit
FROM categories_produits




{{ config(alias='dim_categories', materialized='table') }}

SELECT
  id_client,
  nom_client,
  prenom_client,
  email_client,
  id_segment
FROM {{ source('VTC_Paris', 'clients') }}
WHERE email_client IS NOT NULL
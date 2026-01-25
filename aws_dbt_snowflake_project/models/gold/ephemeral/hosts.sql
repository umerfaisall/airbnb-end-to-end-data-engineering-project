{{
  config(
    materialized = 'ephemeral',
    )
}}
with hosts as (
    select 
        host_id,
        HOST_NAME,
        HOST_SINCE,
        RESPONSE_RATE_QUALITY,
        HOST_CREATED_AT
        FROM 
        {{ ref('obt') }}
)
SELECT * FROM hosts

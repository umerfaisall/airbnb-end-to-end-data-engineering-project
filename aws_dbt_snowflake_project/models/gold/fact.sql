{% set congigs = [
    {
        "table" : "AIRBNB.GOLD.OBT",
        "columns" : "GOLD_obt.booking_id, GOLD_obt.listing_id, GOLD_obt.host_id,    GOLD_obt.total_amount,GOLD_obt.service_fee, GOLD_obt.cleaning_fee, GOLD_obt.accommodates,GOLD_obt.bedrooms, GOLD_obt.bathrooms, GOLD_obt.price_per_night,GOLD_obt.response_rate ",
        "alias" : "GOLD_obt"
    },
    { 
        "table" : "AIRBNB.GOLD.DIM_LISTINGS",
        "columns" : "",
        "alias" : "DIM_Listings",
        "join_condition" : "GOLD_obt.listing_id = DIM_Listings.listing_id"
    },
    {
        "table" : "AIRBNB.GOLD.DIM_HOSTS",
        "columns" : "",
        "alias" : "DIM_Hosts",
        "join_condition" : "GOLD_obt.host_id = DIM_Hosts.host_id"
    }
] %}
SELECT
       {{ congigs[0]['columns'] }}

FROM   
     {{ congigs[0].table }} as {{ congigs[0].alias}}
    {% for config in congigs [1:]%}
    LEFT JOIN {{config.table}} as {{config.alias}}
     on {{ config.join_condition }}
    {% endfor %}
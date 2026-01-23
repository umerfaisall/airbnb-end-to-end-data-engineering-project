{%set nights_booked = 3%}
select * from {{ref("bronze_bookings")}}
where NIGHTS_BOOKED > {{nights_booked }}
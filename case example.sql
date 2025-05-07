select * from customer

--simple case ex:

select
      customer_name,age,
case
     when age <= 30 then 'young'

	 when age > 30 and age <= 60 then 'midage'

	 when age > 60 then 'old'
end as age_category

from
	customer;


--function using case:

create or replace function week_days (input_date date)
returns varchar as $$
declare result varchar;
begin
	 case extract ( dow from input_date)
	 	when 1 then -- monday
		 	result := 'early week';
		when 2 then -- tuesday
			result := 'early week';
		when 3 then -- wednesday
			result := 'mid week';
		when 4 then -- thursday
			result := 'late week';
		when 5 then -- friday
			result := 'late week';
		when 6 then -- saturday
			result := 'weekend';
		when 0 then -- sunday
			result := 'weekend';
		else
			result := 'invalid date';
	end case;	

	return result;
end;
$$ language plpgsql;

select week_days ('2025-05-06')

select week_days ('2025-05-10')

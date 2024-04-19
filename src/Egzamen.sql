-- -1. Owner_лердин аттарынын арасынан эн коп символ камтыган owner_ди жана анын уйун(House) чыгар.
SELECT * FROM owner o
                  INNER JOIN houses h on o.id = h.owner_id     ORDER BY  length(o.first_name) + length(o.last_name) LIMIT 1;
-- - 2. Уйлордун баалары 1500, 2000 дин аралыгында бар болсо true чыгар, жок болсо false чыгар.
select price <= 1500 and price >= 2000 as count_price from houses;
-- - 3. id_лери 5, 6, 7, 8, 9, 10 го барабар болгон адресстерди жана ал адрессте кайсы уйлор бар экенин чыгар.
SELECT * FROM addresses a
                  INNER JOIN houses h on a.id = h.address_id
WHERE h.address_id in (5,6,7,8,9,10);
-- - 4. Бардык уйлорду, уйдун ээсинин атын, клиенттин атын, агенттин атын чыгар.
select h.*,concat(o.first_name, ' ', o.last_name) as owner_full_name,concat(c.first_name, ' ', c.last_name)as client_name,a.name as agent_name
from rent_info ret
         join houses h on ret.house_id = h.id
         join owner o on h.owner_id = o.id
         join customers c on ret.customer_id = c.id
         join agencies a on ret.agency_id = a.id;
-- - 5. Клиенттердин 10-катарынан баштап 1999-жылдан кийин туулган 15 клиентти чыгар.
select * from customers c
where date_of_birth > '1999-1-1'
    limit 15;
-- - 6. Рейтинги боюнча уйлорду сорттоп, уйлордун тайптарын, рейтингин жана уйдун ээлерин чыгар. (asc and desc)
select h.house_type, h.rating, o.first_name, ' ', o.last_name  from houses h
                                                                        join owner o on h.owner_id = o.id
order by rating desc;
-- - 7. Уйлордун арасынан квартиралардын (apartment) санын жана алардын баасынын суммасын чыгар.
select h.house_type , count(h.house_type), sum(h.price)  from houses h where house_type = 'House' group by h.house_type;
-- - 8. Агентсволардын арасынан аты ‘My_House’ болгон агентсвоны, агентсвонын адресин жана анын бардык уйлорун, уйлордун        адрессин чыгар.
select a2.name from houses h
                        join addresses a on h.address_id = a.id
                        join agencies a2 on a.id = a2.address_id
where a2.name = 'My House';
-- - 9. Уйлордун арасынан мебели бар уйлорду, уйдун ээсин жана уйдун адрессин чыгар.
select  o.first_name, ' ', o.last_name
from houses h
         join owner o on h.owner_id = o.id
         join addresses a on h.address_id = a.id
where h.furniture = true;

-- - 10.Кленти жок уйлордун баарын жана анын адрессин жана ал уйлор кайсыл агентсвога тийешелуу экенин чыгар.
-- - 11.Клиенттердин улутуна карап, улутуну жана ал улуутта канча клиент жашайт санын чыгар.
select c.nationality, count(c.first_name) as count_customer from customers c
group by c.nationality;
-- - 12.Уйлордун арасынан рейтингтери чон, кичине, орточо болгон 3 уйду чыгар.
select max(rating), min(rating), avg(rating) from houses;
select house_type, rating from houses order by rating limit 3;
-- - 13.Уйлору жок киленттерди, клиенттери жок уйлорду чыгар.
select c.first_name, h.house_type from houses h
                                           inner join rent_info ri on h.id = ri.house_id inner join customers c on c.id = ri.customer_id
where h.house_type is not null and c.first_name is not null;
-- - 14.Уйлордун бааларынын орточо суммасын чыгар.
select avg(price) avg_price
from houses;
-- - 15.‘A’ тамга менен башталган уйдун ээсинин аттарын, клиенттердин аттарын чыгар.
-- - 16.Эн уйу коп owner_ди жана анын уйлорунун санын чыгар.
-- - 17.Улуту Kyrgyzstan уй-булолу customerлерди чыгарыныз.
select * from customers
where nationality = 'Kyrgyz';
-- - 18.Эн коп болмолуу уйду жана анын адресин ал уй кайсыл ownerге таандык ошону чыгарыныз.
-- - 19.Бишкекте жайгашкан уйлорду жана клиентерин кошо чыгарыныз.
-- - 20.Жендерине карап группировка кылыныз.
select gender from customers
group by gender;
-- - 21.Эн коп моонотко ижарага алынган уйду чыгарыныз.
-- - 22.Эн кымбат уйду жана анын ээсин чыгарыныз.
-- - 23.Бир региондо жайгашкан баардык агентстволорду чыгарыныз
select a.* from addresses ad join agencies a  on a.address_id=ad.id where ad.region='Asanbai';
-- - 24.Рейтинг боюнча эн популярдуу 5 уйду чыгар.
select * from houses h order by h.rating  desc  limit 5;
-- - 25.Орто жаштагы owner_ди , анын уйун , уйдун адрессин чыгар.
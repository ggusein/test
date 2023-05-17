SELECT time_in
FROM Trip JOIN Pass_in_trip
ON Trip.id = Pass_in_trip.trip
JOIN Passenger
ON Pass_in_trip.passenger = Passenger.id
WHERE Passenger.name = 'Steve Martin' AND Trip.town_to = 'London'

SELECT DISTINCT name
FROM Passenger 
JOIN Pass_in_trip ON Passenger.id = Pass_in_trip.passenger
JOIN Trip ON Pass_in_trip.trip = Trip.id
WHERE town_to = 'Moscow' AND plane = 'TU-134'

SELECT member_name, status, SUM (amount * unit_price) AS costs
FROM FamilyMembers AS F
JOIN Payments AS P
ON F.member_id = P.family_member
JOIN Goods AS G
ON P.good = G.good_id
JOIN GoodTypes AS T
ON G.type = T.good_type_id
WHERE good_type_name = 'entertainment'
GROUP BY member_name, status

SELECT good_name
FROM Goods
JOIN Payments
ON Goods.good_id = Payments.good
GROUP BY good
HAVING COUNT (good) > 1

SELECT good_type_name, SUM (amount * unit_price) AS costs
FROM GoodTypes AS t
JOIN Goods AS g
ON t.good_type_id = g.type
JOIN Payments AS p
ON g.good_id = p.good
WHERE YEAR(date) = 2005
GROUP BY good_type_name

SELECT MIN (TIMESTAMPDIFF(YEAR,birthday,CURRENT_DATE)) AS year
FROM Student

SELECT MAX (TIMESTAMPDIFF(YEAR,birthday,CURRENT_DATE)) AS max_year
FROM Student AS t
JOIN Student_in_class AS i ON t.id=i.student
JOIN Class AS c ON i.class=c.id 
WHERE c.name LIKE '10%'

SELECT last_name
FROM Teacher AS t
JOIN Schedule AS s ON t.id=s.teacher 
JOIN Subject AS sb ON s.subject=sb.id 
WHERE sb.name = 'Physical Culture'
ORDER BY t.last_name

SELECT MAX (TIMESTAMPDIFF(YEAR,birthday,CURRENT_DATE)) AS max_year
FROM student
WHERE Student.id IN (SELECT student
FROM Student_in_class
JOIN Class ON student_in_class.class = Class.id
WHERE Class.name LIKE '10%')
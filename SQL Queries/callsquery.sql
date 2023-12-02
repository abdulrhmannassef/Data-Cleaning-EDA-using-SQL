USE test;



-----------------------------------------------------------
-----------------------------------------------------------
--WE ARE CONVERTING THE DATA TYPE OF CALL_TIMESATMP

select * 
from calls

select call_timestamp , CONVERT(Date , call_timestamp)
from calls

alter table calls
add call_timestamp_converted Date

update calls
set call_timestamp_converted =  CONVERT(Date , call_timestamp)

alter table calls
drop column call_timestamp


-----------------------------------------------------------
-----------------------------------------------------------




select *
from calls

--HERE AVERAGE DURATION OF CALL IS (25)
select AVG(call_duration_in_minutes)
from calls

-- NUMBER OF ROWS IS 32941
--- SO WE 32,918 RECORDS AND 12 COLUMNS

select COUNT(*) as rows_num
from calls





-----------------------------------------------------------
-----------------------------------------------------------



-- SHOWS THE DISTINCT VALUES
select DISTINCT(sentiment)
from calls

select DISTINCT(reason)
from calls

select DISTINCT(response_time)
from calls

select DISTINCT(channel)
from calls

select DISTINCT(call_center)
from calls



-----------------------------------------------------------
-----------------------------------------------------------

------
--ASK QUESTIONS AND ANSWER IT						
--
--(EDA)	
--
------
select *
from calls



-----------------------------------------------------------
-----------------------------------------------------------



--WHAT IS THE MOST GIVEN RATING?
select DISTINCT(sentiment) , COUNT(sentiment) as count
from calls
group by sentiment
order by count desc
--WE DEDUCE THAT THE MOST GIVEN RATING IS NEGATIVE





-----------------------------------------------------------
-----------------------------------------------------------






-- WHAT IS THE COUNT OF RESPONSE TIMES FOR EACH CALL_CENTER BRANCH?
select DISTINCT(call_center) , COUNT(response_time) as count, response_time
from calls
group by call_center , response_time
order by count desc
--HERE WE ARE CHECKING HOW MANY CALLS ARE WITHIN, BELOW OR ABOVE THE SERVICE-LEVEL -AGREEMENT TIME.
--SO, HERE IS (COUNT) OF (RESPONSE_TIME) FOR EACH (CALL_CENTER)







-----------------------------------------------------------
-----------------------------------------------------------


select *
from calls

-- WHAT IS THE MOST REASON) THAT PEOPLE IS CALLING FOR?
select DISTINCT(reason) , COUNT(reason) as count
from calls
group by reason
order by count desc
-- HERE (THE MOST REASON) THAT PEOPLE IS CALLING FOR IS (BILLING QUESTION)





-----------------------------------------------------------
-----------------------------------------------------------

-- WHAT IS THE MOST USED (CHANNEL / METHOD) ?
select DISTINCT(channel) , COUNT(channel) as count
from calls
group by channel
order by count desc
-- WE DEDUCE THAT PEOPLE PREFER TO CALL THAN USING CHATBOT


-- WHAT IS THE AVG CALL_DURATION FOR EACH (CHANNEL/METHOD) ALONE?
select DISTINCT(channel) ,  AVG(call_duration_in_minutes) as avg_call_duration
from calls
where channel = 'Call-center'
group by channel

select DISTINCT(channel) , AVG(call_duration_in_minutes) as avg_call_duration
from calls
where channel = 'Email'
group by channel

select DISTINCT(channel) , AVG(call_duration_in_minutes) as avg_call_duration
from calls
where channel = 'Chatbot'
group by channel

select DISTINCT(channel) , AVG(call_duration_in_minutes) as avg_call_duration
from calls
where channel = 'Web'
group by channel


-- MINIMUM & MAXIMUM & AVERAGE CALL DURATION
select MIN(call_duration_in_minutes) as minimum_call_duration , MAX(call_duration_in_minutes) as maximum_call_duration ,
AVG(call_duration_in_minutes) as average_call_duration
from calls


-----------------------------------------------------------
-----------------------------------------------------------



-------------
select *
from calls


-- WHAT IS (THE MOST FAVOURITE CHANNEL) FOR (EACH CITY) TO (CALL THE CALL_CENTER)?
SELECT DISTINCT(city) ,  channel,COUNT(channel) as count
FROM calls
GROUP BY city, channel
ORDER BY city , count DESC



-----------------------------------------------------------
-----------------------------------------------------------
use test;

-- FOR (EACH DAY) WHAT IS THE (TOTAL HOURS) FOR (EACH CHANNEL)?
select distinct(call_timestamp_converted)  ,channel ,sum(call_duration_in_minutes)/60 as total_hours_in_day
from calls
group by call_timestamp_converted , channel
order by call_timestamp_converted , total_hours_in_day desc 



-----------------------------------------------------------
-----------------------------------------------------------


select *
from calls



























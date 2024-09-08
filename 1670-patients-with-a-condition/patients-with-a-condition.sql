/* Write your T-SQL query statement below */

-- pattern match for common conditions e.g DIAB100 MYOP, ACNE DIAB100, YFEV COUGH, etc which consist of 2 words of more
-- pattern match for 1 word e.g SADIAB100

select *
from Patients
where conditions like '%DIAB1%' and conditions not like '%[A-Z]DIAB1%'
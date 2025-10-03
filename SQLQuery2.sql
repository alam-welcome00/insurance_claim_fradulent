	SELECT TOP (1000) *
	  FROM [InsuranceFraudDB].[dbo].[claim_intimation]
  
alter table claim_intimation
alter column age varchar(max);


UPDATE claim_intimation
SET Age = NULL
WHERE Age > 120 

alter table claim_intimation
alter column age int);

select distinct age from claim_intimation
order by age

	
-- First set invalid non-numeric 'NaN' or others to NULL
UPDATE claim_intimation
SET Age = NULL
WHERE Age = 'NaN' OR ISNUMERIC(Age) = 0;


-- Now convert Age column datatype
ALTER TABLE claim_intimation
ALTER COLUMN Age INT;

-- Step 1: Truncate decimals by updating Age as integer strings
UPDATE claim_intimation
SET Age = CAST(FLOOR(CAST(Age AS FLOAT)) AS VARCHAR(MAX))
WHERE ISNUMERIC(Age) = 1 AND Age LIKE '%.%';

-- Step 2: Alter the Age column datatype to int
ALTER TABLE claim_intimation
ALTER COLUMN Age INT;


select distinct PremiumAmount from claim_intimation
order by PremiumAmount

-- Example: Update PremiumAmount column to remove '$' and 'INR', then cast to decimal

UPDATE claim_intimation
SET PremiumAmount = 
    LTRIM(RTRIM(
        REPLACE(
            REPLACE(PremiumAmount, '$', ''),
        'INR', '')
    ))
WHERE PremiumAmount IS NOT NULL;

-- Optional: After cleaning, add a new column to store numeric values
ALTER TABLE claim_intimation
ADD PremiumAmountNumeric DECIMAL(18, 2);

-- Update new column with numeric conversion, ignoring invalid entries
UPDATE claim_intimation
SET PremiumAmount = TRY_CAST(PremiumAmount AS DECIMAL(18,2))
WHERE PremiumAmount IS NOT NULL;

-- Now you can work with PremiumAmountNumeric for numeric calculations

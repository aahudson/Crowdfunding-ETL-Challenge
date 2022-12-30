
-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT DISTINCT ON (b.cf_id) b.cf_id, COUNT(*) AS backer_count
FROM backers as b
JOIN campaign as c
ON b.cf_id = c.cf_id
WHERE c.outcome = 'live'
GROUP BY b.cf_id
ORDER BY b.cf_id, backer_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT cf_id
FROM campaign
WHERE outcome = 'live'
ORDER BY cf_id DESC;

-- all the tabels that were loaded before don't work and are showing errors expect backers 
SELECT * FROM campaign; 
SELECT * FROM backers; 
SELECT * FROM contacts;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

-- CREATE TABLE email_contacts_remaining_goal_amount AS
SELECT c.first_name, c.last_name, c.email, ca.goal - ca.pledged AS "Remaining_Goal_Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts AS c
JOIN campaign AS ca
ON ca.contact_id = c.contact_id
WHERE ca.outcome = 'live'
-- GROUP BY c.contact_id, c.first_name, c.last_name, c.email, Remaining_Goal_Amount
ORDER BY "Remaining_Goal_Amount" DESC;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount; 

--  Export the table as email_backers_remaining_goal_amount.csv

COPY (SELECT * FROM email_contacts_remaining_goal_amount) TO '/path/to/email_backers_remaining_goal_amount.csv' WITH (FORMAT CSV, HEADER TRUE);

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 



-- Check the table



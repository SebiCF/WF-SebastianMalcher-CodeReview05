Queries -->



--get all customers
SELECT * FROM `customer`;

--get customer with name "Mark"
SELECT * FROM `customer` WHERE `cus_name` LIKE 'Mark';

--get customer with name "Kenny" and address "Wien"
SELECT * FROM `customer` WHERE `cus_name` LIKE 'Kenny' AND `cus_address` LIKE 'Wien';

--get invoice where invoice amount is over 500
SELECT * FROM `invoice` WHERE `invoice_amount` > 500;

--get customer name and account_id
SELECT cus_name, account_id FROM account INNER JOIN `customer` on customer.cus_id = account.cus_id;

--get customer name, all the inquiries they made and their chosen payment option
SELECT cus_name, inquiry_id, payment_details
FROM inquiry 
INNER JOIN `payment_option` on payment_option.payment_id = inquiry.payment_id
INNER JOIN `account` on account.account_id = inquiry.account_id
INNER JOIN `customer` on customer.cus_id = account.cus_id;

--get locations which are both start and end locations
SELECT start_location.start_location_id, end_location.end_location_id, location_details
FROM location 
INNER JOIN `start_location` on start_location.location_id = location.location_id
INNER JOIN `end_location` on end_location.location_id = location.location_id;

--get report and customer name where the end location was "Station Margareten"
SELECT report.report_id, end_location.end_location_id, location_details, report.inquiry_id, customer.cus_name
FROM report 
INNER JOIN `end_location` on end_location.end_location_id = report.end_location_id 
INNER JOIN `inquiry` on inquiry.inquiry_id = report.inquiry_id INNER JOIN `account` on account.account_id = inquiry.account_id 
INNER JOIN `customer` on customer.cus_id = account.cus_id INNER JOIN `location` on location.location_id = end_location.location_id 
WHERE location.location_details LIKE "Station Margareten";




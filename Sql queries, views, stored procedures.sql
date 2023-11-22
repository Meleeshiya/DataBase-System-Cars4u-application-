/*SQL query for Hire Centre details*/
select hc.centre_name as Centre_Name ,
hc.centre_address as Address ,
hc.centre_postcode as Post_Code,
c.country_name as Country
from hirecentre hc , countryfreqused c
where hc.countrycode = c.countrycode;

/*SQL query for Vehicle Details,*/
select v.v_registrationno as Registration_No, 
v.v_make as Produced_In ,
vc.vc_name as Vehicle_Classification , vc.numberof_passengers as 
Numberof_Passengers, vm.model_name as Model_Name
from vehicle v , vehicleclassification vc , modelx vm
where v.vehicleclassificationid = vc.vehicleclassificationid and v.modelid = 
vm.modelid;

/*Customer transaction details from last year*/
select c.cname as customer_name,
c.c_contactno as contact_no ,
c.c_add1 ||','|| c.c_add2||','||c.c_add3 AS ADDRESS,
c.c_town as town, 
c.c_country as country, 
c.c_postcode as postcode, 
c.c_contactno as ContactNo ,
c.c_email as email,
t.transactionid, 
to_date(to_char(t.t_ts,'mm/dd/yyyy')) AS Transaction_Date,
t.t_amount AS Transaction_amount
from customer c, transactionx t
where c.customerid = t.customerid and t.t_ts between to_date('2021-01-01 
00:00:00', 'yyyy-mm-dd hh24:mi:ss') and 
to_date('2021-12-31 23:00:00 ', 'yyyy-mm-dd hh24:mi:ss')
group by c.cname,
c.c_contactno,
c.c_add1||','||c.c_add2||','||c.c_add3,
c.c_town,
c.c_country,
c.c_postcode,
c.c_contactno,
c.c_email,
t.transactionid,
to_date(to_char(t.t_ts,'mm/dd/yyyy')),
t.t_amount
order by Transaction_Date desc;

/*List hire center details of hire centers that have more than two check 
inspectors and have address include ‘LS’ .*/
select count(chi.checkininspectorid) as inspectorcount,
hc.centre_name as Centre_name, 
hc.centre_address as Address, 
hc.centre_postcode as PostCode
from checkininspector_freqused chi inner join 
hirecentre hc 
on chi.cins_centreid = hc.centreid
where hc.centre_address like '%LS%'
group by hc.centre_name, 
hc.centre_address, hc.centre_postcode
having count(chi.checkininspectorid) >= 2 ;

/*List down the check-in inspector details of inspector who has highest wage and 
lowest wage as their wage*/
select chf.checkininspector_name || 'check_in inspector get the highest wage' 
as Cusdetails_of_HighestaandLowestSal,
chf.checkininspector_name as Inspector_Name, 
chf.checkininspector_phone as Contact_number, 
chi.checkininspector_dob as Birth_Date, 
chi.checkininspector_address as Address,
chi.checkininspector_ninumber as Ni_number

from checkininspector_freqused chf, checkininspector_info chi
where chf.checkininspectorid = chi.checkininspectorid and 
chf.checkininspector_salary IN (select max(checkininspector_salary) from 
checkininspector_freqused)
union
select chf.checkininspector_name || 'check_in inspector get the lowest wage' 
as Cusdetails_of_HighestaandLowestSal,
chf.checkininspector_name as Inspector_Name, 
chf.checkininspector_phone as Contact_number, 
chi.checkininspector_dob as Birth_Date, 
chi.checkininspector_address as Address,
chi.checkininspector_ninumber as Ni_number
from checkininspector_freqused chf, checkininspector_info chi
where chf.checkininspectorid = chi.checkininspectorid and 
chf.checkininspector_salary IN (select min(checkininspector_salary) from 
checkininspector_freqused)

/*Vehicle classification and their used dates.*/
select 
v.v_registrationno as RegistrationNo,
v.v_color as Color,
vc.vc_name as Vehicle_classification,
vm.model_name as Vehicle_model,
chf.checkininspector_name as Inspector_name,
chf.checkininspector_phone as Inspector_phone,
chi.checkininspector_address as Inspector_address,
chi.checkininspector_ninumber as Inspector_ninumber
from vehicle v, checkininspector_freqused chf,checkininspector_info chi , 
vehicle_checkininspector vchins,vehicleclassification vc, modelx vm
where v.vehicleid = vchins.vehicleid and chf.checkininspectorid = 
vchins.checkininspectorid and v.vehicleclassificationid = 
vc.vehicleclassificationid and
v.modelid = vm.modelid and chf.checkininspectorid= chi.checkininspectorid 
and chf.checkininspector_salary> 600
group by v.v_registrationno,
v.v_color,
vc.vc_name,
vm.model_name,
chf.checkininspector_name,
chf.checkininspector_phone,
chi.checkininspector_address,
chi.checkininspector_ninumber

/*Vehicle classifications and checked inspector details*/
Select
v.v_registrationno,
v.v_color,
vc.vc_name,
vm.model_name,
chf.checkininspector_name,
chf.checkininspector_phone
from vehicle v, checkininspector_freqused chf,vehicle_checkininspector 
vchins,vehicleclassification vc, modelx vm
where v.vehicleid = vchins.vehicleid and chf.checkininspectorid = 
vchins.checkininspectorid and v.vehicleclassificationid = 
vc.vehicleclassificationid and
v.modelid = vm.modelid;

/*code for charts*/
/*Customer count for each Hire Center*/
select count(ha.customerid) AS CUSTOMERCOUNT,
hc.centre_name AS CENTRE_NAME
from hirearrangement ha,hirecentre hc
where ha.start_centreid=hc.centreid
group by hc.centre_name;

/*Revenue from cooperate customers over the last year*/
select sum(t.t_amount) AS Revenue, 
c.cname AS Company
from hirearrangement ha, 
customer c,
transactionx t
where ha.customerid = c.customerid and 
ha.transactionid = t.transactionid and c.c_type='Company' and 
c.c_country= 'United Kingdom' and 
t.t_ts between 
to_date('2015-01-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss') and to_date('2021-
12-31 23:00:00 ', 'yyyy-mm-dd hh24:mi:ss')
group by c.cname;


/*Revenue from Individual customers in last years*/
select sum(t.t_amount) AS Revenue, 
c.cname AS Customer
from hirearrangement ha,
customer c, 
transactionx t
where ha.customerid = c.customerid and
ha.transactionid = t.transactionid and c.c_type='Individual' and t.t_ts between 
to_date('2015-01-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss') and to_date('2021-
12-31 23:00:00 ', 'yyyy-mm-dd hh24:mi:ss')
group by c.cname;

/*Check in inspector count for each Hire Center*/
select count(chi.checkininspectorid) as inspectorcount, 
hc.centre_name as Centre_name
from checkininspector_freqused chi, hirecentre hc
where chi.cins_centreid = hc.centreid
group by hc.centre_name;

CREATE OR REPLACE FORCE VIEW "COUNTRY_DETAILS" ("COUNTRY_NAME", 
"COUNTRY_CONTINENTNAME") AS 
 SELECT country_name, COUNTRY_CONTINENTNAME
 FROM countryfreqused cf, countryinfo ci
 WHERE cf.countrycode = ci.countrycode
/
Hire Charges rates in different Countries:
CREATE OR REPLACE FORCE VIEW "HIRECHARGES_OFCOUNTRIES" 
("COUNTRY_NAME", "VC_NAME", "HIRECHARGE_RATE") AS 
 SELECT cf.country_name, vc.vc_name, cvc.hirecharge_rate
 FROM countryfreqused cf, vehicleclassification vc, 
country_vehicleclassification cvc
 WHERE cvc.countrycode = cf.countrycode and vc.vehicleclassificationid = 
cvc.vehicleclassificationid
/

/*Adjust check in inspector salary form code for */
create or replace PROCEDURE adjust_checkininspector_salary(
 inspector_id IN checkininspector_freqused.checkininspectorid%TYPE,
 inspector_name IN 
checkininspector_freqused.checkininspector_name%TYPE,
 salary_increment_percentage IN NUMBER
) IS
BEGIN
UPDATE checkininspector_freqused
SET checkininspector_salary = checkininspector_salary + 
checkininspector_salary * salary_increment_percentage / 100
WHERE checkininspectorid = inspector_id;
END;

/*Customer discounts increase form-based procedure code*/
create or replace PROCEDURE adjust_customerdiscount(
 customer_id IN discount.customerid%TYPE,
 discount_incresed_percentage IN NUMBER
) IS
BEGIN
UPDATE discount
SET discount_percentage = discount_percentage + discount_percentage * 
discount_incresed_percentage / 100
WHERE discount.customerid = customer_id;
END;

/*Adjust maximum claim amount form-based procedure code*/
create or replace PROCEDURE adjust_insuranceMaxClaimAmount(
 insurance_id IN insurance.insuranceid%TYPE,
 maximum_claimamount_increasedByPercentage IN NUMBER
) IS
BEGIN
UPDATE insurance
SET maximumclaimamount = maximumclaimamount + maximumclaimamount 
* maximum_claimamount_increasedByPercentage / 100
WHERE insurance.insuranceid = insurance_id;
END;

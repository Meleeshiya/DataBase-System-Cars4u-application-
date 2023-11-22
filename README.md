# DataBase-System-Cars4u-application-
These are the assumptions that we made when creating our EERD.

• Transaction for a hire arrangement can only be done by one payment method (single 
transaction).
• Individual customer can have individual hire arrangement which reserves a single 
vehicle whereas cooperate customers can have a cooperate hire arrangement which 
reserves either a single vehicle or a fleet.
• Fleet has a specific set of drivers assigned to it.
• Hire arrangement invoice amount depends on the start hire centre located country’s 
rate for the vehicle classification and vehicle model.
• Cars4u is responsible for the insurance arrangements for some individual customers
for their individual hire arrangements only.
• Some individual customers request insurance for their individual hire arrangements 
and CARS4U is only responsible for those insurance.
• Some customers can have discounts (Cooperate customers maintain loyalty discounts 
for individual vehicle hires and fleet discount for fleet hires)

Here we have written down the attributes and the identifiers for each table.

Customer (customerid, c_name, c_join date, c_addr1, c_add2, c_add3, c_town, c_country, 
c_postcode, c_email, c_contactno)
Individual (customerid, ic_dob, ic_title, ic_forenames, ic_surname, ic_ninumber)
Company (customerid, cc_registrationumber)
Hire Arrangement (hirearrangementid, agreed_start_timestamp, agreed_return_timestamp,
actual_start_timestamp, actual_return_timestamp, ha_status, starting_milage, end_milage)
IndividualHireArrangement (hirearrangementid)
Cooperate Hire Arrangement (hirearrangementid)
Transaction (transactionid, transaction_timestamp, transaction_amount, t_status)
CreditCard (creditcardid, card_number)
RegionalOffice (regionalofficeid, office_name, ro_addr1, ro _add2, ro _add3, ro _town, ro 
_country, ro _postcode, ro_phone, ro_email)
Insurance (insuranceid, insurance_period, maximumclaimamount, coveredParties)
Discount (disid, dis_type, dis_percentage, dis_timestamp)
Country (country_code, cntry_name, cntry_continentname)
Invoice (invoiceid, description, in_amount, in_timestamp)
HireCentre (centreid, hc_addr1, hc _add2, hc _add3, hc_town, hc_country, hc_postcode)
Vehicle (vehicleid, v_color, v_registrationno)
VehicleClassification (vehicleClassificationid, vc_name, noofpassengers)
Model (modelid, model_name)
Driver (driverid, d_name, d_dateofbirth, d_phone, d_address, d_availability, d_gender, 
d_ninumber)
Chcekininspector (chcekininspectorid, ci_name, ci_dob, ci_phone, ci_address, ci_ninumber)
Fleet (fleetid, noofvehicles, f_status)


Validation Questions

1. Number of hatchback cars available at Leeds hire centres?
2. List ‘ABC’ cooperate customers’ phone number and email address?
3. List all the customers who took a longer time than agreed to return the vehicle?
4. List all the transactions and their details of last week.
5. List all the check in inspectors who works in hire centres at Paris?
6. List all invoices and their details issued yesterday.
7. Who are the customers that has a loyalty discount as well as fleet discount?
8. What are the different vehicle models in the fleet, in which driver X’s pool is assigned in 
to?
9. Name all the individual customers who has requested insurance security for the vehicle 
they reserved.
10. List all customers who handed over the vehicle for the same hire centre as 
The check in hire centre.

A definition for each entity

This is the conceptual stage of database development lifecycle. Relational database design 
starts by recognizing required entities. Entity can be a person, place, event or a thing that we 
needed to store information about. We intend to store information about these entities. So 
here we have to clearly understand what is the requirement and what are the entities we 
have to define for collecting information. We can store information in attributes those are 
like characteristics of an entity. In this stage we have to identify entities for our EERD.
When we read the CARS4U description it is clear that we need to store data about Customers, 
CARS4U is a renting company who rents vehicles to customers, So, customer is an entity with 
c_name, c_join date, c_addr1, c_add2, c_add3, c_town, c_country, c_postcode, c_email, 
c_contactno, these attributes. In the description there are two types of customers 
1. Individual
2. Company
So those two are sub entities of the super entity Customer.
Then there should be an entity called Hire Arrangement where we keep all the details related 
to the hires. Hire Arrangement also have different set of attributes such as 
agreed_start_timestamp, agreed_return_timestamp, actual_start_timestamp, 
actual_return_timestamp, ha_status, starting_milage, end_milage. Here Individual customer 
can hire an individual vehicle whereas company can hire individual or a fleet (group of 
vehicles). So here we thought of managing individual and company hire arrangement 
separately. So here we introduce Individual hire arrangement and company hire 
arrangement. Individual hire arrangement can have individual vehicles whereas company hire 
arrangement can have a vehicle or a group of vehicles.
Customers pay their payment via a transaction; we need to store transaction details also. It 
also has set of attributes such as transactionid, transaction_timestamp, transaction_amount, 
t_status. Some customers use credit card to do their payment, we need to keep credit card 
details also for credit card transactions. Credit Card also becomes an entity because of that.
Company has their own regional offices and they conduct hire arrangements of companies, 
in our database we need an entity called regional office because it handles the hire 
arrangements of companies. It also has a different set of attributes. Those are office_name, 
ro_addr1, ro _add2, ro _add3, ro _town, ro _country, ro _postcode, ro_phone, ro_email.
CARS4U give insurance only for individual customers. Because the Company should give 
insurance for their drivers. So, we need an entity called insurance to store insurance details 
such as insurance_period, maximumclaimamount, Insurance_description.
Customers can have discounts in this system, If the rent is done on a individual vehicle 
Customer type does not matter both can have loyalty discounts for some hire arrangements. 
Also, there’s a special discount for company customers called Fleet Discount. We should have 
an entity called Discount to keep that info.
Since Company can hire fleet (Group of vehicles) we need a entity for that to keep Fleet hire 
details.
Since company hire vehicles and there should be an entity to store info of drivers who driving 
those vehicles. In here Driver entity only have relationships with company hire arrangements 
they have no connection with individual hire arrangements.
Hire arrangements are starts and ends at hire centres so we need to store information about 
hire centre, it is also an entity.
Different countries have different hire charges based on the vehicle classifications. So, we 
need to keep track of different countries and their hire charges based on vehicle classification. 
We need an entity for country and for vehicle classification. Since those two has many to 
many cardinalities we can create another table which include country code and vehicle 
classification id and there we can store hire charges for each.
Vehicle has a vehicle classification and has a model. There are many vehicles with different 
vehicle classifications as well as different models, so we thought to consider vehicle 
classification and model as two different entities. Because in description also it says one 
vehicle classification can have different models.
Each hire centres have check in inspectors to check the vehicle condition after hire ends. So, 
we need an entity for those inspectors.

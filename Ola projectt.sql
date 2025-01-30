create database Ola;
use Ola;


#1.  Retrieve all successful bookings
Create view Successful_Bookings as
Select * from bookings 
where Booking_Status = 'Successful';

Select * from Successful_Bookings;


#2.  Find the average ride distance for each vehicle type
Create view avg_ride_distance_for_each_vehicle as
Select Vehicle_Type, avg(Ride_Distance)
as Avg_distance from bookings
group by Vehicle_Type;

Select * from avg_ride_distance_for_each_vehicle;


#3. Get the total number of cancelled rides by customers
Create view cancelled_rides_by_customers as
Select count(*) from bookings where Booking_Status = 'Cancelled by Customer';

Select * from cancelled_rides_by_customers;


#4. List the top 5 customers who booked the highest number of rides
Create view top_5_customers as
Select Customer_ID, count(Booking_ID) as total_rides from bookings
group by Customer_ID order by total_rides desc limit 5;

Select * from top_5_customers;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues

Create view rides_cancelled_by_drivers_P_C_issues as
Select count(*) from bookings 
where Reason_for_cancelling_by_Driver = 'Personal & Car related issues';

Select * from rides_cancelled_by_drivers_P_C_issues;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings

Create view max_min_driver_rating as
Select max(Driver_Ratings) as Max_Rating,
min(Drive_Ratings) as Min_Ratings
from bookings where Vechile_Type = 'Prime Sedan';

Select * from max_min_driver_ratings;


#7. Find the average customer rating per vehicle type

Create view avg_cust_rating as 
Select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings group by Vehicle_Type;


Select * from avg_cust_rating;


#8. Calculate the total booking value of rides completed successfully

Create view total_successful_ride_value as
Select sum(Booking_Value) as Total_Booking from bookings
where Booking_Status = 'Successful';

Select * from total_successful_ride_value;

#9.  List all incomplete rides along with the reason

Create view incomplete_rides_reason as
Select Booking_Id, Incomplete_Rides_Reason from bookings where Incomplete_Rides ='1';

Select * from incomplete_rides_reason;







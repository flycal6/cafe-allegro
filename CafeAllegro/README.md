# CAFE ALLEGRO GROUP PROJECT

## Chris Bartkewicz
## Jackie McKenna
## Brian Thomas
## Stanton Viaduc

## Inspiration
### Our website was inspired by a neighboring suite, Cafe Allegro, a quaint restaurant that serves primarily American-style dishes.
### Nowadays, most restaurants have a website, but not Cafe Allegro.  
### Outside of a handful Google and Yelp reviews, Cafe Allegro has a small online footprint. 

## Process and Progress #1
### Our first step was to build our database, cafeDB.sql. 
### After agreeing on the schema and table relationships (one-to-many, many-to-one, or many-to-many), we developed our minimal viable product (MVP). 

## MVP
### Our database and website would mirror Cafe Allegro's menu with additional perks and functionality. 
### One of the perks was for the website to accept online orders.
### The initial page would only display the menu items. 
### In order for the user to create an order, he or she would need an account. 
### As a customer, the only permission allowed was to add items into a cart and order. 

### The administrator, on the other hand, had the ability to add, update, and/or delete any item on the menu, while adding items to a cart and completing an order. 

### After each order, automatically, the customer and administrator would receive reward points that would be summed up and saved in their account/profile.
### Every dollar spent, would equal one reward point.
### If the user decided to redeem his or her reward points, one reward point would subtract 10 cents off the overall total. Though, in order to use the 
### reward, the user would need at least 10 reward points. 

## Process and Progress #2
### After reaching a consensus on our MVP, our team worked on building our plain old java objects (POJO) based on our schema and table. 
### From our POJOs, we created our data access objects (DAO), which would be utilized by our controllers. 
### Simultaneously, we started working on our home page or index.jsp to further understand the intricacies of our website. 

## Challenges, Learning Curve, and Future Tips
### Using SQL keywords as our table name or title
### Using non-database tables or POJOs and incorporating them into our dynamic web project. Understanding when or why data would be persisted or not. 
### Formatting numbers. Turning a price from a double variable to a string object. 
### Project expanded knowledge on AWS, Tomcat, and Git.

## Stretch Goals
### Administrator can add additional administrative accounts.
### Customer update and/or delete his or her cart. 
### Email notifying business of online food request

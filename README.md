# shopnowat
Open platform to build shopping cart

This is a platform to all the shop keepers and the shoppers to come together for the intention to buy and sell products.
The admin of the platform can add the shop keepers to the system. 
The shopkeepers then can add their products and price it accordingly.
When an order is placed by the customer/shopper, then an email will be sent to the shopper. It is the resposibility of the shopkeeper to deliver the products.
The bills will be generated for each purchase.
The platform hosting the service can monitor the billing history across the shopkeepers and can get the service charge as per the agreed terms.



Follow the below steps to deploy the platform
----------------------------------------------

1) change build.properties file according to your environment

2) build using the ant script
   place the catalina-ant.jar [catalina-ant-5.5.23.jar] in the class path.

3) change mysql username and password according to the build.properties file - for begin with keep the same password without modification.

4) run ant dbTests to create the mysql tables 

5) create the database inside mysql using the below command.
   create database shopnowatdb;

6) run ant dbTests

7) run ant deploywar
shopnowat.war will be created.

NOTE:
The project works fine with the below 3pp versions

apache-activemq-5.13.2
apache-ant-1.9.6
jboss-7.1.1
apache-ant-1.9.6-bin
mysql-installer-community-5.7.11.0
java version 1.7


URL
http://localhost:8080/shopnowat

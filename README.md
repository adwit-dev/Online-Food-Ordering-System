# Online Food Delivery System

## Description
This project is an Online Food Delivery System developed using Java and Spring Boot. The system enables users to browse restaurant menus, add items to their cart, and place orders for home delivery. It features user authentication, order tracking, and payment integration.

## Features
- **User Registration and Login**: Secure authentication system for users.
- **Browse products**: Users can view a list of their menus.
- **Shopping Cart**: Users can add items to their cart and modify order quantities.
- **Order Placement**: Users can place orders, which are then processed and delivered.

- **Payment System**: Integration with payment gateways for processing transactions.

## Technologies Used
- Java 
- Spring Boot 
- Maven
- MySQL

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
What things you need to install the software:
- JDK 17
- Maven
- MySQL Server

### Installing
A step by step series of examples that tell you how to get a development environment running.

 **Install dependencies:**

<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jpa</artifactId>
		</dependency>

		<dependency>
			<groupId>com.mysql</groupId>
			<artifactId>mysql-connector-j</artifactId>
			<scope>runtime</scope>
		</dependency>


		<dependency>
			<groupId>org.apache.tomcat.embed</groupId>
			<artifactId>tomcat-embed-jasper</artifactId>
			<scope>provided</scope>
		</dependency>
<dependency>
    <groupId>org.eclipse.jetty</groupId>
    <artifactId>glassfish-jstl</artifactId>
    <version>11.0.18</version>
</dependency>

<dependency>
    <groupId>jakarta.servlet.jsp.jstl</groupId>
    <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
    
</dependency>


4. **Set up MySQL database:**
- Create a new database named `project`
- Import the `project.sql` file to set up tables

5. **Update application properties:**
- Navigate to `src/main/resources/application.properties`
- Update the database URL, username, and password

6. **Run the application:**




The server will start at <http://localhost:8080>.




## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.



## Authors
- ADWIT ROUT

## Acknowledgments
- Hat tip to anyone whose code was used
- Inspiration
- etc




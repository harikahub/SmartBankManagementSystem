# 🏦 SmartBank Management System

### A Digital Banking Web Application built with Java & Spring

**SmartBank** is a full-stack banking web application that simulates real-world digital banking workflows. It provides customers with secure account access, fund transfers, transaction tracking, PDF statements, email services, and loan management, along with dedicated administrative features.

---

## 🚀 What SmartBank Offers

### 👤 Customer Banking

* Email OTP-based registration
* Secure login
* Personalized banking dashboard
* Account and balance management
* Fund transfer using **Account Number or UPI ID**
* Mini statement with recent transactions
* Downloadable PDF bank statements
* Email bank statements
* Loan application and status tracking

### 💸 Fund Transfer

SmartBank supports practical fund-transfer workflows with:

* Account Number based transfer
* UPI ID based transfer
* Balance validation
* Sender and receiver transaction records
* Automatic balance updates
* Credit and debit transaction tracking

### 🧾 Digital Bank Statements

Customers can generate professional PDF statements containing:

* Account summary
* Transaction details
* Credit / Debit information
* Balance after each transaction
* Indian currency formatting
* Transaction dates
* Sender / receiver information

Statements can also be sent directly through email.

### 🏦 Loan Management

Customers can:

* Apply for loans
* View submitted applications
* Track loan status

Administrators can:

* Review applications
* Approve loans
* Reject loans
* Monitor loan-related information

### 👨‍💼 Admin Management

The admin module provides:

* Customer management
* Loan management
* Loan approval / rejection
* Transaction and banking reports
* Monthly reports
* Annual reports
* Overall banking information

---

## 🛠️ Tech Stack

| Layer          | Technologies                |
| -------------- | --------------------------- |
| **Language**   | Java                        |
| **Web Layer**  | Spring MVC, JSP             |
| **Backend**    | Spring ORM, Spring Data JPA |
| **ORM**        | Hibernate                   |
| **Database**   | MySQL                       |
| **Frontend**   | HTML5, CSS3                 |
| **Build Tool** | Maven                       |
| **Server**     | Apache Tomcat 10            |
| **IDE**        | Eclipse                     |

---

## 🏗️ Architecture

SmartBank follows a layered application architecture:

```text
                 ┌──────────────────────┐
                 │     JSP / HTML / CSS │
                 └──────────┬───────────┘
                            ↓
                 ┌──────────────────────┐
                 │   Spring MVC Layer   │
                 │    Controllers       │
                 └──────────┬───────────┘
                            ↓
                 ┌──────────────────────┐
                 │    Service Layer     │
                 │   Business Logic     │
                 └──────────┬───────────┘
                            ↓
                 ┌──────────────────────┐
                 │   DAO / Repository   │
                 └──────────┬───────────┘
                            ↓
                 ┌──────────────────────┐
                 │    JPA / Hibernate   │
                 └──────────┬───────────┘
                            ↓
                 ┌──────────────────────┐
                 │    MySQL / MariaDB   │
                 └──────────────────────┘
```

This structure separates presentation, business logic, and database operations, making the application easier to maintain and understand.

---

## 💳 Core Banking Workflow

```text
Customer Registration
        ↓
Email OTP Verification
        ↓
Secure Login
        ↓
Banking Dashboard
        ↓
 ┌──────────────┬──────────────┬──────────────┐
 ↓              ↓              ↓
Transfer     Transactions     Loans
 ↓              ↓              ↓
Balance      PDF Statement   Loan Status
Update       + Email         Tracking
```

---

## 🔐 Configuration & Security

Sensitive credentials are **not stored in the public repository**.

The GitHub version contains placeholder values for:

```properties
db.username=root
db.password=YOUR_DB_PASSWORD

mail.username=YOUR_EMAIL
mail.password=YOUR_APP_PASSWORD
```

For local execution, configure your own database and email credentials in the local `application.properties` file.

> **Never commit real database passwords, email passwords, or application passwords to GitHub.**

---

## ▶️ Running the Project

### Prerequisites

Make sure you have:

* Java JDK
* Eclipse IDE
* Maven
* MySQL / MariaDB
* Apache Tomcat 10
* Git

### Clone the Repository

```bash
git clone https://github.com/harikahub/SmartBankManagementSystem.git
```

### Setup

1. Import the project into **Eclipse as a Maven Project**.
2. Create and configure the MySQL / MariaDB database.
3. Add your local database credentials.
4. Add your local email configuration for OTP and email statements.
5. Configure **Apache Tomcat 10** in Eclipse.
6. Deploy and run the application.

---

## 📌 Project Highlights

* 🔐 Email OTP verification
* 🏦 Customer & Admin modules
* 💸 Account / UPI fund transfers
* 💰 Real-time balance updates
* 📊 Transaction management
* 🧾 Professional PDF statements
* 📧 Email statement delivery
* 🏷️ Loan application workflow
* 📈 Monthly & annual banking reports
* 🇮🇳 Indian currency formatting
* 🖥️ Responsive banking dashboard

---

## 🎯 Project Purpose

SmartBank was developed as a practical **Java Full Stack project** to implement real-world banking workflows using enterprise Java technologies.

The project focuses on applying concepts such as:

* Object-Oriented Programming
* MVC architecture
* Spring MVC
* JPA / Hibernate
* Database relationships
* Transaction management
* Session management
* Email integration
* PDF generation
* Role-based application features

---

## 👩‍💻 Developer

### Harika Akula

**Aspiring Java Full Stack Developer**

Focused on building practical applications using **Java, Spring, Hibernate, JSP, and MySQL**.

---

## ⭐ SmartBank Management System

**A practical digital banking application built to bring together customer banking, transactions, statements, loans, email services, and administration in one system.**

**Built with Java • Spring MVC • Hibernate • JSP • MySQL**

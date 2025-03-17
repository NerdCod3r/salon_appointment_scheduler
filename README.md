# 🏠 Salon Appointment Scheduler

A command-line **Salon Appointment Scheduler** built as part of freeCodeCamp’s **Relational Database Certification**. This project demonstrates SQL database management, Bash scripting, and PostgreSQL interactions.

---

## 📌 Features

- Allows customers to book appointments.  
- Saves customer information in a PostgreSQL database.  
- Uses a Bash script to handle user interaction via the terminal.  
- Ensures persistent data storage with relational database design.

---

## 🛠️ Technologies Used

- **Bash** (for scripting user interactions)  
- **PostgreSQL** (for database management)  

---

## 🚀 How to Run

### Prerequisites
Ensure you have **PostgreSQL** installed on your system.  

### Steps

1. **Clone the repository**  
   ```bash
   git clone <repository-url>
   cd salon-appointment-scheduler
   ```

2. **Set up the database**  
   Open PostgreSQL and run the `salon.sql` script:  
   ```sql
   \i salon.sql;
   ```

3. **Run the script**  
   ```bash
   bash salon.sh
   ```

---

## 📂 Project Structure

```
📁 salon-appointment-scheduler
 ┣ 📄 salon.sh       # Main script for scheduling appointments
 ┣ 📄 salon.sql      # Database schema setup
 ┗ 📄 README.md      # Project documentation
```

---

## 🎯 freeCodeCamp Certification

This project is a requirement for freeCodeCamp’s **Relational Database Certification**, designed to improve SQL proficiency through hands-on experience.

---

## 🤝 Contributing

Feel free to **fork** the repository, open **issues**, or submit **pull requests** for improvements.

---

## 📜 License

This project is licensed under the **MIT License**.

# 📚 University Database Schema
### Relational Academic Model — MySQL Implementation

This repository contains a structured and well-designed relational database model representing a simplified academic environment. The goal is to provide a clean, normalized schema suitable for learning, analysis, and academic projects.

---

## 🏛 Project Overview

The database models a small university ecosystem with clearly defined entities:

- **Departments**
- **Knowledge Areas**
- **Schools**
- **Subjects**
- **Facilitators**

Everything is connected through proper relational design, ensuring data integrity and logical flow across the system.

---

## 🔗 How the Model Works

The structure follows real-world academic logic:

- A **Department** oversees multiple Knowledge Areas.
- Each **Knowledge Area** contains Subjects and assigned Facilitators.
- A **Subject** can be taught across different Schools (many-to-many).
- A **Facilitator** may teach multiple Subjects (many-to-many).

Foreign keys maintain all relationships, and the schema is fully normalized to avoid redundancy.

---

## 🎯 Purpose of the Project

This SQL model was built as an academic exercise focused on:

- Understanding relational structures  
- Practicing MySQL schema design  
- Applying normalization rules  
- Modeling administrative processes  
- Testing queries and CRUD operations

Perfect for students, instructors, and anyone practicing relational database design.

---

## 🧪 Included Sample Data

Sample data is provided for:

- Departments  
- Knowledge Areas  
- Schools  
- Subjects  
- Facilitators  
- Relationship tables  

You can run tests immediately after importing the schema.

---

## ⚙️ How to Use

1. Import the `modeloER.sql` file into MySQL or MariaDB.  
2. The database **universidad** will be created automatically.  
3. All tables and demo records will be ready to query.

_No additional configuration required._

---

## 📑 License

This project is released under the **MIT License**, allowing modification, reuse, and distribution.

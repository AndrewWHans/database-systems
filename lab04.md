# Learning Management System (LMS) Database  
**Project Proposal – Phase 0**

---

## 1. Document Title & Summary

**System Name:** Learning Management System (LMS) Database  
**Student:** Andrew Hanson  
**Course:** Database Systems  
**Semester:** Spring 2026  

### Summary
This project proposes the design of a relational database system inspired by existing Learning Management Systems such as Canvas. The database will support core academic functionality including course management, user enrollment, assignment creation, submission tracking, and grading. The system focuses on structured data storage, data integrity, and well-defined relationships to support common academic workflows in a university environment.

---

## Version / Revision History

| Date       | Version | Note |
|------------|---------|------|
| 2026-02-09 | 1.0.0   | Initial Phase 0 project proposal |

**Versioning Scheme:**  
- **Major** – New project phase  
- **Minor** – Significant content updates  
- **Tiny** – Formatting or minor corrections  

---

## 2. Table of Contents

1. Document Title & Summary  
2. Table of Contents  
3. Introduction  
4. Project Scope  
5. Intended Audience  
6. Preliminary System Design  
7. Preliminary Entities, Attributes, and Relationships  

---

## 3. Introduction

### Purpose
The purpose of this project is to design a database system that manages academic data for a Learning Management System. The database will store and organize information related to users, courses, enrollments, assignments, submissions, and grades. This system will serve as the foundational data layer that supports academic operations such as course delivery, assessment tracking, and performance reporting.

### Motivation
Learning Management Systems are widely used in higher education and require reliable data models to ensure accuracy, consistency, and scalability. Designing a database based on a real-world LMS provides a meaningful opportunity to apply database design principles to a realistic and complex system.

---

## 4. Project Scope

### In Scope
- User accounts for students and instructors  
- Course and section management  
- Student enrollment records  
- Assignments and due dates  
- Student submissions  
- Grading and instructor feedback  

### Out of Scope
- User authentication and security implementation  
- Frontend or user interface design  
- File storage for uploaded submissions  
- Real-time notifications or messaging systems  

---

## 5. Intended Audience

- **Students:** Submit assignments, view grades, and track academic progress  
- **Instructors:** Manage courses, create assignments, and evaluate student work  
- **Administrators:** Maintain course offerings and enrollment records  

---

## 6. Preliminary System Design

The database will be designed as a relational system with clearly defined entities and relationships. Data normalization principles will be applied to minimize redundancy and maintain data integrity. Many-to-many relationships will be resolved using associative entities, and constraints will be defined to enforce valid participation in relationships.

This design represents an initial conceptual model and will be refined in later project phases through ER diagrams, EER modeling, and relational schema mapping.

---

## 7. Preliminary Entities, Attributes, and Relationships

> This section represents a first-pass design and is expected to evolve as the project progresses.

---

### Entity: User
- **Attributes:**  
  - UserID (Primary Key)  
  - Name  
  - Email  
  - Role (Student, Instructor)

---

### Entity: Course
- **Attributes:**  
  - CourseID (Primary Key)  
  - CourseName  
  - CourseCode  
  - Semester  

---

### Entity: Enrollment
- **Attributes:**  
  - EnrollmentID (Primary Key)  
  - EnrollmentDate  
- **Relationship:**  
  - User ↔ Course (Many-to-Many)

---

### Entity: Assignment
- **Attributes:**  
  - AssignmentID (Primary Key)  
  - Title  
  - Description  
  - DueDate  
- **Relationship:**  
  - Course → Assignment (One-to-Many)

---

### Entity: Submission
- **Attributes:**  
  - SubmissionID (Primary Key)  
  - SubmissionTimestamp  
  - Grade  
  - Feedback  
- **Relationships:**  
  - Assignment → Submission (One-to-Many)  
  - User → Submission (One-to-Many)

---

### Entity: Instructor
- **Attributes:**  
  - InstructorID (Primary Key)  
  - OfficeHours  
- **Relationship:**  
  - Instructor → Course (One-to-Many)

---

## 8. Conclusion

This proposal outlines the initial design for a Learning Management System database that reflects real-world academic systems. The system includes sufficient complexity through multiple entities, varied relationship types, and clear functional boundaries. Future phases will refine this design through detailed ER diagrams, constraint definitions, and SQL schema implementation.

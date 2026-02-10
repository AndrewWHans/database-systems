# Reddit-Style Social Content Platform Database  
**Project Proposal – Phase 0**

---

## 1. Document Title & Summary

**System Name:** Reddit-Style Social Content Platform Database  
**Student:** Andrew Hanson
**Course:** SP26: DATABASE SYSTEMS: 17038
**Semester:** Spring 2026

### Summary
This project proposes the design of a relational database system modeled after Reddit. The database will support communities (subreddits), user accounts, posts, comments, voting, moderation actions, and reporting. The system is designed to store structured social content data with clear entity relationships and constraints, enabling efficient queries such as trending posts, user engagement statistics, moderation history, and community growth.

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
8. Example Queries / Use Cases  
9. Conclusion  

---

## 3. Introduction

### Purpose
The purpose of this project is to design a database system that supports the core functionality of a Reddit-like platform. The database will store data about users, communities, posts, comment threads, voting behavior, moderation, and content reporting. This database acts as the foundation for creating a scalable and queryable social discussion platform.

### Motivation
Reddit is a strong real-world example of a system with complex data relationships, including hierarchical comments, many-to-many user interactions (votes, memberships), and governance structures (moderators). This makes it an ideal subject for practicing relational modeling, integrity constraints, and ER/EER design.

---

## 4. Project Scope

### In Scope
- User accounts and profiles  
- Communities (subreddits) and membership  
- Posts (text/link/image metadata)  
- Comments (threaded replies)  
- Voting (upvotes/downvotes) on posts and comments  
- Moderators and moderation actions  
- Content reports (flagging)  

### Out of Scope
- Authentication implementation and password storage details  
- Actual media/file storage (images/videos)  
- Real-time chat/messaging  
- Full-text search engine implementation  
- Recommendation algorithm implementation  

---

## 5. Intended Audience
- **Users:** Create posts/comments, vote, join communities, report content  
- **Moderators:** Enforce rules, remove content, manage bans, handle reports  
- **Administrators:** Oversee platform-level data and enforce global policies  

---

## 6. Preliminary System Design

This database will be designed as a normalized relational model. Many-to-many relationships (e.g., memberships, votes) will be represented using associative entities. Threaded comment structure will be represented using a self-referencing relationship. Constraints will be used to ensure valid relationships (e.g., users can vote at most once per item, moderators must belong to a community they moderate).

This Phase 0 design is a first pass and will be refined through ER diagram creation, participation constraints (min, max), and translation to a relational schema in later phases.

---

## 7. Preliminary Entities, Attributes, and Relationships

> This section is being intentionally left as a first draft and will be refined later.

---

### Entity: User
- **Attributes:**  
  - UserID (Primary Key)  
  - Username (Unique)  
  - Email (Unique)  
  - CreatedAt  
  - KarmaScore (optional derived / cached)

---

### Entity: Subreddit (Community)
- **Attributes:**  
  - SubredditID (Primary Key)  
  - Name (Unique)  
  - Description  
  - CreatedAt  
  - RulesText (optional)

---

### Entity: Membership
(Associative entity for User ↔ Subreddit)
- **Attributes:**  
  - MembershipID (Primary Key)  
  - JoinedAt  
  - MemberRole (Member, Moderator) *(role can also be separated into another table later)*  
- **Relationships:**  
  - User ↔ Subreddit (Many-to-Many)

---

### Entity: Post
- **Attributes:**  
  - PostID (Primary Key)  
  - Title  
  - BodyText (nullable)  
  - PostType (Text, Link, Image)  
  - URL (nullable)  
  - CreatedAt  
- **Relationships:**  
  - User → Post (One-to-Many) *(author creates posts)*  
  - Subreddit → Post (One-to-Many) *(posts belong to a community)*  

---

### Entity: Comment
- **Attributes:**  
  - CommentID (Primary Key)  
  - BodyText  
  - CreatedAt  
- **Relationships:**  
  - User → Comment (One-to-Many) *(author writes comments)*  
  - Post → Comment (One-to-Many) *(comments belong to a post)*  
  - Comment → Comment (One-to-Many, self-referencing) *(reply threads)*  
    - ParentCommentID (nullable for top-level comments)

---

### Entity: Vote
(Users vote on posts and comments; one vote per user per target)
- **Attributes:**  
  - VoteID (Primary Key)  
  - VoteType (Upvote, Downvote)  
  - CreatedAt  
  - TargetType (Post, Comment)  
  - TargetID (FK-like reference pattern)  
- **Relationships:**  
  - User → Vote (One-to-Many)

> Note: In implementation, Vote may be split into PostVote and CommentVote to enforce FK constraints cleanly.

---

### Entity: Report
(Users report posts/comments for rule violations)
- **Attributes:**  
  - ReportID (Primary Key)  
  - Reason  
  - CreatedAt  
  - Status (Open, Reviewed, Resolved)  
  - TargetType (Post, Comment)  
  - TargetID  
- **Relationships:**  
  - User → Report (One-to-Many)

---

### Entity: ModerationAction
(Tracks actions taken by moderators)
- **Attributes:**  
  - ActionID (Primary Key)  
  - ActionType (RemovePost, RemoveComment, BanUser, UnbanUser, LockThread)  
  - ActionReason  
  - CreatedAt  
- **Relationships:**  
  - User (Moderator) → ModerationAction (One-to-Many)  
  - Subreddit → ModerationAction (One-to-Many)  
  - Action may reference a PostID, CommentID, or TargetUserID depending on type

---

## 8. Example Queries / Use Cases

1. Show the top 10 posts in a subreddit by score in the last 24 hours  
2. Display a full comment thread for a given post (including replies)  
3. Find all reports that are still open for a subreddit  
4. List all moderation actions taken by a specific moderator in the last 30 days  
5. Compute user karma by summing votes on their posts and comments  
6. Identify the most active users in a subreddit by number of comments/posts  

---

## 9. Conclusion

This proposal outlines a relational database design for a Reddit-style discussion platform with sufficient complexity to support ER/EER modeling and relational schema mapping. The system includes hierarchical comment relationships, many-to-many interactions (membership and voting), and governance/moderation features that reflect real-world requirements. Future phases will refine constraints (min/max participation), enforce referential integrity, and translate the conceptual model into SQL tables.


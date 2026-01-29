# 📊 Kickstarter-Crowdfunding-Analytics

## 📌 Project Overview
This project analyzes crowdfunding campaign data to uncover insights related to project success, funding trends, backer behavior, and category performance.  
The analysis helps stakeholders understand **what drives successful crowdfunding campaigns** using data-driven metrics and visual dashboards.

---

## 🎯 Objectives
- Analyze project outcomes (successful, failed, canceled)
- Identify high-performing categories and locations
- Measure funding and backer trends
- Track project creation trends over time
- Calculate success rates across different dimensions

---

## 🛠 Tools & Technologies
- **SQL** – Data querying, aggregation, KPI calculations  
- **Python** – Data preprocessing and epoch-to-datetime conversion  
- **Tableau** – Interactive dashboards & visual storytelling  
- **Excel / CSV** – Source datasets  

---

## 📂 Dataset Description
The dataset includes crowdfunding project details such as:
- Project ID & Name
- Category & Location
- Goal Amount & Amount Raised
- Number of Backers
- Project State (Successful, Failed, etc.)
- Created Date (Epoch Time)

---

## 🔄 Data Preparation Steps
1. Converted epoch timestamps to standard date format  
2. Built a **calendar table** with:
   - Year, Month, Quarter
   - Financial Month & Financial Quarter
   - Weekday information
3. Converted goal amounts into **USD using static exchange rates**
4. Created relational data model for analysis

---

## 📈 Key KPIs & Metrics

### 🔹 Project Overview
- Total projects by outcome
- Total projects by category
- Total projects by location
- Projects created by year, quarter, and month

### 🔹 Successful Projects Analysis
- Total amount raised
- Total number of backers
- Average campaign duration (days)

### 🔹 Top Projects
- Top projects by number of backers
- Top projects by amount raised

### 🔹 Success Rate Analysis
- Overall success percentage
- Success rate by category
- Success rate by year & month
- Success rate by goal amount range

---

## 📊 Tableau Dashboard
The Tableau dashboard provides:
- Interactive filters (Year, Category, Country)
- KPI summary cards
- Trend analysis charts
- Top-performing project highlights

📷 **Dashboard Preview:**  
<p align="center">
  <img src="C:/Users/KIIT0001/Desktop/Uploads/crowd_funding_dashboard.jpg"/>
</p>


---


<h1 align="center">🚀 <span style="color:#4CAF50;">Scube Task App</span></h1>

<h3 align="center">
<span style="color:#2196F3;">Flutter UI-Only Control & Monitoring System (SCM)</span>
</h3>

---

## 🏢 <span style="color:#FF9800;">Company</span>
**Scube Technologies Ltd**

## 👨‍💻 <span style="color:#9C27B0;">Developer</span>
**Md. Tanvir Ann Noor Meem**

## 🛠 <span style="color:#03A9F4;">Technology Stack</span>
- 🟦 **Flutter**
- 🟪 **GetX (State Management & Navigation)**
- 🎨 **Material UI**
- 📊 **Static / Dummy Data**

---

## 📌 <span style="color:#E91E63;">Project Overview</span>

The **Scube Task App** is a **UI-only Flutter mobile application** designed as a  
<strong style="color:#4CAF50;">Control & Monitoring System (SCM)</strong>.

It visualizes:
- ⚡ Electricity usage  
- 🔌 Power & kWh metrics  
- 💰 Revenue calculations  
- 📈 Data breakdown analysis  

> ⚠️ <span style="color:red;"><b>Important:</b></span>  
> - No backend  
> - No API integration  
> - No database  
> - All values are <b>hardcoded</b>  
> - GetX is used <b>only for UI state</b>

---

## 🎯 <span style="color:#FF5722;">Core Features</span>

✅ Electricity & Energy Visualization  
✅ Power & kWh Metrics  
✅ Revenue View  
✅ Data Breakdown (A, B, C, D)  
✅ Date-Based Filtering (UI only)  
✅ Clean Navigation  
✅ Reusable Widgets  


🔹 No Bottom Navigation  
🔹 No Deep Routing  
🔹 Navigation via **Get.to() / Get.back()**

---

## 📱 <span style="color:#009688;">Screens Overview</span>

---

### 🔐 <span style="color:#FF9800;">1️⃣ Login Screen</span>
📄 `login_screen.dart`

**UI Elements**
- App Logo (SCUBE)
- Username Field
- Password Field (Visibility Toggle)
- Login Button
- Register & Forgot Password Text

**Behavior**
- Empty-field validation only
- Navigates to Dashboard
- No authentication logic

📌 <b>Controller:</b> `AuthController`

---

### 🏠 <span style="color:#4CAF50;">2️⃣ Dashboard Screen</span>
📄 `dashboard_screen.dart`

**Top Section**
- AppBar Title: <b>SCM</b>
- Notification Icon

**Electricity Summary**
- Circular Gauge (e.g. <b>5.53 kW</b>)
- Source / Load Toggle (UI only)

**Data Cards**
- Data View (Active)
- Data Type 2 (Active)
- Data Type 3 (Inactive)

📌 Active cards navigate to <b>Data View Screen</b>

**Feature Grid**
- Analysis Pro
- Plant Summary
- Diesel Generator
- Gas Generator
- Natural Gas
- Water Process

---

### 📊 <span style="color:#03A9F4;">3️⃣ Data View Screen</span>
📄 `data_view_screen.dart`

**Top Toggle**
- Data View
- Revenue View

**Energy Gauge**
- Semi-Circular Gauge
- kWh/Sqft Value

**Date Selection**
- Today Data
- Custom Date (From / To)
- Search Button (UI only)

**Data Breakdown**
- Data A
- Data B
- Data C
- Data D

Each item shows:
- Value
- Percentage
- Cost (৳)

---

### 💰 <span style="color:#9C27B0;">4️⃣ Revenue View Screen</span>
📄 `revenue_view_screen.dart`

**Revenue Gauge**
- Semi-Circular Gauge
- Total Revenue (e.g. <b>8,897,455 tk</b>)

**Expandable Card**
- Data & Cost Info
- Expand / Collapse using GetX

---

### 🚫 <span style="color:#F44336;">5️⃣ No Data Screen</span>
📄 `no_data_screen.dart`

**UI**
- Illustration Image
- Text:
  > <i>"No data is here, please wait."</i>

---

## 🧠 <span style="color:#795548;">Controllers Responsibility</span>

| Controller | Purpose |
|----------|---------|
| `auth_controller.dart` | Form state & validation |
| `dashboard_controller.dart` | Card & toggle state |
| `data_controller.dart` | View & date toggle |
| `revenue_controller.dart` | Expand/collapse state |

---

## 🧩 <span style="color:#607D8B;">Reusable Widgets</span>
📁 `common_widgets/`

- Custom AppBar
- Buttons
- Input Fields
- Toggle Switch
- Gauge Chart
- Expandable Card
- Data List Tile
- Date Picker Field

✨ Keeps UI clean and maintainable

---

## 🗂 <span style="color:#3F51B5;">Project Structure</span>


---

## 📊 <span style="color:#009688;">Data Handling Strategy</span>

✔ Hardcoded values  
✔ Rx variables for UI state  
✔ Static list generation  
✔ No APIs or Models  

---

## 🔍 <span style="color:#FF5722;">Evaluation Criteria</span>

✔ UI accuracy  
✔ Proper spacing  
✔ Clean widget reuse  
✔ GetX usage  
✔ Organized folder structure  

---

## 📝 <span style="color:#4CAF50;">Final Notes</span>

- Clean & readable code
- UI-focused implementation
- Matches assignment instructions
- Production-ready UI structure

---

<h3 align="center" style="color:#4CAF50;">
✅ Fully Compliant with Scube Technologies Ltd Flutter Task Requirements
</h3>


## 🧭 <span style="color:#3F51B5;">Navigation Flow</span>


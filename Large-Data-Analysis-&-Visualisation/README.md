# 📊 Large Data Analysis & Visualisation

This folder contains my work on **big synthetic datasets**, which are **physics-based earthquake catalogs** generated using **MCQsim** simulator. It focuses on two key parts:
- **Parameter Sensitivity Analysis & Scaling Relationships** – investigates how varying physical parameters affects simulated earthquake statistics to identify the most realistic model behavior. 
- **Rupture Behavior Analysis and Comparison Across Geometries** – compares the six fault geometries catalogs to interpret large-scale rupture dynamics using recurrence behavior, and scaling relationships.  

> **Tools:** Python, NumPy, Pandas, SciPy, math, Matplotlib, Jupyter Notebooks, MATLAB

---

## 🔎 What this demonstrates
> - **Data analysis at scale** on long synthetic datasets (30,000+ years of modeled seismicity).  
> - **Pattern & trends recognition** through parameter-driven variations and scaling-law evaluation.  
> - **Efficient code design** for automated catalog reading, parameter sweeping, and visualization.  
> - **Application of computational analysis to real-world systems**, bridging modeling outputs with empirical seismic data.

---

## 🔎 Quick links
- ▶️ **Sensitivity Analysis:** [View notebook →](./Sensitivity-Analysis.ipynb)  
- ▶️ **Across Geometry Analysis:** [View notebook →](./Across-Geometry-Analysis.ipynb)

---

## 🚀 What’s inside

- ⚙️**parameter sensitivity analysis & scaling relationships:**
  - 🧩**Scope:** 
    - Analyzed large synthetic catalogs from one representative East Anatolian Fault geometry (out of six total created).
    
    - Assessed how **physical parameters** control model behavior by influencing statistical scaling relations.  
    
    - Varied a set of **key physical parameters** — including *critical slip distance (Dc)*, *dynamic friction (μd)*, *correlation length (cl)*, and *strength cutoff (w1%)*.
    
  - 🧩**Scaling relations evaluated:**  
    - *Gutenberg–Richter (b-value & Mc)* 
    
    - *Rupture area vs magnitude (RA–M)*
    
    - *Hypocenter depth histograms* 
    
    - *Mean stress-drop distributions* 
    
    - *Magnitude frequency & interevent time* 
    
  - 🧩Compared model outputs with **empirical trends** to assess physical realism. 
  
  - 🧩**Automation:** 
  
    - Developed Python functions to **read and preprocess catalogs**, **filter magnitudes**, **automate scaling relations computation**, and **automate plotting** across all parameters for reproducible large-scale visualization.

  🔗 [View Notebook →](./Sensitivity-Analysis.ipynb)  

<br>

  <div align="center"><span style="color:#888;">⋯⋯⋯⋯ ⬩ ⋯⋯⋯⋯</span></div>


- ⚙️**Rupture behavior analysis and comparison across geometries:**
  - 🧩Applied the same analysis framework to the **final selected catalogs** from all **six fault geometries** to compare their long-term seismic behavior. 
  
  - 🧩**Assessed how fault geometry influences:**
    - *Scaling relationships*, *recurrence rates*, and *magnitude distributions*.  
    
    - *Seismic moment accumulation* and *rupture dynamics* across geometries.  
    
  - 🧩Selected **three key locations (A, B, and C)** based on structural features — such as **bends** and **stepovers** — expected to influence rupture initiation and propagation.  
  
  - 🧩**For each location:**
    - Analyzed **moment accumulation vs. time** to reveal rupture continuation or arrest behavior.
    
    - Evaluated **magnitude distributions** and corresponding mean and standard deviation.
    
    - Investigated **recurrence time distributions** and summarized their **mean, standard deviation, and coefficient of variation (CV)** across all geometries.
    
  - 🧩This interpretation highlights how **fault segmentation and connectivity** govern spatial rupture behavior and earthquake recurrence.

  🔗 [View notebook →](./Across-Geometry-Analysis.ipynb)




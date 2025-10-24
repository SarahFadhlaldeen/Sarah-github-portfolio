# 🧠 Machine Learning — Projects & Tasks

This folder collects my hands-on work in **machine learning** and **deep learning**:
- end-to-end projects (PyTorch) in the **Projects** section
- focused experiments covering main concepts of AI and exercises in the **Tasks** section

> Tools: Python|NumPy, Pandas, Matplotlib, Seaborn, scikit-learn, PyTorch, XGBoost|, Weights & Biases (W&B), Jupyter notebooks

---

## 🔎 Quick links
- ▶️ **Featured projects:** [Projects](./Projects/)
- ▶️ **All tasks:** [Tasks](./Tasks/)

---

## 🚀 What’s inside

- ⚙️**Projects:**
  - 🧩**Landslide-Prediction-UNet-R2UNet :** 
  
    -  Applied **deep-learning–based semantic segmentation** to map landslide-prone areas from multi-channel satellite-derived raster data (Papua New Guinea). 
    
    -  Conducted comprehensive **data preprocessing** and **feature engineering**, including rasterization, normalization, augmentation, and patch extraction.
    
    -  Trained and compared **U-Ne**t and **R2-U-Net** models using Adam optimization, BCE loss.
    
    -  Used **Weights & Biases** to track **experiments**, **hyperparameter tuning**, and **model evaluation metrics** (*accuracy*, *F1-score*, *RMSE*).
  
  🔗 [View U-Net Notebook](./Projects/Landslide_UNet.ipynb) | 🔗 [View R2-U-Net Notebook](./Projects/Landslide_R2UNet.ipynb)

<br>

- ⚙️**Tasks:** 
  - 🧩**MLP-Zero-Init-Symmetry :**
    
     - Demonstrates the symmetry problem in a 2-layer neural network with zero-initialized weights and biases, showing how identical gradients prevent learning on the XOR task.
    
    - Analyzed how poor parameter initialization disrupts gradient flow and convergence, highlighting a core concept in neural-network training and optimization.

  🔗 [View Notebook](./Tasks/MLP-Zero-Init-Symmetry.ipynb) 

  <div align="center"><span style="color:#888;">⋯⋯⋯⋯ ⬩ ⋯⋯⋯⋯</span></div> 
  
  - 🧩**XOR-Linear-vs-2LayerNN :** 
    
      - Built a linear regression baseline that fails on XOR and a 2-layer ReLU network (non-linear) that learns it perfectly. 
      
      - Highlighted how nonlinear capacity enables models to capture complex patterns.
      
      - Performed model training, evaluation, and convergence behavior visualization.
  
  🔗 [View Notebook](./Tasks/XOR-Linear-vs-2LayerNN.ipynb)

  <div align="center"><span style="color:#888;">⋯⋯⋯⋯ ⬩ ⋯⋯⋯⋯</span></div>
  
  - 🧩**Optimizer-Comparison (Rosenbrock & Booth Functions) :** 
  
    - Conducted a comparative experiment of Adam, SGD, RMSProp, and Adagrad optimizers on Rosenbrock and Booth benchmark functions. 
    
    - Performed statistical analysis of convergence, loss-curve visualization, and hyperparameter behavior to demonstrate understanding of gradient-based optimization and model tuning.

  🔗 [View Notebook](./Tasks/Optimizer-Comparison.ipynb)

   <div align="center"><span style="color:#888;">⋯⋯⋯⋯ ⬩ ⋯⋯⋯⋯</span></div>

  - 🧩**Facies-Classification-Well-Logs :** 
  
    - Implemented an end-to-end data-science workflow for lithofacies prediction using well-log data (FORCE 2020 lithology dataset). 
    
    - Performed exploratory data analysis (EDA), feature engineering, and regression modeling to predict missing DTS logs with a 3-layer neural network, followed by facies classification using XGBoost and a Deep Feedforward Neural Network. 
    
    - Conducted hyperparameter tuning, cross-validation, and performance evaluation using accuracy, F1-score, and confusion matrices.

  🔗 [View Notebook](./Tasks/Facies-Classification-Well-Logs.ipynb)

  <div align="center"><span style="color:#888;">⋯⋯⋯⋯ ⬩ ⋯⋯⋯⋯</span></div>

  - 🧩**Edge-Detection–PyTorch-vs-skimage :** 
  
    - Implemented Sobel edge detection using both PyTorch’s 'conv2d' operation and scikit-image filters to explore how convolutional kernels detect image gradients. 
    
    - Compared vertical and horizontal edge maps, visualized outputs, and quantified differences between frameworks. 
    
    - Illustrated how deep-learning frameworks (CNNs) perform classical computer-vision tasks through convolutional filtering.

  🔗 [View Notebook](./Tasks/Edge-Detection-PyTorch-vs-skimage.ipynb)

---

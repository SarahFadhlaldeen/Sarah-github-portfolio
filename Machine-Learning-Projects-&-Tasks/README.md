# 🧠 Machine Learning — Projects & Tasks

This folder collects my hands-on work in **machine learning** and **deep learning**:
- end-to-end projects (PyTorch) in the **Projects** section
- focused experiments covering main concepts of AI and exercises in the **Tasks** section

> Tools: Python|NumPy, Pandas, Matplotlib, Seaborn, scikit-learn, PyTorch, XGBoost|, Weights & Biases (W&B), Jupyter notebooks

---

## 🚀 What’s inside

- **Projects:**
  - **Landslide-Prediction-UNet-R2UNet** — Applied deep-learning–based semantic segmentation to map landslide-prone areas from multi-channel satellite-derived raster data (Papua New Guinea). Conducted comprehensive data preprocessing and feature engineering, including rasterization, normalization, augmentation, and patch extraction. Trained and compared U-Net and R2-U-Net models using Adam optimization, BCE loss, and tracked experiments via Weights & Biases for hyperparameter tuning and model evaluation (Accuracy, F1, RMSE). 
  
  🔗 [View U-Net Notebook](./Projects/Landslide_UNet.ipynb) | 🔗 [View R2-U-Net Notebook](./Projects/Landslide_R2UNet.ipynb)

<br>

- **Tasks:** 
  - **MLP-Zero-Init-Symmetry :**
    
    Demonstrates the symmetry problem in a 2-layer neural network with zero-initialized weights and biases, showing that identical gradients prevent learning (XOR task). Explored how poor parameter initialization affects gradient flow and convergence, illustrating a core machine-learning concept relevant to model training and optimization.

  🔗 [View Notebook](./Tasks/MLP-Zero-Init-Symmetry.ipynb)

  <div align="center"><span style="color:#888;">⋯⋯⋯⋯ ⬩ ⋯⋯⋯⋯</span></div> 
  
    - **XOR-Linear-vs-2LayerNN :** 
      Built a a linear regression baseline that fails on XOR and a two-layer ReLU network (non-linear) that learns it perfectly; demonstrates why nonlinear capacity matters for complex pattern learning. Included model training, evaluation metrics, and visualization of convergence behavior.
  
  🔗 [View Notebook](./Tasks/XOR-Linear-vs-2LayerNN.ipynb)

  <div align="center"><span style="color:#888;">⋯⋯⋯⋯ ⬩ ⋯⋯⋯⋯</span></div>
  
  - **Optimizer-Comparison (Rosenbrock & Booth Functions) :** 
  
    Conducted a comparative experiment of Adam, SGD, RMSProp, and Adagrad optimizers on Rosenbrock and Booth benchmark functions. Included statistical analysis of convergence, loss-curve visualization, and discussion of hyperparameter effects, demonstrating understanding of gradient-based optimization and parameter tuning.

  🔗 [View Notebook](./Tasks/Optimizer-Comparison.ipynb)

   <div align="center"><span style="color:#888;">⋯⋯⋯⋯ ⬩ ⋯⋯⋯⋯</span></div>

  - **Facies-Classification-Well-Logs** — Implemented an end-to-end data-science workflow for lithofacies prediction using well-log data (FORCE 2020 lithology dataset). Performed exploratory data analysis (EDA), feature engineering, and predictive regression modeling (missing DTS logs via a 3-layer NN), followed by facies classification with XGBoost and a Deep Feedforward Neural Network. Included hyperparameter tuning, cross-validation, and performance visualization (accuracy, F1-score, confusion matrices).

  🔗 [View Notebook](./Tasks/Facies-Classification-Well-Logs.ipynb)

  <div align="center"><span style="color:#888;">⋯⋯⋯⋯ ⬩ ⋯⋯⋯⋯</span></div>

  - **Edge-Detection–PyTorch-vs-skimage** — Implemented Sobel edge detection using both PyTorch’s conv2d operation and scikit-image filters to understand how convolutional kernels detect image gradients. Compared vertical and horizontal edge maps, visualized results, and quantified differences. Demonstrated how deep-learning frameworks (CNNs) perform classical computer-vision tasks through convolutional filtering.

  🔗 [View Notebook](./Tasks/Edge-Detection-PyTorch-vs-skimage.ipynb)

---

## 🔎 Quick links

- ▶️ **Featured project:** [Projects](./Projects/)
- 🧩 **All tasks:** [Tasks](./Tasks/)

---

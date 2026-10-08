# Image Recognition Pipeline in R (Planes vs. Cars Classification)

## 1. Project Title and Objective
**Title:** Binary Image Classification Pipeline Using R and Keras

**Objective:** Build, train, and evaluate a Deep Neural Network (Multi-Layer Perceptron) in R to accurately classify custom image data into two distinct categories: 

**Planes** as Class `0` and **Cars** as Class `1`.

---

## 2. Brief Description of the Problem
Image recognition is a fundamental computer vision task that involves categorizing visual inputs into predefined target classes. This project demonstrates end-to-end image processing, feature flattening, and categorical deep learning model construction using R, `EBImage`, and the `Keras3` / `TensorFlow` backend. The pipeline loads raw RGB images of varying dimensions, standardizes their resolution, transforms them into feature vectors, and feeds them into a dense feedforward neural network.

---

## 3. Dataset Information
**Total Samples:** 12 RGB images

**Classes:**
 * **Planes (`p1.jpg` – `p6.jpg`)**
 * **Cars (`c1.jpg` – `c6.jpg`)**

**Data Split:**
 * **Training Set (10 images):** `p1.jpg`–`p5.jpg` (Planes) & `c1.jpg`–`c5.jpg` (Cars)
 * **Testing Set (2 images):** `p6.jpg` (Plane) & `c6.jpg` (Car)

**Image Format & Preprocessing:**
 * Original format: JPEG 
 * Target dimensions: $28 \times 28 \times 3$ 
 * Flattened input vector per image: $28 \times 28 \times 3 = 2,352$ features


---

## 4. R Packages / Libraries Used
**`EBImage` (Bioconductor):** For reading, manipulating, resizing, and transforming multidimensional image arrays.

**`keras3` :** High-level neural networks API for R to configure, train, and evaluate deep learning architectures.

---

## 5. Major Operations Performed
1. **Image Ingestion**
2. **Preprocessing & Resizing**
3. **Array Reshaping & Vectorization** 
4. **Data Partitioning & One-Hot Encoding**
5. **Model Architecture Design:**
   * **Input Layer**
   * **Hidden Layer 1:** Dense layer with $256$ units
   * **Hidden Layer 2:** Dense layer with $128$ units
   * **Output Layer:** Dense layer with $2$ units
6. **Compilation & Optimization**
7. **Training & Validation** 
8. **Inference & Evaluation**

---

## 6. Instructions to Execute the Project

### Prerequisites

```R
# 1. Install BiocManager and EBImage
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("EBImage")

# 2. Install Keras3 and TensorFlow
install.packages("keras3")
library(keras3)
install_keras()
```
Alternatively, you can use built in package manager to install BiocManager and Keras 3. But, EBImage cannot be installed that way so you need BiocManager.

Everything else works right out of the box. Clone and run.

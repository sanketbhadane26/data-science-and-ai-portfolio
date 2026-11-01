# Project 1: Drug Classification — Exploratory Data Analysis (EDA)

## 1. Project Overview

This project focuses on performing Exploratory Data Analysis (EDA) on a drug classification dataset containing patient information and prescribed drug categories.

The objective is to understand the dataset's structure, identify data quality issues, explore numerical and categorical features, investigate relationships between patient characteristics and drug categories, and identify potentially useful patterns for future machine learning tasks.

**Project type:** Exploratory Data Analysis (EDA)  
**Dataset size:** 200 observations × 6 columns  
**Target variable:** `Drug`

---

## 2. Dataset Description

The dataset contains 200 observations and 6 columns.

| Column | Data Type | Description |
|---|---|---|
| Age | Integer | Patient's age in years |
| Sex | String | Patient's sex (Male/Female) |
| BP | String | Blood pressure category |
| Cholesterol | String | Cholesterol category |
| Na_to_K | Float | Sodium-to-potassium ratio |
| Drug | String | Drug category prescribed to the patient; target variable |

### Feature Classification

- **Numerical features:** Age, Na_to_K
- **Categorical features:** Sex, BP, Cholesterol, Drug

---

## 3. Data Inspection and Cleaning

Initial inspection was performed to understand the dataset's structure and check for data quality issues.

### Data Quality Checks

- The dataset contains 200 rows and 6 columns.
- No missing values were found.
- No duplicate records were found.
- The categorical columns contain the expected categories.
- No unexpected categorical values were identified.
- The `Drug` column initially contained inconsistent capitalization, such as `drugC` and `DrugC`.

### Data Cleaning

The inconsistent drug labels were standardized using a mapping dictionary to maintain consistent category names.

After cleaning, the drug categories were:

- DrugA
- DrugB
- DrugC
- DrugX
- DrugY

### Numerical Feature Summary

| Feature | Minimum | Maximum | Approximate Mean |
|---|---:|---:|---:|
| Age | 15 | 74 | 44 |
| Na_to_K | 6 | 38 | 16 |

The dataset was already relatively clean and required minimal preprocessing.

---

## 4. Numerical Analysis

### 4.1 Age Distribution

The Age feature was analyzed using descriptive statistics, a histogram, and a box plot.

- Minimum age: 15 years
- Maximum age: 74 years
- Average age: approximately 44 years
- Skewness: 0.0303

**Observation:**

The age distribution is approximately symmetrical because its skewness is very close to zero. There is no strong positive or negative skew.

### 4.2 Na_to_K Distribution

The `Na_to_K` feature was analyzed using descriptive statistics, a histogram with KDE, and a box plot.

- Minimum value: approximately 6
- Maximum value: approximately 38
- Average value: approximately 16
- Skewness: 1.0393

**Observation:**

The distribution is positively skewed, indicating a longer tail towards higher Na_to_K values.

### 4.3 Outlier Detection

The Interquartile Range (IQR) method was used to identify potential outliers in the numerical features.

Eight potential outliers were identified in the `Na_to_K` feature.

An important observation was that all eight observations belonged to the `DrugY` category.

**Decision:**

These observations were retained rather than removed automatically because they may contain meaningful information about the relationship between Na_to_K and the target variable.

This highlights the importance of understanding outliers before deciding whether to remove them.

---

## 5. Categorical Analysis

### 5.1 Sex Distribution

| Sex | Patients |
|---|---:|
| Male | 104 |
| Female | 96 |

**Observation:**

The dataset contains slightly more male patients than female patients. However, the distribution is relatively balanced.

### 5.2 Blood Pressure Distribution

| BP Category | Patients |
|---|---:|
| HIGH | 77 |
| LOW | 64 |
| NORMAL | 59 |

**Observation:**

HIGH blood pressure is the most frequent category, followed by LOW and NORMAL.

### 5.3 Cholesterol Distribution

| Cholesterol Category | Patients |
|---|---:|
| HIGH | 103 |
| NORMAL | 97 |

**Observation:**

The HIGH cholesterol category is slightly more frequent than the NORMAL category.

### 5.4 Drug Distribution

| Drug | Patients | Percentage |
|---|---:|---:|
| DrugY | 91 | 45.5% |
| DrugX | 54 | 27.0% |
| DrugA | 23 | 11.5% |
| DrugB | 16 | 8.0% |
| DrugC | 16 | 8.0% |
| **Total** | **200** | **100%** |

**Observations:**

- DrugY is the most frequent category, representing 45.5% of the dataset.
- DrugX is the second most frequent category, representing 27%.
- DrugA represents 11.5% of the observations.
- DrugB and DrugC are the least frequent categories, each representing 8%.

The target distribution is uneven, with DrugY accounting for nearly half of all observations.

This should be considered during future machine learning model development and evaluation.

---

## 6. Bivariate Analysis

Bivariate analysis was performed to investigate relationships between individual features and the target variable.

### 6.1 Age vs Drug

A box plot was used to compare age distributions across the five drug categories.

**Observations:**

- DrugB appears to be associated with older patients compared with several other drug categories.
- Its age distribution is concentrated towards older ages, approximately 55–70 years.
- The age distributions of DrugA, DrugC, DrugX and DrugY show considerable overlap.
- DrugY occurs across a wide range of patient ages.
- Age alone does not clearly separate all five drug categories.

**Finding:**

Age may provide some information about drug category, particularly for DrugB, but it does not appear to be a strong standalone separating feature for all categories.

### 6.2 Sex vs Drug

A count plot and cross-tabulation were used to examine the relationship between sex and drug categories.

**Patient Counts:**

| Sex | DrugA | DrugB | DrugC | DrugX | DrugY |
|---|---:|---:|---:|---:|---:|
| Female | 9 | 6 | 7 | 27 | 47 |
| Male | 14 | 10 | 9 | 27 | 44 |

**Percentage Distribution Within Each Sex:**

| Sex | DrugA | DrugB | DrugC | DrugX | DrugY |
|---|---:|---:|---:|---:|---:|
| Female | 9.38% | 6.25% | 7.29% | 28.12% | 48.96% |
| Male | 13.46% | 9.62% | 8.65% | 25.96% | 42.31% |

**Observations:**

- DrugY is the most frequent category among both male and female patients.
- DrugX is the second most frequent category in both groups.
- DrugA, DrugB and DrugC have slightly higher percentages among male patients.
- DrugX and DrugY have slightly higher percentages among female patients.

**Finding:**

The drug distribution differs somewhat between male and female patients. However, these differences alone do not establish a statistically meaningful relationship.

### 6.3 BP vs Drug

A count plot and cross-tabulation were used to investigate the relationship between blood pressure categories and drug categories.

**Patient Counts:**

| Drug | HIGH | LOW | NORMAL |
|---|---:|---:|---:|
| DrugA | 23 | 0 | 0 |
| DrugB | 16 | 0 | 0 |
| DrugC | 0 | 16 | 0 |
| DrugX | 0 | 18 | 36 |
| DrugY | 38 | 30 | 23 |

**Percentage Distribution Within Each BP Category:**

| BP Category | DrugA | DrugB | DrugC | DrugX | DrugY |
|---|---:|---:|---:|---:|---:|
| HIGH | 29.87% | 20.78% | 0% | 0% | 49.35% |
| LOW | 0% | 0% | 25.00% | 28.13% | 46.88% |
| NORMAL | 0% | 0% | 0% | 61.02% | 38.98% |

**Observations:**

- DrugA and DrugB occur only in the HIGH BP category.
- DrugC occurs only in the LOW BP category.
- DrugX occurs in the LOW and NORMAL BP categories.
- DrugY occurs across all three BP categories.
- DrugY has the highest count in the HIGH and LOW BP categories.
- DrugX has the highest count in the NORMAL BP category.

**Finding:**

The distribution of drug categories varies considerably across blood pressure groups. BP appears to be an informative categorical feature in this dataset.

### 6.4 Cholesterol vs Drug

A count plot and cross-tabulation were used to investigate the relationship between cholesterol categories and drug categories.

**Percentage Distribution Within Each Cholesterol Category:**

| Cholesterol | DrugA | DrugB | DrugC | DrugX | DrugY |
|---|---:|---:|---:|---:|---:|
| HIGH | 11.65% | 7.77% | 15.53% | 19.42% | 45.63% |
| NORMAL | 11.34% | 8.25% | 0% | 35.05% | 45.36% |

**Observations:**

- DrugY has the highest patient count in both cholesterol categories.
- DrugC appears only in the HIGH cholesterol category.
- DrugA and DrugB have relatively similar proportions across both categories.
- DrugX has a higher proportion in the NORMAL cholesterol category.
- DrugY has almost identical representation in both groups: approximately 45.6% of HIGH cholesterol patients and 45.4% of NORMAL cholesterol patients.

**Finding:**

Cholesterol category shows some variation in drug distribution, particularly for DrugC and DrugX. However, DrugY has nearly identical proportions across both cholesterol groups.

### 6.5 Na_to_K vs Drug

The mean and median Na_to_K values were compared across drug categories.

| Drug | Mean | Median |
|---|---:|---:|
| DrugA | 10.92 | 11.23 |
| DrugB | 11.52 | 11.17 |
| DrugC | 10.63 | 10.49 |
| DrugX | 10.65 | 10.52 |
| DrugY | 22.37 | 20.49 |

**Observations:**

- DrugY has a considerably higher mean and median Na_to_K ratio than the other drug categories.
- The remaining four drug categories have relatively similar average Na_to_K values.
- The difference between DrugY and the other categories is clearly visible in the box plot and violin plot.

**Finding:**

Na_to_K appears to be a particularly informative feature for distinguishing DrugY from the other drug categories in this dataset.

---

## 7. Correlation Analysis

The Pearson correlation coefficient was calculated between the two numerical features: Age and Na_to_K.

**Correlation coefficient: -0.0631**

**Observation:**

The correlation indicates a very weak negative linear relationship between Age and Na_to_K.

Since the value is close to zero, there is almost no linear association between these two numerical variables in this dataset.

A scatter plot was also created using Drug as the hue variable.

**Observations:**

- DrugY is concentrated at higher Na_to_K values across different age groups.
- DrugA, DrugB, DrugC and DrugX mostly overlap at lower Na_to_K values.
- Age does not clearly separate all five drug categories.
- Na_to_K provides stronger visual separation between DrugY and the remaining categories.

**Finding:**

Na_to_K appears more useful than Age for visually distinguishing DrugY in this dataset.

---

## 8. Pair Plot Analysis

A pair plot was created to examine relationships between numerical features, using Drug as the hue variable.

**Observations:**

- Na_to_K provides visible separation between DrugY and the other drug categories.
- DrugY observations are concentrated at higher Na_to_K values.
- The other four drug categories show considerable overlap in their numerical distributions.
- Age distributions overlap across different drug categories.
- Age alone does not provide clear separation between the drug categories.

**Finding:**

The pair plot supports the earlier observation that Na_to_K is a potentially useful feature for distinguishing DrugY, while Age provides less obvious separation.

---

## 9. Key Findings

The major findings from this exploratory analysis are:

1. **Na_to_K is an informative feature:** DrugY has considerably higher mean and median Na_to_K values than the other drug categories.

2. **Blood pressure varies across drug categories:** Certain drug categories appear only in specific BP groups in this dataset.

3. **Age provides limited separation:** DrugB is associated with older patients, but age distributions overlap across several other categories.

4. **Cholesterol shows some category-specific patterns:** DrugC appears only in the HIGH cholesterol category, while DrugY has nearly identical proportions across both cholesterol groups.

5. **Sex shows relatively small differences:** DrugY remains the most frequent category for both male and female patients.

6. **Potential outliers may be meaningful:** All eight potential Na_to_K outliers belong to DrugY and were retained for further investigation.

7. **The target distribution is uneven:** DrugY represents 45.5% of the dataset, while DrugB and DrugC each represent 8%.

---

## 10. Limitations

The following limitations were identified during the analysis:

1. **Small dataset:** Only 200 observations are available, which may limit the generalizability of the findings.

2. **Uneven target distribution:** DrugY represents approximately 45.5% of the dataset, while DrugB and DrugC each represent only 8%.

3. **Limited numerical features:** Only two numerical features, Age and Na_to_K, are available for numerical analysis.

4. **Categorical medical information:** BP and Cholesterol are represented as categories rather than actual clinical measurements.

5. **Limited patient information:** The dataset does not contain detailed medical history, diagnoses, dosage or other potentially relevant clinical information.

6. **No causal conclusions:** The observed relationships represent associations within the dataset and cannot establish medical causation or prescribing suitability.

7. **Unknown representativeness:** The dataset's sampling process and representativeness of a real patient population are not established.

---

## 11. Conclusion

This project involved a complete exploratory analysis of a drug classification dataset containing 200 patient records.

The analysis included data inspection, data cleaning, descriptive statistics, outlier detection, univariate analysis, bivariate analysis, correlation analysis and pair plot visualization.

The most important finding was that the `Na_to_K` feature showed a clear difference between DrugY and the other drug categories. Blood pressure also showed distinct patterns across drug categories, while Age and Sex provided comparatively less visual separation.

The analysis also highlighted the importance of investigating outliers instead of automatically removing them and understanding uneven target distributions before building machine learning models.

Overall, this project provided practical experience in data cleaning, statistical analysis, visualization and extracting meaningful insights from a structured dataset.

**Note:** These findings describe patterns in the dataset only. They should not be interpreted as medical recommendations or used to determine real-world prescriptions.

---

## 12. Tools and Libraries Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook

## 14. Future Scope

Possible next steps for this project include:

- Perform feature encoding for categorical variables.
- Build a classification model using Scikit-learn.
- Compare Logistic Regression, Decision Tree, Random Forest and other suitable classifiers.
- Evaluate models using accuracy, precision, recall, F1-score and a confusion matrix.
- Investigate class imbalance and use appropriate evaluation techniques.
- Apply cross-validation to evaluate model performance more reliably.

---

**Project Status:** Completed — Exploratory Data Analysis

**Author:** [Sanket Bhadane]
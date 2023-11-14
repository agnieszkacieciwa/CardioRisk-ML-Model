# CardioRisk-ML-Model
CardioRisk-ML-Model is a machine learning project that predicts the risk of a heart attack based on various medical indicators.


## Dataset
The analysis utilizes the "Heart Attack Analysis & Prediction Dataset" sourced from Kaggle. The dataset consists of 14 variables, including age, sex, cholesterol levels, and other medical indicators.


## Models

### Linear Model (Logistic Regression)

The project employs a logistic regression model to analyze the impact of different factors on the likelihood of a heart attack. The model is trained on the training dataset and evaluated on the test dataset. The key variables influencing the model include chest pain type (cp) and the number of major vessels (caa).

### Mixed-Effects Model

A mixed-effects model is used to explore the relationship between exercise-induced chest pain (exng) and maximum heart rate achieved (thalachh) on the likelihood of a heart attack. This model incorporates random effects to account for individual variations.


## Usage
1. Clone the repository: `git clone https://github.com/your-username/CardioRisk-ML-Model.git`
2. Navigate to the `code` directory.
3. Run the R scripts in numerical order to replicate the analysis.


## Dependencies
- R (version 4.x)
- R packages: `tidyverse`, `ggplot2`, `lme4`, `Matrix`, `lattice`

Install the required packages using:
```R
install.packages(c("tidyverse", "ggplot2", "lme4", "Matrix", "lattice"))
`````````````````````

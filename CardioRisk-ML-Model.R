library(tidyverse)
library(ggplot2)
library(lme4)
library(Matrix)
library(lattice)

# Read data
df <- read.csv("C:/Users/agnie/OneDrive/Pulpit/heart.txt")

# Explore data
head(df)
summary(df)

# Data preprocessing
df2 <- df %>%
  mutate(
    cp = as.factor(cp),
    restecg = as.factor(restecg),
    slp = as.factor(slp),
    caa = as.factor(caa),
    thall = as.factor(thall),
    sex = factor(sex, levels = c(0, 1), labels = c("female", "male")),
    fbs = factor(fbs, levels = c(0, 1), labels = c("False", "True")),
    exng = factor(exng, levels = c(0, 1), labels = c("No", "Yes")),
    output = factor(output, levels = c(0, 1), labels = c("Health", "Not Health"))
  )

# Explore preprocessed data
glimpse(df2)
summary(df2)
colSums(is.na(df2))
summary(df2)
prop.table(table(df2$output))
table(df2$output)

# Bar chart for output
ggplot(df2, aes(x = output, fill = output)) +
  geom_bar() +
  xlab("Heart Attack") +
  ylab("Number") +
  ggtitle("Chance of a Heart Attack") +
    scale_fill_discrete(name = 'Heart Disease', labels = c("Less", "Greater"))

# Linear model
set.seed(100)
index <- sample(nrow(df2), nrow(df2) * 0.7)

train <- df2[index,]
test <- df2[-index,]

print(dim(train))
print(dim(test))

model1 <- glm(output ~ ., data = train, family = binomial())
summary(model1)

model2 <- glm(output ~ sex + factor(cp) + factor(caa), data = train, family = binomial())
summary(model2)

# Predictions and density plot
prediction <- predict(model2, type = "response", newdata = test)

test %>%
  ggplot(aes(x = prediction)) +
  geom_density() +
  labs(title = "Probability Distribution for Data Forecast") +
  theme_minimal()

# Compare predictions with actual values
result_prediction <- ifelse(prediction >= 0.5, "Not Health", "Health")
test <- cbind(test, prediction = result_pred)
test %>%
  select(output, prediction) %>%
  slice_head(n = 6)

# Display probability values
data.frame(probability = predict(model2, type = "response", newdata = test))

# Mixed-effects model
xyplot(thalachh ~ exng | output, df2,
       type = c("g", "p", "r"),
       index = function(x, y) coef(lm(y ~ x))[1],
       group = output,
       col = c('red', 'blue'),
       main = "The Relationship Between the Occurrence of a Heart Attack\n and Exercise-induced Angina Pectoris\n and the Maximum Heart Rate Achieved",
       xlab = "Exercise-induced Angina Pectoris",
       ylab = "Maximum Heart Rate Achieved"
)

# Mixed-effects model (lmer)
mod.0 <- lmer(thalachh ~ exng + (1 | output), data = df2)
summary(mod.0)



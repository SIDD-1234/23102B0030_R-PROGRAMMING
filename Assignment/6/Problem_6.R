# Install packages (run only once if not already installed)
install.packages(c("palmerpenguins", "ggplot2", "dplyr", "moments", "car", "effsize"))

# Load packages
library(palmerpenguins)
library(ggplot2)
library(dplyr)
library(moments)
library(car)
library(effsize)

# Load Palmer Penguins dataset
data("penguins")

# View first few rows
head(penguins)

# Structure of dataset
str(penguins)

# Summary
summary(penguins)

# Number of observations
nrow(penguins)

# Species
unique(penguins$species)

# Check missing values
colSums(is.na(penguins))

# Dataset for body mass analysis
penguin_data <- penguins %>%
  filter(!is.na(body_mass_g),
         !is.na(species),
         !is.na(sex))

# View cleaned data
head(penguin_data)

# Number of observations after cleaning
nrow(penguin_data)

# Overall descriptive statistics

body_mass <- penguin_data$body_mass_g

mean(body_mass)
median(body_mass)
min(body_mass)
max(body_mass)
var(body_mass)
sd(body_mass)
quantile(body_mass, 0.25)
quantile(body_mass, 0.75)
IQR(body_mass)
skewness(body_mass)
kurtosis(body_mass)

species_stats <- penguin_data %>%
  group_by(species) %>%
  summarise(
    Mean = mean(body_mass_g),
    Median = median(body_mass_g),
    Minimum = min(body_mass_g),
    Maximum = max(body_mass_g),
    Variance = var(body_mass_g),
    SD = sd(body_mass_g),
    Q1 = quantile(body_mass_g, 0.25),
    Q3 = quantile(body_mass_g, 0.75),
    IQR = IQR(body_mass_g),
    Skewness = skewness(body_mass_g),
    Kurtosis = kurtosis(body_mass_g)
  )

print(species_stats)

ggplot(penguin_data, aes(x = body_mass_g)) +
  geom_histogram(bins = 30) +
  labs(
    title = "Histogram of Penguin Body Mass",
    x = "Body Mass (g)",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(penguin_data, aes(x = species, y = body_mass_g)) +
  geom_boxplot() +
  labs(
    title = "Body Mass by Penguin Species",
    x = "Species",
    y = "Body Mass (g)"
  ) +
  theme_minimal()

ggplot(penguin_data, aes(x = sex, y = body_mass_g)) +
  geom_boxplot() +
  labs(
    title = "Body Mass by Sex",
    x = "Sex",
    y = "Body Mass (g)"
  ) +
  theme_minimal()

ggplot(penguin_data, aes(x = body_mass_g)) +
  geom_density() +
  labs(
    title = "Density Plot of Penguin Body Mass",
    x = "Body Mass (g)",
    y = "Density"
  ) +
  theme_minimal()

# H0: Mean body mass of males = Mean body mass of females
# H1: Mean body mass of males != Mean body mass of females

# Male normality
shapiro.test(
  penguin_data$body_mass_g[penguin_data$sex == "male"]
)

# Female normality
shapiro.test(
  penguin_data$body_mass_g[penguin_data$sex == "female"]
)


# Male QQ plot
qqnorm(
  penguin_data$body_mass_g[penguin_data$sex == "male"],
  main = "QQ Plot - Male Body Mass"
)
qqline(
  penguin_data$body_mass_g[penguin_data$sex == "male"]
)

# Female QQ plot
qqnorm(
  penguin_data$body_mass_g[penguin_data$sex == "female"],
  main = "QQ Plot - Female Body Mass"
)
qqline(
  penguin_data$body_mass_g[penguin_data$sex == "female"]
)

t_test_result <- t.test(
  body_mass_g ~ sex,
  data = penguin_data,
  var.equal = FALSE
)

print(t_test_result)

cohen_result <- cohen.d(
  penguin_data$body_mass_g[penguin_data$sex == "male"],
  penguin_data$body_mass_g[penguin_data$sex == "female"]
)

print(cohen_result)

ggplot(penguin_data, aes(x = species, y = body_mass_g)) +
  geom_boxplot() +
  labs(
    title = "Body Mass Distribution Across Species",
    x = "Species",
    y = "Body Mass (g)"
  ) +
  theme_minimal()

by(
  penguin_data$body_mass_g,
  penguin_data$species,
  shapiro.test
)

anova_model <- aov(
  body_mass_g ~ species,
  data = penguin_data
)

summary(anova_model)

leveneTest(
  body_mass_g ~ species,
  data = penguin_data
)

tukey_result <- TukeyHSD(anova_model)

print(tukey_result)

plot(tukey_result)

kruskal_result <- kruskal.test(
  body_mass_g ~ species,
  data = penguin_data
)

print(kruskal_result)

# ANOVA
summary(anova_model)

# Kruskal-Wallis
kruskal_result

two_way_model <- aov(
  body_mass_g ~ species * sex,
  data = penguin_data
)

summary(two_way_model)

interaction.plot(
  penguin_data$species,
  penguin_data$sex,
  penguin_data$body_mass_g,
  xlab = "Species",
  ylab = "Mean Body Mass (g)",
  trace.label = "Sex",
  main = "Interaction Plot: Species and Sex"
)

ggplot(
  penguin_data,
  aes(x = species, y = body_mass_g, fill = sex)
) +
  geom_boxplot() +
  labs(
    title = "Body Mass by Species and Sex",
    x = "Species",
    y = "Body Mass (g)",
    fill = "Sex"
  ) +
  theme_minimal()

flipper_data <- penguins %>%
  filter(
    !is.na(flipper_length_mm),
    !is.na(species)
  )

# Descriptive statistics
flipper_stats <- flipper_data %>%
  group_by(species) %>%
  summarise(
    Mean = mean(flipper_length_mm),
    Median = median(flipper_length_mm),
    SD = sd(flipper_length_mm),
    Minimum = min(flipper_length_mm),
    Maximum = max(flipper_length_mm)
  )

print(flipper_stats)


ggplot(
  flipper_data,
  aes(x = species, y = flipper_length_mm)
) +
  geom_boxplot() +
  labs(
    title = "Flipper Length Across Penguin Species",
    x = "Species",
    y = "Flipper Length (mm)"
  ) +
  theme_minimal()

flipper_anova <- aov(
  flipper_length_mm ~ species,
  data = flipper_data
)

summary(flipper_anova)

flipper_tukey <- TukeyHSD(flipper_anova)

print(flipper_tukey)

plot(flipper_tukey)


flipper_kruskal <- kruskal.test(
  flipper_length_mm ~ species,
  data = flipper_data
)

print(flipper_kruskal)

ggplot(
  penguin_data,
  aes(x = species, y = body_mass_g)
) +
  geom_boxplot() +
  stat_summary(
    fun = mean,
    geom = "point",
    shape = 18,
    size = 3
  ) +
  labs(
    title = "Penguin Body Mass Comparison Across Species",
    x = "Penguin Species",
    y = "Body Mass (g)"
  ) +
  theme_minimal()

cat("\n================ FINAL ANALYSIS ================\n")

cat("\n1. DESCRIPTIVE STATISTICS\n")
print(species_stats)

cat("\n2. MALE vs FEMALE T-TEST\n")
print(t_test_result)

cat("\n3. COHEN'S D\n")
print(cohen_result)

cat("\n4. ONE-WAY ANOVA\n")
print(summary(anova_model))

cat("\n5. TUKEY HSD\n")
print(tukey_result)

cat("\n6. KRUSKAL-WALLIS TEST\n")
print(kruskal_result)

cat("\n7. TWO-WAY ANOVA\n")
print(summary(two_way_model))

cat("\n8. FLIPPER LENGTH ANOVA\n")
print(summary(flipper_anova))

cat("\n9. FLIPPER LENGTH KRUSKAL-WALLIS\n")
print(flipper_kruskal)

cat("\n=================================================\n")
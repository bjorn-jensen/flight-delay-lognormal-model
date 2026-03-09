# Flight Delay Modelling
# Lognormal vs Gamma distribution

# install packages (kun første gang)
# install.packages("nycflights13")
# install.packages("tidyverse")
# install.packages("fitdistrplus")

# load packages
library(nycflights13)
library(tidyverse)
library(fitdistrplus)

# prepare data
df <- flights %>%
  dplyr::select(arr_delay) %>%
  dplyr::filter(!is.na(arr_delay), arr_delay > 0)

# quick check
nrow(df)
summary(df$arr_delay)

# exploratory plot
ggplot(df, aes(x = arr_delay)) +
  geom_histogram(aes(y = after_stat(density)), bins = 100, fill = "grey80") +
  geom_density(color = "black")

# fit distributions
fit_gamma <- fitdist(df$arr_delay, "gamma")
fit_lognorm <- fitdist(df$arr_delay, "lnorm")

# compare models
fit_gamma$aic
fit_lognorm$aic

# extract parameters
mu <- fit_lognorm$estimate["meanlog"]
sigma <- fit_lognorm$estimate["sdlog"]

mu
sigma

# probabilities from the fitted model

p_le_5 <- plnorm(5, meanlog = mu, sdlog = sigma)
p_gt_60 <- 1 - plnorm(60, meanlog = mu, sdlog = sigma)

p_le_5
p_gt_60

# moments of the fitted lognormal model

EX <- exp(mu + sigma^2 / 2)
VarX <- (exp(sigma^2) - 1) * exp(2 * mu + sigma^2)
SDX <- sqrt(VarX)

EX
VarX
SDX

# median of the fitted lognormal model

MedX <- exp(mu)

MedX

# final plot

ggplot(df, aes(x = arr_delay)) +
  geom_histogram(aes(y = after_stat(density)), bins = 100, fill = "grey80") +
  stat_function(
    fun = dlnorm,
    args = list(meanlog = mu, sdlog = sigma),
    color = "red",
    linewidth = 1
  ) +
  geom_vline(xintercept = MedX, color = "blue", linewidth = 1) +
  geom_vline(xintercept = EX, color = "darkgreen", linewidth = 1) +
  coord_cartesian(xlim = c(0, 200))
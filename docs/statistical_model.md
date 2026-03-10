# Statistical Model

This document presents the mathematical formulation of the flight delay model.

## Data

Let

\[
x_1, x_2, \dots, x_n
\]

denote the observed positive arrival delays, where

\[
x_i > 0
\]

and

\[
n = 133004
\]

observations.

## Lognormal model

We assume that delays follow a lognormal distribution:

\[
X \sim \mathrm{Lognormal}(\mu,\sigma)
\]

This implies

\[
\ln(X) \sim N(\mu,\sigma^2)
\]

The density function is

\[
f(x|\mu,\sigma)
=
\frac{1}{x\sigma\sqrt{2\pi}}
\exp
\left(
-\frac{(\ln x-\mu)^2}{2\sigma^2}
\right)
\]

for \(x>0\).

## Likelihood

Given observations \(x_1,\dots,x_n\), the likelihood is

\[
L(\mu,\sigma)
=
\prod_{i=1}^{n} f(x_i|\mu,\sigma)
\]

## Log-likelihood

Taking logarithms gives

\[
\ell(\mu,\sigma)
=
\log L(\mu,\sigma)
\]

which simplifies to

\[
\ell(\mu,\sigma)
=
-\sum_{i=1}^{n}\ln x_i
-n\ln\sigma
-\frac{n}{2}\ln(2\pi)
-\frac{1}{2\sigma^2}
\sum_{i=1}^{n}(\ln x_i-\mu)^2
\]

## Maximum Likelihood Estimation

The MLE estimators are

\[
\hat{\mu}
=
\frac{1}{n}
\sum_{i=1}^{n}\ln x_i
\]

\[
\hat{\sigma}^2
=
\frac{1}{n}
\sum_{i=1}^{n}(\ln x_i-\hat{\mu})^2
\]

Using the data we obtain

\[
\hat{\mu}=2.963644
\]

\[
\hat{\sigma}=1.308409
\]

Thus the fitted model is

\[
X \sim \mathrm{Lognormal}(2.963644, 1.308409)
\]

## Moments

For a lognormal distribution:

Mean

\[
E[X]=e^{\mu+\sigma^2/2}
\]

Variance

\[
Var(X)=(e^{\sigma^2}-1)e^{2\mu+\sigma^2}
\]

Median

\[
Median(X)=e^\mu
\]

Using the fitted parameters:

\[
E[X] \approx 45.59
\]

\[
SD(X) \approx 97.13
\]

\[
Median(X) \approx 19.37
\]

## Probabilities

From the fitted model we obtain

\[
P(X \le 5) = 0.150334
\]

\[
P(X > 60) = 0.1937446
\]

## Interpretation

The distribution of delays is strongly right-skewed with a heavy tail.

Most delays are moderate, but rare extreme delays substantially increase the mean delay.

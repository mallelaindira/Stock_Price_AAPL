# Stock_Price_AAPL


AAPL Stock Price Prediction using GARCH Models
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot01.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot02.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot03.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot04.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot05.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot06.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot07.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot08.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot09.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot10.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot11.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot12.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot13.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot14.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot15.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot16.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot17.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot18.png)

## Stock Analysis with R: AAPL

This repository contains R code to analyze the stock prices of AAPL (Apple Inc.) using various techniques and models. 

### Prerequisites

Make sure you have the following libraries installed:

- quantmod
- xts
- PerformanceAnalytics
- rugarch

You can install these libraries using the `install.packages()` function in R.

### Data Retrieval and Visualization

To start the analysis, we retrieve the historical stock prices of AAPL from January 1, 2008, to December 31, 2023, using the `getSymbols()` function. Then, we plot the December 2023 returns and all returns using the `chartSeries()` function.

```R
# Load necessary libraries
library(quantmod)
library(xts)
library(PerformanceAnalytics)
library(rugarch)

# Retrieve AAPL stock prices from 2008-01-01 to 2023-12-31
getSymbols("AAPL", from = "2008-01-01", to = "2023-12-31")

# Plot AAPL's December 2023 returns and all returns
chartSeries(AAPL$AAPL.Close, subset = "2023-12", theme = "white")
chartSeries(AAPL$AAPL.Close, theme = "white")

# Calculate daily returns
returns <- CalculateReturns(AAPL$AAPL.Close)

# Plot daily returns
plot(returns, main = "AAPL Daily Returns")

# Create a histogram with a density curve
hist(returns, freq = FALSE, main = "AAPL Returns Distribution")
chart.Histogram(returns, main = "AAPL Returns Distribution")


# Plot rolling performance chart of monthly volatility
chart.RollingPerformance(returns, width = 30, FUN = "sd.annualized", main = "AAPL Monthly Volatility")


# Specify and fit GARCH models
spec <- ugarchspec(variance.model = list(model = "sGARCH"))
fit <- ugarchfit(spec, data = returns)

# Forecast volatility
forecast <- ugarchforecast(fit, n.ahead = 10)

# Perform simulations
simulations <- ugarchpath(fit, n.sim = 100)

# Plot simulated stock prices
plot.zoo(simulations@model$sigma, main = "Simulated Stock Prices")
matplot(simulations@model$sigma, type = "l", main = "Simulated Stock Prices")


# Retrieve AAPL stock prices from 2024-01-01 to 2024-03-31
getSymbols("AAPL", from = "2024-01-01", to = "2024-03-31")

# Plot closing prices
chartSeries(AAPL$AAPL.Close, theme = "white")


# Stock_Price_AAPL

AAPL Stock Price Prediction using GARCH Models

## Stock Analysis with R: AAPL

This repository contains R code to analyze the stock prices of AAPL (Apple Inc.) using various techniques and models. 

### Prerequisites

I have loaded/installed the following libraries:

- quantmod
- xts
- PerformanceAnalytics
- rugarch


### Data Retrieval and Visualization - AAPL stock prices from 2008-01-01 to 2023-12-31

To start the analysis, we retrieve the historical stock prices of AAPL from January 1, 2008, to December 31, 2023, using the `getSymbols()` function. Then, we plot the December 2023 returns and all returns using the `chartSeries()` function.

# Plot AAPL's December 2023 prices and historical prices
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot01.png)

![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot03.png)

# Calculating daily returns and Ploting daily returns
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot04.png)

# Creating a histogram with a density curve

![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot02.png)

# Plotting rolling performance chart of monthly volatility
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot05.png)

![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot06.png)
# Specifying and fitting GARCH models
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot07.png)

# Forecasting volatility
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot08.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot09.png)

# Fitting models with different parameters 

## **** the first model resulted in specifications that could be improved. Hence fitting other alternatives.
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot10.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot11.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot12.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot13.png)
# Performing simulations and Plotting simulated stock prices

![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot14.png)

![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot15.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot16.png)

# Retrieving AAPL stock prices from 2024-01-01 to 2024-03-31

# Plotting closing prices


![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot17.png)
![Image Title](https://github.com/mallelaindira/Stock_Price_AAPL/raw/main/Rplot18.png)


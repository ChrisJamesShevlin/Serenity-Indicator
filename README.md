![image](https://github.com/user-attachments/assets/60381667-375a-4911-a24f-0a867e03c4fa)

# Serenity Ratio Indicator

The **Serenity Ratio Indicator** is a custom technical analysis tool that combines volatility (via Average True Range), momentum (via Relative Strength Index), and trend-following elements (via Moving Averages) to evaluate the relative risk-adjusted performance of a trading instrument. This indicator helps traders identify potential overbought and oversold conditions, as well as overall market sentiment.

## Table of Contents
- [Overview](#overview)
- [Parameters](#parameters)
- [Calculation](#calculation)
- [Usage](#usage)
- [Installation](#installation)
- [Contributing](#contributing)
- [License](#license)

## Overview

The Serenity Ratio Indicator is designed to:
- Combine volatility, momentum, and trend strength into a single indicator.
- Measure the market’s "serenity" by accounting for risk (through ATR), momentum (via RSI), and trend (via a moving average).
- Provide potential buy and sell signals by identifying overbought or oversold levels in conjunction with price movements.

## Parameters

The Serenity Ratio Indicator has the following configurable parameters:

```
// Parameters
ATRPeriod = 14   // Period for the Average True Range calculation
MAPeriod = 50    // Period for the Moving Average calculation
RSIPeriod = 14   // Period for the Relative Strength Index calculation
```

These default parameters can be adjusted based on your trading preferences and the market being analyzed.

## Calculation

The Serenity Ratio is calculated using the following steps:

1. **True Range (TR):**
   - Calculate the True Range as the maximum of the following:
     - High - Low (current candle)
     - Absolute value of (High - Close[1]) (previous close)
     - Absolute value of (Low - Close[1]) (previous close)

   ```python
   TRValue = max(high - low, max(abs(high - close[1]), abs(low - close[1])))
   ```

2. **Average True Range (ATR):**
   - The ATR is the moving average of the True Range over the `ATRPeriod`.

   ```python
   ATRValue = average[ATRPeriod](TRValue)
   ```

3. **Moving Average (MA):**
   - The moving average of the closing price over the `MAPeriod`.

   ```python
   MALong = average[MAPeriod](close)
   ```

4. **Relative Strength Index (RSI):**
   - Calculate the RSI using the `RSIPeriod`.

   ```python
   RSIValue = RSI[RSIPeriod]
   ```

5. **Serenity Ratio Calculation:**
   - The final Serenity Ratio is derived from the following formula:
   
   ```python
   SerenityIndex = (100 - ATRValue) * (RSIValue / 100) * (close / MALong)
   ```

   This formula adjusts the market's volatility (via ATR) and momentum (via RSI) relative to the closing price and its moving average.

## Usage

### Buy Signal:
- A buy signal can occur when the Serenity Ratio crosses above a key level (e.g., 30 or 50) from below, indicating that the market might be entering a more bullish phase after oversold conditions.

### Sell Signal:
- A sell signal can occur when the Serenity Ratio crosses below a key level (e.g., 70 or 50) from above, signaling potential overbought conditions and the possibility of a bearish reversal.

### Example:
You can use the Serenity Ratio with standard overbought/oversold thresholds such as 70 (overbought) and 30 (oversold), or customize the thresholds depending on the market conditions.

## Installation

To use the Serenity Ratio Indicator in your platform:

1. **TradingView / Pine Script:**
   - Copy the formula into a new indicator script within TradingView.

   ```pinescript
   // Serenity Ratio Indicator
   ATRPeriod = 14
   MAPeriod = 50
   RSIPeriod = 14

   TRValue = max(high - low, max(abs(high - close[1]), abs(low - close[1])))
   ATRValue = ta.sma(TRValue, ATRPeriod)
   MALong = ta.sma(close, MAPeriod)
   RSIValue = ta.rsi(close, RSIPeriod)

   SerenityIndex = (100 - ATRValue) * (RSIValue / 100) * (close / MALong)

   plot(SerenityIndex, title="Serenity Ratio", color=color.green)
   ```

2. **MetaTrader / MQL5:**
   - The indicator can also be translated into MQL5 or other trading platforms.

3. **Python / Custom Backtesting:**
   - You can implement the formula in Python using libraries like `pandas` for data manipulation and `matplotlib` for plotting.

## Contributing

Contributions are welcome! If you would like to contribute to this project, please fork the repository and submit a pull request with your improvements.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more information.



// Parameters for the Serenity Index
ATRPeriod = 14 // ATR Period
MAPeriod = 50  // Moving Average Period
RSIPeriod = 14 // RSI Period

// Calculate the components
TRValue = max(high - low, max(abs(high - close[1]), abs(low - close[1]))) // True Range calculation
ATRValue = average[ATRPeriod](TRValue) // Average True Range
MALong = average[MAPeriod](close) // Moving Average
RSIValue = RSI[RSIPeriod] // RSI

// Serenity Index Calculation
SerenityIndex = (100 - ATRValue) * (RSIValue / 100) * (close / MALong)

// Plot the Serenity Index
return SerenityIndex

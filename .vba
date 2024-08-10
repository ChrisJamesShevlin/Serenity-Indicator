mmshort = average[short]
mmlong = average[long]
sto = stochastic[14,3]

if mmshort > mmlong then
if sto crosses over 20 then
signal = 1
else
signal = 0
endif

endif

return signal

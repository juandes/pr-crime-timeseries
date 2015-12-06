# Load data
pr_crime_table <- read.csv("~/Desktop/pr_crime_table.csv", row.names = 1)

# Transform the table into a vector; ts should just take a vector, it performs
# the split into times by itself
ts.model <- ts(c(t(pr_crime_table)), frequency = 12, start = c(2007, 1))
print(ts.model)

# Decompose the time series model using moving averages
decomposition.ma <- decompose(ts.model)

# Plot the seasonal trend
plot(decomposition.ma$figure, type="b", xaxt="n", xlab="")
months.names <- months(ISOdate(2007,1:12,1))
axis(1, at=1:12, labels=monthNames, las=2)

# Plot the general trend
plot(decomposition.ma$trend)

# Calculate the sum of crimes per year
apply(pr_crime_table, 1, function(x) sum(x))

#
# SPEC-hist.R, 26 Aug 18
#
# Data from:
# www.spec.org/cpu2006/results
#
# Example from:
# Evidence-based Software Engineering: based on the publicly available data
# Derek M. Jones
#
# TAG SPEC benchmark


source("ESEUR_config.r")

plot_layout(2, 1)


cpu2006=read.csv(paste0(ESEUR_dir, "benchmark/cpu2006-results-20140206.csv.xz"), as.is=TRUE)

start_date=as.Date("01-Jan-2006", format="%d-%B-%Y")
cpu2006$Test.Date=as.Date(paste0("01-", cpu2006$Test.Date), format="%d-%B-%Y")
cpu2006=subset(cpu2006, Test.Date >= start_date)

cint=subset(cpu2006, Benchmark == "CINT2006")
cint$Benchmark=NULL
cint=subset(cint, Result > 0)


hist(cint$Result, main="", col=point_col,
	xlab="SPECint result", ylab="Number of computers\n")

plot(density(cint$Result), col=point_col, main="",
	xlab="SPECint result", ylab="Density (of number of computers)\n")



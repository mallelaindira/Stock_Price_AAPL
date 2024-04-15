library(quantmod)
library(xts)
library(PerformanceAnalytics)
library(rugarch)


#Apple daily prices - charting Dec 2023 returns and all returns
getSymbols("AAPL",
          from="2008-01-01",
          to="2023-12-31")

chartSeries(AAPL["2023-12"])
chartSeries(AAPL)


#Charting Daily returns
return<-CalculateReturns(AAPL$AAPL.Close)
return<-return[-1]
hist(return)
chart.Histogram(return,
                methods=c('add.density','add.normal'),
                colorset=c('blue','green','red'))

chartSeries(return,theme='white')

#Annual volatility

sd(return)
sqrt(252)*sd(return["2008"])
sqrt(252)*sd(return["2023"])


chart.RollingPerformance(R=return["2008::2023"],
                         width=22,
                         FUN="sd.annualized",
                         scale=252,
                         main="Apple's monthly rolling volatility")

chart.RollingPerformance(R=return["2008::2023"],
                         width=252,
                         FUN="sd.annualized",
                         scale=252,
                         main="Apple's monthly rolling volatility")

#1. sGARCH model with constant mean - model could be improved

s<- ugarchspec(mean.model=list(armaOrder=c(0,0)),
               variance.model = list(model="sGARCH"),
               distribution.model = 'norm')
m<- ugarchfit(data=return, spec=s)

m

plot(m, which='all')
f<-ugarchforecast(fitORspec = m,
                  n.ahead=20)
plot(fitted(f))
plot(sigma(f))

#Application example - portfolio allocation
v <- sqrt(252)*sigma(m)
w<- 0.1/v
plot(merge(v,w),
     multi.panel=T)

#2. GARCH with sstd - this model is better than the previous one
s<- ugarchspec(mean.model=list(armaOrder=c(0,0)),
               variance.model = list(model="sGARCH"),
               distribution.model = 'sstd')
m<- ugarchfit(data=return, spec=s)

m
plot(m, which='all')

#3. GJR-GARCH - so far this model is the best
s<- ugarchspec(mean.model=list(armaOrder=c(0,0)),
               variance.model = list(model="gjrGARCH"),
               distribution.model = 'sstd')
m<- ugarchfit(data=return, spec=s)

m
plot(m, which='all')



#4. AR(1) GJR-GARCH ---AR1 too high indicating this model is not a good fit
s<- ugarchspec(mean.model=list(armaOrder=c(1,0)),
               variance.model = list(model="gjrGARCH"),
               distribution.model = 'sstd')
m<- ugarchfit(data=return, spec=s)

m
plot(m, which='all')


#5. GJR-GARCH in mean - this is also not useful as archm Pr(t) is 0.855041

s<- ugarchspec(mean.model=list(armaOrder=c(0,0),
                               archm=T,
                               archpow=2),
               variance.model = list(model="gjrGARCH"),
               distribution.model = 'sstd')
m<- ugarchfit(data=return, spec=s)

m
plot(m, which='all')

#simulation (we decided the third one we modelled is best so far)

s<- ugarchspec(mean.model=list(armaOrder=c(0,0)),
               variance.model = list(model="gjrGARCH"),
               distribution.model = 'sstd')
m<- ugarchfit(data=return, spec=s)



sfinal<-s

setfixed(sfinal) <- as.list(coef(m))


f2008 <-ugarchforecast(data=return["/2008-12"],
                       fitORspec = sfinal,
                       n.ahead=252)

f2023 <-ugarchforecast(data=return["/2023-12"],
                       fitORspec = sfinal,
                       n.ahead=252)

par(mfrow= c(1,1))
plot(sigma(f2008))
plot(sigma(f2023))

sim<-ugarchpath(spec=sfinal,
                m.sim=3,
                n.sim=1*66,
                rseed=123)

plot.zoo(fitted(sim))
plot.zoo(sigma(sim))

p<- 192.2846*apply(fitted(sim),2,'cumsum')+ 192.2846

matplot(p,type="l", lwd=3)

p

#next 20 actual AAPL prices

bee<-getSymbols("AAPL",
                from="2024-01-01",
                to="2024-03-31")

chartSeries(AAPL$AAPL.Close)




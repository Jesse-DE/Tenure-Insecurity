#library for reading excel data
library(readxl)

#Import the data

setwd("D:/ITC/10 MSc/Data/Survey_data/Non_encoded_data")
data <- read_excel("Survey_data.xlsx")
summary(data)

#loading FactoMinerR and Factoshiny
library(Factoshiny)
library(FactoMineR)
options(max.print=999999)

res <- MCA(data)

#Hierarchical ascendant clustering

res.HCPC <- HCPC(res, kk=Inf, min = 3, max = 10, consol = TRUE)
plot(res.HCPC, axes = 1:2)

#Look ar the results of clusterini
names(res.HCPC)
res.HCPC$call$t
res.HCPC$data.clust

res.HCPC$desc.var #variables results
res.HCPC$desc.axes
plot(res.HCPC, axes = c(1,2))
#Results for individuals (respondents)
res.HCPC$desc.ind


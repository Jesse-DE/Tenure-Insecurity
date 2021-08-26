library(readxl)
setwd("D:/ITC/10 MSc/Data/Survey_data/Non_encoded_data")
data <- read_excel("Survey_data.xlsx")
summary(data)

#Loading libraries
#library(Factoshiny)
library(FactoMineR)

#MCA with default graph

res <- MCA(data)
options(max.print=999999)#For printing maximum output
summary(res, ncp=3, nbelements = Inf) #Gives the results for all individuals

#Description of dimensions
#correlation between each variables and the first dimension
#only correlation significantly different to 0 are shown
#dimdesc(res) 

#Graph with labels
plot(res, label=c("var", "quali.sup"), cex=0.7)

#Graph with labels
plot(res, invisible = c("var", "quali.sup"), cex=0.7)#make variables and supplementary variable invisible

options(ggrepel.max.overlaps = Inf) #To show all label
plot(res, invisible = c("ind", "quali.sup"), autoLab ="yes", cex=0.7, title = "Active categories")
#uncomment if you set supplementary categor
#plot(res, invisible = c("ind", "var"), autoLab ="yes", cex=0.7, title = "Supplementary categories") 

#===================================================================================
#Select some categories

#select categories according to their quality of representation, their contribution and their name
plot(res, invisible = "ind", autoLab ="yes", cex=0.7, selectMod = "cos2 10")
#10 means showing 10 active variables (categories) with highest representation and will also show also 10 sup categories if any with high repres

#select categories (20) that most contribute the construction of the plane
plot(res, invisible = "ind", autoLab ="yes", cex=0.7, selectMod = "contrib 20")

#Select some individuals

#10 means showing 10 active categories with highest representation
plot(res, invisible = c("var", "quali.sup"), autoLab ="yes", cex=0.7, select = "cos2 20")

#Simultaneous representation with selection for individuals and categories
plot(res, autoLab ="yes", cex=0.7, select = "cos2 20", selectMod = "cos2 10")


#=====================================================================================
#Graph of variable /showing the squared relationship

plot(res, choix = "var", xlim = c(0,0.6), ylim = c(0,0.6)) #default graph

#Uncomment line below incase you have suplemenary variable to make them invisible
#plot(res, choix = "var", xlim = c(0,0.6), ylim = c(0,0.6), invisible = c("quali.sup", "var"))

#======================================================================================
#Graphs on dimensions 3 and 4

plot(res, invisible = c("var", "quali.sup"),cex=0.7, select = "contrib 20", axis=3:4)
plot(res, invisible ="ind",autoLab ="yes", cex=0.7, selectMod = "contrib 20", axis=3:4)

#=====================================================================================

#Drawing individual with respect to their categories (Remember we have 28 categories)
plot(res, cex = 0.8,  habillage = 24, title = "Individual MCA graph by category")


#Confidence ellipse around categories for the variables 12 to  15
plotellipses(res, keepvar = c(20:25))

#Confidence ellipse around categories (Answer for each question) for the variables each categories
plotellipses(res, keepvar = c(25:25), axis=3:4)


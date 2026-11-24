###############################################
##             STATISTICS                    ##
## Bioinformatics and Computational Genomics ##
###############################################

###############################################
#                LABORATORY 2                 #
#           DESCRIPTIVE STATISTICS            #
###############################################

# Topics:
# - Examples of descriptive statistics (multiple groups and complex datasets)

##############
# EXERCISE 1 #
##############

# Analysis of the data in 'patients.txt', 
# that contains data about patients with heart attack 
# We have 4 variables:
# AGE
# WEIGHT
# HEIGHT
# SEX: 1=female 2=male

# How many males and females do we have?
# Consider the variable HEIGHT. Is its distribution symmetric? Are there any outliers?
# What happen to the distribution if we exclude these outliers?
# Consider the variable WEIGTH. Are there any differences between males and females?
# What happen if we exclude the not realistic outliers?
# Are there any relationships among the variables AGE, HEIGHT and WEIGHT? 
# How these relationships change if we consider the SEX group?

# NOTE: there are NA data... use the argument na.rm=TRUE
#       for example:
#       sd(patients$HEIGHT,na.rm=TRUE)

setwd("C:/Users/giuli/Desktop/Statistics 2024/Lab 2")

# Import data
patients=read.table('patients.txt',header=TRUE)

head(patients)
str(patients)

# SEX should be a factor variable... change it
patients$SEX[patients$SEX==1]='female'
patients$SEX[patients$SEX==2]='male'
patients$SEX=as.factor(patients$SEX)
str(patients)

attach(patients)


# How many males and females do we have?
table(SEX)


# Consider the variable HEIGHT
summary(HEIGHT)
# We have many NA! Use the argument na.rm=TRUE to compute location and dispersion parameters...
sd(HEIGHT,na.rm=TRUE)

# Histogram
x11()
hist(HEIGHT,prob=TRUE,xlab='Height',main='Histogram HEIGHT')
# Asymmetric distribution, fat left tail?

# Boxplot
x11()
boxplot(HEIGHT,ylab='Height',main='Boxplot HEIGHT')
# The asymmetry is only because of many lower outliers!
# The box is quite symmetric... 

# Outliers
outliers=boxplot(HEIGHT,plot=FALSE)$out
outliers
# Outliers are probably due to errors in data recording...

# Try to remove outliers
outliers.index=which(HEIGHT<boxplot(HEIGHT,plot=FALSE)$stats[1])
patients.sel=patients[-outliers.index,]

detach(patients)
attach(patients.sel)

summary(HEIGHT)
sd(HEIGHT,na.rm=TRUE)
# Less variability

# Histogram
x11()
hist(HEIGHT,prob=TRUE,xlab='Height',main='Histogram HEIGHT after selection')

# Boxplot
x11()
boxplot(HEIGHT,ylab='Height',main='Boxplot HEIGHT after selection')
# More symmetric distribution 


# Consider the variable WEIGHT, in the two SEX groups
tapply(WEIGHT,SEX,summary)
tapply(WEIGHT,SEX,sd,na.rm=TRUE)

# Histogram
x11()
par(mfrow=c(2,1))
hist(WEIGHT[SEX=='female'],prob=TRUE,xlab='Weight',main='Histogram WEIGHT Females',
     col='pink',xlim=range(WEIGHT,na.rm=TRUE),breaks=seq(20,140,10))
hist(WEIGHT[SEX=='male'],prob=TRUE,xlab='Weight',main='Histogram WEIGHT Males',
     col='lightblue',xlim=range(WEIGHT,na.rm=TRUE),breaks=seq(20,140,10))

# Boxplot
x11()
boxplot(WEIGHT~SEX,col=c('pink','lightblue'),ylab='Height',main='Boxplot HEIGHT')
# Female distribution is quite symmetric
# Male weight has many outliers

# Male outliers
outliers=boxplot(WEIGHT[SEX=='male'],plot=FALSE)$out
outliers

# Try to remove the two lower outliers (not realistic values)
outliers.index2=which((WEIGHT<boxplot(WEIGHT[SEX=='male'],plot=FALSE)$stats[1])&(SEX=='male'))
patients.sel.sel=patients.sel[-outliers.index2,]

detach(patients.sel)
attach(patients.sel.sel)

# Consider the variable WEIGHT, in the two SEX groups
tapply(WEIGHT,SEX,summary)
tapply(WEIGHT,SEX,sd,na.rm=TRUE)
# Less variability in males

# Histogram
x11()
par(mfrow=c(2,1))
hist(WEIGHT[SEX=='female'],prob=TRUE,xlab='Weight',main='Histogram WEIGHT Females',
     col='pink',xlim=range(WEIGHT,na.rm=TRUE),breaks=seq(20,140,10))
hist(WEIGHT[SEX=='male'],prob=TRUE,xlab='Weight',main='Histogram WEIGHT Males',
     col='lightblue',xlim=range(WEIGHT,na.rm=TRUE),breaks=seq(20,140,10))

# Boxplot
x11()
boxplot(WEIGHT~SEX,col=c('pink','lightblue'),ylab='Height',main='Boxplot WEIGHT')
# Both distributions are symmetric
# There are some outliers with high weight
# Men tend to have a weight higher than women


# Consider all variables
# Select patients without NA in all the three variables
index=which((!is.na(AGE))&(!is.na(WEIGHT))&(!is.na(HEIGHT)))
patients.not.na=patients.sel[index,]

detach(patients.sel)
attach(patients.not.na)

x11()
pairs(patients.not.na[,1:3])

cor(patients.not.na[,1:3])
# HEIGHT and WEIGHT are positively correlated

# Scatterplot with colors for males and females
colors=rep(NA,nrow(patients.not.na))
colors[SEX=='female']='pink'
colors[SEX=='male']='lightblue'
x11()
pairs(patients.not.na[,1:3],col=colors)

cor(patients.not.na[SEX=='female',1:3])
cor(patients.not.na[SEX=='male',1:3])
# correlation between HEIGHT and WEIGHT is not high in females

detach(patients.not.na)


##############
# EXERCISE 2 #
##############

# Analysis of the data in 'record.txt', 
# that contains running records obtained from athletes from different countries 
# in varius types of athletics events (sprints and middle-distance). 
# We have data about 55 countries (observations) and 6 records (variables):
# 100 metres, 200 metres, 400 metres, 800 metres, 1500 metres and 3000 metres

# Are there any relationships between the different athletic events?

# Import data in R
record <- read.table('record.txt', header=TRUE)

attach(record)
head(record)
str(record)


#### Studing relationships between many variables ####

# Compute the main location and dispersion parameters
summary(record)

# Matrix with variances and covariances between variables
var(record)

# Matrix with correlations
cor(record)
# Positive correlations between variables
# Higher correlations between similar distances

# Scatterplot
x11()
plot(record,main='Scatter plot Running records')
pairs(record,main='Scatter plot Running records') # Same plot...

# Packages
# R packages are collections of R functions and data. 
# R comes with a standard set of packages, but many others can be downloaded and installed (from CRAN, bioconductor...)
# To install a package from CRAN click on 'Packages', then 'Instal package(s)...' 
# To install a package from a local .zip file click on 'Packages', then 'Install package(s) from local zip files'
# We can also use the command 'install.packages'
#install.packages('rgl') 

# Plot 3D
library(rgl)
plot3d(record[,1],record[,2],record[,3],xlab='100 metres',ylab='200 metres',zlab='400 metres')

# Boxplot
x11()
boxplot(record,ylab='records',main='Boxplot Running records')
x11()
boxplot(record[,1:3],ylab='records',main='Boxplot Running records - Sprints')
# Distributions are quite symmetric
# Presence of some outliers in almost all variables

# Are the countries with high times in sprints running the same that are slow also in middle-distances?
bx=boxplot(record,plot=FALSE)
bx

outliers=bx$out
outliers_group=bx$group
rownames(record)

rownames(record)[which(record[,outliers_group[1]]==outliers[1])]
rownames(record)[which(record[,outliers_group[2]]==outliers[2])]
rownames(record)[which(record[,outliers_group[3]]==outliers[3])]
rownames(record)[which(record[,outliers_group[4]]==outliers[4])]
rownames(record)[which(record[,outliers_group[5]]==outliers[5])]

# Are the countries with low times in 100 metres the same with low times in 200 metres?
rownames(record)[order(record[,1])[1:2]] 
rownames(record)[order(record[,2])[1:2]]


# Consider the 400 metres data and draw a normal probability plot


# Q-Q plot (or Normal Probability Plot)
# We represent on x-axis the theoretical quantiles of a standard normal N(0,1)
# and on y-axis the empirical quantiles

x11()
qqnorm(m400,main='Q-Q plot record 400 metres',ylab='Empirical quantiles',xlab='Theoretical quantiles')
qqline(m400,col='red')

detach(record)



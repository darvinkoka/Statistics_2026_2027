
###############################################
##                  STATISTICS               ##
## Bioinformatics and Computational Genomics ##
###############################################


###############################################
#             INTRODUCTION TO R               #
###############################################

# R is a free software for statistical computing

# To download R: http://www.r-project.org/
# To have more information on R look at the "help" menu of R

# Reference:
# Dalgaard -  Introductory Statistics with R, Springer (2008)
# http://link.springer.com/book/10.1007%2F978-0-387-79054-1

# To download RStudio (after R): https://www.rstudio.com/

# if you need help:
# help in R
# search on Google (best choice) 
    #Useful site: Stackoverflow (for sure, someone has already faced the problem 
    #                            you are trying to solve)
# contact me


# Topics:
# - Basic commands of R language
# - Plots


# In RStudio you can:
# - Write commands directly in the console
# - Write commands in a script, save it as .r and then run it (better choice)
#   To execute the selected code: Ctrl+Enter (Command+Enter on Mac systems) 

# NOTE: Commands written after the symbol '#' are not executed, 
#       and can be used as comments in the script

# NOTE: R needs a WORKING DIRECTORY
#       To set or change it:
#       - After selecting R Console window, click on 'Session' and then 
#         'Set working directory'...'
#       - Use the command 'setwd'
setwd('C:/Users/giuli/Desktop/Statistics 2025/Lab 1')
### for Windows user: pay attention to / and \ in the copy and paste!!!! ###


# To get the current working directory
getwd()


###################
# R as calculator #
################### 

# We can use R to compute simple aritmetic expressions

(12*0.5+4)/4
# using standard mathematical functions
sqrt(9)
log(10)
exp(1)
3^{-1*2}
log(-1)
sqrt(-1)
#############
# R objects #
#############

# We create R symbolic variables assigning them values
# Left-hand Assignment operator: '<-' (equivalent to '=')

### Scalars ###
a<-1 
a  #R is case sensitive!

b=2
b


a=b
a
b

#So what happens if we do 2=2?

### Vectors ###
# To create vectors we use the functions 'c', ':', 'seq' or 'rep'

# 'c' is used to concatenate values
v1=c(2,4,7,10)
v1

letters=c("a",'b','c','d')
letters

# ':' and 'seq' are used to create regular sequences
v2=1:5
v2

v3=seq(0,5,by=0.5)
v3

v4=seq(0,5,length.out=3)
v4

# If we need information about a particular function we can use the command 'help'
help(seq)

# What if we don't remember the name of the function? Use the command 'help.search'
help.search("sequence")

# 'rep' is used to generate a vector with repeated values
v5=rep(1,10)
v5

# We can also combine vectors
v6=c(v4,v5)
v6

### Matrices ###
M1=matrix(data=1:12,nrow=4,ncol=3)
M1

M2=matrix(data=1:12,nrow=4,ncol=3,byrow=TRUE)
M2

M3=cbind(c(2,4,8),c(3,6,12))
M3

t(M3)


M4=rbind(1:3,4:6)
M4

# NOTE: in R vectors are NOT matrices of dimensions n*1 or 1*n

m=is.matrix(v1)
m

v2=as.matrix(v2)
v2

### Extract elements from vectors or matrices
v1
length(v1) 

v1[2]
v1[1:3]
v1[c(1,3)]
v1[-1]  
v1[-length(v1)]

M1
dim(M1) 

dim(t(M1))

M1[1,3]
M1[2:4,1]
M1[4,c(1,3)]

M1[3,]
M1[,2]

M1[c(1,3,4),2:3]

### Manage the workspace ###
# To get all the variables in the workspace
ls()

# How to remove variable M1?
rm(M1)
ls()

# If we want to remove all variables...
rm(list=ls())
ls()



#############################
# ALGEBRAIC OPERATIONS IN R #
#############################
# NOTE: The default in R is to perform operation componentwise
a=1
b=2
c=c(2,3,4)
d=rep(10,3)


### Scalars and vectors ###
a+b # Scalar + scalar
c+d # Vector + vector
a*b # Scalar * scalar
c*d # Vector * vector (componentwise)
c^3 # Power (componentwise)
exp(c) # Exponential (componentwise)

# BE CAREFUL: R uses recycling!
#             To perform operations componentwise on vectors with different dimensions, 
#             R recycles the values of the shortest vector so that the operation can 
#             be computed. 
#             Sometimes we get a warning, other times no...
e=1:3
f=rep(10,5)
e+f 

g=rep(10,6)
e+g

c+a # Vector + scalar

### Matrices ###

W=matrix(data=1:12,nrow=4,ncol=3)
W
Z=rbind(rep(0,3),1:3,10:12,c(4,7,1))
Z

Z+W # Matrix + matrix (componentwise)
Z*W # Matrix * matrix (componentwise)

# What if we need matrix operations?
V=t(W) # Traspose
V

V*W # Matrix * matrix (componentwise)
# Error: different matrix dimensions

# Matrix multiplication
V%*%W
W%*%V 
Z%*%W 
# Error: matrices have incompatible dimensions!

# BE CAREFUL: R uses recycling also with matrices
W+a # Matrix + scalar

W
c
W+c # Matrix + vector
# Better don't do that...


### Useful functions ###
sum(c) # Sum of the vector components
prod(c) # Prodoct of the vector components

sum(Z) # Sum of the matrix components
prod(Z) # Product of the matrix components
colSums(Z) # Sum column by column of the matrix
rowSums(Z) # Sum row by row of the matrix

###################
# OTHER R OBJECTS #
###################

### Boolean variables ###
a==1

a!=1

c
c>3
sum(c>3)

# check conditions
a
if(a == 1){
  a = a + 1
}else{
  a <- a - 1
}
a

# repeat code for some iterations
for(i in 1:10){
  a = a - 1
}
a

### Dataframes ###
# R objects that contain different variables
# They are similar to matrices (but they are NOT matrices) 
# whose columns represent the variables under study and the rows are 
# the different observations

exam=data.frame(id=as.character(c(45020,45679,46789,43126,42345,47568,45674)),
                written=c(30,19,29,NA,25,26,18), 
                project=c(3,3,-1,NA,3,2,NA), 
                total=c(30,22,28,NA,28,28,NA)
)
exam

# To access a specific column (variable) of a dataframe we can use the symbol '$'
exam$written

# We can access directly the variables of a dataframe, with the command 'attach'
attach(exam) 
written

# To remove the direct accessibility of the attached variables we use 'detach'
detach(exam)
written
# NOTE: We are not removing the dataframe, just the direct access!


############
# GRAPHICS #
############
## To plot points in the x-y plane we use 'plot'
x=0:3
y=c(4,5,2,10)

x11() # Create a new graphics device (use 'quartz()' on Mac)
plot(x,y) # Plot points (x,y)

x=seq(0,3,by=0.01)
y=x^2
x11()
plot(x,y,type='l') # Plot a line
points(1,1,col='red') # Add the point (1,1) to the plot, in red
z <- x^3
lines(x,z,col='blue') # Add a line to the plot, in blue

# better quality plots:
# have a look at plotly or ggplot (spend some time to improve 
#                                  the quality of your plots)

#functions:

Heaviside_step_function <- function(x){
  browser()
  if(x<0) return(0)
  return(1)
}

Heaviside_step_function(1)
Heaviside_step_function(-Inf)
Heaviside_step_function(0)


########
# SAVE #
########
# To save the script:
# select the script window, click on 'File' and then 'Save'

# To save a graphic:
# select the graphic device, click on 'File' and then 'Save as'

# To save dataframes, vectors, matrices... in a text file
write.table(W, 'my_matrix.txt')

# To save R objects in a .RData file
save(x,y,z,file='my_variables.RData')

# NOTE: R saves in the current working directory!

# To load a saved .RData
load('my_variables.RData')


# "The tool that is so dull that you cannot cut yourself on it is non likely
# to be sharp enough to be either useful or helpful"
# Tukey, J. W. (1965). The technical tools of statistics. The American Statistician, 19(2), 23–28.

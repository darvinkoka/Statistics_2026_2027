#R can also be used as calculator 

5*12
sqrt(9)
log(210)
exp(1)
log(10)*exp(23)/sqrt(104)
(12*4+5)*2
log10(100)

#matrixes and vectors
a <- 2
b = 2

c<- a*b
v1 <- c(2,4,7,10)
letters = c('a', 'b', 'c')


2 = 3
2 = 2

a == b
a == 3

a <-7

v2 <- 1:10

a <- 2

v3 <- seq(0, 5, by = 0.5)
help(seq)

v4 <- rep(1,10)
v4
help(rep)

v5 <- c(v3,v4)
v5

matrix(0, nrow = 3, ncol = 2)

M1 <- matrix(1:12, nrow = 4, ncol = 3)
M2<- matrix(1:12, nrow = 4, ncol = 3, byrow = TRUE)

v6 <- c(1,2,3)
v7 <- c(4,5,6)

M3 <- cbind(v6,v7)
M3

M4 <- rbind(v6,v7)
M4

M4
M5 <- t(M4)
M5

is.matrix(v6)
v6 <- as.matrix(v6)
is.matrix(v6)
v6

length(v6)

v6[4]
v6[1]

v6[1:2]
v6[c(1,3)]


M3
M3[2, 2]

M3[1:2,2]
m3

M3[1,]
M3[,2]

ls()
rm(M3)
rm(list = ls())

M3

#Operations with variables

a = 1
b = 2 
c <- c(2,3,4) 
d <- rep(10, 3)

a+b
a*b
a/b
a^b
exp(a)

e<- 1:3
f <- rep(10, 5)
e
f

e+f

a+e

M1 <-matrix(1:12, nrow = 4, ncol = 3)
M2 <- rbind(rep(0,3), 1:3, 10:12, c(4,7,1))
M1
M2

M1+M2 

M1*M2
M1 %*% M2

dim(M1)
dim(M2)

M2<-t(M2)
M2
dim(M2)
M1%*%M2

M1+a

M1
M1*2


e
sum(e)
prod(e)
M1
colSums(M1)
rowSums(M1)

a
bool1 <- a==1
bool1

a==1
a!=2
a
a!=1

a>=1
a > 1

if(a == 1){
  cat("ciao")
}else{
  cat("bye")
}


if(a > 1){
  cat("ciao")
}else{
  cat("bye")
}

e
g <- c(e,f)
g
1:10
for(i in 1:10){
  cat("ciao\n")
  cat(i)
}

g
for(i in 1:length(g)){
  g[i] <-g[i]-1
}
g

#data.frames

exam = data.frame(id=c(123,456,789),
                  written = c(10, 30, 32),
                  projects = c(30,27,25))
exam
ID <- exam$id
ID

attach(exam)
id
detach(exam)

#graphics

x = 0:3
x
y <- c(4,5,2,10)
plot(x,y, type = 'l', col = "red")

x11()
quartz()
plot(x,y, type = 'l', col = "red")

y2<- c(1,2,3,4)
points(x,y2)

lines(x,y2)

Heaviside_step_function <- function(x){
  browser()
  if(x<0) return(0)
  return(1)
}

Heaviside_step_function(0)
Heaviside_step_function(2)
Heaviside_step_function(-1)

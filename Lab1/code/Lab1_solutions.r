###############################################
##                  STATISTICS               ##
## Bioinformatics and Computational Genomics ##
###############################################


###############################################
#                LABORATORY 1                 #
#       DESCRIPTIVE STATISTICS - Solutions    #
###############################################


##############
# EXERCISE 2 #
##############

# Descriptive analysis of the categorical variable in file 'patients_registry.txt', 
# that contains data about patients with heart attack
# 3 variables:
# HOSPITAL:        ID of the hospital where the patient arrives
# TIME_TO_SURGERY: time (min) between the onset of the heart attack and the surgery
# VEHICLE:         vehicle used to reach the hospital
#                  CAR:       private car
#                  FLYCAR:    ambulance emergency response vehicle
#                  AMBULANCE: ambulance
#                  TRANSFER:  programmed transfer from a different hospital

# How many patients do we have?
# How many patients used their private car to reach the hospital?
# For how many patients we don't know the vehicle used? (tip: use command 'is.na')
# Describe the variable VEHICLE using graphics
# Which is the mode of the variable VEHICLE?

# NOTE: there are some missing values (NA) in the data

patients=read.table('patients_registry.txt', header=TRUE)

head(patients)
dim(patients)
# We have 1080 patients

attach(patients)
VEHICLE

which(VEHICLE=='CAR')
length(which(VEHICLE=='CAR'))
# 371 patients used their private car to reach the hospital

is.na(VEHICLE)
sum(is.na(VEHICLE))
# For 21 patients we don't know the vehicle used to reach the hospital

# Barplot (absolute frequencies)
x11()
plot(VEHICLE,xlab='Vehicle',ylab='Absolute frequencies',main='Barplot VEHICLE')

# Relative frequencies table
VEHICLE_abs=table(VEHICLE)
VEHICLE_rel=prop.table(VEHICLE_abs)

# Barplot (relative frequencies)
x11()
barplot(VEHICLE_rel,xlab='Vehicle',ylab='Relative frequencies',main='Barplot VEHICLE')

# Pie chart
x11()
pie(VEHICLE_rel,col=rainbow(length(VEHICLE_rel)),main='Pie chart VEHICLE') 

# Compute the mode
VEHICLE_abs[VEHICLE_abs==max(VEHICLE_abs)]
# CAR is the mode

detach(patients)



##############
# EXERCISE 3 #
##############

# Descriptive analysis of the quantitative data in file 'temperature.txt'. 
# 130 observations of 3 variables
# Temperature: body temperature (Fahrenheit degrees)
# Sex:         M=man, W=woman
# HeartBeats:  pulses for minute

# Is the distribution of the temperature symmetric?
# Are there any outliers?
# Are there any differences between the temperature in men and women?

# NOTE: decimal points are here indicated with a comma, so we must use the argument 'dec=',''
#       when we import the dataset


temp <- read.table('temperature.txt',header=TRUE,dec=',')

head(temp)
dim(temp)

attach(temp)

# Compute the main location and dispersion parameters
summary(Temperature)

# Histogram
x11()
hist(Temperature,main='Histogram Temperature',prob=TRUE) 

# Boxplot
x11()
boxplot(Temperature,ylab='Temperature',main='Boxplot Temperature')
# The distribution of the variable Temperature is quite symmetric
# There are 2 lower outliers and 1 upper outlier

Temperature_male=Temperature[which(Sex=='M')]
Temperature_female=Temperature[which(Sex=='W')]

# Compute the main location and dispersion parameters in the two groups
summary(Temperature_male)
summary(Temperature_female)
sd(Temperature_male)
sd(Temperature_female)

# Histograms, divided in groups
x11()
par(mfrow=c(2,1))
hist(Temperature_male,prob=TRUE,xlab='Temperature',main='Histogram Males',
     col='lightblue',xlim=range(Temperature),ylim=c(0,0.6),breaks=seq(96,101,by=0.5))
hist(Temperature_female,prob=TRUE,xlab='Temperature',main='Histogram Females',
     col='pink',xlim=range(Temperature),ylim=c(0,0.6),breaks=seq(96,101,by=0.5))

# Boxplot, divided in groups
x11()
boxplot(Temperature_male,Temperature_female,col=c('lightblue','pink'),names=c('Males','Females'),
        main="Temperature - Males and females")
# Temperature is a bit higher in women then in men
# Both distributions are quite symmetric, even if in males we observe a fatter left tail
# The dispersion is higher in women (higher standard deviation and presence of 4 outliers)

detach(temp)

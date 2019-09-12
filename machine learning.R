# Data set as been taken from kaggle data repisotory {International football results from 1872 to 2019}
# Data set is named as "soccer.data"
library(readr)
soccer<-read_csv("results.csv",col_names = TRUE)
View(soccer)

# Descriptive  Statistics of the Soccer
# Mean() using function
# Assigning home team column to variable a and home score to b
a<-soccer$home_team 
b<-soccer$home_score
#Using tapply function we can find out average home_score of each team
c<-tapply(b, a, mean)
print(c)
# TO find average home_score of team England and Yorkshire and categorical value
print(c["England"])
c["Yorkshire"]

#Number of matches played by each team
d<-table(soccer$home_team)
print(d)
# Finding the highest number of matches played by a home_team
max(d)

#median away_score of england team for all the matches played
e<-soccer[,c(3,5)]
e$away_score[e$away_team=="England"]
print(median(e$away_score[e$away_team=="England"]))

#Range of away_score of scotland team for all the matches played
range(soccer$away_score[soccer$away_team=="Scotland"])
# Quantlie for the cities they have played 
table(soccer$city)
range(table(soccer$city))
quantile(table(soccer$city))

# Variance of the Wales team withrespect to home score and away score
f<-soccer$away_score[soccer$away_team =="Wales"]
g<-soccer$home_score[soccer$home_team=="Wales"]
length(f)
#Since lenghth of f is too high we are limiting the f which is equal to g
n<-f[c(1:317)]
length(g)
h<-var(f[c(1:317)],g)

# Standard deviation of the wales team withrespect to and away score
sd(f)
summary(soccer)

# Barplot for Number of matches played during the year 1872-1892. 
i<-soccer$date[c(1:100)]
mdate<-as.Date(x1,"%Y-%m-%d")
class(mdate)
format(mdate,"%Y")
barplot(table(format(mdate,"%Y")),main = "Number of matches played during year 1872-1892",xlab = "Years",ylab = "No.of Matches played",col = "Green")
j<-barplot(table(format(mdate,"%Y")),main = "Number of matches played during year 1872-1892",xlab = "Years",ylab = "No.of Matches played",ylim = c(0,10),col=)
text(j,table(format(mdate,"%Y")),labels =as.character(table(format(mdate,"%Y"))),adj = c(0.5,-0.5))

#Scatter plot between away team and away score
table(soccer$home_team[soccer$home_team =="Wales"])
plot(g, n, main = "Scatter plot between home score and away score of wales",xlab = "home score",ylab = "away score")

#Tranformation
k<-(soccer$home_score)^2
sqrt(k)
cube<-(soccer$away_score)^3
print(cube)


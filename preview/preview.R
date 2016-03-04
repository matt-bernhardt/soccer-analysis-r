# This script generates a series of plots used to preview a given game.
# It reads in past performance data for each team, and generates three
# plots:
# 1 - a running graph of points earned
# 2 - a running graph of points per game
# 3 - a running graph of cumulative playing time concentration (HHI index)

# Read in data files, one per team
# The number appended to "preview" in each observation in this case is a 
# Team ID value
preview11 <- read.csv('data/calculate_hhi_11_2015.csv')
preview12 <- read.csv('data/calculate_hhi_12_2015.csv')
preview13 <- read.csv('data/calculate_hhi_13_2015.csv')
preview14 <- read.csv('data/calculate_hhi_14_2015.csv')
preview15 <- read.csv('data/calculate_hhi_15_2015.csv')
preview16 <- read.csv('data/calculate_hhi_16_2015.csv')
preview17 <- read.csv('data/calculate_hhi_17_2015.csv')
preview18 <- read.csv('data/calculate_hhi_18_2015.csv')
preview19 <- read.csv('data/calculate_hhi_19_2015.csv')
preview20 <- read.csv('data/calculate_hhi_20_2015.csv')
preview42 <- read.csv('data/calculate_hhi_42_2015.csv')
preview43 <- read.csv('data/calculate_hhi_43_2015.csv')
preview44 <- read.csv('data/calculate_hhi_44_2015.csv')
preview45 <- read.csv('data/calculate_hhi_45_2015.csv')
preview340 <- read.csv('data/calculate_hhi_340_2015.csv')
preview427 <- read.csv('data/calculate_hhi_427_2015.csv')
preview463 <- read.csv('data/calculate_hhi_463_2015.csv')
preview479 <- read.csv('data/calculate_hhi_479_2015.csv')
preview506 <- read.csv('data/calculate_hhi_506_2015.csv')
preview547 <- read.csv('data/calculate_hhi_547_2015.csv')

# Set overall graphing parameters
par(
  mfrow=c(1,1), # only one plot per image
  new=F, # clear the plot frame before each plot
  las=1, # axis labels are always horizontal
  pch=21, # graphic marks are circles with separate stroke and fill colors
  cex.axis = 0.7, # font size of axis marks
  cex.lab = 0.85, # font size of axis labels
  cex=1.2 # base font size
)

# Define plot colors - this can be done for easier recognition of teams
homeColor = "blue"
homeFill = "white"
awayColor = "#ffd407"
awayFill = "black"

# Simple plots

# 1 - Points earned
par(new=F,lwd=2)
plot(preview45$Points,col=homeColor,main="Points earned - Montreal Impact and Columbus Crew SC",xlab="Games played",ylab="Points earned",xlim=c(1,34),ylim=c(0,50),type="s")
grid(lty=1,lwd=1,col="#e1e1e6")
par(new=T,lwd=2)
plot(preview11$Points,col=awayColor,xlim=c(1,34),ylim=c(0,50),xlab="",ylab="",type="s")
text("Matt Bernhardt\n@BernhardtSoccer\nMassiveReportData.com",x=34.5,y=0,col="gray",adj=c(1,0))
par(new=F)

# 2 - Points per game
plot(preview463$PPG,bg="white",col="white",main="Points per game - Montreal Impact and Columbus Crew SC",xlab="Games played",ylab="Points per game",xlim=c(1,34),ylim=c(0,3),type="o")
grid(lty=1,lwd=1,col="#e1e1e6")
par(new=T,lwd=2)
plot(preview463$PPG,bg=homeFill,col=homeColor,xlab="",ylab="",xlim=c(1,34),ylim=c(0,3),type="o")
par(new=T)
plot(preview45$PPG,bg=awayFill,col=awayColor,xlim=c(1,34),ylim=c(0,3),xlab="",ylab="",type="o")
text("Matt Bernhardt\n@BernhardtSoccer\nMassiveReportData.com",x=34.5,y=0,col="#cccccc",adj=c(1,0))
par(new=F)

# 3 - Lineup concentration
plot(preview45$HHI,cex=1.2,bg="white",col="white",main="Playing time concentration - Montreal Impact and Columbus Crew SC",xlab="Games played",ylab="Playing time concentration",xlim=c(1,34),ylim=c(0,1),type="o")
grid(lty=1,lwd=1,col="#e1e1e6")
par(new=T,lwd=2)
plot(preview45$HHI,cex=1.2,bg=homeFill,col=homeColor,xlab="",ylab="",xlim=c(1,34),ylim=c(0,1),type="o")
par(new=T)
plot(preview11$HHI,cex=1.2,bg=awayFill,col=awayColor,xlim=c(1,34),ylim=c(0,1),xlab="",ylab="",type="o")
text("Matt Bernhardt\n@BernhardtSoccer\nMassiveReportData.com",x=34.5,y=0,col="gray",adj=c(1,0))
par(new=F)

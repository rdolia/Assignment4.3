states=rownames(USArrests)
#. Get states names with 'w'
#convert to lower case
lowerstates <- tolower(states)
lowerstates

lsdframe<-as.data.frame(lowerstates)

library(sqldf)

sqldf("SELECT * 
      FROM lsdframe 
      WHERE `lowerstates`LIKE 'w%'") 

#. Get states names with 'W'.
dfstates<- as.data.frame(states)
dfstates                        
sqldf("SELECT * 
      FROM dfstates 
      WHERE `states`LIKE 'W%'") 

#2. Prepare a histogram of the number of characters in each US state.s

library(ggplot2)

states1 <-  as.data.frame(nchar(states))
#add a column of names to states1 dataframe
states1$States<- states
colnames(states1)<-c("Characters","States")
states1
ggplot(states1, aes(x=Characters)) + geom_histogram()
     
       
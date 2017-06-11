work.dir = 'C://Users/uqoho1/Documents'; setwd(work.dir)
data = read.csv('total.csv') 

library(ggplot2)

ggplot(data=data, aes(x=Year, y=pixels_immersed, group=1)) +
  geom_line() +
  ylab("Percentage of pixels immersed")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(panel.border = element_rect(fill=NA,colour="black",size=0.5))+
  theme(text=element_text(size=15))

data2 = read.csv('yearly.csv')

ggplot(data=data2, aes(x=Year, y=pixels_immersed), group=Year) +
  geom_line() +
  ylab("Number of pixels immersed")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(panel.border = element_rect(fill=NA,colour="black",size=0.5))

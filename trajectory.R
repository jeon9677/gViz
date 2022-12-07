library(ggplot2)
library(shiny)
library(plotly)
current_path <-rstudioapi::getActiveDocumentContext()$path
setwd(dirname(current_path ))
getwd()


load(paste0(getwd(),"/interactions.rda"))


library(ggplot2)

x <- c(100, 200, 300, 200, 500, 320, 300, 50)
y <- c(100, 250, 600, 700, 60, 120, 200, 360)
t <- rep(seq(2009,2012),2)
z <- rep(c("A","B"),each=4)

d <- as.data.frame(cbind(z,t,x,y))
d <- d[order(d$z, d$t),]
head(d)

ggplot(data = d, aes(x = x, y = y, colour = z, label=t)) + 
  geom_line(aes(group = z)) +
  geom_point() +
  geom_text()


head(d)


all = rbind(b$'60_new_b',b$'70_new_b',b$'75_new_b',b$'80_new_b',b$'90_new_b')
head(all)

a

topics = rep(colnames(data_m),5)
topics_num = rep(c(1:20),5)

t = rep(c(60,70,75,80,90),each=20)

df = as.data.frame(cbind(topics_num,t))
df2 = as.data.frame(cbind(t,all))
head(df2)


dir="./Results"

library(ggrepel)
pdf(paste0(dir,"/Trajectory_Plot.pdf"))
ggplot(data = df2, aes(x = coordinate_1, y = coordinate_2, colour = t, label=id)) + 
  geom_path(aes(group = id),arrow = arrow(ends = "last")) +
  geom_point() +
  geom_text_repel()
dev.off()


head(b)

df2
head(cb)
i= 1
head(df2)
tail(df2)
df2[1:20,]
i= 2

ggplot(data = df2[1:20*i,],aes(x=coordinate_1, y = coordinate_2, colour = t, label =id)) + 
  geom_path(aes(group = id),arrow = arrow(ends = "last")) +
  geom_point() +
  geom_text_repel()






output$pacingplot <- renderPlotly({
  
  colNames <- names(Delivery_data)[-1] #Assuming Date is the first column
  
  print(colNames)
  p <- plotly::plot_ly(x = ~Delivery_data$Date, type = "scatter",
                       mode = "lines")
  for(trace in colNames){
    p <- p %>% plotly::add_trace(y = as.formula(paste0("~`", trace, "`")), name = trace)
  }
  
  p %>% 
    layout(title = "Impressions Over Time",
           xaxis = list(title = "Date"),
           yaxis = list (title = "Impressions"))
  
  
})

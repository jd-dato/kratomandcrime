library(tidyverse)
library(ggplot2)
library(plyr)
library(plotly)
library(flexdashboard)
summary(KratomSales1)
ggplot(data = KratomSales1, aes(x = WeekNum, y = TotalSales, z = DateY)) +
  geom_point()

#Scatterplot 3D Test
# scatterplot3d(x= KratomSales1$WeekNum, y= KratomSales1$DateY, z= KratomSales1$TotalSales)

ggplot(data = KratomSales1, aes(x = TotalSales, y= ViolentCrime)) + 
  geom_point() + geom_smooth(method = lm, fill = 'green', se = TRUE) +
  labs(title='Weekly Kratom Sales and Violent Crime Rates', x= 'Weekly Kratom Sales', y= "Weekly Reported Violent Crime Rates")
# Correlaiton Test of Total Kratom Sales and Violent crime
cor.test(KratomSales1$TotalSales, KratomSales1$ViolentCrime, method=c("pearson"))

# Graph but comparing Units Sold instead of Total Sales
cor.test(KratomSales1$Units, KratomSales1$ViolentCrime, method = 'pearson')
litchart <- ggplot(data = KratomSales1, aes(x=TotalSales, y= ViolentCrime, color=Units)) +
  geom_point() + geom_smooth(method = lm, fill='green', se=TRUE, alpha=0.09) 

litchart + labs(title='Kratom Sales Compared to Violent Crime', 
            subtitle = "Compared to both units sold and total sales amount",
            y= 'Violent Crime Rate for the Week',
            x='Total Kratom Sales for the Week') 

# I am creating an interactive plot here
ggplotly(litchart)

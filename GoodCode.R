library(tidyverse)
library(ggplot2)
library(plyr)
library(plotly)
library(flexdashboard)
library(readr)
library(readr)
library(lattice)
library(reshape2)
KratomSales1 <- read_csv("KratomSales1.csv")
litchart <- ggplot(data = KratomSales1, aes(x=TotalSales, y= ViolentCrime, color=Units)) +
  geom_point() + geom_smooth(method = lm, fill='green', se=TRUE, alpha=0.09) + labs(title='Kratom Sales Compared to Violent Crime', 
                                                                                    subtitle = "Compared to both units sold and total sales amount",
                                                                                    y= 'Violent Crime Rate for the Week',
                                                                                    x='Total Kratom Sales for the Week') 

ggplotly(litchart)
#Constructing the 3D chart
x_grid <- seq(from = min(KratomSales1$TotalSales), to = max(KratomSales1$TotalSales), length = 50)
y_grid <- seq(from = min(KratomSales1$Units), to = max(KratomSales1$Units), length = 50)
z_grid <- seq

plot_ly(KratomSales1, x = ~TotalSales, y = ~Units, z = ~ViolentCrime, color = ~Transactions,
        colors = c('#FFC000', '#228B22'), traceinfo = c('all'), )
# Notes on how to create heatmap
# Instead of creating a heatmap just from tibble you need to mass correlate
# Then create a heatmap of the respective correlations
# This would look like:



KratomSales2 <- as.data.frame(KratomSales1)
KratomSales3 <- KratomSales2[-c(1,2,7)]
corr_mat <- round(cor(KratomSales3),2)
head(corr_mat)
melted_corr_mat <- melt(corr_mat)
gx <- ggplot(data = melted_corr_mat, aes(x=Var1, y=Var2, fill = value))+
  geom_tile() +  scale_fill_gradient(low = "#228B22",
                                     high = "#FFC000",
                                     guide = "colorbar")
ggplotly(gx)


# Correlation

# Scatter plot (most frequently used plot)
# It help to understand the nature of relationship between two variables

# drawn using geom_point()
# Additionally, geom_smooth which draws a smoothing line
# can be tweaked to draw the line of best fit by setting method='lm'

install.packages("ggplot2")
options(scipen=999)  # turn-off scientific notation like 1e+48
library(ggplot2)
theme_set(theme_bw())  # pre-set the bw theme.
data("midwest", package = "ggplot2")

# Scatterplot
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) + 
  labs(subtitle="Area Vs Population", 
       y="Population", 
       x="Area", 
       title="Scatterplot", 
       caption = "Source: midwest")

plot(gg)

odd <- seq(from = 1 , to = 99, by = 2)
even <- seq(2, 100, by= 2)

df <- data.frame(odd, even, nrow = 10)
xy <- ggplot(df, aes(x = odd, y = even))+
  geom_point(aes(col = odd, size = even))+
  geom_smooth(method = "loess", se = F)+
  labs(subtitle = "odd vs even",
       y = "Even",
       x = "Odd",
       title = "Scatter Plot",
       caption = "Source : Number")

  
plot(xy)




library(ggplot2)
x <- mtcars$mpg
y <- mtcars$hp
ggplot(data = mpg, aes(x = cty, y = hwy))
last_plot()





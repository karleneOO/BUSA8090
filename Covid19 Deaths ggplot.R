#First we create the variables:
Country <- c("Germany", "Australia", "Portugal", "USA", "Italy", "Philippines", "Turkey", "Brazil", "Egypt")
Deaths <- c(5877, 80, 880, 54256, 26384, 494, 2706, 4045, 307)
Population <- c(83783942, 25499884, 10196709, 331002651, 60461826,	109581078, 84339067, 212559417, 102334404)

#Then we combine the variables into a single dataframe
Covid19_Data <- tibble(Country,Deaths, Population)

#Add in a new variable to the Covid19_Data frame that calculates the Covid-19 deaths per 100,000 population
Covid19_Data <- Covid19_Data %>% mutate(Deaths_Popu = (Deaths/Population)*100000)


#Then plot the data
ggplot(Covid19_Data, 
         aes(x=Deaths_Popu, y=reorder(Country,+Deaths_Popu))) + 
  geom_bar(stat="identity", fill = "royalblue3", width = 0.65) + 
  labs(title = "Covid-19 deaths per 100,000 population", subtitle = "as of 25th April 2020") +
  theme(panel.grid.minor = element_blank(), 
          panel.grid.major.x = element_line(colour = "dark grey"), 
          panel.background = element_rect(fill="white"), 
          axis.title = element_blank(), 
          plot.title = element_text(hjust = 0.5, face = "bold"), 
          plot.subtitle = element_text(hjust = 0.5, face = "italic")) + 
  scale_x_continuous(position = 'top') 

#We can exclude Italy and USA from the plot 
ggplot(subset(Covid19_Data, Country %in% c("Germany", "Australia", "Portugal", "Philippines", "Turkey", "Brazil", "Egypt")),
       aes(x=Deaths_Popu, y=reorder(Country,+Deaths_Popu))) + 
  geom_bar(stat="identity", fill = "royalblue3", width = 0.65) + 
  labs(title = "Covid-19 deaths per 100,000 population", subtitle = "as of 25th April 2020") +
  theme(panel.grid.minor = element_blank(), 
          panel.grid.major.x = element_line(colour = "dark grey"), 
          panel.background = element_rect(fill="white"), 
          axis.title = element_blank(), 
          plot.title = element_text(hjust = 0.5, face = "bold"), 
          plot.subtitle = element_text(hjust = 0.5, face = "italic")) + 
  scale_x_continuous(position = 'top') + 
  expand_limits(x=c(0,10))




#A2T3 - Question 2
library(WDI)
library(countrycode)
library(tidyverse)
install.packages("devtools")
library(devtools)
install_github("DougLuke/UserNetR")
library(UserNetR)
data(Bali)

#a)
wdi_data2014 <- WDI(indicator= c("NY.GDP.PCAP.PP.KD", "EN.ATM.CO2E.PC"), 
                start=2014,end=2014, extra=TRUE) #getting the data from the WDI package
wdi_data2014 <- as_tibble(wdi_data2014) #converting to a tibble
wdi_data2014 <- wdi_data2014 %>% rename(GDPpercap=NY.GDP.PCAP.PP.KD,Emit_CO2percap=EN.ATM.CO2E.PC) #changing column names

write_csv(wdi_data2014,"wdi_co2_GDP14.csv") #saving as a csv
wdi <- read_csv("wdi_co2_GDP14.csv") #importing back into R as a csv, will work with this dataframe

data_map <- map_data("world") #getting long/lat data

worldmap <- ggplot(data_map, aes(x=long, y=lat,group = group)) + geom_polygon(fill="white", colour="black") #define graph of world map

data_map$ccode <- countrycode(data_map$region, origin = "country.name", destination="wb")
wdi$ccode <- countrycode(wdi$country, origin = "country.name", destination="wb")

completedata <- full_join(data_map, wdi, by = c('ccode'='ccode')) #joining the long/lat data with the wdi data

plottitle=expression(paste("Global Distribution of ",CO[2]," per capita"))
ggplot(completedata,aes(x=long, y=lat, group=group, fill =Emit_CO2percap)) +
  geom_polygon()+
  labs(title = plottitle, fill = "CO2 per capita", x= "Longitude", y = "Latitude") +
  theme(plot.title = element_text(hjust = 0.5, size = 16))


#b)
BaliNetworkTerrorists <- ggnetwork(Bali,layout = "kamadakawai")
(ggplot(BaliNetworkTerrorists,aes(x,y, xend=xend, yend=yend))
  + geom_edges(colour="lightgrey")
  + geom_nodes(colour = "lightgrey",size = 0.5)
  + geom_nodetext(aes(label=vertex.names),fontface = "bold", color="deeppink4")
  +theme_blank())

#c)
BaliNetworkRoles <- ggnetwork(Bali,layout = "kamadakawai")
(ggplot(BaliNetworkRoles,aes(x,y, xend=xend, yend=yend))
  + geom_edges(colour="lightgrey")
  + geom_nodes(colour = "black",size = 9)
  + geom_nodetext(aes(label = role),fontface = "bold", colour= "plum1")
  +theme_blank())


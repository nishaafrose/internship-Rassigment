#install.packages(devtools)
#importing libraries
library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)
#scraping website
url <-"https://www.flipkart.com/search?q=ac+1.5+ton+5+star+under+35000&sid=j9e%2Cabm%2Cc54&as=on&as-show=on&otracker=AS_QueryStore_OrganicAutoSuggest_2_35_sc_na_ps&otracker1=AS_QueryStore_OrganicAutoSuggest_2_35_sc_na_ps&as-pos=2&as-type=RECENT&suggestionId=ac+1.5+ton+5+star+under+35000%7CAir+Conditioners&requestId=15e7ca04-e524-4316-9719-6fa20c358abb&as-searchtext=air%20conditioner%201.5%20ton%20under%2035000" 

#allowability
path = paths_allowed(url)

#HTML from the website
web = read_html(url)
View(web)

#segregating name
name <- web %>% html_nodes(".KzDlHZ") %>% html_text()                    
View(name)

#segregating price
price <- web %>% html_nodes("._4b5DiR") %>% html_text()
View(price)

#segregating powerusage
powerusage <- web %>% html_nodes(".J\\+igdf:nth-child(1)") %>% html_text()
View(powerusage)

#segregating ratings
ratings <- web %>% html_nodes(".Y1HWO0") %>% html_text()
View(ratings)





#segeregating size
size <- web %>% html_nodes(".J\\+igdf:nth-child(2)") %>% html_text()
View(size)

#segregating reviews
reviews <- web %>% html_nodes(".hG7V\\+4+ span") %>% html_text()
View(reviews)

#segregating offer
offer <- web %>% html_nodes(".cN1yYO span") %>% html_text()
View(offer)

#Creating Dataframe 
airconditioner = data.frame(name,price,powerusage,ratings,size,reviews,offer)
View(airconditioner)

#Saving as csv file 
write.csv(airconditioner,"flipkart_airconditioner.csv")


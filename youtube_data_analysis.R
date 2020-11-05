library(vosonSML)
library(tidyverse)
lubridate
# google developer API key
apikey <- "AIzaSyBUPtKEE5xly36Laes24qAZyOtcP9zsUMk"


#videoIDs = c("wCKva76JpGE")
#ytdata <- Authenticate("youtube", apiKey = apikey) %>% 
#Collect(videoIDs = videoIDs)


# Authenticate, Collect

key <- Authenticate("youtube",apiKey = apikey)

#Provide video ids

video <- "xw0gE8QA1W0" 

# store it in a Dataframe

ytdata1 <- Collect(credential = key, videoIDs = video, writeToFile = TRUE)

#store collected data in csv in local desktop

write.csv(ytdata1,file = "D:\\R Studio\\laxmibomb.csv",row.names = FALSE)

# perrforming text analysis

# Install
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
install.packages("syuzhet") # for sentiment analysis
install.packages("ggplot2") # for plotting graphs
install.packages("pacman")

# call the above packages
pacman::p_load("tm","SnowballC","wordcloud","RColorBrewer","syuzhet","ggplot2")

#choose file
laxmibomb <- read.csv(file.choose(),header = TRUE)

#convert into corpus
corpus_m <- iconv(laxmibomb$Comment)
View(corpus)
corpus <- Corpus(VectorSource(corpus_m))
inspect(corpus[1:5])

# Removing emojis from text

#gsub("^[<].*[>]$","",corpus)

View(emoji)
#Clean Text
corpus <- tm_map(corpus,tolower) # text to lowercase
corpus <- tm_map(corpus,removePunctuation) # removes punctuation
corpus <- tm_map(corpus,removeNumbers) # removes numbers
corpus <- tm_map(corpus,removeWords,stopwords('english')) # removing frequently occuring words
corpus <- tm_map(corpus,stripWhitespace)
corpus <- tm_map(corpus,removeWords,c('ufuf','uufef','uufefuufef'))

# tm_map(corpus, gsub, pattern = 'stocks', replacement = 'stock')

# removing URLS in the text

######removeURL <- function(x)gsub('http[[:alnum:]]*','',x)
######cleanset <- tm_map(cleanset,content_transformer(removeURL))


cleanset <- corpus

# Term Document Matrix

tdm <- TermDocumentMatrix(cleanset)
tdm

tdm <- as.matrix(tdm)
tdm[1:10,1:20]

# Bar Plot
count <- rowSums(tdm)

count <- sort(rowSums(tdm), decreasing = TRUE)

count <- subset(count,count>=1500)


barplot(count,
        las = 2,
        col = rainbow(5))
        

#Wordcloud
count <- sort(rowSums(tdm), decreasing = TRUE)
set.seed(222)
wordcloud(words = names(count),
          freq = count,
          max.words = 200)
txtdata <- read.csv(file.choose(),header = TRUE)
str(txtdata)
View(txtdata)
library(lubridate)
library(stringr)
txtdata$new_data <- ymd(str_sub(txtdata$PublishedAt,1,10))
?stringr
?lubridate
glimpse(txtdata)











#Checking error
library(httr)
youtube_key <- "AIzaSyBUPtKEE5xly36Laes24qAZyOtcP9zsUMk"
req <- httr::GET("https://www.googleapis.com/youtube/v3/search", 
                 query = list(part = "snippet",
                              q = "programming",
                              maxResults = 2,
                              key = youtube_key))

str <- httr::content(req)
str(str)

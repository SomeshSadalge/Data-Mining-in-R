install.packages("tm")
install.packages("wordcloud")
library(tm)

# Viewing the structure of data- In terms of Continous & Catagorical Data
str(Reviews)
reviews_text= paste(Reviews$text,collapse = " ")

# Assining each text as a vector or an object- Vector is basic structre in R, 
#  it shows each text element as document
reviews_source= VectorSource(reviews_text)

# Corpus - It is used to remove unrequired words and special char. in data
Corpus= Corpus(reviews_source)

# tm_map is used for transforming data
Corpus= tm_map(Corpus, content_transformer(tolower))
Corpus= tm_map(Corpus, removePunctuation)
Corpus= tm_map(Corpus, stripWhitespace)
Corpus= tm_map(Corpus, removeWords, stopwords("english"))
stopwords("english")

# Documented term matrix
dtm= DocumentTermMatrix(Corpus)
View(dtm)

# Convering dtm matrix into sequential matrix
dtm2= as.matrix(dtm)
dtm2

# To check frequency of repetation
freq= colSums(dtm2)
freq= sort(freq, decreasing = T)
freq
head(freq) # Top 5 words

library(wordcloud)
words<- names(freq)
wordcloud(words[1:100],freq[1:100],random.order = TRUE)
par(bg="Orange") # Backgroung color


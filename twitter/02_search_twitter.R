library("rtweet")
source("crypt.R")

key_file <- file.path(path.expand("~"), "Data/key.RData")
credentials_file <- file.path(path.expand("~"), "Data/twitter_credentials.dat")

if (file.exists(key_file)){
  load(key_file)
} else {
  print("Execute script 01_encriptar_key.R")
}

if (file.exists(credentials_file)) {
  credentials <- read.aes(filename = credentials_file, key = key)
} else {
  print("Execute script 01_encriptar_key.R")
}

twitter_token <- create_token(app = "rtweet_token", consumer_key = credentials$consumer_key, consumer_secret = credentials$consumer_secret)

followers <- get_followers(user="FORCE11SCI")
followers_df <- lookup_users(followers)
colnames(followers_df)

View(followers_df[c('name','location')])

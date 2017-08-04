library("digest")
source("crypt.R")

# Setup where to store key and credentials
key_file <- file.path(path.expand("~"), "Data/key.RData")
credentials_file <- file.path(path.expand("~"), "Data/twitter_credentials.dat")

# Setup Twitter consumer key and secret
# Visit https://dev.twitter.com/index
consumer_key <- ""
consumer_secret <- ""

# Generate key and save it (plain text)
key <- as.raw(sample(0:255, 16, replace=TRUE))
save(key, file = key_file)

# Generate credentials and save it (encrypt)
credentials <- data.frame(consumer_key=consumer_key, consumer_secret=consumer_secret, stringsAsFactors = FALSE)
write.aes(df = credentials, filename = credentials_file, key = key)
rm(credentials)
rm(key)

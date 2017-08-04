Search info about Twitter users
================
Roberto Muñoz
03 August, 2017

-   [Loading libraries and Twitter credentials](#loading-libraries-and-twitter-credentials)
    -   [Loading libraries](#loading-libraries)
    -   [Loading Twitter credentials](#loading-twitter-credentials)
    -   [Seeting up tokens](#seeting-up-tokens)
-   [Get user followers](#get-user-followers)

Loading libraries and Twitter credentials
=========================================

Loading libraries
-----------------

``` r
library("rtweet")
```

    ## Welcome to rtweet v0.4.0!

``` r
source("crypt.R")
```

Loading Twitter credentials
---------------------------

``` r
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
```

Seeting up tokens
-----------------

``` r
twitter_token <- create_token(app = "rtweet_token", consumer_key = credentials$consumer_key, consumer_secret = credentials$consumer_secret)
```

Get user followers
==================

``` r
followers <- get_followers(user="FORCE11SCI")
followers_df <- lookup_users(followers)
colnames(followers_df)
```

    ##  [1] "user_id"                            "name"                              
    ##  [3] "screen_name"                        "location"                          
    ##  [5] "description"                        "protected"                         
    ##  [7] "followers_count"                    "friends_count"                     
    ##  [9] "listed_count"                       "created_at"                        
    ## [11] "favourites_count"                   "utc_offset"                        
    ## [13] "time_zone"                          "geo_enabled"                       
    ## [15] "verified"                           "statuses_count"                    
    ## [17] "lang"                               "contributors_enabled"              
    ## [19] "is_translator"                      "is_translation_enabled"            
    ## [21] "profile_background_color"           "profile_background_image_url"      
    ## [23] "profile_background_image_url_https" "profile_background_tile"           
    ## [25] "profile_image_url"                  "profile_image_url_https"           
    ## [27] "profile_image_url.1"                "profile_image_url_https.1"         
    ## [29] "profile_link_color"                 "profile_sidebar_border_color"      
    ## [31] "profile_sidebar_fill_color"         "profile_text_color"                
    ## [33] "profile_use_background_image"       "default_profile"                   
    ## [35] "default_profile_image"              "profile_banner_url"

``` r
print(followers_df[c('name','location')], right=FALSE)
```

    ##    name                                         location                      
    ## 1  PLOS ECR Community                           San Francisco, CA             
    ## 2  Daniela Saderi                               Portland, OR                  
    ## 3  Marcel Knöchelmann                           London, England               
    ## 4  AnaCarolinaSimionato                         São Carlos, São Paulo         
    ## 5  Freyja                                       <NA>                          
    ## 6  OBinn@ Ojem@ny\U0001f1f3\U0001f1ec\U0001f393 Nigeria                       
    ## 7  A2K For Development                          <NA>                          
    ## 8  Gail Steinhart                               Ithaca, NY                    
    ## 9  Metadata 2020                                The world                     
    ## 10 UC Curation Center                           Oakland, CA                   
    ## 11 Philippe Rocca-Serra                         <NA>                          
    ## 12 Eka                                          <NA>                          
    ## 13 Jessea                                       Gabrielino-Tongva Territory   
    ## 14 Ivan Grishagin                               <NA>                          
    ## 15 Openy Abraham                                Uganda                        
    ## 16 Moriana Garcia                               <NA>                          
    ## 17 sci.AI                                       Worldwide                     
    ## 18 Helen Dobson                                 Manchester, UK                
    ## 19 Sydney                                       <NA>                          
    ## 20 Stefan Tanaka                                <NA>                          
    ## 21 Brianna Marshall                             Southern California           
    ## 22 Lusia Veksler                                <NA>                          
    ## 23 Gail (((Clement)))                           Caltech Library               
    ## 24 esther dell                                  <NA>                          
    ## 25 UF ScholComm                                 Gainesville, FL               
    ## 26 Christine Fruin                              Florida                       
    ## 27 Karen the librarian                          San Diego                     
    ## 28 John Kunze                                   Berkeley, California          
    ## 29 Alyssa L. Berry                              New York, NY                  
    ## 30 Peter Li                                     <NA>                          
    ## 31 Alex Holcombe                                Sydney, Australia             
    ## 32 Michael J. Miller                            <NA>                          
    ## 33 Matthew Ostercamp                            <NA>                          
    ## 34 Allegra Swift                                San Diego, CA                 
    ## 35 Infinite Monkey                              Lemuria                       
    ## 36 Nagham El Houssamy                           <NA>                          
    ## 37 Tom Morrell                                  <NA>                          
    ## 38 kpendell                                     <NA>                          
    ## 39 Steven MacCall                               Tuscaloosa                    
    ## 40 Stefanie Haustein                            Ottaw                         
    ## 41 Nicky Agⓐte                                  Brooklyn, New York            
    ## 42 Humanities Commons                           New York, NY                  
    ## 43 Gimena del Rio                               Ciudad Autónoma de Buenos Aire
    ## 44 John Hilton                                  London and Hampshire, UK      
    ## 45 Daniel S. Katz                               Urbana, IL                    
    ## 46 Keita Bando                                  Nagoya, Aichi, Japan          
    ## 47 Antonio Fabregat                             <NA>                          
    ## 48 Lillian Rigling                              London, Ontario               
    ## 49 Jenny Miglus                                 <NA>                          
    ## 50 Francesca Albrezzi                           Los Angeles, CA               
    ## 51 Tim Elfenbein                                Long Beach, CA                
    ## 52 Amy Suiter                                   Saint Louis, MO               
    ## 53 Daniella Lowenberg                           San Francisco                 
    ## 54 Dogmom13                                     Santa Rosa, CA                
    ## 55 Juan Pablo Alperin                           Vancouver, British Columbia   
    ## 56 Barbara Gastel                               <NA>                          
    ## 57 Dr. Amy Price                                <NA>                          
    ## 58 Adrian-Tudor Panescu                         Iasi, Romania                 
    ## 59 Ricardo Hartley                              Santiago, Chile               
    ## 60 Amanda Page                                  Syracuse, NY                  
    ## 61 Paige Mann                                   <NA>                          
    ## 62 Shelley Stall                                <NA>                          
    ## 63 Scholarly Commons                            Where you are                 
    ## 64 Force11.org                                  Global

Search info about Twitter users
================
Roberto Muñoz
03 August, 2017

-   [Loading libraries and Twitter credentials](#loading-libraries-and-twitter-credentials)
    -   [Loading libraries](#loading-libraries)
    -   [Loading Twitter credentials](#loading-twitter-credentials)
    -   [Seeting up tokens](#seeting-up-tokens)
-   [Display Twitter followers of user FORCE11SCI](#display-twitter-followers-of-user-force11sci)

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

Display Twitter followers of user FORCE11SCI
============================================

``` r
followers <- get_followers(user="FORCE11SCI")
followers_df <- lookup_users(followers)
#colnames(followers_df)

cat("Followers of user: ", "FORCE11SCI")
```

    ## Followers of user:  FORCE11SCI

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

``` r
users <- get_friends(followers_df$user_id[1])
users_df <- lookup_users(users)

cat("Accounts followed by the user: ", toString(followers_df$name[1]))
```

    ## Accounts followed by the user:  PLOS ECR Community

    ##     name                                      location                                 
    ## 1   FSCI                                      <NA>                                     
    ## 2   Ricardo Hartley                           Santiago, Chile                          
    ## 3   Drew R Evans                              Adelaide, South Australia                
    ## 4   Kat Kerlin                                UC Davis                                 
    ## 5   Carina Fish                               California, USA                          
    ## 6   ScienceThroughStory                       Berkeley, CA                             
    ## 7   Sara ElShafie                             Berkeley, CA                             
    ## 8   Kristi Holmes                             Chicago                                  
    ## 9   Nick Shockey                              Washington, DC                           
    ## 10  open_epi                                  Brooklyn, NY                             
    ## 11  Climate Central                           Princeton, NJ                            
    ## 12  Mike Thompson                             San Francisco Bay Area                   
    ## 13  America Adapts                            <NA>                                     
    ## 14  Jonathan Eisen                            Davis, CA                                
    ## 15  eLife - the journal                       Cambridge, UK                            
    ## 16  Michael Eisen                             Berkeley, CA                             
    ## 17  AmyPoehlerSmartGirls                      Worldwide                                
    ## 18  NYT Science                               New York, NY                             
    ## 19  Michelle McKenna                          MN-HI-WI-MI-MN                           
    ## 20  Dustin R. Glasner                         Berkeley, CA                             
    ## 21  Luke Kollin                               by the food                              
    ## 22  Will Lykins                               San Francisco, CA                        
    ## 23  Samira Asgari                             Boston, MA                               
    ## 24  Ninad Oak                                 Houston, TX                              
    ## 25  darachm\u2697⚄\u4dfb                      NYC                                      
    ## 26  Tom Monie                                 Cambridge, England                       
    ## 27  Biswapriya Misra                          San Antonio, TX                          
    ## 28  Judith Reichel                            <NA>                                     
    ## 29  Mike Stevenson                            <NA>                                     
    ## 30  Aoife Collery                             Cork, Ireland                            
    ## 31  Mark Fitzpatrick                          Toronto, Canada                          
    ## 32  Shyam Diwakar                             Amritapuri, Kollam, Kerala               
    ## 33  Tati_Wolfe                                West University Place, TX                
    ## 34  Juliana Vasco                             Wooster, OH                              
    ## 35  Merran Govendir                           Sydney, New South Wales                  
    ## 36  Carlos Celis                              Bogotá, D.C., Colombia                   
    ## 37  David J Allen                             London, UK                               
    ## 38  Daniel Noble                              Sydney, Australia                        
    ## 39  Stephanie Coffin                          Philadelphia, Pennsylvania               
    ## 40  Meghna Verma                              Blacksburg, VA                           
    ## 41  Diane Wu                                  San Francisco, CA                        
    ## 42  Katharina S Volz PhD                      San Francisco, NYC, Germany              
    ## 43  Monica Rosenberg                          New Haven, CT                            
    ## 44  Daisy Robinton                            Boston, MA                               
    ## 45  Naomi Penfold                             Cambridge                                
    ## 46  Corinⓐ Logan                              Cambridge, England                       
    ## 47  Dr. Rachel Yoho                           <NA>                                     
    ## 48  Jean-Philip Piquemal                      Paris, France                            
    ## 49  Caitlin Grzeskowiak                       Washington, DC                           
    ## 50  Wang Sonne                                Netherlands                              
    ## 51  Internet Archive                          San Francisco, CA                        
    ## 52  Heather Piwowar                           Vancouver Canada                         
    ## 53  Iva Cheung                                New Westminster, BC                      
    ## 54  David Wiley                               UT, USA                                  
    ## 55  Daniel Waugh                              Dublin, Ireland.                         
    ## 56  ⓪ Chris Hartgerink                        Tilburg, the Netherlands                 
    ## 57  Beck Pitt                                 UK                                       
    ## 58  The Gentlelady fr FL                      New York, NY                             
    ## 59  Jan Gondol                                Bratislava, Slovakia                     
    ## 60  Chealsye Bowley                           United States                            
    ## 61  Achintya • ಅಚಿಂತ್ಯ                          Geneva, Switzerland                      
    ## 62  hjoseph                                   Washington, D.C.                         
    ## 63  Michael Stebbins                          Washington DC                            
    ## 64  Carly Strasser                            Oakland, CA                              
    ## 65  Pinkie                                    Cambodia                                 
    ## 66  Jessica Polka                             Boston, MA                               
    ## 67  Amanda Shaver                             Athens, GA                               
    ## 68  Anita George                              Brisbane, Queensland                     
    ## 69  Pieter Abbeel                             Berkeley                                 
    ## 70  christopher joyce                         Washington D.C.                          
    ## 71  Jeremy Borniger                           Palo Alto, CA                            
    ## 72  BRAIN Initiative                          <NA>                                     
    ## 73  Naureen Ghani                             New York, New York                       
    ## 74  PHD Comics                                <NA>                                     
    ## 75  PhD Forum                                 International                            
    ## 76  #ECRchat                                  Global                                   
    ## 77  bioRxiv                                   New York                                 
    ## 78  SugarScience                              San Francisco, CA                        
    ## 79  Laura A. Schmidt                          San Francisco, CA                        
    ## 80  Healthy Food America                      Seattle, WA                              
    ## 81  NPR Health News                           Washington, DC                           
    ## 82  I Am SciComm                              Worldwide                                
    ## 83  Laurian Williamson                        Nottingham, England                      
    ## 84  Teresa Chan                               Canada (Hamilton, ON)                    
    ## 85  Akshit Puri                               British Columbia, Canada                 
    ## 86  Christina Bergmann                        Paris, France                            
    ## 87  Mattie C Pawlowic                         Athens, GA                               
    ## 88  Sophia Thomas                             Bangalore, India                         
    ## 89  Kenneth Gibbs                             Washington, DC                           
    ## 90  Julie Ripplinger                          Riverside, CA                            
    ## 91  Alexis Achim                              <NA>                                     
    ## 92  Rigan                                     <NA>                                     
    ## 93  Joslyn                                    USA                                      
    ## 94  Stephanie Porcell                         San Francisco, CA                        
    ## 95  Jenny Molloy                              University of Cambridge                  
    ## 96  Clair Geary                               New York                                 
    ## 97  David W. Cleary                           University of Southampton                
    ## 98  Katerina Kademoglou                       Brno, Czech Republic                     
    ## 99  A. K.                                     <NA>                                     
    ## 100 Priyanka Patel ,PhD                       India                                    
    ## 101 Danielle J-Schoffman                      Worcester, MA                            
    ## 102 David Mehler                              Cardiff, Wales                           
    ## 103 Nicola Morrice                            <NA>                                     
    ## 104 Rebecca Steketee                          Rotterdam, Zuid-Holland                  
    ## 105 Nina Wale                                 Ann Arbor, MI                            
    ## 106 Eileen O'Brien                            <NA>                                     
    ## 107 Dr Stephanie Zihms                        <NA>                                     
    ## 108 Christopher Bean                          Uppsala, Sverige                         
    ## 109 Hogeun Park                               East Lansing, MI                         
    ## 110 Sean McBride                              West Palm Beach, FL                      
    ## 111 tanvi sinha                               <NA>                                     
    ## 112 Carly Rosewarne                           Kaurna Land, Karra Wirraparri            
    ## 113 Charles Le Losq                           Canberra                                 
    ## 114 Dr Helen Williams                         Westmead, Australia                      
    ## 115 Juliet Moncaster                          Boston, MA, United States                
    ## 116 Adriana Boersner                          <NA>                                     
    ## 117 Rachel Bryan                              Mumbles, Swansea, Wales, UK              
    ## 118 Julia Gustavsen                           Lausanne, Switzerland                    
    ## 119 BP Grehan                                 <NA>                                     
    ## 120 Selene Fernandez                          Irapuato, GTO, México                    
    ## 121 Nicole E Basta                            Minneapolis, MN                          
    ## 122 Angela Camargo                            México                                   
    ## 123 Constantine                               Dublin, Ireland                          
    ## 124 Aleix Valls                               Fargo, ND                                
    ## 125 Devdeep Mukhopadhyay                      Kharagpur/Kolkata, West Bengal           
    ## 126 Daniyal Jafree                            London, England                          
    ## 127 Christine Lattin                          New Haven, CT                            
    ## 128 Tim D. France                             Bournemouth/Chiang Mai                   
    ## 129 Ian Dyball                                Norfolk, UK                              
    ## 130 Iarⓐ VPS                                  Rio de Janeiro, Brasil                   
    ## 131 Gurveer Bains                             Toronto, Ontario                         
    ## 132 Katherine Silkaitis                       Cambridge, MA                            
    ## 133 Edwin van Teijlingen                      Bournemouth University                   
    ## 134 Rebecca Gelding                           Macquarie Uni, Sydney                    
    ## 135 Devendra Dusane                           Columbus, OH, USA                        
    ## 136 Hung-Ji Tsai                              <NA>                                     
    ## 137 Danna Gifford                             Manchester, UK                           
    ## 138 Joe Timpona                               <NA>                                     
    ## 139 Speaking Of Medicine                      PLOS                                     
    ## 140 Nicole Allen                              DC & PVD \U0001f1fa\U0001f1f8            
    ## 141 James Michiel MPH                         Boston, MA                               
    ## 142 Tom McBride                               San Francisco, CA                        
    ## 143 Jeremy Anderson                           Eugene, OR                               
    ## 144 OpenCon                                   Washington, DC                           
    ## 145 Aaron J Dy \U0001f468\U0001f3fb‍\U0001f52c Cambridge, MA                            
    ## 146 Louise Archer                             Cork, Ireland / London, UK               
    ## 147 Cynthia Fuhrmann                          <NA>                                     
    ## 148 Lucy Bell                                 London, England                          
    ## 149 Laura Roberts                             Munich, Germany                          
    ## 150 Ellen Quillen                             <NA>                                     
    ## 151 Andrew Bellemer                           Banner Elk, NC                           
    ## 152 Barack Obama                              Washington, DC                           
    ## 153 White House Archived                      Washington, DC                           
    ## 154 Mary Young                                Seattle, WA                              
    ## 155 Ben Linzmeier                             Wisconsin, USA                           
    ## 156 Kim Ferguson                              Utrecht, The Netherlands                 
    ## 157 Irene Ylönen                              Jyvaskyla, Finland                       
    ## 158 Ulrike Träger                             <NA>                                     
    ## 159 ProgPal2016                               <NA>                                     
    ## 160 Ashanti Washington                        Washington, DC                           
    ## 161 Javier Sotillo                            Australia                                
    ## 162 Camila Scorticati                         <NA>                                     
    ## 163 Philip Dunne                              Carrickfergus, Northern Ireland          
    ## 164 Salif Mahamane \u270a\U0001f525\U0001f52c Logan, UT                                
    ## 165 Sam Penrice                               Lincoln, England                         
    ## 166 Bethany Jose                              Christchurch City, New Zealand           
    ## 167 Patrícia Pečnerová                        Stockholm, Sweden                        
    ## 168 Veronika Cheplygina                       Rotterdam, The Netherlands               
    ## 169 Rachel Harris                             Bristol, UK                              
    ## 170 Amira                                     Limerick, Ireland                        
    ## 171 Will Hill                                 Cardiff                                  
    ## 172 Yoan Fourcade                             Uppsala, Sverige                         
    ## 173 Catherine Foster                          Cardiff University                       
    ## 174 Lauren Diepenbrock                        Raleigh, NC, USA                         
    ## 175 e-nios                                    Athens, Greece                           
    ## 176 Chris Toseland                            Canterbury, Kent, UK                     
    ## 177 Carena Bell                               Lancashire/Manchester, UK                
    ## 178 JMH                                       Indy                                     
    ## 179 Gauri Bhosale                             England, United Kingdom                  
    ## 180 The BBB Scientist                         Yellow City                              
    ## 181 Darwin                                    Lima, Peru                               
    ## 182 Matthew Brousil                           Washington, USA                          
    ## 183 João G. Rodrigues                         <NA>                                     
    ## 184 Bruno C. Vellutini                        Dresden, Germany                         
    ## 185 Shankar K Shakya                          Corvallis, OR                            
    ## 186 Cristian Fong                             <NA>                                     
    ## 187 Amanda Easson                             Toronto, Ontario                         
    ## 188 Laura Multini                             São Paulo, Brasil                        
    ## 189 Jay Achar                                 MSF, London                              
    ## 190 Alana Sharp                               London, England                          
    ## 191 Dr Matthew Doyle                          National institutes of Health            
    ## 192 Alexandra                                 Liverpool / St. Petersburg               
    ## 193 Alfredo Chavez                            Berkeley, CA                             
    ## 194 MEGHA MAJOE                               <NA>                                     
    ## 195 MayWard Forever                           <NA>                                     
    ## 196 R⓪ss Mounce                               Cambridge, England                       
    ## 197 Bradley Brown                             Newcastle Upon Tyne, England             
    ## 198 Joseph McArthur                           London, England                          
    ## 199 Emil TheGreatDane                         Ithaca N.Y, USA                          
    ## 200 Rachel Stirrup                            Leamington Spa, England                  
    ## 201 Lady Naturalist                           Cleveland, OH                            
    ## 202 Amrita Sule                               Richmond VA                              
    ## 203 Stephanie Blais                           Canada                                   
    ## 204 Alessandro Chiarenza                      Londra, Inghilterra                      
    ## 205 Afiq Durrani                              Kuala Lumpur / Edinburgh                 
    ## 206 Sarah Skeen                               Cape Town, South Africa                  
    ## 207 Myka Ababon                               <NA>                                     
    ## 208 Georgina Stebbings                        <NA>                                     
    ## 209 Aubrey Cunnington                         <NA>                                     
    ## 210 Jason Tallis                              <NA>                                     
    ## 211 Emma Cavan                                Hobart, Tasmania                         
    ## 212 Deborah Apthorp                           Canberra, Australia                      
    ## 213 Peter Tennant                             Leeds, England                           
    ## 214 AC Rooke                                  Peterborough, ON, CANADA                 
    ## 215 Danielle Szafir                           Boulder, CO                              
    ## 216 Karrera Djoko (Dr K)                      Australia then UK in 09/17               
    ## 217 Jade BRUXAUX                              Toulouse, France                         
    ## 218 Zoe E Lewis                               England, United Kingdom                  
    ## 219 JCIM                                      Washington, DC                           
    ## 220 Kristin Safi                              Knoxville, TN                            
    ## 221 Lisa Akison                               Brisbane, Queensland                     
    ## 222 Steve Meikle                              <NA>                                     
    ## 223 Dan Lurie                                 Berkeley via NYC                         
    ## 224 Stephanie Lehman                          Baltimore, MD                            
    ## 225 Shannon Farris                            Raleigh NC                               
    ## 226 Alexander Darlington                      Warwick, UK                              
    ## 227 Deborah Lichti                            North Carolina, USA                      
    ## 228 Stephanie Redmond                         <NA>                                     
    ## 229 Dickson Despommier                        <NA>                                     
    ## 230 Caio Maximino                             Marabá/PA, Brazil                        
    ## 231 Prachee Avasthi                           Kansas City                              
    ## 232 fauziharoon                               Cambridge, MA                            
    ## 233 Rachel Hale\U0001f41b                     National Oceanography Centre, Southampton
    ## 234 Mirre Simons                              Sheffield, England                       
    ## 235 Fergus Neville                            <NA>                                     
    ## 236 Patrick M. Krueger                        Denver                                   
    ## 237 Andrew J. Hollins                         Cardiff, UK                              
    ## 238 Nicole Shakerley PhD                      Albany, NY                               
    ## 239 Melodi Ghui                               +65                                      
    ## 240 Rachel Shaffer                            <NA>                                     
    ## 241 Megan Yu                                  San Francisco, CA                        
    ## 242 Fiona Nielsen                             <NA>                                     
    ## 243 Haris Antypas                             Stockholm, Sweden                        
    ## 244 Bastian Fromm                             Oslo, Norway                             
    ## 245 Chris Stocker                             <NA>                                     
    ## 246 Gisele Calderon                           Houston, TX                              
    ## 247 Bruno P. Lima                             Minneapolis, MN                          
    ## 248 Natalya Karina Sousa                      College Park, MD                         
    ## 249 ADIECS                                    Lima, Peru                               
    ## 250 Abby Lawson                               South Carolina, USA                      
    ## 251 Abby Olena                                Carrboro, NC                             
    ## 252 Nick Smith                                Berkeley, CA                             
    ## 253 Vanessa #ANULASTF                         <NA>                                     
    ## 254 GEH LAB                                   New York, NY                             
    ## 255 Timothy Ken Mackey                        San Diego, CA                            
    ## 256 Jayna Raghwani                            Oxford                                   
    ## 257 Will Kotiadis                             United Kingdom                           
    ## 258 Tavis Hayes                               Ottawa, Ontario                          
    ## 259 Eisha Mhatre                              Pittsburgh, PA                           
    ## 260 eLife Community                           <NA>                                     
    ## 261 Larry Peiperl                             San Francisco, USA                       
    ## 262 Flavall L.                                San Francisco                            
    ## 263 PLOS Currents: MD                         <NA>                                     
    ## 264 PLOS Currents: HD                         <NA>                                     
    ## 265 PLOS ALM                                  San Francisco, CA                        
    ## 266 Hilda Bastian                             Washington DC                            
    ## 267 PLOS Currents: DIS                        <NA>                                     
    ## 268 PLOS Currents: OBK                        <NA>                                     
    ## 269 Jorge Velez-Juarbe                        Los Angeles, CA                          
    ## 270 Daniel MacArthur                          Boston, USA                              
    ## 271 Katie L. Strong                           Atlanta, GA                              
    ## 272 Ecology Community                         San Francisco, CA                        
    ## 273 Ríona Mc Ardle                            Newcastle Upon Tyne, England             
    ## 274 Md Zohorul Islam                          Faculty of Health &Medical Sc.           
    ## 275 Dr. Jessica Breland                       San Francisco, CA                        
    ## 276 Elizabeth Cutrone                         <NA>                                     
    ## 277 Michael Eisen                             37° 14′ 6″ N, 115° 48′ 40″ W             
    ## 278 Liana Hone                                Columbia, MO                             
    ## 279 YJ Kim                                    <NA>                                     
    ## 280 Meredith Niles                            Burlington, VT                           
    ## 281 Ernesto Priego                            Tweets may be scheduled.                 
    ## 282 Brett                                     Tübingen, Germany                        
    ## 283 TWiGH                                     <NA>                                     
    ## 284 Dr. Sulzhan Bali                          Washington, DC                           
    ## 285 Nathaniel Gore                            Cambridge                                
    ## 286 Jeff Atkins                               Charlottesville, VA                      
    ## 287 Rishi R. Masalia                          Athens, GA                               
    ## 288 Chris Givens                              North Carolina, USA                      
    ## 289 James Fink                                Connecticut, USA                         
    ## 290 Sarah Z. Gibson                           Pangaea                                  
    ## 291 Sasha Wright                              Los Angeles, CA                          
    ## 292 Jens Hegg                                 Moscow, ID, USA                          
    ## 293 Annie Liang                               Toronto, Ontario                         
    ## 294 Cici Zhang                                Brooklyn, NY                             
    ## 295 Matthew Eng                               South Bend, IN                           
    ## 296 Emilie Reas                               San Diego, CA                            
    ## 297 Emma Whittington                          Syracuse, NY                             
    ## 298 Ida Jooste                                Durban                                   
    ## 299 Sara Kassabian                            Oakland, CA                              
    ## 300 PLOS Biology                              San Francisco/ Cambridge, UK             
    ## 301 PLOS NTDs                                 San Francisco, CA                        
    ## 302 PLOS Currents                             San Francisco, CA                        
    ## 303 Mark Johnson                              San Francisco, CA                        
    ## 304 PLOS Collections                          Cambridge, England                       
    ## 305 Jon Tennant                               Berlin, Germany                          
    ## 306 Andreas Vilhelmsson                       Malmö, Sweden                            
    ## 307 Meredith Wright                           New York, NY                             
    ## 308 Mary Gearing                              <NA>                                     
    ## 309 PLOS Medicine                             <NA>                                     
    ## 310 PLOS Genetics                             Cambridge, UK                            
    ## 311 PLOS Paleo Community                      San Francisco, CA                        
    ## 312 PLOS Comp Biol                            <NA>                                     
    ## 313 PLOS Neuro Community                      <NA>                                     
    ## 314 PLOS Pathogens                            San Francisco, CA                        
    ## 315 PLOS Synbio                               San Francisco                            
    ## 316 PLOS Blogs                                San Francisco                            
    ## 317 PLOS ONE                                  San Francisco                            
    ## 318 PLOS                                      USA and UK

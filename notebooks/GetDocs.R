# This script sees us 
# 1. performing the long task of loading all raw pdf docs, 
# 2. generating metadata from the filenames,
# 3. creating second character vector of all docs, but lemmatised and with stops removed, and
# 4. Saving to an RDS file for loading for use with other scripts

sapply(c("tidyverse", "tidytext", "readtext", "textstem", "quanteda"),
       function(x)
             if(!(x %in% rownames(installed.packages()))){install.packages(x)})
lapply(c("tidyverse", "tidytext", "readtext", "textstem", "quanteda"),
       require, 
       character.only = TRUE)

# Assuming the relevant files are stored in a 'Raw_Data' subdirectory of the working directory.

docnames <- dir("Raw_Data/")
raw_docs <- docnames %>%
      map(., function(x) readtext(paste("Raw_Data/", x, sep = ""))) 

raw_docs2 <- raw_docs %>%
      map(as_tibble) %>%
      map(., function(x) unnest_tokens(x, word, text))
      
docs <- raw_docs2 %>%
      map(., function(x) paste(x$word, sep = " ", collapse = " ")) %>% 
      unlist

# Now remove stopwords and lemmatise

stops <- quanteda::stopwords() %>% 
      as_tibble %>%
      rename(word = value)

docs_stops_lemmatised <- raw_docs2 %>%
      map(., function(x) anti_join(x, stops, by = "word")) %>%
      map(., function(x) x %>%
                mutate(word_lemmatised = lemmatize_words(x$word))) %>%
      map(., function(x) paste(x$word_lemmatised, sep = " ", collapse = " ")) %>%
      unlist

# Retrieve metadata
get_meta <- function(docnames){
      # get year
      years <- str_replace_all(docnames, "[^[:digit:]]", "")
      years <- unlist(strsplit(years, ""))
      years <- years %>%
            .[1:4] %>%
            paste(., collapse = "") %>%
            as.double
      # Get country
      split_names <- unlist(strsplit(docnames, ""))
      underscores0 <- str_locate_all(docnames, "_")
      underscores <- underscores0[[1]][,1]
      country <- split_names[(underscores[1]+1):(underscores[2]-1)] %>%
            paste(., collapse = "")
      # Get company
      company <- split_names[(underscores[2]+1):(underscores[3]-1)] %>%
            paste(., collapse = "")
      sector <- split_names[1:(underscores[1]-1)] %>%
            paste(., collapse = "")
      x <- list(years, country, company, sector)
      return(x)
}


meta <- map(docnames, get_meta)

process_meta <- function(meta){
      companies <- unlist(sapply(seq_along(1:length(meta)), function(x) meta[[x]][3]))
      
      countries <- unlist(sapply(seq_along(1:length(meta)), function(x) meta[[x]][2]))
      
      years <- unlist(sapply(seq_along(1:length(meta)), function(x) meta[[x]][1])) %>%
            str_sub(., start = 1, end = 4) %>%
            as.numeric
      
      sector <- unlist(sapply(seq_along(1:length(meta)), function(x) meta[[x]][4]))
      
      
      # Bring together in a tibble
      
      change_names <- function(x){
            names(x) <- c("year", "country", "company", "sector")
            return(x)
      }
      meta <- meta %>% map(., unlist(unlist)) %>%
            map(., change_names) %>%
            map(., as_tibble)
      names(meta) <- docnames
      meta <- bind_cols(meta) %>% t %>% as_tibble %>%
            add_column(docnames) %>%
            add_column(seq(1:length(docnames)))
      
      
      colnames(meta) <- c("year", "country", "company", "sector", "filename", "corpus position")
      meta$year <- as.numeric(meta$year)
      return(meta)
}

meta <- process_meta(meta)

# Give filenames to document vectors

names(docs) <- docnames
names(docs_stops_lemmatised) <- docnames

saveRDS(docs, file = "docs.RDS")
saveRDS(docs_stops_lemmatised, file = "docs_nostops.RDS")
saveRDS(meta, file = "metadata.RDS")
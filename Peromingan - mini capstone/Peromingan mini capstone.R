# set current directory use which the resource of data for analysis is store in this directory
setwd("~/Master in Information Technology/Fourth Semester/IT380 - Introduction to Data Mining using R/Mini capstone/Mini capstone - Copy")

# install needed packages for running some codes
install.packages("tm")
install.packages("SnowballC")
install.packages("arules")

# use library of installed packages
library('tm')
library('SnowballC')
library('stringr')
library('arules')

# JAM (song tracks that the user listens to per jam)
jam <- read.csv("jam_to_msd.csv", header=FALSE, sep=",", stringsAsFactors=FALSE)
colnames(jam)<-c('user_id','track_id')
View(jam)

# TRACKS
unique_tracks <- read.csv("unique_tracks.csv", header=FALSE, sep=",", stringsAsFactors=FALSE)
colnames(unique_tracks)<-c('track_id','song_id','artist_name','song_title')
View(unique_tracks)

# ARTIST
unique_artists <- read.csv("unique_artists.csv", header=FALSE, sep=",", stringsAsFactors=FALSE)
colnames(unique_artists)<-c('artist_id','artist_mbid','track_id','artist_name')
View(unique_artists)

# SONG DETAILS
# load data from file
song_dataset <- read.csv("song_dataset.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

# view loaded data which is assign to variable song_dataset
View(song_dataset)

# Select column names to be drop/remove
drop_song_dataset <- c("X","analyzer_version","artist_7digitalid","artist_latitude","artist_location","artist_longitude","artist_playmeid","genre","idx_artist_terms","idx_similar_artists","release","release_7digitalid","track_7digitalid")

# remove/drop selected column names
s = song_dataset[,!(names(song_dataset) %in% drop)]

# view result of variable s
View(s)

# load data from song_dataset2 file
song_dataset2 <- read.csv("song_dataset2.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

# view loaded data from song_dataset2.csv which is assign to variable song_dataset2
View(song_dataset2)

# Select column names to be drop/remove
drop_song_dataset2 <- c("X","analyzer_version","artist_7digitalid","artist_latitude","artist_location","artist_longitude","artist_playmeid","genre","idx_artist_terms","idx_similar_artists","release","release_7digitalid","track_7digitalid")





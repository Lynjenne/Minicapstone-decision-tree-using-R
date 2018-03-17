# set current directory use which the resource of data for analysis is store in this directory
setwd("~/Master in Information Technology/Fourth Semester/IT380 - Introduction to Data Mining using R/Mini capstone/Minicapstone-decision-tree-using-R/Peromingan - mini capstone")

# install needed packages for running some codes
install.packages("tm")
install.packages("SnowballC")
install.packages("arules")
install.packages("RMySQL")

# use library of installed packages
library('tm')
library('SnowballC')
library('stringr')
library('arules')
library('RMySQL')

# TRACKS
# read data from file
unique_tracks <- read.csv("unique_tracks.csv", header=FALSE, sep=",", stringsAsFactors=FALSE)
# assign names to columns
colnames(unique_tracks)<-c('track_id','song_id','artist_name','song_title')
# view data
View(unique_tracks)

# ARTIST
# read data from file
unique_artists <- read.csv("unique_artists.csv", header=FALSE, sep=",", stringsAsFactors=FALSE)
# assign names to columns
colnames(unique_artists)<-c('artist_id','artist_mbid','track_id','artist_name')
# view data
View(unique_artists)

# JAM 
# read data from file
jam <- read.csv("jam_to_msd.csv", header=FALSE, sep=",", stringsAsFactors=FALSE)
colnames(jam)<-c('user_id','track_id')
View(jam)

# SONG DETAILS
# read data from file
song_dataset <- read.csv("song_dataset.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
# view data 
View(song_dataset)
# Select column names to be drop/remove
drop_song_dataset <- c("X","analyzer_version","artist_7digitalid","artist_latitude","artist_location","artist_longitude","artist_playmeid","genre","idx_artist_terms","idx_similar_artists","release","release_7digitalid","track_7digitalid")
# remove/drop selected column names
s = song_dataset[,!(names(song_dataset) %in% drop_song_dataset)]
# view the result of assing variable s
View(s)

# load data from song_dataset2 file
song_dataset2 <- read.csv("song_dataset2.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
# view loaded data from song_dataset2.csv which is assign to variable song_dataset2
View(song_dataset2)
# Select column names to drop/remove
drop_song_dataset2 <- c("X","artist.7digitalid","analysis.sample.rate","artist.playmeid","danceability","end.of.fade.in","energy","key","key.confidence","mode","mode.confidence","release.7digitalid","start.of.fade.out","tempo","time.signature","time.signature.confidence")
# remove/drop selected columns names
s2 = song_dataset2[,!(names(song_dataset2) %in% drop_song_dataset2)]
# view result data
View(s2)

# connect to database song_db
song_db <-dbConnect(MySQL(), user="root", password="peromingan", host="35.224.141.246")
#dbSendQuery(song_db, "DROP DATABASE song_db IF EXISTS;")
dbSendQuery(song_db, "CREATE DATABASE song_db")
dbSendQuery(song_db, "USE song_db")

# TRACKS
# create table unique_tracks to database song_db
dbWriteTable(song_db, name="unique_tracks", unique_tracks, append=TRUE)
dbGetQuery(song_db, "select * from unique_tracks")

# ARTIST
# create table unique_tracks to database song_db
dbWriteTable(song_db, name="unique_tracks", unique_tracks, append=TRUE)
dbGetQuery(song_db, "select * from unique_tracks")


#Installing SQLite R Package called as "RSQLite" 
# For MySQl, R package is RMySQL
# For PostgreSQL R package is RPostgreSQL
# For other databases use package called as "RODBC"

install.packages("RSQLite")
install.packages("RMySQL")
install.packages("RPostgreSQL")
install.packages("RODBC")

# Downloading SQLite database file from the web

download.file(url = 'http://www.jaredlander.com/data/diamonds.db',
              destfile ='/home/venkataswamy/Documents/diamonds.db',
              mode = 'wb')

#dbDriver function is used to connect the database product

library(DBI)
library(RSQLite)
library(RMySQL)
drv <- dbDriver('SQLite')
class(drv)

#Establishing the connection to the specific database by dbConnect function

con <- dbConnect(drv,'/home/venkataswamy/Documents/diamonds.db')
class(con)

#Connection has been established with the database and use DBI function for querying

dbListTables(con)

dbListFields(con, name = 'diamonds')

#dbGetQuery function is used to extract the data from databases in to data.frame object

DT <- dbGetQuery(con, "SELECT * FROM diamonds", stringAsFactors=FALSE)

mysql <- dbConnect(MySQL(), user='root', 
                       password='Swamy@23', dbname='classicmodels', host='localhost')
mysql
dbListTables(mysql)


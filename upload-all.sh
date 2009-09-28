#! /bin/bash
# CouchDB sample documents upload
#
COUCH_PORT=5984
DB_SITE=http://$1:$COUCH_PORT/
#DB_SITE=http://127.0.0.1:5984/
DB_NAME=cocktail-book

# create database
curl -X PUT $DB_SITE$DB_NAME

# input documents
curl -X PUT -d @'./document/matini.txt' $DB_SITE$DB_NAME/matini
curl -X POST -d @'./document/matini.txt' $DB_SITE$DB_NAME
curl -X POST -d @'./document/cocktails.txt' $DB_SITE$DB_NAME/_bulk_docs

# input Design documents
curl -X PUT -H'Content-Type: application/json' -d @'./design/d01.txt' $DB_SITE$DB_NAME/_design/d01
curl -X PUT -H'Content-Type: application/json' -d @'./design/d02.txt' $DB_SITE$DB_NAME/_design/d02
curl -X PUT -H'Content-Type: application/json' -d @'./design/d03.txt' $DB_SITE$DB_NAME/_design/d03
curl -X PUT -H'Content-Type: application/json' -d @'./design/d04.txt' $DB_SITE$DB_NAME/_design/d04

echo "finished ...,be relaxed !!"

exit 0

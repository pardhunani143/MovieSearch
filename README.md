# MovieSearcher

This application searches movies using the TMDb API(https://www.themoviedb.org/). User can enter any keyword and results are displayed as below

1. Movies released between 2017 and 2018
2. Movies with top 10 highest rating 

## Get Started

Step -1: Open XCode

Step -2: Click on "clone a existing project".

Step -3: Copy and paste URL: " https://github.com/pardhunani143/MovieSearch.git"

Step -4: Press button "Done"

Step -5: Build MovieSearch project 

Step - 6: Build DataManager project

You may face issues while building project with error "No such module Static Lib" or "Library Not Found for Static Lib " errors .

If you face above errors while building this project then update path
 as "${SRCROOT}/DataManager/StaticLib" under following locations

1. Under DataManager -> Build Settings -> Swift Compiler - Search Paths - Import Path
2. Under DataManager-> Build Settings -> Search Paths - Library Search path

## Requirements

This project is made on XCode 11.6 , Mac Os - catalina ,Swift 5

## Description 

a) Built using Xcode editor

b) Modularization into two binaries 

  1. MovieSearcher - ios application that will take user input and displays movies according to business 
     requriements
  2. DataManager - Its a dynamic library built on XC Framework and it contains public APIs that interact 
     with The Movie DB API to send and receive data.
     It also has static library called "StaticLib" which contains sorting logic to sort movies according 
     rating

c) Only Ios core foundation frameworks provided default by Xcode are used

d) No wrappers are used in this project

e) API Key used in this project is encrypted/decrypted using base64 encoding mechanism


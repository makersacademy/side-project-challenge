Sentiment Analysis
---------------------

## Synopsis
Sentiment analysis is an app that allows you to search tweets on certain topics and then returns a brief sentiment analysis on the content of the tweets.

##User stories:

As a user,
So I can check tweets on certain subject,
I want to search for tweets

As a user,
So I can understand the tone of tweets,
I want to make a request to analyse the content of the tweets


As a user,
So I can understand the tone of tweets,
I want to see the result of the tone analysis next to each tweet

## Built with
The app uses ```sferik```, A Ruby interface to the Twitter API and Sentiment Analysis API from MeaningCloud. 


## Installation
Clone or fork this repo and run ```bundle install```. You will need to re-create both API requests as they require unique authentication keys.

## Extra functionality to be added
-  A more detailed description of the result from MeaningCloud
-  A dynamic graph showing sentiment changes on a topic across time/location  

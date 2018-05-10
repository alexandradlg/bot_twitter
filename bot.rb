
require 'twitter'
require 'dotenv'

Dotenv.load


client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_API_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWITTER_API_CONSUMER_SECRET']
    config.access_token        = ENV['TWITTER_API_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_API_ACCESS_TOKEN_SECRET']
end

@results = []

search_terms = ["bde", "startup", "peer learning","université", "student", "computer science", "peer programming", "epitech", "innovation" ]


search_terms.each do |term|

    @search = client.user_search(term)

    @search.each { |user|
        user_tweet = user.screen_name
        @results.push(user_tweet)
    }
    
end

@results.each { |user|
    user.to_s
    client.follow(user)
}

time = rand(36..45)

@results.each { |user|
    client.update("Le peer learning t'intéresse ou tu veux apprendre à coder rapidement ? Deviens dev en 80 jours ici ==> https://bit.ly/2wrt50E #{user} #RoR #Peerlearning #coding #THP #bootcamp #ruby #rubyonrails #learn #dev #gratuit" )
    sleep time
}
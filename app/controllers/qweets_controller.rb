class QweetsController < ApplicationController

  get '/qweets' do
    @qweets = Qweet.all
    erb :'/qweets/index'
  end

  get '/qweets/index' do
    @qweets = Qweet.all
    erb :'/qweets/index'
  end

  get '/qweets/create' do
    erb :'/qweets/create'
  end

  post '/qweets/create' do
    @user = User.find_by(id: params[:user_id])
    @qweet = Qweet.create(user_id: params[:user_id])
    @user.qweets << @qweet
    @user.save
    erb :'/qweets/create'
  end

  post '/qweets/:id/edit' do
    @qweet = Qweet.find_by(id: params[:id])
    erb :'/qweets/edit'
  end

  get '/qweets/:id/edit' do
    @qweet = Qweet.find_by(id: params[:id])
    erb :'/qweets/show'
  end

  get '/qweets/:id' do
    @qweet = Qweet.find_by(id: params[:id])
    erb :'/qweets/show'
  end

  post '/qweets/:id' do
    @qweet = Qweet.find_by(id: params[:id])
    @qweet.content = params[:content]
    @qweet.save
    redirect to "/qweets/#{@qweet.id}"
  end

  get '/qweets/:id/delete' do
    @qweet = Qweet.find_by(id: params[:id])
    erb :'/qweets/show'
  end

  post '/qweets/:id/delete' do
    @qweet = Qweet.find_by(id: params[:id])
    @qweet.destroy
    redirect '/qweets'
  end
end

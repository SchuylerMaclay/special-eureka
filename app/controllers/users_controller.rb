class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/index' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/create' do
    erb :'/users/create'
  end

  post '/users' do
    @user = User.find_or_create_by(name: params[:name])
    redirect to "/users/#{@user.id}"
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  post '/users/:id' do
    @user = User.find_by(id: params[:id])
    @user.update(name: params[:name])
    erb :'/users/show'
  end

  get '/users/:id/edit' do
    @user = User.find_by(id: params[:id])
    erb :'/users/edit'
  end

  get '/users/:id/delete' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  post '/users/:id/delete' do
    @user = User.find_by(id: params[:id])
    @user.qweets.destoy_all
    @user.destroy
    redirect '/users'
  end

end

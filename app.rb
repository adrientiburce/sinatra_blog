require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"

get "/" do
  @title = "Bienvenue sur mon super Blog !"
  @database = DB
  erb :index
end


get "/show/:id" do
  @title = "Présentation d'un article"
  @database = DB
  @article_id = params[:id].to_i  #on convertit le string en int 
  @article = @database[@article_id]
  @comments = COMMENTS[@article_id]
  erb :show
end

get '/guess/:who' do
  pass unless params['who'] == 'Frank'
  halt 401, 'go away!'
end
require "sinatra"
require "slugify"
require "sinatra/reloader" if development?
require_relative "database"


get "/" do
  @title = "Mon Blog !"
  @database = DB
  erb :index
end


get "/show/:slug/:id" do
  @database = DB
  @article_id = params[:id].to_i  #on convertit le string en int 
  @article_title = @database[@article_id][:title]
  @title = @article_title
  @article = @database[@article_id]
  @comments = COMMENTS[@article_id]
  erb :show
end

get '/guess/:who' do
  pass unless params['who'] == 'Frank'
  halt 401, 'go away!'
end
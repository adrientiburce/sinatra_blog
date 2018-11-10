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
  @article_id = params[:id].to_i  #convert string into int 
  @article_title = @database[@article_id][:title]
  @title = @article_title
  @article = @database[@article_id]
  @comments = COMMENTS[@article_id]
  erb :show
end


#prevent from wrong URL
get "/show/:slug/:id/*" do
  redirect back
end

get "/*" do   
  pass if request.path_info == "/show"
  redirect back
end
require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :"/bookmarks"
  end

  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end

  post '/bookmarks/new' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/delete/:id' do
    Bookmark.delete(id: params[:id])
    redirect "/bookmarks"
  end

  get '/bookmarks/:id' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"/bookmarks/update"
  end

  put '/bookmarks/update/:id' do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect "/bookmarks"
  end

  run! if app_file == $0

end

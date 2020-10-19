require 'gossip'
require 'sinatra'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  # get '/' do
  #   erb :index
  # end
  get '/gossips/new/' do
    erb :new_gossip
  end
  # post '/gossips/new/' do
  #   puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
  # end
  # post '/gossips/new/' do
  #   Gossip.new("José", "Josiane est nulle" ).save
  # end
  post '/gossips/id/' do
      Gossip.new(params["gossip_author"],params["gossip_content"]).save
      redirect '/'
  end

  get '/gossips/:id' do
      erb :show, locals: {gossips: Gossip.find(params["id"])}
  end
  

end

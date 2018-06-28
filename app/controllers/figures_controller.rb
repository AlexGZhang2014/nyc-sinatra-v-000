class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end
  
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end
  
  post '/figures' do
    @figure = Figure.create(name: params["figure[name]"])
    @figure.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    redirect to "/figures/#{@figure.id}"
  end
end
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
    binding.pry
    @figure = Figure.create(name: params["figure[name]"])
    @figure.title_ids = params[:titles]
    @figure.landmark_ids = params[:landmarks]
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
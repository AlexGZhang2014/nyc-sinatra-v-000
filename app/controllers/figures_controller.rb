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
    @figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty?
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
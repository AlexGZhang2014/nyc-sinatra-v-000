class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end
  
  get '/figures/new' do
    erb :'figures/new'
  end
  
  post '/figures' do
    redirect to "/figures/#{@figure.id}"
  end
end
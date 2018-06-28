class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end
  
  get '/landmarks/new' do
    @titles = Title.all
    @figures = Figure.all
    erb :'landmarks/new'
  end
  
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    if !params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end
    if !params[:figure][:name].empty?
      @landmark.figures << Figure.create(params[:figure])
    end
    @landmark.save
    redirect to "/landmark/#{@landmark.id}"
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    @titles = Title.all
    @figures = Figure.all
    erb :'landmarks/edit'
  end
  
  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    if !params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end
    if !params[:figure][:name].empty?
      @landmark.figures << Figure.create(params[:figure])
    end
    @landmark.save
    redirect to "/landmark/#{@landmark.id}"
  end
end
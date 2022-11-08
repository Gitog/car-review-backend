class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    get '/cars' do
       cars = Car.all
       cars.to_json
    end

    get '/cars/:make' do
        car = Car.find_by_make(params[:make])
        
        car.to_json(only: [:make, :model], include: {reviews: {only: [:comment, :score], include: {user: {only: [:full_name]}}}})
    end

    get '/users' do
        users = User.all
        users.to_json
     end

     get '/reviews' do
        reviews = Review.all
        reviews.to_json
     end

     post '/reviews/:id' do
        
     end

     
end
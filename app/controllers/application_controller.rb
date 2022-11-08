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

     post '/users' do
      user = User.create(
         full_name: params[:full_name],
         gender: params[:gender],
         email_address: params[:email_address],
         password: params[:password]
      )
      user.to_json

     end

     get '/reviews' do
        reviews = Review.all
        reviews.to_json
     end

     post '/reviews' do
      review = Review.create(
         score: params[:score],
         comment: params[:comment],
         car_id: params[:car_id],
         user_id: params[:user_id]
      )
      review.to_json
        
     end

     
end
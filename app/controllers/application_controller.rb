class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    get '/cars' do
       cars = Car.all
       cars.to_json
    end

    get '/users' do
        users = User.all
        users.to_json
     end

     get '/reviews' do
        reviews = Review.all
        reviews.to_json
     end
 
 

end
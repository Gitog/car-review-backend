puts "🌱 Seeding data..."

# Make 10 users
10.times do
    user = User.create(name: Faker::Name.name, email_address: Faker::Internet.email)
end

40.times do
    # create a car with random data
    makeModel = Faker::Vehicle.make_and_model
    array = array[0]
    model = array[1]

    car = Car.create(year: Faker::Vehicle.year, make: make, model: model, price: Faker::Commerce.price(range: 30000..100000, as_string: true), mileage: Faker::Vehicle.mileage, color: Faker::Vehicle.color, image: carArray.sample)
end

puts "🌱 Done seeding!"
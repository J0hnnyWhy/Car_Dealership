require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/car_dealership')

get('/') do       #Goes to the root (index.erb)
  erb(:index)     #The index page has links to vehicles.erb and vehicle_new.erb.
end

get('/vehicles') do  #Goes to vehicles.erb
  @vehicles = Vehicle.all() #Grabs class vehicle with method .all and name it @vehicles, which is displayed on vehicles.erb.
  erb(:vehicles)
end

get('/vehicles_form') do #Goes to vehicle_form.erb so they can save a new vehicle.
  erb(:vehicles_form)
end

post('/vehicles') do
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year")
  vehicle = Vehicle.new(make, model, year)
  vehicle.save()
  erb(:success)
end

get('/vehicles/:id') do
  @vehicle = Vehicle.find(params.fetch("id").to_i())
  erb(:vehicle)
end

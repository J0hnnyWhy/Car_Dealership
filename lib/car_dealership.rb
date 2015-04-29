#https://github.com/johnandjoss/car-dealership
class Vehicle
  @@vehicles = [] #Creates a class variable called '@@vehicles' which is an emtpy array until vehicle has been saved

  define_method(:initialize) do |make, model, year| #Initializes the class Vehicle passes in the parameters: make, model, year.
    @make = make #Creates an instance variable of the parameter make
    @model = model #Creates an instance variable of the parameter model
    @year = year #Creates an instance variable of the paremeter year
    @id = @@vehicles.length().+(1)
  end

  define_method(:make) do #Calling the instance variable make
    @make
  end

  define_method(:model) do #Calling the instance variable model
    @model
  end

  define_method(:year) do #Calling the instance variable year
    @year
  end

  define_method(:save) do #Pushing user input into the '@@vehicles' array
  @@vehicles.push(self)
  end

  define_singleton_method(:all) do  #Class method that calls the class variable '@@vehicles'
    @@vehicles
  end

  define_singleton_method(:clear) do  #Class method that sets class variable '@@vehicles' to an empty array
    @@vehicles = []
  end

  define_method(:age) do
    this_year = Time.new()  #Creates a new instance of the Time class and sets it equal to this_year
    age = this_year.year.-(@year) #Calls the property year of the variable 'this_year' and subtracts the value in the instance variable '@year'
  end

  define_method(:worth_buying) do
    american_cars = ["Chrysler", "Ford", "GM"] #Creates a new array called 'American_Cars'
    american_cars.include?(@make).&(age.<(16)) #Evaluates if the value in @make is in the array American_cars and evaluates if the value in age is less than 16 and returns a boolean value.
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |identification|
    found_vehicle = nil
    @@vehicles.each() do |vehicle|
      if vehicle.id().eql?(identification.to_i())
        found_vehicle = vehicle
      else "no vehicle found"
      end
    end
    found_vehicle
  end
end

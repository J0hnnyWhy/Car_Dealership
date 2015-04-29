class Vehicle
  @@vehicles = [] #Creates a class variable called '@@vehicles' which is an emtpy array
  define_method(:initialize) do |make, model, year| #Initializes the class Vehicle passes in the parameters: make, model, year.
    @make = make #Creates an instance variable of the parameter make
    @model = model #Creates an instance variable of the parameter model
    @year = year #Creates an instance variable of the paremeter year
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

  define_singleton_method(:all) do
    @@vehicles
  end

  define_singleton_method(:clear) do
    @@vehicles = []
  end
end

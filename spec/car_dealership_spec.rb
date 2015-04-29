require('rspec')
require('car_dealership')

describe(Vehicle) do
  describe('#make') do
    it('return the make of the vehicle') do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle.save()
      expect(test_vehicle.make()).to(eq("Toyota"))
    end
  end
  
end

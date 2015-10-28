# ~ann/app25r/db/csv2cars.rb

Car.delete_all
require  'csv'
csvrows = CSV.read("#{Rails.root}/public/cars.csv")
csvrows[1,csvrows.size].each{|row| 
  p row

  Car.create(:make => row[0], 
    :mmodel        => row[1], 
    :yr            => row[2], 
    :color         => row[3], 
    :vin           => row[4], 
    :owner         => row[5])
}
Car.all

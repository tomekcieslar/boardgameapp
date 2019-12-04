class Location < ApplicationService
  def initialize(street, city)
    @street = street
    @city = city
  end

  attr_accessor :street, :city

  def call
    place = Geocoder.coordinates("#{street}, #{city}")
    place.reverse!
  end
end

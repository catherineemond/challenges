class City
  attr_accessor :name, :routes

  def initialize(name)
    @name = name
    @routes = {}
  end

  def add_route(city, price)
    @routes[city] = price
  end
end

atlanta = City.new("Atlanta")
boston = City.new("Boston")
chicago = City.new("Chicago")
denver = City.new("Denver")
el_paso = City.new("El Paso")

atlanta.add_route(boston, 100)
atlanta.add_route(denver, 160)
boston.add_route(chicago, 120)
boston.add_route(denver, 180)
chicago.add_route(el_paso, 80)
denver.add_route(chicago, 40)
denver.add_route(el_paso, 140)

def dijkstra(starting_city, other_cities)
  routes_from_city = {}
  routes_from_city[starting_city] =  [0, starting_city]

  other_cities.each { |city| routes_from_city[city] = [Float::INFINITY, nil] }
  visited_cities = []
  current_city = starting_city

  while current_city do
    visited_cities << current_city

    current_city.routes.each do |city, price|
      total_price = routes_from_city[current_city][0] + price
      
      if routes_from_city[city][0] > total_price
        routes_from_city[city] = [total_price, current_city]
      end
    end

    current_city = nil
    cheapest_route_from_current_city = Float::INFINITY

    routes_from_city.each do |city, info|
      if info[0] < cheapest_route_from_current_city && !visited_cities.include?(city)
        cheapest_route_from_current_city = info[0]
        current_city = city
      end
    end
  end

  return routes_from_city
end

routes = dijkstra(atlanta, [boston, chicago, denver, el_paso])

routes.each do |city, info|
  p "#{city.name}: #{info[0]}"
end
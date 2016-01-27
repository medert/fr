require "pry"
require "net/http"
require "json"


class Map

  def initialize(stop)
    @stop = stop
  end

  def get_predictions
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    key = "AIzaSyAFBY0Vmg0PtCy3tpWb2HbXIicE3vLRr5Q"
    URI("http://realtime.mbta.com/developer/api/v2/alerts?api_key=wX9NwuHnZU2ToO7GmGR9uw&include_access_alerts=false&include_service_alerts=true&format=json")
    # URI("http://realtime.mbta.com/developer/api/v2/#{query}?api_key=#{key}&stop=#{@stop}&format=json")
  end
end


# stop = gets.chomp.to_str

mbta = Map.new("Wollaston")

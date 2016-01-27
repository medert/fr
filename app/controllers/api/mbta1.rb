require "pry"
require "net/http"
require "json"


class Mbta
  def initialize(route_name)
    @route_name = route_name
  end

  def get_predictions
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    key = "wX9NwuHnZU2ToO7GmGR9uw"
    URI("http://realtime.mbta.com/developer/api/v2/alertheaders?api_key=wX9NwuHnZU2ToO7GmGR9uw&format=json")
  end

  def convert_time(time)
    Time.at(time.to_i).strftime("%I:%M%p")
  end

  def alert_messages
    messages = []
    get_predictions["alert_headers"].each do |alert|
      if alert["effect_name"] != "Delay"
        binding.pry
        messages.push(alert["header_text"])
      end
    end
    return messages
  end
end
#
mbta = Mbta.new("Red Line")

puts mbta.alert_messages

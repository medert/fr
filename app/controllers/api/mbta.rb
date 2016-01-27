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
    URI("http://realtime.mbta.com/developer/api/v2/alerts?api_key=wX9NwuHnZU2ToO7GmGR9uw&include_access_alerts=false&include_service_alerts=true&format=json")
  end

  def convert_time(time)
    Time.at(time.to_i).strftime("%I:%M%p")
  end

  def alert_messages
    messages = []
    get_predictions["alerts"].each do |alert|
      if alert["effect_name"] == "Delay"
        # && alert["affected_services"]["services"].first["route_name"] == @route_name
        messages.push(alert["effect_name"])
        messages.push(alert["short_header_text"])
        messages.push(alert["cause_name"])
        messages.push(alert["service_effect_text"])
        messages.push("Affected time from #{convert_time(alert["effect_periods"].first["effect_start"])} to #{convert_time(alert["effect_periods"].first["effect_end"])}.")
      end
    end
    return messages
  end
end
#
mbta = Mbta.new("Red Line")

puts mbta.alert_messages

#建物の名前を受け取って、最短経路の時間を返すBOT

class RouteData
  constructor: (dest) ->
    @destination = dest
    @http = "https://maps.googleapis.com/maps/api/directions/json"
    @key = "AIzaSyCaJTFa5K-qsCEc9zoDlwCVTe63m0JflQQ"
    @origin = "東京都中央区銀座8-20-33"
    @language = "ja"
    @mode = "driving"
    @query =
      key: @key
      origin: @origin
      language: @language
      mode: @mode
      destination: @destination
    @start_address = "出発地点"
    @end_address = "目的地"
    @duration = ""
  
  result: (robot, msg) ->
    robot.http(@http).query(@query).get() ((err, res, body) ->
      json = JSON.parse body
      route = json.routes[0]
      if !route
        msg.send "ごめんなさい、分からないの。。。"
        return
      legs = route.legs[0]
      @start_address = legs.start_address
      @end_address = legs.end_address
      @duration = legs.duration.text
      if !@start_address || !@end_address
        msg.send "ごめんなさい、分からないの。。。"
      else
        msg.send """
                    #{@start_address}
                        ↓ #{@duration}
                    #{@end_address}
                 """
      )
    
  
module.exports = (robot) ->
  robot.hear /@to (.*)/i, (msg) ->
    routeData = new RouteData msg.match[1]
    routeData.result(robot, msg)

    
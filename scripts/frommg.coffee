#建物の名前を受け取って、最短経路の時間を返すBOT

module.exports = (robot) ->
  robot.respond /@to (.+)/i, (msg) ->
    msg.reply "to #{msg.match[1]} :: 1時間"
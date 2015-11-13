# Description:
#   Prevent Hubot from outputting anything for a period
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_MUTE_ROOM_PREFIX (# on Slack, IRC, etc, otherwise leave blank, but must be defined)
#
# Commands:
#   hubot mute list - Check which channels have been muted
#   hubot mute - mutes the current channel
#   hubot unmute - unmutes the current channel
#
# Author:
#   Alex House (@alexhouse)
#

mute_channels = []
mute_listener = null
mute_all = false
mute_explain = {}
mute_first = true;

module.exports = (robot) ->
  robot.brain.on 'loaded', ->
    if mute_first
      mute_first = false
      mute_channels = robot.brain.get('mute_channels') or []
      mute_all = robot.brain.get('mute_all') or false

  robot.respond /mute list$/i, (msg) ->
    msg.finish()
    if mute_channels.length is 0 and mute_all is false
      msg.send 'No channels have been muted yet'
      return

    if mute_all is true
      msg.send 'ALL channels are muted'
    else
      for room in mute_channels
        msg.send room + ' is muted'

  robot.respond /(mute||unmute)$/i, (msg) ->
    msg.finish()
    channel = process.env.HUBOT_MUTE_ROOM_PREFIX + msg.message.room

    muteChannel msg.match[1], channel, (what) ->
      msg.send what

  # Catch-all listener to mute responses
  robot.hear /(.*)$/i, {id: "hubot-mute.catch_all"}, (msg) ->
    if mute_all is false and mute_channels.indexOf(process.env.HUBOT_MUTE_ROOM_PREFIX + msg.message.room) == -1
      return
    if msg.match[1].indexOf('mute') != -1
      return

    msg.finish()

    if msg.match[0].toLowerCase().indexOf(robot.name.toLowerCase()) != 0
      return

    reason = if mute_all is true then 'All channels are muted' else "Channel #{process.env.HUBOT_MUTE_ROOM_PREFIX}#{msg.message.room} is muted"
    if !mute_explain[msg.message.room]?
      msg.send 'This channel is currently muted because: ' + reason + '. Unmute the channel with "Tabbot unmute."'
      mute_explain[msg.message.room] = true
      delay 300000, ->
        delete mute_explain[msg.message.room]

  mute_listener = robot.listeners.pop()
  robot.listeners.unshift(mute_listener)

muteAll = (action, cb) ->
  mute_all = action == 'mute'

  robot.brain.set 'mute_all', mute_all
  cb 'All channels have been ' + action + 'd'

muteChannel = (action, channel, cb) ->
  action = action.toLowerCase()
  if process.env.HUBOT_MUTE_ROOM_PREFIX?
    if channel.indexOf(process.env.HUBOT_MUTE_ROOM_PREFIX) != 0
      cb "Cannot #{action} '#{channel}'. Did you mean '#{process.env.HUBOT_MUTE_ROOM_PREFIX}#{channel}'?"
      return false

  if action == 'mute'
    if mute_channels.indexOf(channel) > -1
      cb 'Channel ' + channel + ' already muted'
      return false

    mute_channels.push(channel)
  else
    idx = mute_channels.indexOf(channel)
    if idx == -1
      cb 'Cannot unmute ' + channel + ' - it is not muted'
      return false

    mute_channels.splice idx, 1

  robot.brain.set 'mute_channels', mute_channels
  cb 'Channel ' + channel + ' ' + action + 'd'
  return true

delay = (ms, func) -> setTimeout func, ms

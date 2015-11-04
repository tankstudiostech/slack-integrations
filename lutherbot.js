this.Luther = function(conf) {
  this.config = conf;
  
  this.run = function() {
   var Slack, autoMark, autoReconnect, slack, token;
  var request = require('request');
  Slack = require('slack-client');
  
  token = this.config.lutherbotToken;

  autoReconnect = true;

  autoMark = true;

  slack = new Slack(token, autoReconnect, autoMark);

  slack.on('open', function () {
    var channel, channels, group, groups, id, messages, unreads;
    channels = [];
    groups = [];
    unreads = slack.getUnreadCount();
    channels = (function () {
      var _ref, _results;
      _ref = slack.channels;
      _results = [];
      for (id in _ref) {
        channel = _ref[id];
        if (channel.is_member) {
          _results.push("#" + channel.name);
        }
      }
      return _results;
    })();
    groups = (function () {
      var _ref, _results;
      _ref = slack.groups;
      _results = [];
      for (id in _ref) {
        group = _ref[id];
        if (group.is_open && !group.is_archived) {
          _results.push(group.name);
        }
      }
      return _results;
    })();
    console.log("Welcome to Slack. You are @" + slack.self.name + " of " + slack.team.name);
    console.log('You are in: ' + channels.join(', '));
    console.log('As well as: ' + groups.join(', '));
    messages = unreads === 1 ? 'message' : 'messages';
    return console.log("You have " + unreads + " unread " + messages);
  });

  function containsText(text, isThisInside) {
    return text.toUpperCase().indexOf(isThisInside.toUpperCase()) >= 0;
  }

  function getVerse(text, callback) {
    var options = {
      proxy: process.env.http_proxy,
      url: 'http://lutherbot.herokuapp.com/getVerse?text=' + text,
      method: 'GET',
    };

    request.get(options, function (err, res, body) {
      callback(body);
    });
  }

  function isMessageToLuther(messageType, channel, text) {
    return messageType === 'message' && channel != null && text != null && (containsText(text, "luther") || containsText(text, "<@U08ANELP7>"));
  }
  
  function isMessageTimeRequest(message) {
    var timeIndex = containsText(message, "time");  
    return timeIndex;
  }
  
  var timeZones = [{
    name: 'cdt',
    houroffset: -6,
    minoffset: 0
  },{
    name: 'pdt',
    houroffset: -5,
    minoffset: 0
  },{
    name: 'at',
    houroffset: 9,
    minoffset: 30
  }];
  
  var timeList = [{
    name: "craigelliss",
    display: "Ryan",
    timezone: timeZones[0] 
  },{
    name: "benjaminjrobin",
    display: "Ben",
    timezone: timeZones[0] 
  },{
    name: "themast",
    display: "Derek",
    timezone: timeZones[1] 
  },{
    name: "rtankersley",
    display: "Craig",
    timezone: timeZones[2] 
  }]
  
  slack.on('team_join', function(user) {
    
  });
  
  slack.on('message', function (message) {
    try {
      var channel, channelError, channelName, errors, response, text, textError, ts, messageType, typeError, user, userName;

      channel = slack.getChannelGroupOrDMByID(message.channel);
      user = slack.getUserByID(message.user);
      response = '';
      messageType = message.type;
      ts = message.ts;
      text = message.text;
      channelName = (channel != null ? channel.is_channel : void 0) ? '#' : '';
      channelName = channelName + (channel ? channel.name : 'UNKNOWN_CHANNEL');
      userName = (user != null ? user.name : void 0) != null ? "@" + user.name : "UNKNOWN_USER";
  
      if (isMessageToLuther(messageType, channel, text)) {
        if(isMessageTimeRequest(text)) {
          var userTime = null;
          for(var i = 0; i < timeList.length; i++)
          {
            if(timeList[i].name == user.name)
            {
              userTime = timeList[i].timezone;
              break;
            }
          }
          
          if(userTime == null)
            timeList[0].timezone;
            
            var timeIndex = text.toUpperCase().indexOf("time".toUpperCase());
            if(timeIndex + 9 < text.length)
            {
              timeIndex = timeIndex + 5;
              var hour = Number(text[timeIndex] + text[timeIndex + 1]);
              var minutes = Number(text[timeIndex + 3] + text[timeIndex + 4]);
              if(!isNaN(hour) && !isNaN(minutes)) {
                var messageString = "";
                for(var i = 0; i < timeList.length; i++) {
                  var t = timeList[i];
                  var newHour =  hour - (userTime.houroffset - t.timezone.houroffset);
                  var newMinutes = minutes - (userTime.minoffset - t.timezone.minoffset);
                  if(newMinutes === 60) {
                    newHour += 1;
                    newMinutes = 0;
                  }
                  if(newMinutes < 30) {
                    newMinutes += 60;
                    newHour -= 1;
                  }
                  if(newHour >= 24) newHour -= 24;
                  if(newHour < 0) newHour += 24;
                  var hourString = newHour.toString();
                  while(hourString.length < 2) hourString = "0" + hourString;
                  var minString = newMinutes.toString();
                  while(minString.length < 2) minString = "0" + minString;
                  messageString += '*' + t.display + '* : ' + hourString + ':' + minString + '\n';
                }
                channel.send(messageString);
              }
            }
            else {
              console.log(timeIndex);
              console.log(text);
            }
        }
        else {
          getVerse(text, function (data) {
            try {
              var verse = JSON.parse(data);
              console.log(verse);
              if(verse.ok) {
                
                channel.send("*" + verse.reference + "*\n>" + verse.text.replace(/\r\n/g, '\n\n>'));
              }
            } catch(err) {
              console.log(err);
            }
          });
        }
      }
      else {
        typeError = messageType !== 'message' ? "unexpected type " + messageType + "." : null;
        textError = text == null ? 'text was undefined.' : null;
        channelError = channel == null ? 'channel was undefined.' : null;
        errors = [typeError, textError, channelError].filter(function (element) {
          return element !== null;
        }).join(' ');
        return console.log("@" + slack.self.name + " could not respond. " + errors);
      }
    } catch(err) {
      
    }
  });

  slack.on('error', function (error) {
    return console.error("Error: " + error);
  });

  slack.login(); 
  } 
};

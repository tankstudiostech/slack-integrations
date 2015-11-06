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
    return containsText(message, "time") && containsText(message, ":");  
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
    name: "rtankersley",
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
    name: "craigelliss",
    display: "Craig",
    timezone: timeZones[2] 
  }]
  
  function getTime(text, colonIndex) {
    var one = 0;
    var two = 0;
    var three = 0;
    var four = 0;
    var five = null;
    var six = null;
    
    if(colonIndex - 1 > 0)
      two = text[colonIndex - 1];
    if(colonIndex - 2 > 0)
      one = text[colonIndex - 2];
    if(colonIndex + 1 < text.length)
      three = text[colonIndex + 1];
    if(colonIndex + 2 < text.length)
      four = text[colonIndex + 2];
    
    if(colonIndex + 4 < text.length) {
      five = text[colonIndex + 3];
      six = text[colonIndex + 4];
    }
    var hour = 0;
    var min = 0;
    if(one != ' ' && two != ' ' && !isNaN(Number(one)) && !isNaN(Number(two))) {
      hour = Number(one + two);
    }
    else if(two != ' ' && !isNaN(Number(two))) {
      hour = Number(two);
    } 
    else
      return null;
     
    if(three != ' ' && four != ' ' && !isNaN(Number(three)) && !isNaN(Number(four)))
      min = Number(three + four);
    else
      return null;
    
    var isMorning = true;
    
    if(hour < 0 || hour > 24 || min < 0 || min > 59)
      return null;
    if(hour > 12) {
      hour -= 12;
      isMorning = false;
    }
    else if(five != null && (six === 'M' || six == 'm') &&  (five === 'P' || five === 'p')) {
        isMorning = false;
    }
    
    return {hour: hour, min: min, isMorning: isMorning};
  }
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
            
            var colonIndexes = [];
            var newText = text;
            var cIndex = 0;
            var hasColon = false;
            do {
              cIndex = newText.indexOf(":");
              hasColon = cIndex > -1;
              if(hasColon)
              {
                if(colonIndexes.length > 0) {
                  cIndex += colonIndexes[colonIndexes.length - 1] + 1;
                }
                colonIndexes.push(cIndex);
                if(cIndex + 1 < newText.length)
                  newText = newText.substring(cIndex + 1);
                 else
                  hasColon = false;
              }
            } while(hasColon)
            
            var time = null;
            for(var ci = 0; ci < colonIndexes.length; ci++) {
              time = getTime(text, colonIndexes[ci]);
              if(time != null)
                break;
            }
            if(time != null)
            {
              var hour = time.hour;
              var minutes = time.min;
              var isMorning = time.isMorning;
              console.log(isMorning);
              
              if(!isNaN(hour) && !isNaN(minutes)) {
                var messageString = "";
                for(var i = 0; i < timeList.length; i++) {
                  var t = timeList[i];
                  var newHour =  hour - (userTime.houroffset - t.timezone.houroffset);
                  var newMinutes = minutes - (userTime.minoffset - t.timezone.minoffset);
                  if(newMinutes >= 60) {
                    newHour += 1;
                    newMinutes -= 60;
                  }
                  if(newMinutes < 0) {
                    newMinutes += 60;
                    newHour -= 1;
                  }
                  var newIsMorning = isMorning;
                  
                  if(hour < newHour) {
                    for(var s = newHour; s > hour; s--) {
                      if(s % 12 == 0)
                        newIsMorning = !newIsMorning;
                    }
                  }
                  else if(hour > newHour) {
                    for(var s = newHour; s <hour; s++) {
                      if(s % 12 == 0)
                        newIsMorning = !newIsMorning;
                    }
                  }
                  while(newHour > 12) {
                    newHour -= 12;
                  }
                  while(newHour < 1) {
                   newHour += 12; 
                  }
                  var hourString = newHour.toString();
                  while(hourString.length < 2) hourString = "0" + hourString;
                  var minString = newMinutes.toString();
                  while(minString.length < 2) minString = "0" + minString;
                  messageString += '*' + t.display + '* : ' + hourString + ':' + minString + ' ' + (newIsMorning ? 'AM' : 'PM') + '\n';
                }
                channel.send(messageString);
              }
            }
            else {
                channel.send("Were you trying to ask me to help with timezones?  If so, *you didn't send me time!*  Feel free ask again.");
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

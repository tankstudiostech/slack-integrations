(function () {
  var Slack, autoMark, autoReconnect, slack, token, bibliaToken;
  var request = require('request');
  Slack = require('slack-client');

  token = 'xoxb-8362496789-OAHaqA4kmJYy5SQv6Y1OrOEG';
  bibliaToken = 'af3e9dd726db10140bb80cedd99863f8';

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
})();

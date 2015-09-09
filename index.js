var express = require('express');
var app = express();
var request = require('request');
var bodyParser = require('body-parser')
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
}));

var config;
if((process.env.heroku || 'false') === 'true') {
  config = process.env;
} else {
  var configurationFile = require('./config');
  config = configurationFile.config;
}

var techrefurl = 'techreformation.slack.com';
var techreftoken = config.slackToken;

if(config.runLuther) {
  var luther = require('./lutherbot');
  var bot = new luther.Luther(config);
  bot.run();
}

app.listen(process.env.PORT || 5000);

app.post('/techrefinvite', function (req, res) {
  res.header('Access-Control-Allow-Origin', req.headers.origin);
  InviteToSlack(techrefurl, req.body.email, req.body.fname, req.body.lname, techreftoken, res);
});

function InviteToSlack(url, email, fname, lname, token, originalRes) {
  var options = {
    proxy: process.env.https_proxy,
    url: 'https://' + url + '/api/users.admin.invite?email=' + email + '&channels=C06SGVBV5&first_name=' + fname + 'n&last_name=' + lname + '&token=' + token + '&set_active=true&_attempts=1',
    method: 'POST',
  };

  request.post(options, function (err, res, body) {
    originalRes.send(body);
  });
}
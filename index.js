var express = require('express');
var app = express();
var request = require('request');
var bodyParser = require('body-parser')
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
}));

var techrefemail = 'techreformation.slack.com';
var techreftoken = 'xoxp-6901139172-6902652471-10022340690-436360'
app.listen(process.env.PORT || 5000);
app.post('/techrefinvite', function (req, res) {
  var origin = req.get('Origin');
  if(origin.indexOf("tank") > -1 || origin.indexOf("techreformation") > -1)
  {
    res.header('Access-Control-Allow-Origin', 'http://www.tankstudios.net');
    InviteToSlack(techrefemail, req.body.email, techreftoken, res);
  }
  res.send("{ok:false}");
});

function InviteToSlack(url, email, token, originalRes) {

  var options = {
    proxy: process.env.https_proxy,
    url: 'https://' + url + '/api/users.admin.invite?email=' + email + '&channels=C06SGVBV5&first_name=Ryan&last_name=Tankersley&token=' + token + '&set_active=true&_attempts=1',
    method: 'POST',
  };
  request.post(options, function (err, res, body) {
    console.log('STATUS: ' + res.statusCode);
    console.log('HEADERS: ' + JSON.stringify(res.headers));
    res.setEncoding('utf8');
    console.log('BODY: ' + body);
      originalRes.send(body);
    res.on('data', function (chunk) {
      console.log(chunk);
    });
  });
}
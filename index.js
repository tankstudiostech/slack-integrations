var express = require('express');
var app = express();
var request = require('request');
var bodyParser = require('body-parser')
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
}));

var techrefurl = 'techreformation.slack.com';
var techreftoken = 'xoxp-6901139172-6902652471-10022340690-436360'

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
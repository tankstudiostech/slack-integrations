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
      InviteToSlack(techrefemail, req.body.email, req.body.fname, req.body.lname, techreftoken, function(data) {
        res.setEncoding('utf8');
        res.send(data);
      });
});

function InviteToSlack(url, email, fname, lname, token, callback) {
    var options = {
      proxy: process.env.https_proxy,
      url: 'https://' + url + '/api/users.admin.invite?email=' + email + '&channels=C06SGVBV5&first_name=' + fname + 'n&last_name=' + lname + '&token=' + token + '&set_active=true&_attempts=1',
      method: 'POST',
    };
    
    request.post(options, function (err, res, body) {
      callback(body);
    });
}
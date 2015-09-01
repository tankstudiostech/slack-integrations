var express = require('express');
var app = express();


app.listen(process.env.PORT || 5000);
app.post('/slackintegration', function (req, res) {
  res.send("rawr");
});
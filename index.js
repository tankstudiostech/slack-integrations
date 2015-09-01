var express = require('express');
var app = express();


app.listen(process.env.PORT || 5000);
app.get('/', function (req, res) {
  res.sendFile(__dirname + '/index.html');
});

app.use(express.static('dist'));
app.use(express.static('app'));
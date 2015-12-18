// Description:
//   Catme is the most important thing in life
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   hubot cat me - Receive a cat
//   hubot cat bomb - Get 5 pugs
//   hubot cat bomb N - Get N pugs

module.exports = function(robot) {
    var request = require('request');
    
    var meowMeUrl = 'http://meowme.herokuapp.com/random';
    var bombingVar = 'bombing';
    var getRandomCat = function(cb) {
        var reqOpts = {
            proxy: process.env.http_proxy,
            url: meowMeUrl,
            method: 'GET',
        };
        
        request.get(reqOpts, function (err, res, body) {
            cb(JSON.parse(body).cat);
        });
    };
    
    robot.respond(/cat me/i, function(msg) {
        getRandomCat(function(cat) {
           msg.send(cat); 
        });
    });
    
    robot.respond(/cat bomb( (\d+))?/i, function(msg) {
        var count = msg.match[2] || 5;
        if(count > 9) {
            msg.send("Are you trying to kill me?");
        }
        else if(!robot.brain.get(bombingVar)) {
            robot.brain.set(bombingVar, true);
            var intervalId;
            var intervalCount = 0;
            intervalId = setInterval(function(){
                intervalCount++;
                getRandomCat(function(cat) {
                   msg.send(cat); 
                });
                if(intervalCount == count) {
                    clearInterval(intervalId);
                    robot.brain.set(bombingVar, false);
                }
            }, 1000);
        }
        else
            msg.send("I'm still working on a current bombing.  Keep asking me; bombings take less than 10 seconds.");
    });
};
// Description:
//   Pugme is the most important thing in life
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   hubot pug me - Receive a pug
//   hubot pug bomb - Get 5 pugs
//   hubot pug bomb N - Get N pugs

module.exports = function(robot) {
    var request = require('request');
    
    var getRandomPug = function(cb) {
        var reqOpts = {
            proxy: process.env.http_proxy,
            url: 'http://pugme.herokuapp.com/random',
            method: 'GET',
        };
        
        request.get(reqOpts, function (err, res, body) {
            cb(JSON.parse(body).pug);
        });
    };
    
    robot.respond(/pug me/i, function(msg) {
        getRandomPug(function(pug) {
           msg.send(pug); 
        });
    });
    
    robot.respond(/pug bomb( (\d+))?/i, function(msg) {
        var count = msg.match[2] || 5;
        if(count > 9) {
            msg.send("Are you trying to kill me?");
        }
        else if(!robot.brain.get("bombing")) {
            robot.brain.set("bombing", true);
            var intervalId;
            var intervalCount = 0;
            intervalId = setInterval(function(){
                intervalCount++;
                getRandomPug(function(pug) {
                   msg.send(pug); 
                });
                if(intervalCount == count) {
                    clearInterval(intervalId);
                    robot.brain.set("bombing", false);
                }
            }, 1000);
        }
        else
            msg.send("I'm still working on a current bombing.  Keep asking me; bombings take less than 10 seconds.");
    });
};
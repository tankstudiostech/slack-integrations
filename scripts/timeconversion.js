module.exports = function(robot) {
    
    var timeZones = [{
        name: 'cdt',
        houroffset: 0,
        minoffset: 0
  },{
        name: 'pdt',
        houroffset: 1,
        minoffset: 0
  },{
        name: 'at',
        houroffset: 14,
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
    }];
    
    var moment = require('moment');
    
    robot.hear(/time.*([0-1])?[1-9]:[0-5][0-9][ *]?([PpAa][Mm])?/i, function(msg) {
        var splitMatch = msg.match[0].split(' ');
        var actual = '';
        for(var i = 1; i < splitMatch.length; i++) {
            actual += splitMatch[i] + ' ';
        }
        
        actual = actual.trim();
        var momentObj = moment(actual, ["h:mm A"])
        for(var i = 0; i < timeList.length; i++) {
            var uName = msg.message.user.name;
            //var uName = 'themast';
            if(timeList[i].name === uName) {
                momentObj.subtract(timeList[i].timezone.houroffset, 'hour');
                momentObj.subtract(timeList[i].timezone.minoffset, 'minute');
            }
        };
        
        var message = '';
        for(var i = 0; i < timeList.length; i++) {
            var newMoment = moment(momentObj);
            newMoment.add(timeList[i].timezone.houroffset, 'hour');
            newMoment.add(timeList[i].timezone.minoffset, 'minute');
            message += '*' + timeList[i].display + '*: ' + newMoment.format("h:mm A") + '\n'; 
        };
        
        msg.send(message);
    });
};
module.exports = function(robot) {
    robot.respond(/echoroom/i, function(msg) {
        console.log('here');
        var splittext = msg.message.text.split(' ');
        console.log(splittext);
        if(splittext.length >= 2) {
            var channel = splittext[2];
            console.log(channel);
            var message = '';
            for(var i = 3; i < splittext.length; i++) {
                message += splittext[i] + ' ';
            }
            message.trim();
            console.log(message);
            robot.messageRoom(channel, message);
        }
    });
};
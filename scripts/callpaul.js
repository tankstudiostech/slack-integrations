module.exports = function(robot) {
    robot.hear(/call paul/i, function(msg) {
        msg.send('http://i1068.photobucket.com/albums/u458/Ryan_Tankersley/apostlepaul_zpsgdj6cijj.jpg');  
    });
    
    robot.enter(function(msg) {
        if(msg.envelope.room == 'general') {
            var name = msg.message.user.name;
            var message = 'Welcome @' + name + '! We are glad you\'re here! ' +
            'As you are getting acquainted with Slack, you will notice that you\'re in a few channels already, such as #general and #tech. ' +
            'There are many other channels you can join based on what you are interested in, such as #reading  and #games!\n\n' +
            'If you have any questions, ask @tank. He\'ll be happy to help :).'
            robot.messageRoom(name, message);
        }
    });
}
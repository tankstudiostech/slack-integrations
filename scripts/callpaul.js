module.exports = function(robot) {
    robot.hear(/call paul/i, function(msg) {
        msg.send('http://i1068.photobucket.com/albums/u458/Ryan_Tankersley/apostlepaul_zpsgdj6cijj.jpg');  
    });
}
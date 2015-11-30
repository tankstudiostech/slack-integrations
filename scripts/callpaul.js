module.exports = function(robot) {
    robot.hear(/call paul/i, function(msg) {
        msg.send('https://drive.google.com/file/d/0B0JoA6Yz2R7hTWd3RUR3b0ZKRmc/view?usp=sharing');  
    });
}
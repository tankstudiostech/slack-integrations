module.exports = function(robot) {
    robot.hear(/call paul/i, function(msg) {
        msg.send('blob:https%3A//drive.google.com/46c5ea9d-54ff-4340-bc2b-a8a93adf3387');  
    });
}
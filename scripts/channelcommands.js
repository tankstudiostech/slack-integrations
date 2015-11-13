// (function(){
//     var slackClient = require('slack-client');
//     var request = require('request');
//     var options = {
//         token: 'xoxb-14184560593-oiCkHM7IG3qDIdWIWkXOCTjK',
//         autoReconnect: true,
//         autoMark: true
//     };
// 
//     var slack = new slackClient(options.token, options.autoReconnect, options.autoMark);
//     
//     var containsMessage = function(message, text) {
//         return message.toUpperCase().indexOf(text.toUpperCase()) > -1;    
//     };
//     
//     slack.on('message', function(message) {
//         //console.log(message);
//         // var channel = slack.getChannelGroupOrDMByID(message.channel);
//         // if(containsMessage(message.text, "leave") || containsMessage(message.text, "you suck") || containsMessage(message.text, "go away")) {
//         //     var reqOpts = {
//         //         proxy: process.env.http_proxy,
//         //         url: 'https://slack.com/api/groups.kick?token=' + ut + '&channel=' + message.channel + '&user=' + message.user,
//         //         method: 'GET',
//         //     };
//         //     request.get(reqOpts, function (err, res, body) {
//         //         console.log(body);
//         //     });    
//         // } 
//     });
//     
//     slack.login();   
// })();

// module.exports = function(robot) {
//     var leave = function(res) {
//         res.send('/leave');        
//     };
//     
//     robot.respond(/go away/i, function(res) {
//         leave(res);
//     });
//     
//     robot.respond(/leave/i, function(res) {
//         console.log("1");
//         leave(res);
//     });
//     
//     robot.respond(/you suck/i, function(res) {
//         leave(res);
//     });
// }
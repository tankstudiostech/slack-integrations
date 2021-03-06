module.exports = function(robot) {
    var request = require('request');
    var bibleBooks = [
        'genesis', 'exodus', 'leviticus', 'numbers', 'deuteronomy',
        'joshua', 'judges', 'ruth', '1 samuel', '2 samuel', '1 kings', '2 kings', '1 chronicles', '2 chronicles', 'ezra', 'nehemiah', 'esther',
        'job', 'psalms', 'psalm', 'proverbs', 'ecclesiastes', 'song of solomon',
        'isaiah', 'jeremiah', 'lamentations', 'ezekiel', 'daniel',
        'hosea', 'joel', 'amos', 'obadiah', 'jonah', 'micah', 'nahum', 'habakkuk', 'zephaniah', 'haggai', 'zechariah', 'malachi',
        'matthew', 'mark', 'luke', 'john',
        'acts',
        'romans',
        '1 corinthians', '2 corinthians',
        'galatians', 'ephesians', 'philippians', 'colossians', '1 thessalonians', '2 thessalonians', '1 timothy', '2 timothy', 'titus', 'philemon',
        'hebrews',
        'james',
        '1 peter', '2 peter',
        '1 john', '2 john', '3 john',
        'jude',
        'revelation',
    ];
    
    var getVerse = function(text, callback) {
        var options = {
            proxy: process.env.http_proxy,
            url: 'http://lutherbot.herokuapp.com/getVerse?text=' + text,
            method: 'GET',
        };

        request.get(options, function (err, res, body) {
            callback(body);
        });
    };
    
    var verseRegexHear = function(regex) {
        robot.hear(regex, function(msg) {
            var message = msg.message.text;
            var match = msg.match[0];
            var firstLetter = match.substring(0, 1).toUpperCase();
            var matchLocation = message.indexOf(match);
            //Capitalizes the first letter and cuts off any verse that might have been before this one.
            var newMessage = firstLetter + message.substring(matchLocation+firstLetter.length);
            getVerse(newMessage, function(body) {
                try {
                    var verse = JSON.parse(body);
                    if(verse.ok) {
                        if(verse.text.length > 2000) {
                            verse.text = verse.text.substring(0, 2000) + '...';
                        }
                        msg.send("*" + verse.reference + "*\n>" + verse.text.replace(/\r\n/g, '\n\n>'));
                    }
                } catch(err) {
                  console.log(err);
                }
            });
        });
    };
    
    for(var i = 0; i < bibleBooks.length; i++) {
        var regex = new RegExp('!' + bibleBooks[i], 'i');
        verseRegexHear(regex);
    }
}
// Commands:
//  hubot stock <symbol> sends in stock information for given symbol 
module.exports = function(robot) {
    var moment = require('moment');
    var request = require('request');
	
    var failMessages = [
        "SELL! SELL! SELL!",
        "I should have invested in emus."
    ];
    
    var successMessages = [
        "BUY! BUY! BUY!",
        "I'm gonna be rich!"
    ];
	
    var getRandomMessage = function(isGood) {
        if(isGood) {
            var max = successMessages.length;
            var pos = Math.floor((Math.random() * max));
            return successMessages[pos];
        }
        else {
            var max = failMessages.length;
            var pos = Math.floor((Math.random() * max));
            return failMessages[pos];
        }
    };
    
    var getStockQuote = function(stockName, callback) {
        var reqOpts = {
            proxy: process.env.http_proxy,
            url: 'http://finance.yahoo.com/d/quotes.csv?s=' + stockName + '&f=pl1',
            method: 'GET',
        };
        
        request.get(reqOpts, function (err, newRes, body) {
            if(callback != null)
                composeMessage(stockName, body, callback);
        });
    };
    
    var isStockMarketOpen = function() {
        var now = moment();
        var close = moment();
        close.hour(CLOSE_HOUR);
        var open = moment();
        open.hour(OPEN_HOUR);
        return now.hour >= open.hour && now.hour <= close.hour;    
    };
    
	var fixCurrencyDecimal = function(currency) {
        var curString = currency.toString();
        if(curString.indexOf('$') <= -1) {
            curString = '$' + curString;
        }
        var decimalpos = curString.indexOf('.');
        if(decimalpos <= -1) {
            curString += ".00";
        }
        
        while(decimalpos > -1 && decimalpos > curString.length - 3) {
            curString += "0";
        }
        
        return curString;
    };
    
    var composeMessage = function(stockName, data, callback) {
        var splitMessage = data.split(',');
        var name = stockName.toUpperCase();
        var info = {
            open: splitMessage[0],
            close: splitMessage[1].replace('\n', '')
        };
        
        if(isNaN(Number(info.open)) || isNaN(Number(info.close))) {
            callback("How about you try sending me a REAL stock symbol next time?");
            return;   
        } 
        
        var open = parseFloat(info.open);
        var close = parseFloat(info.close);
        
		var message = '';
		
        if(open === close) {
            message = '*' + name + '* did not change today, closing at *$' + info.open + '*.';
        }
        
        var priceChange = Math.round((open - close) * 100) / 100;
        var priceChangeString = '';
        if(priceChange > 0) {
            priceChangeString = "-$" + priceChange;
        } else {
            priceChange *= -1;
            priceChangeString = "$" + priceChange;
        }
        
        
        priceChangeString = fixCurrencyDecimal(priceChangeString);
        console.log(info.open);
        var openString = fixCurrencyDecimal(info.open);
        console.log(openString);
        var closeString = fixCurrencyDecimal(info.close);
        var change = open < close ? "up" : "down";
        var sassMessage = getRandomMessage(open < close);
        var isOpenMessage = isStockMarketOpen() ? "is currently" : "closed today";
        message = '*' + name + '* ' + isOpenMessage + ' at *' + closeString + '*, ' + change + ' ' + priceChangeString + ' from *' + openString + '* yesterday.\n' + sassMessage + '\nhttp://markets.money.cnn.com/services/api/chart/snapshot_chart_api.asp?symb=' + name;
		
		if(callback != null)
			callback(message);
    };
    
    robot.respond(/stock/i, function(res) {
        var message = res.message.text;
        var info = message.split(' ');
        var quote = info[info.length - 1];
        quote = quote.replace('\n', '');
        getStockQuote(quote, function(message) {
			res.send(message);
		});
    });
}
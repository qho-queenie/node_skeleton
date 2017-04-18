var mysql = require('mysql');
var connection = mysql.createConnection({
    port     : 3306, // 8889
    host     : "localhost",
    user     : "root",
    password : "root",
    database : "plant"
});

module.exports = connection;

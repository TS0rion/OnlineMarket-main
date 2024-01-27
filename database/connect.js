var sql = require("mssql");
const config = require("./config.js");

// connect to your database
const connect = () => {
  var connection = sql.connect(config, function (err) {
    if (err) return err;
    else {
      console.log("Connect to Sqlserver successfully");
      return connection;
    }
  });
};
module.exports = connect;

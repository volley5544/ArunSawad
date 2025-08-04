const admin = require("firebase-admin/app");
admin.initializeApp();

const getServerCurrentDateTime = require("./get_server_current_date_time.js");
exports.getServerCurrentDateTime =
  getServerCurrentDateTime.getServerCurrentDateTime;

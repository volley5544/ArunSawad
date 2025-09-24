const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.getServerCurrentDateTime = functions.https.onCall((data, context) => {
  // Write your code below!
  const now = new Date();
  res.send(now.toISOString());
  // Write your code above!
  return now.toISOString();
});

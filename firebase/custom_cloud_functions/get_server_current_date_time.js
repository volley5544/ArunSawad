const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.getServerCurrentDateTime = functions
  .region("asia-southeast1")
  .https.onCall((data, context) => {
    // Write your code below!
    res.send("Hello from Google Cloud Functions!");
    const now = new Date();
    res.send(now.toISOString());
    // Write your code above!
    return now.toISOString();
  });

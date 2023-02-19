const express = require("express");
const WebSocket = require('ws');
const app = express();
var bodyParser = require("body-parser");
const auth = require("./routes/auth");
const event= require("./routes/organize");

require("./src/db.js");

app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use("/auth", auth);
app.use("/event", event);

const port = process.env.PORT || 3000;
const server = app.listen(port, () => {
  console.log(`Listening on ${port}...`);
});
const wss = new WebSocket.Server({ server });
wss.on('connection', function connection(ws) {
    console.log('Client connected');
  
    ws.on('message', function incoming(data) {
      console.log(`Received message: ${data}`);
  
      // handle the message (e.g. broadcast it to all connected clients)
      wss.clients.forEach(function each(client) {
        if (client.readyState === WebSocket.OPEN) {
          client.send(data);
        }
      });
    });
  
    ws.on('close', function close() {
      console.log('Client disconnected');
    });
  });

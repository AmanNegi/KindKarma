const express = require('express');
const app = express();
const WebSocket = require('ws');

const server = app.listen(3000, () => {
  console.log('Server started on port 3000');
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
  
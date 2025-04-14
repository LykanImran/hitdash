const express = require('express');
const WebSocket = require('ws');
const cors = require('cors');

const app = express();
app.use(cors());

// HTTP endpoint for polling
app.get('/api/metrics', (req, res) => {
  res.json(generateMockData());
});

// WebSocket server
const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', (ws) => {
  console.log('Client connected');
  
  // Send data every 2 seconds
  const interval = setInterval(() => {
    ws.send(JSON.stringify(generateMockData()));
  }, 2000);

  ws.on('close', () => {
    console.log('Client disconnected');
    clearInterval(interval);
  });
});

function generateMockData() {
  return {
    activeUsers: Math.floor(Math.random() * 1000) + 100,
    pageViews: Math.floor(Math.random() * 5000) + 1000,
    avgSessionDuration: Math.floor(Math.random() * 300) + 60
  };
}

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
  console.log(`WebSocket server running on ws://localhost:8080`);
});
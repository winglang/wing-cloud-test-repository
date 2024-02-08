#!/usr/bin/env node
const http = require('http');

process.on('SIGINT', () => {
  console.info("Interrupted")
  process.exit(0)
});

const messages = [];

const server = http.createServer((req, res) => {
  if (req.method === "POST") {
    req.on("data", (chunk) => {
      messages.push(chunk.toString());
    });
    req.on("end", () => {
      res.end("ok");
    });
  }

  console.log(`request received: ${req.method} ${req.url}`);
  res.end(JSON.stringify({ messages }));
});

console.log('listening on port 3000');
server.listen(3000);
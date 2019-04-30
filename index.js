/*
*
* Primary file for the API
*
*/

// Dependencies
const http = require('http');
const url = require('url');
const StringDecoder = require('string_decoder').StringDecoder;

// The server should respond to all requets with a string
const server = http.createServer((req, res) => {

  // Get the URL and parse it
  const parseUrl = url.parse(req.url, true);

  // Get the path
  const path = parseUrl.pathname;
  const trimmedPath = path.replace(/^\/+|\/+$/g, '');

  // Get the query string as an object
  const queryStringObject = parseUrl.query;

  // Get the HTTP Method
  const method = req.method.toLowerCase();

  // Get the header as an object
  const headers = req.headers;

  // Get the payload if any
  const decoder = new StringDecoder('utf-8');
  const buffer = '';

  req.on('data', () => {
    buffer += decoder.write(data);
  });

  req.on('end', () => {
    buffer += decoder.end();

    // Send the response
    res.end('Hello World\n');

    // Log the request path
    console.log(`Request received on path: ${trimmedPath}`);
    console.log(`with this method ${method}`);
    console.log(`with these query string parameters`, queryStringObject)
    console.log(`with these headers`, headers);
    console.log(`with this payload ${buffer}`);
  })



})

// Start the server, and have it listen on port 3000
server.listen(3000, () => {
  console.log("The sever is listening on port 3000 now")
})

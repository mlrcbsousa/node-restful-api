/*
*
* Primary file for the API
*
*/

// Dependencies
const http = require('http');
const url = require('url');

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

  // Send the response
  res.end('Hello World\n');

  // Log the request path
  console.log(`Request received on path: ${trimmedPath}`);
  console.log(`with this method ${method}`);
  console.log(`with these query string parameters`, queryStringObject)

})

// Start the server, and have it listen on port 3000
server.listen(3000, () => {
  console.log("The sever is listening on port 3000 now")
})

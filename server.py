from http.server import BaseHTTPRequestHandler, HTTPServer

PORT = 8000

class HelloWorldHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        # 1. Send the HTTP status code response (200 OK)
        self.send_response(200)
        
        # 2. Set the response header content type
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        
        # 3. Write the body content (Must be converted to raw bytes)
        self.wfile.write(b"Hello World\n")

    # Optional: Silence standard terminal request logging
    def log_message(self, format, *args):
        return

if __name__ == "__main__":
    # Create the server binding it to all interfaces on port 8000
    server = HTTPServer(("", PORT), HelloWorldHandler)
    print(f"🚀 Python Server running silently at http://localhost:{PORT}")
    
    try:
        # Keep the process alive and listening
        server.serve_forever()
    except KeyboardInterrupt:
        print("\n🛑 Server stopped.")
        server.server_close()

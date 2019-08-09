#!/usr/local/bin/python3
import socket
import time
import json
from http.server import BaseHTTPRequestHandler, HTTPServer

host_name = ''
host_port = 5000

class MyServer(BaseHTTPRequestHandler):
    server_name = socket.gethostname()
    server_ip = socket.gethostbyname(server_name)

    def do_GET(self):
        """simple http response"""
        self.send_response(200)
        self.send_header('Content-Type', 'text/html')
        self.end_headers()
        self.body = 'hostname: ' + self.server_name + '   ip: ' + self.server_ip + '   remote: ' + self.address_string() + '   time: ' + time.asctime() + '   path: ' + self.path + '\n'
        self.wfile.write(self.body.encode('utf-8'))

    def do_POST(self):
        """json api response"""
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        self.response = {
            'hostname': self.server_name,
            'ip': self.server_ip,
            'remote': self.address_string(),
            'time': time.asctime(),
            'path': self.path
        }
        self.body = json.dumps(self.response)
        self.wfile.write(self.body.encode('utf-8'))

webServer = HTTPServer((host_name, host_port), MyServer)
webServer.serve_forever()

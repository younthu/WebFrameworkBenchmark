var http = require('http')

http.createServer(function (request, response) {

	// 发送 HTTP 头部
	// HTTP 状态值: 200 : OK
	// 内容类型: text/plain
	response.writeHead(200, {'Content-Type': 'text/plain'});

	// 发送响应数据 "now"
	response.end(new Date().toLocaleString());
  console.log("Log something to make it even with Sinatra/Rails in cost of console output");
}).listen(8888);

// 终端打印如下信息
console.log('Server running at http://127.0.0.1:8888/');

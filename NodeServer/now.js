var http = require('http')
var url = require('url')

http.createServer(function (request, response) {
	var pathname = url.parse(request.url).pathname;
	    console.log("Request for " + pathname + " received.");

			if(pathname == "/io"){
				io(request, response)
			}else{
				index(request, response)
			}
}).listen(8888);

function io(request, response){
	setTimeout(()=>{
		// 发送 HTTP 头部
		// HTTP 状态值: 200 : OK
		// 内容类型: text/plain
		response.writeHead(200, {'Content-Type': 'text/plain'});

		// 发送响应数据 "now"
		response.end(new Date().toLocaleString() + " from io");
	}, 700)
}

function index(request, response){

		// 发送 HTTP 头部
		// HTTP 状态值: 200 : OK
		// 内容类型: text/plain
		response.writeHead(200, {'Content-Type': 'text/plain'});

		// 发送响应数据 "now"
		response.end(new Date().toLocaleString());
	//  console.log("Log something to make it even with Sinatra/Rails in cost of console output");
}
// 终端打印如下信息
console.log('Server running at http://127.0.0.1:8888/');

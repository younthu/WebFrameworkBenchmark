# 启动服务
~~~
node now.js
~~~

# io模拟测试
100并发，10000个请求，平均每秒140个请求，因为默认是io 时间700毫秒，可以看出每秒完成数收并发数限制了。
1000(ms)/700(毫秒io/请求) = 1.4 个请求每秒
1.4请求每秒 * 100并发 = 140

~~~
ab -c 100 -n 10000 http://127.0.0.1:8888/io
This is ApacheBench, Version 2.3 <$Revision: 1757674 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.0.1 (be patient)
Completed 1000 requests
Completed 2000 requests
Completed 3000 requests
Completed 4000 requests
Completed 5000 requests
Completed 6000 requests
Completed 7000 requests
Completed 8000 requests
Completed 9000 requests
Completed 10000 requests
Finished 10000 requests


Server Software:
Server Hostname:        127.0.0.1
Server Port:            8888

Document Path:          /io
Document Length:        28 bytes

Concurrency Level:      100
Time taken for tests:   71.297 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1290000 bytes
HTML transferred:       280000 bytes
Requests per second:    140.26 [#/sec] (mean)
Time per request:       712.972 [ms] (mean)
Time per request:       7.130 [ms] (mean, across all concurrent requests)
Transfer rate:          17.67 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    1   0.6      1       3
Processing:   700  711   5.7    711     735
Waiting:      700  708   4.7    708     730
Total:        701  713   5.6    712     735

Percentage of the requests served within a certain time (ms)
  50%    712
  66%    714
  75%    716
  80%    717
  90%    719
  95%    722
  98%    728
  99%    731
 100%    735 (longest request)
~~~

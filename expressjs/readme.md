# 启动

~~~
PORT=4000 npm start
~~~

# 测试

~~~
ab -n 10000 -c 100 http://localhost:4000
~~~


# I/O测试(138 请求/秒)
模拟700毫秒网络io的情况

~~~
ab -c 100 -n 10000 http://127.0.0.1:4000/io
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
Server Port:            4000

Document Path:          /io
Document Length:        23 bytes

Concurrency Level:      100
Time taken for tests:   72.360 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2230000 bytes
HTML transferred:       230000 bytes
Requests per second:    138.20 [#/sec] (mean)
Time per request:       723.598 [ms] (mean)
Time per request:       7.236 [ms] (mean, across all concurrent requests)
Transfer rate:          30.10 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    1   0.6      1       4
Processing:   702  723  10.0    722     790
Waiting:      702  718   8.7    717     785
Total:        702  723   9.9    723     790

Percentage of the requests served within a certain time (ms)
  50%    723
  66%    725
  75%    726
  80%    728
  90%    733
  95%    738
  98%    755
  99%    765
 100%    790 (longest request)
~~~

# 无I/O测试(526.7 请求/秒)

macbook pro 2015 mid, i7, 2.5 GHz

~~~
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
Server Port:            4000

Document Path:          /
Document Length:        170 bytes

Concurrency Level:      100
Time taken for tests:   18.984 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      3710000 bytes
HTML transferred:       1700000 bytes
Requests per second:    526.76 [#/sec] (mean)
Time per request:       189.839 [ms] (mean)
Time per request:       1.898 [ms] (mean, across all concurrent requests)
Transfer rate:          190.85 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0       3
Processing:     6  189  17.5    189     265
Waiting:        6  189  17.5    189     265
Total:         10  189  17.4    189     265

Percentage of the requests served within a certain time (ms)
  50%    189
  66%    193
  75%    196
  80%    198
  90%    205
  95%    218
  98%    229
  99%    237
 100%    265 (longest request)
~~~

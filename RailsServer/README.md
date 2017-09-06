# README

# 无I/O测试

~~~
ab -c 100 -n 10000 http://127.0.0.1:3000/
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
Server Port:            3000

Document Path:          /
Document Length:        122885 bytes

Concurrency Level:      100
Time taken for tests:   343.833 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1232080000 bytes
HTML transferred:       1228850000 bytes
Requests per second:    29.08 [#/sec] (mean)
Time per request:       3438.334 [ms] (mean)
Time per request:       34.383 [ms] (mean, across all concurrent requests)
Transfer rate:          3499.38 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0       3
Processing:   145 3422 1050.1   3091    9847
Waiting:      145 3416 1048.4   3085    9846
Total:        147 3422 1050.1   3091    9847

Percentage of the requests served within a certain time (ms)
  50%   3091
  66%   3228
  75%   3368
  80%   3454
  90%   4160
  95%   5925
  98%   6792
  99%   8711
 100%   9847 (longest request)
~~~

# I/O测试(模拟)

~~~
ab -c 100 -n 10000 http://127.0.0.1:3000/io
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
Server Port:            3000

Document Path:          /io
Document Length:        11 bytes

Concurrency Level:      100
Time taken for tests:   1415.358 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      3410000 bytes
HTML transferred:       110000 bytes
Requests per second:    7.07 [#/sec] (mean)
Time per request:       14153.582 [ms] (mean)
Time per request:       141.536 [ms] (mean, across all concurrent requests)
Transfer rate:          2.35 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0       4
Processing:   959 14082 760.8  14128   14440
Waiting:      957 14082 760.9  14128   14439
Total:        962 14082 760.6  14129   14443

Percentage of the requests served within a certain time (ms)
  50%  14129
  66%  14168
  75%  14180
  80%  14186
  90%  14198
  95%  14209
  98%  14221
  99%  14230
 100%  14443 (longest request)
~~~

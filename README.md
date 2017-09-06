# NodeBenchmark
repository for node benchmark

# Case 1, 查询当前时间

## Rails 5 api,
用rails 5 api模式生成一个api

```ruby
rails new my_api --api
bundle install
rails g scaffold time_provider stamp short_string

# TimeProvidersController
def now
  render json:DateTime.now
end

# routes.rb
get "/now", to: "time_providers#now"
```

# Run benchmark with siege

```
siege -c 1000 -r 30 -b http://localhost:8888/now
siege -c 1000 -r 30 -b http://localhost:4567/now
siege -c 1000 -r 30 -b http://localhost:3000/now
```

# Run benchmark with ab

ab是apache bench的简称

## 无IO测试
没有io，纯烧CPU，谁框架轻量级，语言执行速度快，谁响应就快。

```
ab -n 10000 -c 100 http://localhost:8888/  # 累计10000个请求，100路并发, 单机测试结果[Node js   ]:  140.26 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:4000/  # 累计10000个请求，100路并发, 单机测试结果[expressjs ]:  526.76 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:4567/  # 累计10000个请求，100路并发, 单机测试结果[sinatra   ]:  2348.28 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:3000/  # 累计10000个请求，100路并发, 单机测试结果[rails     ]:  29.08 [#/sec] (mean)
```

## IO测试
模拟700毫秒网络IO情况

~~~
ab -n 10000 -c 100 http://localhost:8888/io  # 累计10000个请求，100路并发, 单机测试结果[Node js   ]:   140.26 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:4000/io  # 累计10000个请求，100路并发, 单机测试结果[expressjs ]:   138.20 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:4567/io  # 累计10000个请求，100路并发, 单机测试结果[sinatra   ]:    22.71 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:3000/io  # 累计10000个请求，100路并发, 单机测试结果[rails     ]:     7.07 [#/sec] (mean)
~~~

## node server

下面是在本地（Mac bookpro 2016 mid) ab测试的结果。
~~~
ab -c 100 -n 10000 http://127.0.0.1:8888/
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

Document Path:          /
Document Length:        21 bytes

Concurrency Level:      100
Time taken for tests:   1.074 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1220000 bytes
HTML transferred:       210000 bytes
Requests per second:    9310.70 [#/sec] (mean)
Time per request:       10.740 [ms] (mean)
Time per request:       0.107 [ms] (mean, across all concurrent requests)
Transfer rate:          1109.28 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.3      0       3
Processing:     1   11   2.8     10      37
Waiting:        1   11   2.8     10      37
Total:          4   11   2.8     10      37

Percentage of the requests served within a certain time (ms)
  50%     10
  66%     11
  75%     11
  80%     11
  90%     13
  95%     14
  98%     16
  99%     30
 100%     37 (longest request)
~~~

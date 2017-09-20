# NodeBenchmark
针对常见的web框架做并发访问连接数的测试。

# Run benchmark with siege

```
siege -c 1000 -r 30 -b http://localhost:8888/now
siege -c 1000 -r 30 -b http://localhost:4567/now
siege -c 1000 -r 30 -b http://localhost:3000/now
```

# Run benchmark with ab

ab是apache bench的简称

## 无IO测试
没有io，纯烧CPU，谁框架轻量级，语言执行速度快，谁响应就快。下面分别是NodeJs, expressjs, sinatra, rails 的响应速度. 可以看出sinatra最快, node js其次, rails 非常慢。

```
ab -n 10000 -c 100 http://localhost:8888/  # 累计10000个请求，100路并发, 单机测试结果[Node js   ]:  1447.44 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:4000/  # 累计10000个请求，100路并发, 单机测试结果[expressjs ]:  526.76 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:4567/  # 累计10000个请求，100路并发, 单机测试结果[sinatra   ]:  2348.28 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:3000/  # 累计10000个请求，100路并发, 单机测试结果[rails     ]:  29.08 [#/sec] (mean)
```

## IO测试
模拟700毫秒网络IO情况. 下面分别是NodeJs, expressjs, sinatra, rails 的响应速度. nodejs最快的，expressjs略慢。sinatra和rails慢了不止一个数量级。

~~~
ab -n 10000 -c 100 http://localhost:8888/io  # 累计10000个请求，100路并发, 单机测试结果[Node js   ]:   140.26 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:4000/io  # 累计10000个请求，100路并发, 单机测试结果[expressjs ]:   138.20 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:4567/io  # 累计10000个请求，100路并发, 单机测试结果[sinatra   ]:    22.71 [#/sec] (mean)
ab -n 10000 -c 100 http://localhost:3000/io  # 累计10000个请求，100路并发, 单机测试结果[rails     ]:     7.07 [#/sec] (mean)
~~~



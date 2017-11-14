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
# 若无特殊说明，一下均为累计30000个请求，3000路并发, 单机测试结果
ab -n 30000 -c 3000 http://localhost:8888/  #[   Node js]:  3154.61 [#/sec] (mean)
ab -n 30000 -c 2000 http://localhost:4000/  #[ expressjs]:   450.66 [#/sec] (mean)
ab -n 30000 -c 3000 http://localhost:4567/  #[   sinatra]:  2348.28 [#/sec] (mean)
ab -n 30000 -c 3000 http://localhost:3000/  #[     rails]:    29.08 [#/sec] (mean)
ab -n 30000 -c 3000 http://localhost:8080/  #[    golang]: unstable [#/sec] (mean), 最高的时候平均每秒可达14000，测两次以后就经常假死，基本在400请求左右。
```

## IO测试
模拟700毫秒网络IO情况. 下面分别是NodeJs, expressjs, sinatra, rails 的响应速度. nodejs最快的，expressjs略慢。sinatra和rails慢了不止一个数量级。

~~~
# 若无特殊说明，一下均为累计30000个请求，3000路并发, 单机测试结果
ab -n 30000 -c 3000 http://localhost:8888/io  #[   Node js]:   2741.15 [#/sec] (mean)
ab -n 30000 -c 3000 http://localhost:4000/io  #[ expressjs]:   1553.08 [#/sec] (mean)
ab -n 30000 -c 3000 http://localhost:4567/io  #[   sinatra]:    22.71 [#/sec] (mean)
ab -n 30000 -c 3000 http://localhost:3000/io  #[     rails]:     7.07 [#/sec] (mean)
ab -n 30000 -c 3000 http://localhost:8080/io  #[    golang]:     141.53 [#/sec] (mean)
~~~

# Roadmap
1. 接下来会加入python框架的测试
2. 还有C的测试



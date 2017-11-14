# NodeBenchmark
针对常见的web框架做并发访问连接数的测试。


# Run benchmark with ab

ab是apache bench的简称. 因为mac下文件句柄(FD)数量限制, 无法用ab模拟高并发测试，所以一下所有测试均是在ubuntu docker下完成。

在docker里面测试过程中，容易遇到因为服务器日志太多，结果让ab中途退出的情况。所以，一般建议启动服务器的时候用nohup启动，日志不会打印到terminal

~~~
PORT=4567 nohup ruby now.rb & # 启动sinatra 服务器
nohup npm start & #启动express js
~~~

## 无IO测试
没有io，纯烧CPU，谁框架轻量级，语言执行速度快，谁响应就快。下面分别是NodeJs, expressjs, sinatra, rails 的响应速度. 可以看出golang > node js > sinatra, rails 非常慢。

```
# 若无特殊说明，一下均为累计30000个请求，3000路并发, 单机测试结果. node js 和expressjs 已经在ubuntu docker 里面用3000并发做了测试。sinatra用3000并发做测试总是抛connection reset by peer的问题。 rails, golang未用3000并发测试。
ab -n 30000 -c 3000 http://localhost:8888/  #[   Node js]:  3154.61 [#/sec] (mean)
ab -n 30000 -c 2000 http://localhost:4000/  #[ expressjs]:   450.66 [#/sec] (mean)
ab -n 30000 -c 100 http://localhost:4567/   #[   sinatra]:  2348.28 [#/sec] (mean)
ab -n 30000 -c 100 http://localhost:3000/   #[     rails]:    29.08 [#/sec] (mean)
ab -n 30000 -c 3000 http://localhost:8080/  #[    golang]: 12591.41 [#/sec] (mean)
```

## IO测试
模拟700毫秒网络IO情况. 下面分别是NodeJs, expressjs, sinatra, rails, golang 的响应速度. golang 和 nodejs最快的(两者同一个数量级)，expressjs略慢。sinatra和rails慢了不止一个数量级。

~~~
# 若无特殊说明，一下均为累计30000个请求，3000路并发, 单机测试结果
ab -n 30000 -c 3000 http://localhost:8888/io #[   Node js]:  2741.15 [#/sec] (mean)
ab -n 30000 -c 3000 http://localhost:4000/io #[ expressjs]:  1553.08 [#/sec] (mean)
ab -n 30000 -c 100 http://localhost:4567/io  #[   sinatra]:    22.71 [#/sec] (mean)
ab -n 30000 -c 100 http://localhost:3000/io  #[     rails]:     7.07 [#/sec] (mean)
ab -n 30000 -c 3000 http://localhost:8080/io #[    golang]:  3703.73 [#/sec] (mean)
~~~

# Roadmap
1. 接下来会加入python框架的测试
2. 还有C的测试



# 量子密钥租约与消耗账本

`quantum-key-lease` 是围绕密钥区间、租约代次、消费确认与安全事件建设的纯后端服务。领域名称和首批状态约定见 `contracts/domain.json`，运行数据统一写入 `data/`。

依赖就绪后执行 `make test` 可运行基础检查；`make build` 会在镜像内再次运行测试并构建服务，`make run` 在 8312 端口启动。进程状态通过 `GET /healthz` 返回 JSON。

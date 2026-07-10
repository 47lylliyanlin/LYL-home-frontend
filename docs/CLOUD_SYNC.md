# Cloud Sync

当前前端云端目录：

- 服务器：`207.148.101.128`
- 前端目录：`/opt/kiro/frontend`
- Nginx：直接托管该目录

## 一键同步

在本地 PowerShell 运行：

```powershell
cd /d F:\kiro-project\frontend
.\deploy-cloud.ps1
```

脚本会在服务器上执行：

1. 进入 `/opt/kiro/frontend`
2. 拉取 GitHub `main`
3. 强制对齐到 `origin/main`
4. 检查并 reload Nginx

## 如果没有 SSH 权限

需要先在本机配置可以登录服务器的 SSH key，或手动登录服务器执行：

```bash
cd /opt/kiro/frontend
git fetch origin main
git reset --hard origin/main
nginx -t && systemctl reload nginx
```

## 验证

```powershell
Invoke-WebRequest https://kiro-home.duckdns.org/ -UseBasicParsing
```

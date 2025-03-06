# 使用 Node.js 官方镜像作为基础镜像
FROM node:18.20.4-slim  # 确保版本与你的项目兼容, slim 版本体积更小

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json (或 yarn.lock)
# 利用 Docker 缓存，先复制依赖文件，加快构建速度
COPY package*.json ./

# 安装生产环境依赖
RUN npm install --production # 或者 yarn install --production

# 复制应用程序代码
COPY . .

# 设置环境变量 (可选，但推荐)
# 根据你的应用程序需要设置
ENV NODE_ENV production
ENV PORT 3000   # 你的应用程序监听的端口

# 暴露端口 (可选，但推荐)
# 如果你的应用程序需要从外部访问，暴露相应的端口
EXPOSE 3000

# 定义启动命令
CMD ["node", "server.js"]

# 我的博客

基于 **Hugo + PaperMod** 的中文个人博客，支持 Markdown 写作、搜索、标签、归档、深浅色外观、文章目录、代码复制与 RSS。搭建思路参考[周鑫的建站日志](https://www.zhouxin.space/logs/)。

访问博客：**[xpanghu.github.io](https://xpanghu.github.io/)** · [源码仓库](https://github.com/xpanghu/xpanghu.github.io) · [发布状态](https://github.com/xpanghu/xpanghu.github.io/actions/workflows/hugo.yaml)

## 本地预览

本项目使用 Hugo **0.168.0**。macOS 可通过 `brew install hugo` 安装；其他系统参考 [Hugo 安装文档](https://gohugo.io/installation/)。重新克隆项目时，记得拉取主题：

```sh
git submodule update --init --recursive
make dev
```

打开 <http://localhost:1313/>。保存文件后会自动刷新，按 `Ctrl+C` 停止。也可以直接运行：

```sh
hugo server --buildDrafts --bind 127.0.0.1 --baseURL http://localhost:1313/
```

## 先改这三处

| 文件 | 修改内容 |
| --- | --- |
| `hugo.yaml` | 博客标题、作者、首页介绍、GitHub 链接与站点地址 |
| `content/about.md` | 自我介绍与联系方式 |
| `content/posts/` | 删除或改写示例文章，添加自己的文章 |

当前博客名称暂为“我的博客”，作者使用已连接的 GitHub 用户名 `xpanghu`。关于页含待填写提示，开篇和 Markdown 指南是示例内容。

## 写一篇文章

```sh
hugo new content posts/my-new-post/index.md
```

编辑生成的 Markdown 文件。文章开头的 `title` 是标题，`description` 是摘要，`tags` 是标签；`draft: true` 表示草稿。发布前将其改为 `false`，并确认 `date` 不在未来。

图片放在文章的 `index.md` 旁边，用 `![图片说明](photo.jpg)` 引用。建站日志可创建在 `content/logs/`。Obsidian、Typora、VS Code 等编辑器均可编辑这些标准 Markdown 文件；Obsidian 的双链和附件语法需转换为标准 Markdown 后发布。

## 构建

```sh
make build
```

静态网页输出到 `public/`。生产构建默认排除草稿。不要编辑或提交 `public/`，它会在构建时重新生成。

## GitHub Pages

博客已发布到个人主页仓库 `xpanghu/xpanghu.github.io`，网址为 **https://xpanghu.github.io/**。本地 `main` 分支通过 SSH 连接该仓库。

仓库包含 `.github/workflows/hugo.yaml`：推送到 `main` 后，自动安装固定版本的 Hugo，拉取固定的 PaperMod 子模块，构建并发布。构建时使用 GitHub 返回的 Pages 地址，因此也支持项目子目录。

迁移到其他 GitHub 账户时的首次发布步骤：

1. 在 GitHub 创建公开仓库 `<用户名>.github.io`，修改 `hugo.yaml` 的站点地址、作者和 GitHub 链接，并把本地 Git 远程地址指向新仓库。
2. 在仓库 **Settings → Pages → Build and deployment → Source** 选择 **GitHub Actions**。
3. 推送代码，或在 **Actions → Build and deploy blog → Run workflow** 手动运行。
4. 等待工作流成功，再访问 Pages 提供的网址。

后续发布：

```sh
git add content hugo.yaml assets static
git commit -m "docs: update blog"
git push origin main
```

GitHub Pages 面向互联网公开提供网页，发布前请检查示例内容和个人信息。

## 主题维护

PaperMod 以 Git 子模块固定版本。自定义样式放在 `assets/css/extended/custom.css`，不用修改主题本身。宽度足够时文章目录固定在右侧，窄屏使用主题的折叠目录。

需要升级时再运行 `git submodule update --remote themes/PaperMod`，然后执行 `make build` 并检查预览，最后提交主题版本变化。主题采用 MIT 许可证，详见 `themes/PaperMod/LICENSE`。

## 参考

- [博客搭建日志](https://www.zhouxin.space/logs/blog-setup-logs/)
- [Hugo 官方文档](https://gohugo.io/)
- [Hugo 部署到 GitHub Pages](https://gohugo.io/host-and-deploy/deploy-to-github-pages/)
- [PaperMod](https://github.com/adityatelange/hugo-PaperMod)

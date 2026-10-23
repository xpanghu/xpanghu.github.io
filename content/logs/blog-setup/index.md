---
title: "建站第一步：给文字一个自己的家"
date: 2026-10-24T00:00:00+08:00
draft: false
description: "记录这个博客的结构、工具选择和后续维护方式。"
summary: "沿用 Hugo 与 PaperMod，搭好文章、归档、标签和搜索。用简单的结构，为之后的写作留出空间。"
tags: [建站, Hugo, PaperMod]
---

## 从一个简单的结构开始

这个博客参考了[周鑫的博客搭建日志](https://www.zhouxin.space/logs/blog-setup-logs/)，采用 Hugo 和 PaperMod。Markdown 保存内容，Hugo 生成网页，主题负责排版和导航。

首版提供文章列表、建站日志、归档、标签、搜索及关于页。搜索在浏览器中完成，阅读者可以切换深色或浅色外观，也可以通过 RSS 订阅。

## 内容放在哪里

```text
content/
├── posts/       # 文章与笔记
├── logs/        # 建站记录
├── about.md     # 关于
├── archives.md  # 归档入口
└── search.md    # 搜索入口
```

每篇文章使用独立文件夹和 `index.md`，图片可以放在同一文件夹中。网站标题、首页介绍和导航集中在 `hugo.yaml` 中配置。

## 本地预览

```sh
make dev
```

预览地址是 `http://localhost:1313/`。保存文章后，页面会自动更新。

## 发布方式

本站选择 GitHub Pages 托管。仓库中的 GitHub Actions 工作流会安装固定版本的 Hugo、拉取主题并生成静态文件，再将结果交给 Pages 发布。

后续更新只需修改 Markdown 并推送到 `main` 分支。工作流会自动读取实际 Pages 地址，不需要手工修改生成的 HTML。

## 留给之后的事

先开始写作，再根据实际需要补充功能。评论、访问统计、独立域名和图床都可以以后再添加。
